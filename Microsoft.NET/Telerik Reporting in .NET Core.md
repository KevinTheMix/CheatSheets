# Telerik Reporting in .NET Core

## Problem Statement

Prior to .NET Core (and .NET Standard), a reporting tool embedded within Visual Studio provided by Telerik called [Visual Studio Report Designer](https://docs.telerik.com/reporting/ui-report-designer) could by used to design reports, which were then saved as regular .cs (or .vb) files.
That allowed for complete control over the C# class, notably enabling dependency injection (DI), so business objets could be used as DataSource for the report.

As of .NET Core (and .Net Standard) however, [that embedded tool is no longer supported](https://docs.telerik.com/reporting/use-reports-in-net-core-apps#implemented-features-and-limitations), and designing reports is instead achieved through a [standalone Report Designer](https://docs.telerik.com/reporting/report-designers#standalone-report-designer), also provided by Telerik.
Reports in the new format are encoded either as .trdp files (which are zipped archives of XML files) or (legacy) .trdx plain XML files.

A report in that format usually contains the configuration for its own DataSource, which can be a DB, a CSV file, or some business objects. In that latter case, the DataSource is in fact an **ObjectDataSource** that holds a reference to a method within a given assembly. When requested, the report is thus capable of calling the (attribute-augmented) method via reflection, which typically returns a collection of entities fed into the report. Additionally, that method can accept parameters, which are passed down from the report's own parameters.

The issue we faced was that in the particular execution context of a report invocation, there is no way to access BL classes, since the constructor of the class holding the method called by the report must have no parameters. So, even though the report can successfully call a backend method, that method cannot access the rest of the BL instances.

## Solution

After further digging and study of the Telerik API, it turns out that there were a more elegant way to address our particular setup.

See, in order to implement a BE document controller, such as for serving reports to UWP or JS frontends like our end goal was, Telerik recommends using something called [Reporting REST Services](https://docs.telerik.com/reporting/telerik-reporting-rest-conception), which is essentially a REST controller inheriting from a base Controller implemented by Telerik that exposes plenty of methods already capable of handling the generation of reports when queried.

Now, we don't even have to call that controller manually and manipulate all those methods ourselves, because Telerik provides us with a [HTML5 Report Viewer](https://docs.telerik.com/reporting/html5-report-viewer), which is simply a static HTML (and Javascript) file that does that job for us. That viewer can be adapted as a full .vue component, or just called by UWP via a WebView (as described [here](https://docs.telerik.com/reporting/knowledge-base/integrate-telerik-reporting-in-uwp-application).

All that is left, is be able to somehow connect the controller methods that handle the creation of reports to our BLs that effectively return the entities in order to fill the report data.
Where exactly to bridge the report DataSource to a BL?

Well, luckily, that's where this configuration object injected into the Telerik base Controller comes into play:

```C#
public ReportsController(IReportServiceConfiguration reportServiceConfiguration)
    : base(reportServiceConfiguration)
{

}
```

Indeed, in _Startup.cs_, that object's properties are fully parameterized:

```C#
// Configure dependencies for Telerik ReportsController.
services.TryAddSingleton<IReportServiceConfiguration>(sp =>
    new ReportServiceConfiguration
    {
        ReportingEngineConfiguration = Configuration,
        HostAppId = "Auction",  // "AuctionReporting"
        Storage = new FileStorage(),
        //ReportSourceResolver = new UriReportSourceResolver(System.IO.Path.Combine(sp.GetService<IWebHostEnvironment>().ContentRootPath, "Reporting//Reports")),
        ReportSourceResolver = new KokoReportSourceResolver(sp.GetService<IReportBL>()),
    });
```

The most interesting property being the last one: **ReportSourceResolver**, to which a custom resolver can be provided, which implements the following interface:

```C#
ReportSource Resolve(string report, OperationOrigin operationOrigin, IDictionary<string, object> currentParameterValues);
```

which returns a **ReportSource** from a report name.

* A ReportSource is basically an instance of report, filled with data.
* The report name is an arbitrary string which can typically be a report definition file (e.g. "_Report.trdp_").

All that is left is implementing the custom resolver, in particular its Resolve() method, which is called whenever a method from the base controller needs to instantiate a report. In our case, it is that method which is going to make the appropriate calls to the relevant BL(s), to which it has access since they were passed from _Startup.cs_. The method also accepts a dictionary of parameters, which can be provided by the frontend.

```C#
public ReportSource Resolve(string reportId, OperationOrigin operationOrigin, IDictionary<string, object> currentParameterValues)
{
    if (currentParameterValues.Count != 2
        || currentParameterValues[DeliveryPeriodParam].GetType() != typeof(Int64)
        || currentParameterValues[AuctionTypeParam].GetType() != typeof(Int64))
    {
        throw new ArgumentException($"Missing parameter");
    }

    int deliveryPeriod = Convert.ToInt32(currentParameterValues[DeliveryPeriodParam]);
    AuctionType auctionType = (AuctionType)Enum.ToObject(typeof(AuctionType), currentParameterValues[AuctionTypeParam]);   // Courtesy of https://stackoverflow.com/a/29485
    return GetBidReportInstance(reportId, deliveryPeriod, auctionType);
}
```

Note that this implementation is backwards compared to the self-feeding reports described in the problem statement above: in that aforementioned case the report would contact its DataSource to feed itself, but in this case, it is the resolver (called by the controller methods) that instantiates and feeds its data to the report.

## Telerik REST API

As stated above, it is not necessary to know the actual API exposed by the controller because it is entirely handled by the HTML Report Viewer, but for reference, the methods are called in the following order with the following parameters:

0. GET /facade/Reports/formats
1. POST /facade/Reports/clients => af61820efa6
2. POST /facade/Reports/clients/{clientID}/parameters `{ "report": "BidReport.trdp", "parameterValues": { "deliveryPeriod": 2020, "auctionType": 1 } }`
3. POST /facade/Reports/clients/{clientID}/instances `{ "report": "BidReport.trdp", "parameterValues": { "deliveryPeriod": 2020, "auctionType": 1 } }` => c406a5ca253
4. POST /facade/Reports/clients/{clientID}/instances/{instanceID}/documents `{"format":"HTML5Interactive","deviceInfo":{"enableSearch":true,"ContentOnly":true,"UseSVG":true,"BasePath":"http://localhost:57615/api/reports"},"useCache":true}` => f7982894d843c5090a43c5
5. GET /facade/Reports/clients/35cdc78732b/instances/45a0b2213ef/documents/b977d1127fad62261a12b6/pages/1

* POST Parameters   ResolveReportParameters = 0
* POST Instance     CreateReportInstance = 1
* POST Documents    GenerateReportDocument = 2

## Troubleshooting

* JSON-related error
  * Add _Microsoft.AspNetCore.Mvc.NewtonsoftJson_ Nuget package
  * In _Startup.cs_, append **.AddNewtonsoftJson()** method:
    * `services.AddControllers().AddNewtonsoftJson();` or
    * `services.AddRazorPages().AddNewtonsoftJson();`
    * (`services.Configure<IISServerOptions>(options => { options.AllowSynchronousIO = true; });` - found in the code at the same location; might be completely irrelevant)
  * See <https://docs.telerik.com/reporting/knowledge-base/jsonresult-serializersettings-must-be-an-instance-of-type-systemtextjson-jsonserializeroptions>

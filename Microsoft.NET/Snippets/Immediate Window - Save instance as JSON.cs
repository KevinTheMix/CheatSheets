/// <summary>
/// Save a runtime variable as JSON (or XML) file on-the-fly.
/// Paste the following code in the Visual Studio Immediate Window.
/// <see href="https://stackoverflow.com/a/41176409">Source</see>
/// </summary>
System.IO.File.WriteAllText(@"C:\Koko.json", Newtonsoft.Json.JsonConvert.SerializeObject(koko, Newtonsoft.Json.Formatting.Indented));
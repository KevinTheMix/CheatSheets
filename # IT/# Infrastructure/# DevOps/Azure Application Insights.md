# Azure Application Insights

Observability/OTel feature that offers vendor-neutral Application Performance Monitoring (APM) for live web applications (à la Elasticsearch Kibana, Sentry)

## Quick Tips

* [PyPi - azure-monitor-opentelemetry](https://pypi.org/project/azure-monitor-opentelemetry)
* [GitHub - Azure-Samples](https://github.com/Azure-Samples/azure-monitor-opentelemetry-python)
* [GitHub - opentelemetry-instrumentation-flask](https://github.com/open-telemetry/opentelemetry-python-contrib/tree/main/instrumentation/opentelemetry-instrumentation-flask)

## Glossary

* **Instrumentation** = process of adding code & using librarires to collect telemetry data (traces/metrics/logs) to make an application become observable, telling OT what to measure
* **Kusto (Query Language)** (KQL) = query language used to explore Application Insigthts data (à la read-only SQL, optimized for logs/time-series/diagnostics)

## API

* `traces | where cloud_RoleName == "<app>"`
* `traces | where cloud_RoleName contains "<app>"`
* `union exceptions, traces | summarize count() by cloud_RoleName, tostring(customDimensions["deployment.environment"]) | order by count_ desc` = all exceptions/traces per app

### Standard Keys

OpenTelemetry defines semantic conventions for resource attributes. Common standard keys include:

* **service.name** = app (same as in OTEL_SERVICE_NAME)
* **service.namespace** = namespace (eg umbrella project or team)
* **service.version** = semver (eg *1.2.0*)
* **service.instance.id** = pod ID (eg *api-pod-abc123*)
* **deployment.environment** = environment (eg *development/production*)
* **host.name** = server name (eg *server01*)
* **cloud.provider** = cloud (eg *azure*)
* **cloud.region** = region (eg *westeurope*)

In Azure Monitor, these map to **customDimensions** in your logs/traces. service.name specifically maps to cloud/roleName, and service.instance.id maps to cloud/roleInstance

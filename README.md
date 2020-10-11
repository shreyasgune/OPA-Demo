# OPA-Demo
This is a demo for Open Policy Agent using Golang

OPA exposes API's that are not tied to a vendor or domain, which get called and help manage policies.

- Evaluation
    OPA’s interface for asking for policy decisions. Integrating OPA is primarily focused on integrating an application, service, or tool with OPA’s policy evaluation interface. This integration results in policy decisions being decoupled from that application, service, or tool.

- Management
    OPA’s interface for deploying policies, understanding status, uploading logs, and so on. This integration is typically the same across all OPA instances, regardless what software the evaluation interface is integrated with. Distributing policy, retrieving status, and storing logs in the same way across all OPAs provides a unified management plane for policy across many different software systems.

## Go stuff
The `rego` package exposes different options for customizing how policies are evaluated. Through the `rego` package you can supply policies and data, enable metrics and tracing, toggle optimizations, etc

> Preparing queries in advance avoids parsing and compiling the policies on each query and improves performance


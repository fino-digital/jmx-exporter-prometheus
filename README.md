# Introduction 

This container packages the [prometheus jmx-exporter](https://github.com/prometheus/jmx_exporter) java agent that can be used to monitor JVM applications.

# Usage

This container is best used as initContainer. Copy the agent over to the shared volume

```yaml
spec:
  initContainers:
  - name: prometheus-jmx-exporter
    image: finodigital/jmx-exporter-prometheus:0.19.0
    env:
    - name: shared-volume
      emptyDir: {}
    volumeMounts:
    - mountPath: /jmx-agent
      name: shared-volume
    args:
      - -c
      - mkdir -p /jmx-agent && cp -r /agent/jmx_prometheus_javaagent.jar /jmx-agent/agent.jar
    command:
      - sh
```

Then attach the agent to your java application, for example with `JAVA_TOOL_OPTIONS`

```yaml
spec:
  containers:
    - name: your-application
      image: your-image
      env:
        - name: JAVA_TOOL_OPTIONS
          value: -javaagent:/jmx-agent/agent.jar=1234:/path/to/config
```


// TODO:
// - Describe/open port
// - configuration (as config map)

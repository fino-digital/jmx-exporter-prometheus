FROM alpine

RUN adduser -u 65532 -S nonroot
USER nonroot

ADD https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.19.0/jmx_prometheus_javaagent-0.19.0.jar /agent/jmx_prometheus_javaagent.jar

CMD mkdir -p /jmx-agent && cp -r /agent/jmx_prometheus_javaagent.jar /jmx-agent/agent.jar

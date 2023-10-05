FROM alpine

RUN addgroup -g 65532 nonroot && adduser -u 65532 -S nonroot -G nonroot
USER nonroot

ADD --chown=65532:65532 https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.19.0/jmx_prometheus_javaagent-0.19.0.jar /agent/jmx_prometheus_javaagent.jar

CMD mkdir -p /jmx-agent && cp -r /agent/jmx_prometheus_javaagent.jar /jmx-agent/agent.jar

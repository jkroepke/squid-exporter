FROM        golang
ADD         . /squid-exporter
WORKDIR     /squid-exporter
RUN         make all

FROM        quay.io/prometheus/busybox:latest

COPY --from=0 /squid-exporter/bin/squid-exporter  /bin/squid-exporter

EXPOSE      9301
ENTRYPOINT  [ "/bin/squid-exporter" ]

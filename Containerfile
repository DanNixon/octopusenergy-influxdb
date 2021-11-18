FROM docker.io/library/golang:alpine3.14 as builder

RUN mkdir -p /tmp/octopusenergy-influxdb
ADD . /tmp/octopusenergy-influxdb
WORKDIR /tmp/octopusenergy-influxdb

RUN go build .

FROM docker.io/library/alpine:3.14

COPY --from=builder /tmp/octopusenergy-influxdb/octopusenergy-influxdb /usr/local/bin/octopusenergy-influxdb

RUN mkdir /config
WORKDIR /config

ENTRYPOINT ["/usr/local/bin/octopusenergy-influxdb"]

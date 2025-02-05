# octopusenergy-influxdb

This little piece of program pulls data via Octopus Energy API into InfluxDB for onwards use.

## Configuration 
Configuration file `config.yml` is required:
```yaml
octopusenergy:
  token: "sk_live_......"

influxdb:
  url: "http://localhost:8086"
  # org: "Utilities"
  database: "octopusenergy"
  token: ""
  
electricity:
  mpan: "..."
  serial: "..."
  
gas:
  mpan: "...."
  serial: "..."
  # type: smets1
```
*Note: InfluxDB authorization token is optional.*

*Note: Organization is required for InfluxDB v2.*

If you don't wish to get electricity or gas data, just remove that part of configuration file.

`type: smets1` must be specified for SMETS1 meters to ensure correct unit for gas meter readings.
This can be omitted for SMETS2 meters.

Tested with InfluxDB v1.8.3 - compatibility with InfluxDB 2.0 not guaranteed.

## Usage
```shell  
$ git clone https://github.com/FileGo/octopusenergy-influxdb.git
$ cd octopusenergy-influxdb
$ make
$ ./octopusenergy-influxdb
Data succcessfully retrieved.
```

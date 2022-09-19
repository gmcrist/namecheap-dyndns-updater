# DynDNS Updater for Namecheap


## About

This script + service files will update multiple dyndns records hosted with namecheap
on a periodic (5 minute) basis. The script will resolve the system's public IP address.
For each configured record + domain combination, the script will then query the currently
configured IP address. If there is a difference, then the script will send an update.
If there is no different, it will be skipped.

This approach is to help ensure minimal needed updates - effectively only updating
when necessary.

A simple configuration file is used to define the DNS records, associated domains,
and the authentication key.

The file (defautled to /etc/dyndns/sites.conf) consists of the following format:

```
record,domain,key
```

An example of this file with multiple records + domains + keys looks like:

```
@,mydomain.com,9bf219d5c9c01407a075dac9a31daeb0
www,mydomain.com,9bf219d5c9c01407a075dac9a31daeb0
@,sub.domain.com,6020de3030a18f25d0d214559d3f2b91
pi-1,sub.domain.com,6020de3030a18f25d0d214559d3f2b91
pi-2,sub.domain.com,6020de3030a18f25d0d214559d3f2b91
```

A systemd service and timer are included to ensure that the updater runs
on a regular basis, which is set to run once every five minutes.


## Installation

The `install.sh` script will perform a basic installation (copying files into place
and enabling the systemd service and timer.

After installing, you can simply modify the configuration file (`/etc/dyndns/sites.conf`)
and the configuration will be read the next time the timer is triggered.

## TODO / Enhancements

The following items could be added a future time:
- [ ] Support for additinal providers
- [ ] More robust DNS resolution / IP detection
- [ ] More error handling
- [ ] Triggers / Alerts when an update occurs


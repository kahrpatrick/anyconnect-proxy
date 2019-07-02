# anyconnect-proxy
Dockerized openconnect client. Compatible with Cisco AnyConnect (CSD). Exposes socks5 proxy.

## The problems with Cisco AnyConnect
* The AnyConnect desktop client makes use of Cisco Secure Desktop (CSD), which downloads a trojan binary from the target VPN server and executes it on the host machine. For more details see: https://www.infradead.org/openconnect/csd.html
* Some version of AnyConnect do not allow split-tunneling, resulting in all traffic (even local) to be routed through the VPN. This is an issue for privacy, or if one has to work with local services (e.g. docker).

## The workaround
There are several possibilities to the CSD problem: Spoofing the response that is send to the server fo verification, running a modified binary, or running the original binary in a quarantined environment. Depending on the ToS of your provider/organization, the latter might be the best option.

This repository provides a dockerized version of openconnect. The container accepts connections to a SOCKS5 proxy, and forwards everything through the VPN. 

## Usage

* Install [Docker CE](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
* Edit user credentials and connection details in `build_and_run.sh`
* Run `build_and_run.sh`

### Firefox
* To proxy everything, add the proxy to the Firefox proxy configuration. 
* If the VPN should only be used for certain hosts, a [PAC file](https://developer.mozilla.org/en-US/docs/Web/HTTP/Proxy_servers_and_tunneling/Proxy_Auto-Configuration_(PAC)_file) can be loaded. 
* Sometimes it is not possible to define all the hosts in advance. The following Firefox Addon allows to quickly enable/disable a proxy configuration: [Proxy Toggle](https://addons.mozilla.org/en-US/firefox/addon/proxy-toggle/)

### SSH
SSH can be configured to route its traffic through a SOCKS proxy:
`ssh user@remote -o "ProxyCommand=/usr/bin/nc -X 5 -x 127.0.0.1:443 %h %p"`
This can also be added to the `~/.ssh/config` file.

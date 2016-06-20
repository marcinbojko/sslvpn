Application description
=======================
FortiClient extends the power of FortiGate's Unified threat management to endpoints on your network. Desktops, laptops, tablets & smartphones, FortiClient enables every device - local or remote, stationary or mobile - to integrate with your FortiGate. With no per-seat license fees, FortiClient takes the headaches out of managing multiple endpoints so your users & guests can work efficiently anywhere, without compromising your security. It's the end-point solution for your FortiGate network.

Features
--------
* Install & uninstall via Chocolatey
* [NEW] Tests local source (if exists) to prevent dowloading package from Internet 
	* \\\\office.eleader.biz\packages\choco\forticlient*.msi 
* Requires source path to MyGet


#### 2016-06-20 Build 4.0.2329
* initial package
* added 'REINSTALLMODE=vomus REINSTALL=ALL ' to MSI install parameters (minor/major upgrade handling feature)


# Usage
## Direct
``` 
choco install sslvpn -source https://www.myget.org/F/eleader/ 
```
or with added source
```
choco source add -n=eLeader -s"https://www.myget.org/F/eleader/api/v2" --priority=10
choco install sslvpn
```
## YAML
```
sslvpn:
  ensure: latest
  uninstall_options: "--force --all-versions"
  provider: chocolatey
  source: https://www.myget.org/F/eleader/
```  
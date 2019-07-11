## VPN Client Deployment for Cisco ASA VPN

This is a script used to deploy the Shrew VPN Client and configure them. This is good for deploying a Windows 10 compatible client for 
a Cisco ASA VPN.

This script installs the chololately package manager, installs the shrewsoftvpn in silent mode with the free standard version
Then copies the config file from a file server to the current users config directory %APPDATA%\..\Local\Shrew Soft VPN\sites

Need to test if this works on reboot

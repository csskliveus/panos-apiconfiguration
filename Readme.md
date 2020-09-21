This respository is a small excercise. 

This repository will help to know on how to call Palo-alto XML API using shell script. 

https://docs.paloaltonetworks.com/pan-os/8-1/pan-os-panorama-api/pan-os-xml-api-request-types.html 
API Basics:
API Basics: API Type Description 
- type=keygen : Generate API keys for authentication.
- type=config   : Modify the configuration.
- type=commit   : Commit firewall configuration, including partial commits.
- type=op       : Perform operational mode commands, including checking system status and validating configurations.
- type=report   : Get reports, including predefined, dynamic, and custom reports.
- type=log      : Get logs, including traffic, threat, and event logs.
- type=import   : Import files including configurations and certificates.
- type=export   : Export files including packet captures, certificates, and keys.
- type=user-id  : Update User-ID mappings.
- type=version  : Show the PAN-OS version, serial number, and model number.

Portion of the candidate configuration Format: https:///api/key=apikey&type=config&action=get&xpath=

Firewall candidate configuration https:///api/?type=config&action=get&xpath=/config/devices/entry/vsys/entry[@name='vsys1']&key=<api_key>

Address objects in a virtual system (vsys). https:////api/?key=apikey&type=config&action=get&xpath=/config/devices/entry/vsys/entry[@name='vsys1']/address

Full list of applications https:///api/?key=apikey&type=config&action=get&xpath=/config/predefined/application

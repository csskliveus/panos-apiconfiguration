This respository is a small excercise. 

This repository will help to know on how to call Palo-alto XML API using shell script. 


API Basics:
API Basics: API Type Description 
- keygen- Generate an API Key (not shown in API Browser) 
- config- Retrieve or modify the configuration 
- commit- Commit the configuration 
- export- Export files, packet captures, and keys 
- import- Import files, certificates, response pages, and branding 
- op- Operational commands (like ‘show’ commands) • report- Retrieve predefined, dynamic, and custom reports user-id- User/IP mappings and Dynamic Address Groups

Portion of the candidate configuration Format: https:///api/key=apikey&type=config&action=get&xpath=

Firewall candidate configuration https:///api/?type=config&action=get&xpath=/config/devices/entry/vsys/entry[@name='vsys1']&key=<api_key>

Address objects in a virtual system (vsys). https:////api/?key=apikey&type=config&action=get&xpath=/config/devices/entry/vsys/entry[@name='vsys1']/address

Full list of applications https:///api/?key=apikey&type=config&action=get&xpath=/config/predefined/application

Most PAN-OS XML API requests are synchronous, meaning the response immediately provides the requested data. For example, when you Make Your First API Call and request system information, the API response is immediate and contains information such as the IP address, hostname, and model of your firewall.

However, there are some Request Types that require more time to process and are asynchronous, meaning they require more than one request to get final results. These API requests include the following:

- Get Reports (API)
- Retrieve Logs (API)
- Export Technical Support Data

Some requests to Run Operational Mode Commands (API), including download, upgrade, and installation requests
With asynchronous requests: 

- You first initiate a request. 
- The API responds with a job ID while it processes your request. 
- In your subsequent requests, you use this job ID to check on the results of your original request.
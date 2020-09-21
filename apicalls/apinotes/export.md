You can export certain types of files from the firewall using the type=export parameter in the API request.

Use the category parameter to specify the type of file that you want to export.

- Configuration            — category=configuration
- Certificates/Keys        — category=certificate
- Response pages           — category= application-block-page | captive-portal-text | file-block-continue-page | file-block-page | global-protect-portal-custom-help-page | global-protect-portal-custom-login-page | global-protect-portal-custom-welcome-page | ssl-cert-status-page | ssl-optout-text | url-block-page | url-coach-text | virus-block-page>
- Technical support data   — category=tech-support
- Device State             — category=device-state


Example:
 curl -kG -H "X-PAN-KEY:$apikey" "https://$serverip/api/?type=export&category=configuration" > "./$file_name"

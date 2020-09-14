#-----------------------------------------------------------------

## Precondition:  To run this script, xmllint needs to be deployed'
# sudo apt install libxml2-utils

# Parameters: 
# serverip or fqdn
# apikey
# new config file
#-----------------------------------------------------------------

#dateformat1='date +%m-%d-%Y'
#echo $dateformat1
$1, $2 , $3
serverip=$1
apikey=$2
newconfig_file=$3

# name the backup config file

file_name="running-config-"`date +"%Y-%m-%d"`".xml"

# delete if the same file exists
if [ -f "$file_name" ]; then
        echo "$file_name exists.So remove file."
        rm $file_name
fi

echo "----Taking back up of existing configuration file-----------"

# export running-config from the server
curl -kG -H "X-PAN-KEY:$apikey" "https://$serverip/api/?type=export&category=configuration" > "./$file_name"

echo "-------Back is completed. Please check file $file_name-----------------------"
echo ''
echo ''
echo "-------Import new configuration file -----------"

curl -k -H "X-PAN-KEY:$apikey"  --form file=@"./$newconfig_file" "https://$serverip/api/?type=import&category=configuration" > importconfig.xml
 importconfig_status=$(xmllint --xpath "string(//response/@status)" importconfig.xml)
 importconfig_message=$(xmllint --xpath "string(//response)" importconfig.xml)

 echo "-------File import status is : ' $importconfig_status '----------------------------"
 rm ./importconfig.xml
 echo ''
 echo ''
echo "----Load the configuration file ---------------------------------------------------"

# load new configuration file in the server

curl -k -H "X-PAN-KEY:$apikey" "https://$serverip/api/?type=op&cmd=<load><config><from>$newconfig_file</from></config></load>" > loadconfig.xml

# get status
 loadconfig_status=$(xmllint --xpath "string(//response/@status)" loadconfig.xml)
 loadconfig_message=$(xmllint --xpath "string(//response)" loadconfig.xml)
 echo $loadconfig_status
 echo $loadconfig_message

 echo "-------File load status is : ' $loadconfig_status '----------------------------"

 rm ./loadconfig.xml

# get response
 echo ''
 echo ''
 if [ $loadconfig_status == 'success' ]
  then
   echo "--------Commit the configuration file ----------------------------------------"

    # validate new configuration. 'Validate' is an asynchronous job. This will return a job id. We need to track job for status of the action.
    # curl -k -H "X-PAN-KEY:$apikey" "https://$serverip/api/?type=commit&cmd=<validate><full></full></validate>"

    # get the status of the job
    # curl -k -H "X-PAN-KEY:$apikey" "https://$serverip/api/?type=op&cmd=<show><jobs><id>52</id></jobs></show>"

    # commit new configuration in the server

      curl -k -H "X-PAN-KEY:$apikey" "https://$serverip/api/?type=commit&cmd=<commit><force></force></commit>" > commitconfig.xml
      commitconfig_status=$(xmllint --xpath "string(//response/@status)" commitconfig.xml)
      commitjob_id=$(xmllint --xpath "string(//response//job)" commitconfig.xml)
      echo $commitconfig_status
      echo $commitjob_id

#echo "commit job id id : $jobid"
       echo ''
       echo ''
       echo 'sleep for 1 min'
       sleep 1m

      curl -k -H "X-PAN-KEY:$apikey" "https://$serverip/api/?type=op&cmd=<show><jobs><id>$commitjob_id</id></jobs></show>" > job_status.xml
       jobresponse_status=$(xmllint --xpath "string(//response/@status)" job_status.xml)
       jobstatus=$(xmllint --xpath "string(//response//status)" job_status.xml)
       job_error=$(xmllint --xpath "string(//response//details)" job_status.xml)
       echo ''
       echo "response status '$jobresponse_status'"
       echo "commit job status is '$jobstatus'"
       echo "messages ......$job_error"
       rm ./job_status.xml
    else
      echo ''
      echo ''
      echo " Loading of the new configuration failed. Please check file again.. "
 fi

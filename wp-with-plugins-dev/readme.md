# List of free(ium) plugins used by GWR

To change version or add new plugin simply add url to plugin list.\
Make sure to not have whitespace or # in front of the URL as it won't get mached that way to be downloaded.

## build-and-publish 
This script is for convience to upload the image to dockerhub if you choose to.\
You are expected to set DHUB_USER and DHUB_PASS env viariable (can be set in .env placed in this directory).\

Alternatively you could simply build this image as part of docker-compose (uncomment build step).
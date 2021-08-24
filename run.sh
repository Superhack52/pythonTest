#!/bin/sh

# CONTAINER_NAME=dockertestrun_teamcity-agent-instance_1
# function get_image_tag {
# 	echo $( docker ps -a --format "{{.Image}}"  --filter="name=$CONTAINER_NAME")
# }

function generate_json {
cat <<EOF
{
	"buildType": {
    	"id": "PythonTest_GetResultContainer"
	},
	"properties": {
    	"property": [{
            	"name": "env.container_name",
            	"value": "${CONTAINER_NAME}"
     	   }
    	]
	}
}
EOF
}

# echo $(generate_json)
echo Test begin
pytest ./main.py --alluredir=./allure_result
echo Test ended

echo Run curl
curl -v --header "Authorization: Bearer ${TOKEN}" --request POST "http://teamcity-server-instance:8111/app/rest/buildQueue/" --data "$(generate_json)" --header "Content-Type: application/json"
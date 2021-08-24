#!/bin/sh

function get_image_tag {
	echo $( docker ps -a --format "{{.Image}}"  --filter="${CONTAINER_NAME}")
}

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
     	   },
			{
				"name": "env.image_tag",
				"value": "$(get_image_tag)"
			}
    	]
	}
}
EOF
}

echo Test begin
pytest ./main.py --alluredir=./allure_result
echo Test ended

echo Run curl
curl -v --header "Authorization: Bearer ${TOKEN}" --request POST "http://teamcity-server-instance:8111/app/rest/buildQueue/" --data "$(generate_json)" --header "Content-Type: application/json"
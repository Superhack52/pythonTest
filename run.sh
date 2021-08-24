#!/bin/sh
function generate_json {
cat <<EOF
{
	"buildType": {
    	"id": "PythonTest_GetResult"
	}
}
EOF
}

echo Test begin
pytest ./main.py --alluredir=./allure_results
echo Test ended

curl -v --header "Authorization: Bearer ${TOKEN}" --request POST "http://teamcity-server-instance:8111/app/rest/buildQueue/" --data --data "$(generate_json)" --header "Content-Type: application/json"


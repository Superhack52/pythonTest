#!/bin/sh
echo Test begin
pytest ./main.py --alluredir=./allure_results
echo Test ended
curl -v --header "Authorization: Bearer ${TOKEN}" --request POST "http://teamcity-server-instance:8111/app/rest/buildQueue/" --data "{ 'buildType': { 'id': 'PythonTest_GetResultContainer' }, 'properties': { 'property': [{ 'name': 'env.container_name', 'value': ${CONTAINER_NAME} } ]}}" --header "Content-Type: application/json"
FROM python:3.9.6-alpine3.14

WORKDIR /usr/src/app

COPY . .
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "pytest", "./main.py", "--alluredir=./allure_results"  ]
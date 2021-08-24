FROM python:3.9.6-alpine3.14

ENV TOKEN=$auth_token

RUN apk --no-cache add curl
RUN apk add --no-cache bash

WORKDIR /usr/src/app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

CMD [ "./run.sh" ]


# FROM python:3.9.6-alpine3.14

# ENV TOKEN=$auth_token

# RUN apk add --no-cache bash

# WORKDIR /usr/src/app

# COPY . .

# RUN pip install --no-cache-dir -r requirements.txt

# CMD [ "pytest", "./main.py", "--alluredir=./allure_results"  ]
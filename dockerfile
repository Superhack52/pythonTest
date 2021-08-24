FROM python:3.9.6-alpine3.14

RUN apk --no-cache add curl
RUN apk add --no-cache bash

WORKDIR /usr/src/app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt
RUN ["chmod", "+x", "/usr/src/app/run.sh"]
CMD [ "./run.sh" ]
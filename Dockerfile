FROM node:12.13.0

RUN mkdir /code
WORKDIR /code

RUN apt-get update
RUN apt-get install netcat -y

COPY package*.json ./

RUN npm install

COPY . .

RUN ["chmod", "+x", "/code/entry-point.sh"]

ENTRYPOINT ["/code/entry-point.sh"] 

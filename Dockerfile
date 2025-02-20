FROM node:10

ENV PORT 8000
EXPOSE 8000

RUN set -ex; \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
    rsync

WORKDIR /app

COPY package*.json /app/

RUN npm install

COPY . .

RUN npm run build

CMD ["npm", "start"]

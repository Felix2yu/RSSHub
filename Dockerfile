FROM node:alpine

LABEL MAINTAINER https://github.com/DIYgod/RSSHub/

ENV NODE_ENV production
ENV TZ Asia/Shanghai
RUN apk add --no-cache dumb-init
WORKDIR /app

COPY package.json /app
COPY . /app

RUN sed -i 's%<blockquote> - %%g' /app/lib/routes/weibo/utils.js

EXPOSE 1200
ENTRYPOINT ["dumb-init", "--"]

CMD ["npm", "run", "start"]

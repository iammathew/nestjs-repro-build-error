FROM node:12-alpine as builder

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

COPY . /app/
WORKDIR /app
RUN npm install \
  && npm run-script build

FROM node:12-alpine

WORKDIR /usr/src/app/

COPY --from=builder /app/node_modules ./node_modules

COPY --from=builder /app/dist ./dist
COPY package*.json ./
COPY yarn.lock ./

EXPOSE 3000
CMD [ "npm", "run", "start:prod" ]

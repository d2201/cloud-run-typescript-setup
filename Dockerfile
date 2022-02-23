FROM node:16-alpine AS build-stage

WORKDIR /app

COPY . .

RUN yarn && yarn build

FROM node:16-alpine AS production-stage

WORKDIR /app

COPY --from=build-stage /app/dist ./dist
COPY --from=build-stage /app/package.json ./package.json

RUN yarn --prod

CMD ["yarn", "start"]
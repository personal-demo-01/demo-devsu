FROM node:16.18.0-alpine as build

WORKDIR /demo

COPY package.json package-lock.json ./
RUN npm install

COPY . ./
RUN npm run build

FROM node:16.18.0-alpine

ARG SECRET_TOKEN
ENV SECRET_TOKEN=${SECRET_TOKEN}

WORKDIR /demo

COPY package.json package-lock.json ./
# Install only <dependencies>
RUN npm install --only=prod

COPY --from=build /demo/build ./build

EXPOSE 8090
CMD ["node", "build/index.js"]

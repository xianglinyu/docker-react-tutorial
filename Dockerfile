FROM node:alpine as webbuild

WORKDIR /app

COPY package.json .
RUN npm install 

COPY . .
RUN npm run build


FROM nginx
COPY --from=webbuild /app/build /usr/share/nginx/html





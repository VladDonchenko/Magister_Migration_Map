FROM node:18-alpine as build

WORKDIR /app

# Додаємо налаштування npm
RUN npm config set registry https://registry.npmjs.org/
RUN npm config set strict-ssl false

COPY package*.json ./

# Очищаємо кеш npm
RUN npm cache clean --force

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 
FROM node:20-alpine as builder
WORKDIR /app 
RUN mkdir node_modules
COPY . .

RUN npm i --omit=dev
RUN npm run build

FROM nginx
COPY --from=builder /app/nginx /etc/nginx/conf.d
EXPOSE 80 
COPY --from=builder /app/out /usr/share/nginx/html


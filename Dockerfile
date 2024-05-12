FROM node:20-alpine as builder
WORKDIR /app 

COPY . . 
RUN npm install -g pnpm

RUN pnpm i
RUN pnpm build

FROM nginx 
EXPOSE 80 
COPY --from=builder /app/out /usr/share/nginx/html

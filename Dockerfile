#Multi-step builds
FROM node:20.12.2-alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
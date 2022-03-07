FROM node:lts-stretch-slim as app
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=app /app/dist/portfolio /usr/share/nginx/html
FROM node:22-alpine
WORKDIR /app
COPY app.zip /tmp/app.zip
RUN unzip -q /tmp/app.zip -d /app && rm /tmp/app.zip
ENV PORT=8080 DATA_DIR=/data NODE_ENV=production
EXPOSE 8080
CMD ["node", "--import", "./server/register.mjs", "--experimental-strip-types", "--no-warnings", "server/main.mjs"]

FROM node:16.20.2-slim

WORKDIR /app

# Copy only the dependency files first
COPY frontend/package.json frontend/yarn.lock ./
RUN yarn install

# Copy the application files excluding unnecessary items (.dockerignore handles this)
COPY frontend/ ./

RUN yarn build

EXPOSE 3000

CMD [ "yarn", "start" ]

# This is the main docker file which will implement the multi-stage logic

FROM node:18 AS builder


#FIRST STAGE

WORKDIR /app
COPY package*.json ./

RUN npm install


COPY . .

RUN npm run build

#SECOND STAGE

FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

# JUST INTALL THE DEV DEPENDENCIES
RUN npm install --only=production

# COPY THE ALREADY BUILDED FILES
COPY --from=builder /app/dist ./dist

EXPOSE 3000


CMD ["node", "dist/index.js"]




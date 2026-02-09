FROM node:22-alpine
workdir /app
copy package*.json ./
run npm install 
copy . . 
EXPOSE 3000 
cmd ["npm", "run", "dev"]
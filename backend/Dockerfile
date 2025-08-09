FROM node:20
WORKDIR /app

# Copy package files first for better caching
COPY package.json ./

RUN npm install --production

# Copy application code
COPY . .

EXPOSE 5001
CMD ["npm", "start"]
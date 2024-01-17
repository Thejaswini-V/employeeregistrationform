# Use an official Node.js LTS image as the base image for the backend
FROM node:14

# Set the working directory for the backend
WORKDIR /app/server

# Copy the package.json and package-lock.json files and install dependencies
COPY server/package*.json ./
RUN npm install

# Copy the backend source code
COPY server .

# Expose the port on which your Node.js app is running
EXPOSE 3001

# Set the working directory for the frontend
WORKDIR /app/client

# Copy the package.json and package-lock.json files and install dependencies
COPY client/package*.json ./
RUN npm install

# Copy the frontend source code
COPY client .

# Build the React app
RUN npm run build

# Set the working directory back to the root
WORKDIR /app

# Expose the port on which your React app will be served (assuming it's 3000)
EXPOSE 3000

# Command to start both the backend and frontend
CMD ["npm", "start"]


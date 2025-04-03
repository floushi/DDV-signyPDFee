# Use an official Node.js runtime as a parent image
# Using alpine variant for smaller size
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (or npm-shrinkwrap.json)
COPY package*.json ./

# Install app dependencies
# Use --only=production if you don't need devDependencies
RUN npm install

# Bundle app source
# Copy all files from the current directory to the working directory in the container
COPY . .

# Cloud Run injects the PORT environment variable automatically.
# EXPOSE is not needed as Cloud Run handles port mapping.
# ENV PORT is not needed as Cloud Run provides the value at runtime.

# Run the app when the container launches
CMD [ "npm", "start" ]

# Use the standard Node.js 18 runtime as a parent image (Debian-based, includes more common libraries than Alpine)
FROM node:18

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
# Execute node directly instead of via npm start
CMD [ "node", "server.js" ]

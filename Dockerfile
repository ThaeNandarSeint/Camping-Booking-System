# Stage 1: Complie and build Angular codebase

# Use official node image as a base image
FROM node:latest as build

# Set up the working dir
WORKDIR /gwsc/frontend

# Add the source code to app
COPY ./ /gwsc/frontend/

# Install the dependencies
RUN npm install

# Generate the build of application
RUN npm run build


# Stage 2: Serve app with nginx server
# Use official nginx image as the base image
FROM nginx:latest

# Copy the build output to replace the default nginx contents
COPY --from=build /gwsc/frontend/dist/gwsc-frontend /usr/share/nginx/html

# Expose port 80
EXPOSE 80

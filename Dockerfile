#From baseimage
FROM node:18


#move to this folder in docker
#set the working directory in the docker,by default docker has a directory /app
WORKDIR /app 

#copy all files from source to destination
#COPY . .


#COPY package.json and paste inside /app directory
COPY package.json /app

#it will install dependencies -which in our case is express
#RUN npm install

#mentioning that we are passing an argument as NODE_ENV
ARG NODE_ENV 
RUN if ["$NODE_ENV" = "development" ]; \
	then npm install; \ 
    else npm install --only=production; \
    fi

#now copy all emaining files inside /app directory
COPY . /app

#EXPOSE port on which our application will run
#EXPOSE 3000
#to pass PORT number through environment variable
ENV PORT 3000
EXPOSE $PORT

#CMD["executable"]
CMD ["node","app.js"]

#CMD ["npm","run","dev"]
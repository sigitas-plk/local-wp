# Localhost WP Setup 

This will require you to install docker and docker-compose

[How To: Install Docker](https://docs.docker.com/desktop/)

[How To: Install Docker Compose](https://docs.docker.com/compose/install/)

## Starting wordpress 

After you're done setting up your docker and docker compose. Verify that you can pull images and can successfully connect. 

Go to the location of your docker-compose file and run:
```shell 
docker-compose up
```

This will pull and start up 3 containers with MySQL, WP with apache and phpmyadmin

If you want to run this in [detached mode](https://docs.docker.com/compose/reference/up/) 
```shell 
docker-compose up -d
```
## Accessing Wordpress Instance and Database

To access your wordpress navigate to: [http://localhost](http://localhost)

To access php my admin navigate to: [http://localhost:8080](http://localhost:8080)

User: **wordpress** 

Password: **wordpress**

## Stopping wordpress

After you're done, you can stop running containers by running in directory with your docker-compose.yml file:
```shell 
docker-compose down
```

## Modifying themes / files / accessing db files

Wordpress and DB files are mounted on **data** directory of your docker-compose.yml file. 
*Project from 42's Common Core, finished in August 2023.*

# Inception
System administration project aimed at getting familiar with Docker and Docker-Compose through setting up a Wordpress website.

### Services
- 1 Docker container with Wordpress + php-fpm
- 1 Docker container with NGINX and TLSv1.3
- 1 Docker container with MariaDB
- 1 Volume with the Wordpress database
- 1 Volume with the Wordpress website files

They will be connected through a docker-network as seen below:
![Service infrastructure](/img/inception.PNG)

The makefile will call the docker-compose.yml file, use `make up` to build and `make down` to stop.

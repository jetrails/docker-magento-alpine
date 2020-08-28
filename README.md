# Docker Magento Alpine
> Docker development environment for staging Magento 1 & Magento 2 on Alpine 3.6

![](https://img.shields.io/travis/jetrails/docker-magento-alpine.svg?style=for-the-badge&colorB=9f9f9f)
![](https://img.shields.io/badge/License-MIT-lightgray.svg?style=for-the-badge)
![](https://img.shields.io/badge/Magento-All-lightgray.svg?style=for-the-badge)
![](https://img.shields.io/docker/stars/jetrails/magento-alpine.svg?style=for-the-badge&colorB=9f9f9f)
![](https://img.shields.io/docker/pulls/jetrails/magento-alpine.svg?style=for-the-badge&colorB=9f9f9f)

<img src="docs/images/preview.png" width="400px" />

## Disclaimer

The docker containers within this repository were build for development purposes only and should **NOT** be used in production. This product is licensed under the [MIT LICENSE](LICENSE.md) and comes with no warranty, use at your own risk.

## Supported tags and respective `Dockerfile` links
- `redis` [redis/Dockerfile](src/redis/Dockerfile)
- `varnish` [varnish/Dockerfile](src/varnish/Dockerfile)
- `nginx` [nginx/Dockerfile](src/nginx/Dockerfile)
- `mysql` [mysql/Dockerfile](src/mysql/Dockerfile)
- `php-fpm-5.6` [php-fpm-5.6/Dockerfile](src/php-fpm-5.6/Dockerfile)
- `php-cli-5.6` [php-cli-5.6/Dockerfile](src/php-cli-5.6/Dockerfile)
- `php-cron-5.6` [php-cron-5.6/Dockerfile](src/php-cron-5.6/Dockerfile)
- `php-fpm-7.1` [php-fpm-7.1/Dockerfile](src/php-fpm-7.1/Dockerfile)
- `php-cli-7.1` [php-cli-7.1/Dockerfile](src/php-cli-7.1/Dockerfile)
- `php-cron-7.1` [php-cron-7.1/Dockerfile](src/php-cron-7.1/Dockerfile)
- `php-fpm-7.2` [php-fpm-7.2/Dockerfile](src/php-fpm-7.2/Dockerfile)
- `php-cli-7.2` [php-cli-7.2/Dockerfile](src/php-cli-7.2/Dockerfile)
- `php-cron-7.2` [php-cron-7.2/Dockerfile](src/php-cron-7.2/Dockerfile)

## Getting Started

Using shared volumes on MacOS with Docker is painfully slow. That is why we use **docker-sync** for sharing volumes with and between docker containers. While this solution has a slightly longer initial up-time, it makes up for it when the containers are started and initially synced. We also use **docker-compose** to run our docker containers because of it's simplicity. Sample docker-compose files for Magento 1 and Magento 2 can be found in the [dist](dist) directory. Similarly, there is a __docker-sync.yml__ file that can be used alongside either configuration. Assuming that your Magento installation lives in _public_html_ of your project folder, and the appropriate _docker-compose.yml_ and _docker-sync.yml_ files are found in the same directory, then you can start docker-sync and run the docker containers using the following sequence of commands:

```shell
docker-sync start
docker-compose up -d
```

Shutting them down is just as easy:

```shell
docker-compose down
docker-sync stop
docker-sync clean # Only if not starting again
```

## Environmental Variables

All docker images, except for the php-cli containers, have the ability to tail their container's relevant logs if the `VERBOSE=true` flag is passed as an environmental variable. Passing it to the container is optional since by default `VERBOSE=false`. It is explicitly stated within the sample _docker-compose.yml_ file for documentation purposes only.  Please also note that you will only be able to see the verbose output of these containers if you run docker-compose without the _detach_ flag, i.e. `docker-compose up`.

### mysql
Since we build off of the `mysql:5.7` image, the environment variables will look the same. One exeption is that we use `MYSQL_USER_NAME` instead of `MYSQL_USER` and `MYSQL_USER_PASSWORD` instead of `MYSQL_PASSWORD`. This is for backwards compatibility purposes. A full list of environment variables can be found [here](https://hub.docker.com/_/mysql#environment-variables).

### nginx
When NGINX starts, it copies the appropriate configuration file so it can be used. This configuration file is determined by the environment variable below. If no variable is passed then the below value is set.
- `MAGENTO_VERSION=2`

## Build System

Building our docker images is easy. We use a simple [Makefile](Makefile) to manage building and publishing our docker images. As part of our CI/CD pipeline, we use [Travis-CI](https://travis-ci.org) to build our docker images on every push to the master branch. If the build process is successfull, then those new images will be pushed to docker hub. Please note that pull requests are not built automatically to avoid automated pushes to docker hub. Below are all the commands that are implemented within our build system:

- `make build_all`: build all docker images that are found under _src_ directory
- `make build <tag>`: build specific image by passing the tag name as a parameter
- `make publish_all`: push all docker images that have a folder in _src_
- `make publish <tag>`: push specific image by passing the tag name as a parameter

## Issues / Feature Requests

If any issues come up or any feature are requested, please feel free to open up an issue through Github. For all other inquiries, feel free to email us at development@jetrails.com.

### Install Magento Using Command-Line

```shell
docker-compose run php-cli
magento setup:install \
    --base-url=http://howtospeedupmagento.com \
    --base-url-secure=https://howtospeedupmagento.com \
    --db-host=mysql \
    --db-name=magento \
    --db-user=magento \
    --db-password=magento \
    --backend-frontname=admin \
    --admin-firstname=jetrails \
    --admin-lastname=jetrails \
    --admin-email=admin@example.com \
    --admin-user=jetrails \
    --admin-password=jetrails312 \
    --language=en_US \
    --currency=USD \
    --timezone=America/Chicago \
    --use-rewrites=1 \
    --search-engine=elasticsearch7 \
    --elasticsearch-host=elasticsearch \
    --elasticsearch-port=9200 \
    --elasticsearch-username=elastic \
    --elasticsearch-password=changeme
```

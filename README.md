# Docker Magento Alpine
> Docker development environment for staging Magento 1 & Magento 2 on Alpine 3.6

![](https://img.shields.io/badge/Version-1.0.4-lightgray.svg?style=for-the-badge)
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

## Getting Started

Using shared volumes on MacOS with Docker is painfully slow. That is why we use **docker-sync** for sharing volumes with and between docker containers. While this solution has a slightly longer initial up-time, it makes up for it when the containers are started and initially synced. We also use **docker-compose** to build/run our docker containers because of it's simplicity. Sample docker-compose files for Magento 1 and Magento 2 can be found in the [dist](dist) directory. Similarly, there is a __docker-sync.yml__ file that can be used alongside either configuration. Assuming that your Magento installation lives in _public_html_ of your project folder, and the appropriate _docker-compose.yml_ and _docker-sync.yml_ files are found in the same directory, then you can start docker-sync and run the docker containers using the following sequence of commands:

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
Below are the possible environment variable that can be passed to the _mysql_ docker container with some sample values. If non are passed, then only the _root_ user will exist with the default password of _mysql_.
- `MYSQL_ROOT_PASSWORD=mysql`
- `MYSQL_USER_NAME=magento_db_user`
- `MYSQL_USER_PASSWORD=password123`
- `MYSQL_DATABASE=magento`

### nginx
When NGINX starts, it copies the appropriate configuration file so it can be used. This configuration file is determined by the environment variable below. If no variable is passed then the below value is set.
- `MAGENTO_VERSION=2`

## Build Process

Building our docker images is easy since we use docker-compose to do it for us. Simply run `docker-compose -f build.yml build` to build the docker containers from source. Once built, and with proper permission, feel free to push them to docker using `docker push jetrails/magento-alpine:<tag>`.

## Issues / Feature Requests

If any issues come up or any feature are requested, please feel free to open up an issue through Github. For all other inquiries, feel free to email us at development@jetrails.com.

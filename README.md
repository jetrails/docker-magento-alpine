# Docker Magento Alpine
> Docker development environment for staging Magento 2 on Alpine 3.6

![](https://img.shields.io/badge/Version-1.0.0-lightgray.svg?style=for-the-badge)
![](https://img.shields.io/badge/License-MIT-lightgray.svg?style=for-the-badge)
![](https://img.shields.io/badge/Magento-2-lightgray.svg?style=for-the-badge)
![](https://img.shields.io/docker/stars/jetrails/magento-alpine.svg?style=for-the-badge&colorB=9f9f9f)
![](https://img.shields.io/docker/pulls/jetrails/magento-alpine.svg?style=for-the-badge&colorB=9f9f9f)

<img src="docs/images/preview.png" width="400px" />

## Disclaimer

The docker containers within this repository were build for development purposes only and should **NOT** be used in production. This product is licensed under the [MIT LICENSE](LICENSE.md) and comes with no warranty, use at your own risk.

## Getting Started

Using shared volumes on MacOS with Docker is painfully slow. That is why we use **docker-sync** for sharing volumes with and between docker containers. While this solution has a slightly longer up time, it makes up for it when the containers are started. We also use **docker-compose** to build/run our docker containers because of it's simplicity. Sample _docker-compose.yml_ and _docker-sync.yml_ files can be found in the [dist](dist) directory. Assuming that your Magento 2 installation lives in _public_html_ of your project folder, you can start docker-sync and run the docker containers using the following sequence of commands:

```shell
docker-sync start
docker-compose up -d
```

Shutting them down is just as easy:

```shell
docker-compose down
docker-sync stop
docker-sync clean
```

## Environmental Variables

All docker containers, except for _php-cli-7.1_, have the ability to tail their container's relevant logs if the `VERBOSE=true` flag is passed as an environmental variable. Passing it to the container is optional since by default `VERBOSE=false`. It is explicitly stated within the sample _docker-compose.yml_ file for documentation purposes only.  Please also note that you will only be able to see the verbose output of these containers if you run docker-compose without the _detach_ flag, i.e. `docker-compose up`.

### mysql
Below are the possible environment variable that can be passed to the _mysql_ docker container with some sample values. If non are passed, then only the _root_ user will exist with the default password of _mysql_.
- `MYSQL_ROOT_PASSWORD=mysql`
- `MYSQL_USER_NAME=magento_db_user`
- `MYSQL_USER_PASSWORD=password123`
- `MYSQL_DATABASE=magento`

## Build Process

Building our docker containers is easy since we use docker-compose to do it for us. Simply run `docker-compose -f build.yml build` to build the docker containers from source. Once built, and with permissions, feel free to push them to docker using `docker push jetrails/magento-alpine:<tag>`.

## Issues / Feature Requests

If any issues come up or any feature are requested, please feel free to open up an issue through Github. For all other inquiries, feel free to email us at development@jetrails.com.

# Easy Xmrig Miner Docker Image

## Table of Contents

- [Easy Xmrig Miner Docker Image](#easy-xmrig-miner-docker-image)
  - [Table of Contents](#table-of-contents)
  - [About](#about)
  - [Build](#build)
    - [Prerequisites](#prerequisites)
    - [Building](#building)
  - [Deployment](#deployment)
    - [Prerequisites](#prerequisites-1)
    - [Running](#running)


## About

This is a docker image for the [Xmrig](https://github.com/xmrig/xmrig) miner. It is based on the [Ubuntu](https://hub.docker.com/_/ubuntu) image. It is meant to be easily deployed on a client in just seconds.

## Build

You need to build the image on every Architecture you want to run it on. Using images from other architectures will lead to errors when running the container.

### Prerequisites

- [Docker](https://www.docker.com/)
- [Git](https://git-scm.com/)

### Building

To build the image, first clone the repository:

    git clone https://github.com/proliecan/xmrig-docker.git

Then, build the image with the following command:

    docker build -t xmrig xmrig-docker --build-arg wallet=<wallet> --build-arg pool=<pool> --build-arg password=<password> --build-arg donate-level=<donate-level>

In the above command, replace the following values with your own:

 - `<wallet>` is your wallet address
 - `<pool>` is the pool you want to mine on
 - `<password>` is the password for the pool (or the name of your worker, depending on the pool)
 - `<donate-level>` is the percentage of your hashrate you want to donate to the Xmrig project (default is 5%)

The flags in the above command are:
- `--build-arg wallet=<wallet>` sets the wallet address
- `--build-arg pool=<pool>` sets the pool
- `--build-arg password=<password>` sets the password / worker name
- `--build-arg donate-level=<donate-level>` sets the donation level
- `-t xmrig` names the image `xmrig`
- `xmrig-docker` is the path to the cloned repository

This might take a bit of time, depending on your internet connection and your CPU because it has to download the Ubuntu image, update it, download all the dependencies and compile Xmrig.

## Deployment

### Prerequisites

- [Docker](https://www.docker.com/)

### Running

To run the image, use the following command:

    docker run [-d] -it --name xmrig xmrig

 - `-d` runs the container in the background
 - `-it` runs the container in interactive mode
 - `--name xmrig` names the container `xmrig`
 - `xmrig` is the name of the image you just built

To detach from the container when running it without `-d`, press `Ctrl + P` followed by `Ctrl + Q`.

To attach to the container when running it with `-d`, use the following command:

    docker attach xmrig

To stop the container, use the following command:
    
        docker stop xmrig

To remove the container, use the following command:

    docker rm xmrig

To remove the repository and the image, use the following command:

    docker rmi xmrig && rm -rf xmrig-docker

To view the logs of the container in real time, use the following command:

    docker logs -f xmrig


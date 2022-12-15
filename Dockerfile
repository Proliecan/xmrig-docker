FROM ubuntu:latest
# ARGs: Insert your wallet address, pool and worker name (or password dependong on the pool)
ARG wallet=<WalletAddress>
ARG pool=gulf.moneroocean.stream:10128
ARG pass=<UnnamedWorker>
ARG donate-level=5

ENV WALLET=$wallet
ENV POOL=$pool
ENV PASS=$pass
ENV DONATE_LEVEL=$donate-level

# Install
RUN apt update && apt full-upgrade -y \
    # Update
    && apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y \
    # Clone
    && cd /etc \
    && git clone https://github.com/xmrig/xmrig.git \
    && cd xmrig \
    # Build
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    # copy to /usr/bin
    && cp xmrig /usr/bin

# execute xmrig in shell
CMD [ "sh", "-c", "xmrig -o $POOL -u $WALLET -p $PASS -k --donate-level= $DONATE_LEVEL" ]
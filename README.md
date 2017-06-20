# electrumx-docker
Dockerfile for [electrumx](https://github.com/kyuupichan/electrumx) on Ubuntu 14.04 with leveldb and daemontools.

## Step 1. Configuration
Edit `env/COIN` to your coin.

Edit `env/DAEMON_URL` accordingly.Need to match your daemon.

For AltCoins,edit your coin class in `env/coins.py`.`env/coins.py` will be append to [electrumx/lib/coins.py](https://github.com/kyuupichan/electrumx/blob/master/lib/coins.py)

Leave others defaults

## Step 2.Run
Build docker image :
```shell
      cd electrumx-docker
      docker build -t electrumx-docker .
```

Run docker:
```shell
    docker run -idt electrumx-docker
```



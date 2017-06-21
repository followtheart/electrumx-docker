# electrumx-docker
Dockerfile for [electrumx](https://github.com/kyuupichan/electrumx) on Ubuntu with leveldb and daemontools.

## Build by yourself
### Step 1. Configuration
Edit `env/COIN` to your coin.

Edit `env/DAEMON_URL` accordingly.Need to match your daemon.

For AltCoins,edit your coin class in `env/coins.py`.`env/coins.py` will be append to [electrumx/lib/coins.py](https://github.com/kyuupichan/electrumx/blob/master/lib/coins.py)

Leave others defaults

### Step 2.Run
Build docker image :
```shell
      cd electrumx-docker
      docker build -t electrumx .
```

Run docker:
```shell
    docker run -idt electrumx
```

## Or pull image from docker hub.

```
      docker pull followtheart/electrumx
```
Or
```
      docker run --name electrumx -idt followtheart/electrumx
```
then enter docker

Edit `/home/electrumx/scripts/electrumx/env/COIN` to your coin.

Edit `/home/electrumx/scripts/electrumx/env/DAEMON_URL` accordingly.Need to match your daemon.

For AltCoins,edit your coin class in `/home/electrumx/electrumx/lib/coins.py`.

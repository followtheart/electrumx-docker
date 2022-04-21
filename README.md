# electrumx-docker
Dockerfile for [electrumx](https://github.com/kyuupichan/electrumx) on Ubuntu with leveldb and daemontools.

## Usage
### Step 1. Configuration
```
git clone https://github.com/followtheart/electrumx-docker.git
cd electrumx-docker
```

Then,Edit `env/COIN` to your coin.

Edit `env/DAEMON_URL` accordingly.Need to match your daemon.

For AltCoins,edit your coin class in `env/coins.py`.`env/coins.py` will be append to [electrumx/lib/coins.py](https://github.com/kyuupichan/electrumx/blob/master/electrumx/lib/coins.py)

Leave others defaults

### Step 2.Run
Run from docker hub:
```shell
    docker run -v env:/env  -idt followtheart/electrumx
```

Or,build your special env docker image :
```shell
      docker build -t electrumx .
      docker run -v -idt electrumx
```

## THANKS

### Warmly welcome all kinds of suggestions

Thanks for suggestions from:

[kyuupichan](https://github.com/kyuupichan/electrumx)

[qinshulei](https://github.com/qinshulei)


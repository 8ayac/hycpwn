# hycpwn

## Description
This environment is fully tuned for 8ayac's CTF(Pwn) life.
But for you to pwn, that may be a useful environment to some extent.
If you are interested in it, please try it!

## Installation
### From GitHub
```sh
git clone https://github.com/8ayac/hycpwn.git && cd hycpwn
docker build -t hycpwn
```

### From DockerHub
The image can alos be got from [Docker Hub](https://hub.docker.com/r/8ayac/hycpwn)
```sh
docker pull 8ayac/hycpwn
```

## How to use
Start up the image.
```
docker run -it 8ayac/hycpwn
```

## Includes
* radare2
* ltrace
* strace
* gdb-peda
* Pwngdb
* rp++
* pwntools
* libformatstr
* neovim
* zsh
* etc...

# hycpwn

## Description
This environment is fully tuned for 8ayac's CTF(Pwn) life.  
But for you to pwn, that may be a useful environment to some extent.  
If you are interested in it, please try it!

## Installation
### From GitHub
```sh
$ git clone https://github.com/8ayac/hycpwn.git && cd hycpwn
$ docker build -t hycpwn ./
```

### From DockerHub
The image can also be got from [Docker Hub](https://hub.docker.com/r/8ayac/hycpwn)
```sh
$ docker pull 8ayac/hycpwn
```

## How to use
Start up the image.
```
$ docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it 8ayac/hycpwn
```

## Includes
* [radare2](https://github.com/radare/radare2.git)
* ltrace
* strace
* [gdb-peda](https://github.com/longld/peda.git)
* [Pwngdb](https://github.com/scwuaptx/Pwngdb.git)
* [mgpeda](https://github.com/miyagaw61/mgpeda.git)
* [rp++](https://github.com/0vercl0k/rp.git)
* [pwntools](https://github.com/Gallopsled/pwntools.git)
* [libformatstr](https://github.com/hellman/libformatstr.git)
* [neovim](https://github.com/neovim/neovim.git)
* [zsh](www.zsh.org)
* etc...

FROM ubuntu
MAINTAINER 8ayac <Twitter: @8ayac>

# タイムゾーンの設定
ENV TZ Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# homeディレクトリの設定
ENV HOME /home/root
RUN mkdir -p /home/root \
    mkdir -p /home/root/Workdir \
    mkdir -p /home/root/Documents \
    mkdir -p /home/root/Downloads

# apt
RUN apt-get -qy update && apt-get install -qy \
    sudo \
    git \
    curl \
    wget \
    xsel \
    netcat \
    socat \
    zsh \
    python \
    python-dev \
    python-pip \
    python3 \
    python3-dev \
    python3-pip \
    ltrace \
    strace \
    gdb \
    # pwntools用 {{{
    libssl-dev \
    libffi-dev \
    build-essential
    # }}}

# for 32bit executable file
RUN dpkg --add-architecture i386
RUN apt-get -qy update && apt-get install -qy \
    libc6:i386 \
    libncurses5:i386 \
    libstdc++6:i386 \
    gcc-multilib \
    g++-multilib

# radare2
RUN git clone https://github.com/radare/radare2 ~/Downloads/radare2 && \
    cd ~/Downloads/radare2 && sys/install.sh > /dev/null 2>&1

# gdb, gdb-peda
RUN git clone https://github.com/longld/peda.git ~/peda && \
    echo "source ~/peda/peda.py" >> ~/.gdbinit

# mgtools, mgpeda
RUN git clone https://github.com/miyagaw61/mgtools.git ~/repos/mgtools && \
    git clone https://github.com/miyagaw61/mgpeda.git ~/Downloads/mgpeda && \
    cd ~/Downloads/mgpeda && yes | ./mgpeda_install.sh 2>&1
ENV PATH $PATH:~/repos/mgtools

# dotfiles
RUN git clone https://github.com/8ayac/dotfiles.git ~/dotfiles && \
    ~/dotfiles/00_install/neovim-install.sh && \
    ~/dotfiles/00_install/zsh-install.sh && \
    ~/dotfiles/00_install/zsh-syntax-highlighting-install.sh

# pwntools
RUN pip install -q --upgrade pip && \
    pip install -q --upgrade pwntools

# libformatstr
RUN pip install --upgrade libformatstr

# rop
RUN wget -q https://github.com/0vercl0k/rp/releases/download/v1/rp-lin-x64 && \
    wget -q https://github.com/0vercl0k/rp/releases/download/v1/rp-lin-x86 && \
    chmod +x rp-lin-x64 rp-lin-x86 && \
    mv rp-lin-x64 rp-lin-x86 /usr/local/bin

WORKDIR /home/root/Workdir
CMD ["/usr/bin/zsh"]

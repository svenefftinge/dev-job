FROM gitpod/workspace-full

USER gitpod

#Install Google key
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Install custom tools, runtime, etc.
RUN sudo apt-get update && sudo apt-get update -y && \
    sudo apt-get install -y git-all google-chrome-stable

# Install ZSH
RUN git clone https://github.com/jotyGill/quickz-sh.git ./quickz
WORKDIR /home/gitpod/quickz
RUN chmod +x ./quickz.sh
RUN ./quickz.sh -c

FROM silex/emacs
RUN useradd app

COPY --chown=app init.el /home/app/.emacs.d/init.el

# Node for ob-js
RUN curl -sL https://deb.nodesource.com/setup_17.x | bash - 
RUN apt-get install -y nodejs

# Install Golang

RUN apt-get install -y golang

# Install jq

RUN apt-get install -y jq

# Install Rust

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

USER app

# Parse the emacs config so we get pre-compiled packages
RUN emacs --batch --load /home/app/.emacs.d/init.el

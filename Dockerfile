FROM alpine:3.18.2

RUN addgroup -g 1000 myuser && \
    adduser -D -u 1000 -G myuser myuser

RUN apk add git neovim alpine-sdk yarn unzip wget python3 py3-pip npm lazygit ripgrep zlib-dev openssl-dev --update

RUN npm install -g neovim

USER myuser

WORKDIR /home/myuser

RUN git clone --depth=1 https://github.com/pyenv/pyenv.git .pyenv

ENV PYENV_ROOT="/home/myuser/.pyenv"
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"

RUN pyenv install 3.11.3 && \
    pyenv global 3.11.3

RUN python -m venv ~/.pynvim_venv && \
    ~/.pynvim_venv/bin/pip install pynvim

RUN git clone https://github.com/agusdmb/nvim ~/.config/nvim

RUN git config --global --add safe.directory '*'

WORKDIR /home/myuser/workspace

CMD ["nvim"]

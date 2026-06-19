FROM node:20-bullseye-slim

RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/1gamer539a/livai-md.git /livai_bot

WORKDIR /livai_bot

RUN unzip ovl-md-v2-corrige.zip && cp -r livai-md-v2/* . && rm -rf livai-md-v2 ovl-md-v2-corrige.zip

RUN npm install

EXPOSE 8000

CMD ["node", "index.js"]

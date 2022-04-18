FROM ruimarinho/bitcoin-core:22.0

RUN apt-get update
RUN apt-get install jq curl -y

WORKDIR /home/playgraund

COPY ./e2e/ e2e/
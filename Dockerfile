FROM ruimarinho/bitcoin-core:22.0

RUN apt-get update
RUN apt-get install jq curl -y

WORKDIR /home

COPY ./e2e/ playgraund/e2e/
COPY ./configs/ bitcoin/.bitcoin/
# RUN ls bitcoin/.bitcoin -al

# /home/bitcoin/.bitcoin/bitcoin.conf
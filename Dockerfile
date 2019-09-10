FROM hashicorp/packer:light

ENV KUBECTL_VER v1.15.3

RUN set -x \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VER/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && sudo mv ./kubectl /usr/local/bin/kubectl \
    && rm /var/cache/apk/*

WORKDIR /tmp

ENTRYPOINT ["/bin/bash", "-c"]

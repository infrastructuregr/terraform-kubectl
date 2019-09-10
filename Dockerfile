FROM hashicorp/packer:light

ENV KUBECTL_VER v1.15.3

RUN set -x \
    && apk add --update --no-cache curl ca-certificates \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VER/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && curl -L https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator -o /usr/local/bin/aws-iam-authenticator \
    && chmod +x /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/aws-iam-authenticator \
    && rm /var/cache/apk/*

WORKDIR /tmp

ENTRYPOINT ["/bin/bash", "-c"]

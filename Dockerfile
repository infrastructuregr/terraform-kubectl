FROM hashicorp/terraform:0.12.10

ENV KUBECTL_VER v1.16.0
WORKDIR /tmp

RUN apk add --update --no-cache curl ca-certificates

ADD https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VER/bin/linux/amd64/kubectl /usr/bin/kubectl
RUN chmod +x /usr/bin/kubectl

ENTRYPOINT ["/bin/sh","-c"]

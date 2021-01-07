FROM hashicorp/terraform:0.14.4

WORKDIR /tmp

RUN apk add --update --no-cache curl ca-certificates
RUN curl -sLO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

RUN mv ./kubectl /usr/bin/kubectl \
    && chmod +x /usr/bin/kubectl \
    && kubectl version --short --client

ENTRYPOINT ["/bin/sh","-c"]

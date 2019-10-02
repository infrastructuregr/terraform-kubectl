FROM hashicorp/terraform:light

ENV KUBECTL_VER v1.16.0
WORKDIR /tmp


RUN apk add --update --no-cache curl ca-certificates

ADD https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VER/bin/linux/amd64/kubectl /usr/bin/kubectl
RUN chmod +x /usr/bin/kubectl

ADD https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator /usr/bin/aws-iam-authenticator
RUN chmod +x /usr/bin/aws-iam-authenticator


ENTRYPOINT ["/bin/bash", "-c"]

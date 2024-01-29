FROM alpine:3.19.1

LABEL name="aws-cdk-action"
LABEL repository="https://github.com/ScottBrenner/aws-cdk-action"
LABEL homepage="https://github.com/ScottBrenner/aws-cdk-action"
LABEL org.opencontainers.image.source="https://github.com/ScottBrenner/aws-cdk-action"

LABEL "com.github.actions.name"="aws-cdk-action"
LABEL "com.github.actions.description"="GitHub Action for AWS CDK"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="yellow"

LABEL "maintainer"="Scott Brenner <scott@scottbrenner.me>"

RUN apk --no-cache add nodejs npm python3 py3-pip git make musl-dev go
RUN npm install -g aws-cdk
RUN pip3 install aws-cdk-lib --break-system-packages

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]

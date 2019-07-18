FROM alpine:edge

LABEL name="aws-cdk-action"
LABEL version="1.0.0"
LABEL repository="https://github.com/ScottBrenner/aws-cdk-action"
LABEL homepage="https://github.com/ScottBrenner/aws-cdk-action"

LABEL "com.github.actions.name"="aws-cdk-action"
LABEL "com.github.actions.description"="GitHub Action for AWS CDK"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="yellow"

LABEL "maintainer"="Scott Brenner <scott@scottbrenner.me>"

RUN apk add --update nodejs nodejs-npm python3 py-pip
RUN ln -sf python3 /usr/bin/python
RUN npm install -g aws-cdk typescript
RUN pip3 install aws-cdk.core

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
FROM alpine:3.10.1

LABEL name="aws-cdk"
LABEL version="0.0.1"
LABEL repository="https://github.com/ScottBrenner/aws-cdk-action"
LABEL homepage="https://github.com/ScottBrenner/aws-cdk-action"

LABEL "com.github.actions.name"="aws-cdk"
LABEL "com.github.actions.description"="GitHub Actions for AWS CDK"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="yellow"

LABEL "maintainer"="Scott Brenner <scott@scottbrenner.me>"

RUN apk add nodejs nodejs-npm python3 

RUN npm install -g aws-cdk typescript

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
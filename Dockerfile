FROM alpine:3.19.0

LABEL name="aws-cdk-action"
LABEL repository="https://github.com/ScottBrenner/aws-cdk-action"
LABEL homepage="https://github.com/ScottBrenner/aws-cdk-action"
LABEL org.opencontainers.image.source="https://github.com/ScottBrenner/aws-cdk-action"

LABEL "com.github.actions.name"="aws-cdk-action"
LABEL "com.github.actions.description"="GitHub Action for AWS CDK"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="yellow"

LABEL "maintainer"="Scott Brenner <scott@scottbrenner.me>"

RUN apk --no-cache add nodejs npm python3 pipx
RUN pipx ensurepath
RUN npm install -g aws-cdk-lib
RUN pipx install --no-dir aws-cdk-lib

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]

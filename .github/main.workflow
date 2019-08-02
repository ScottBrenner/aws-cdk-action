workflow "Build and Publish" {
  on = "push"
  resolves = "Docker Publish"
}

action "Shell Lint" {
  uses = "actions/bin/shellcheck@master"
  args = "entrypoint.sh"
}

action "Test" {
  uses = "actions/bin/bats@master"
  args = "test/*.bats"
}

action "Docker Lint" {
  uses = "docker://replicated/dockerfilelint:09a5034"
  args = ["Dockerfile"]
}

action "Build" {
  needs = ["Shell Lint", "Test", "Docker Lint"]
  uses = "actions/docker/cli@master"
  args = "build -t aws-cdk-action ."
}

action "Publish Filter" {
  needs = ["Build"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Docker Tag" {
  needs = ["Publish Filter"]
  uses = "actions/docker/tag@master"
  args = "aws-cli-action scottbrenner/aws-cli-action --no-latest"
}

action "Docker Login" {
  needs = ["Docker Tag"]
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Docker Publish" {
  needs = ["Docker Login"]
  uses = "actions/docker/cli@master"
  args = "push scottbrenner/aws-cli-action"
}

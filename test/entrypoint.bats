#!/usr/bin/env bats

PATH="$PATH:$BATS_TEST_DIRNAME/bin"

function setup() {
  # Override PATH to mock out the aws cdk
  export PATH="$BATS_TEST_DIRNAME/bin:$PATH"
  # Ensure GITHUB_WORKSPACE is set
  export GITHUB_WORKSPACE='.'
}

@test "entrypoint runs successfully" {
  run cdk --help
  [ "$status" -eq 0 ]
}

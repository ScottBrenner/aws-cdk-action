#!/usr/bin/env bats

PATH="$PATH:$BATS_TEST_DIRNAME/bin"

function setup() {
  # Override PATH to mock out the aws cdk
  export PATH="$BATS_TEST_DIRNAME/bin:$PATH"
  # Ensure GITHUB_WORKSPACE is set
  export GITHUB_WORKSPACE='.'
}


@test "entrypoint runs successfully" {
  chmod a+x $GITHUB_WORKSPACE/entrypoint.sh
  run $GITHUB_WORKSPACE/entrypoint.sh help
  echo $output
  [ "$status" -eq 0 ]
}

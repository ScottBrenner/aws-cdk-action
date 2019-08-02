#!/usr/bin/env bats

@test "entrypoint runs successfully" {
  chmod a+x test/bin/cdk
  run test/bin/cdk
  echo $output
  [ "$status" -eq 0 ]
}

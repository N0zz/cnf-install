#!/usr/bin/env bash

testVersion() {
  assertEquals "Version: v0.1 (https://github.com/N0zz/cnf-install/releases/tag/v0.1)" "$(/workspace/cnf-install -v)"
}

. /workspace/shunit2

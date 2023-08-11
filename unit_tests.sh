#!/bin/env bash

# Source the shunit2 framework
. shunit2

# Source your script to be tested
. cnf-install

# Define your tests using functions
testVersion() {
  assertEquals "Version: v0.1 (https://github.com/N0zz/cnf-install/releases/tag/v0.1)" "$(cnf-install -v)"
}

# Run the tests
. shunit2

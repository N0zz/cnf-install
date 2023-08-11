#!/usr/bin/env bash

testVersion() {
  assertEquals "Version: v0.1 (https://github.com/N0zz/cnf-install/releases/tag/v0.1)" "$(./cnf-install -v)"
}

testSearch() {
  assertContains "Installer: " "$(./cnf-install http)"
}

testInstall() {
  ./cnf-install http -i
  rc=$($?)
  assertTrue "[ ${rc} == 0 ]"
}

. ./shunit2

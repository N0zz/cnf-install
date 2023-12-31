#!/usr/bin/env bash

testVersion() {
  assertEquals "Version: v0.2 (https://github.com/N0zz/cnf-install/releases/tag/v0.2)" "$(./cnf-install -v)"
}

testSearch() {
  assertContains "$(./cnf-install http -f)" "Installer: "
}

testInstall() {
  yes | ./cnf-install http -i
  rc=$?
  assertTrue "[ ${rc} == 0 ]"
}

testInstalledPackage() {
  http --version
  rc=$?
  assertTrue "[ ${rc} == 0 ]"
}

. ./shunit2

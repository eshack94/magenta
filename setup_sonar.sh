#!/bin/bash

## Download and unzip the Scanner for your CI ##

local SONAR_SCANNER_VERSION=3.3.0.1492

export SONAR_SCANNER_HOME=$HOME/.sonar/sonar-scanner-$SONAR_SCANNER_VERSION
rm -rf $SONAR_SCANNER_HOME
mkdir -p $SONAR_SCANNER_HOME
curl -sSLo $HOME/.sonar/sonar-scanner.zip http://repo1.maven.org/maven2/org/sonarsource/scanner/cli/sonar-scanner-cli/$SONAR_SCANNER_VERSION/sonar-scanner-cli-$SONAR_SCANNER_VERSION.zip
unzip $HOME/.sonar/sonar-scanner.zip -d $HOME/.sonar/
rm $HOME/.sonar/sonar-scanner.zip
export PATH=$SONAR_SCANNER_HOME/bin:$PATH
export SONAR_SCANNER_OPTS="-server"

sonar-scanner \
  -Dsonar.projectKey=eshack94_magenta \
  -Dsonar.organization=eshack94-github \
  -Dsonar.sources=. \
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.login=b7dd0df83ac018d591368374e7b7ef750e9e3339
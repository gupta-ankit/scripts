#!/bin/bash

mkdir $1
cd $1
touch "build.gradle"
echo "apply plugin: 'java'" >> "build.gradle"
mkdir -p src/main/java
mkdir -p src/main/resources
mkdir -p src/test/java
mkdir -p src/test/resources
cd -

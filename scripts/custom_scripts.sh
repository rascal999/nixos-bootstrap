#!/usr/bin/env bash

# For each script in ~/custom_scripts
for f in ~/custom_scripts/*.sh; do
  echo Running $f ..
  $f
done

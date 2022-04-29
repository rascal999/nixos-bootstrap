#!/usr/bin/env bash

# For each script in ~/custom_scripts
for f in ~/custom_scripts/*.sh; do
  if [[ -f $f ]]; then
    echo Running $f ..
    $f
  fi
done

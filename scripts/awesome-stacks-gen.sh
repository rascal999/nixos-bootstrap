#!/usr/bin/env bash

echo "ds-net-traefik() {"
echo "    docker network create --driver=overlay traefik-net"
echo "    docker stack deploy -c $HOME/git/misc/awesome-stacks/stacks/traefik.yml traefik"
echo "}"
echo

for STACK in $HOME/git/misc/awesome-stacks/stacks/*
do
   TARGET=`echo -n $STACK | gawk -F '/' '{ print $NF }' | sed 's/.yml//g'`
   echo "# $TARGET"
   echo "ds-${TARGET}() {"
   echo "    ds-net-traefik"
   echo "    DOMAIN=${TARGET}.ds docker stack deploy -c $HOME/git/misc/awesome-stacks/stacks/${TARGET}.yml $TARGET"
   echo "    firefox https://${TARGET}.ds &; disown"
   echo "    watch docker stack ps $TARGET"
   echo "}"
   echo
   echo "ds-${TARGET}-kill() {"
   echo "    docker stack rm $TARGET"
   echo "    sleep 6"
   echo "    docker volume prune"
   echo "}"
   echo
done

echo -n "# "
for STACK in $HOME/git/misc/awesome-stacks/stacks/*
do
   TARGET=`echo -n $STACK | gawk -F '/' '{ print $NF }' | sed 's/.yml//g'`
   echo -n "${TARGET}.ds "
done

echo
echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh"

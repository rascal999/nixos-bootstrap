# nixos-bootstrap

On a new box run the following:

```
curl -L https://bit.ly/3EmjFlZ -o master.zip
unzip master.zip
cd nixos-bootstrap-main
./init.sh
```

Reboot and run:

```
git clone https://github.com/rascal999/nixos-bootstrap.git $HOME/git/nixos-bootstrap
cd $HOME/git/nixos-bootstrap
./post_install.sh
./pentest_resources.sh
```

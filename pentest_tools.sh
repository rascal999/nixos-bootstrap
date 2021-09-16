#!/usr/bin/env bash

echo "### NixOS post install pentest resources script"

#docker pull kalilinux/kali-linux-docker                # official Kali Linux
docker pull owasp/zap2docker-stable                     # official OWASP ZAP
docker pull wpscanteam/wpscan                           # official WPScan
docker pull metasploitframework/metasploit-framework    # Official Metasploit
docker pull citizenstig/dvwa                            # Damn Vulnerable Web Application (DVWA)
docker pull wpscanteam/vulnerablewordpress              # Vulnerable WordPress Installation
docker pull hmlio/vaas-cve-2014-6271                    # Vulnerability as a service: Shellshock
docker pull hmlio/vaas-cve-2014-0160                    # Vulnerability as a service: Heartbleed
docker pull opendns/security-ninjas                     # Security Ninjas
docker pull usertaken/archlinux-pentest-lxde            # Arch Linux Penetration Tester
docker pull diogomonica/docker-bench-security           # Docker Bench for Security
docker pull ismisepaul/securityshepherd                 # OWASP Security Shepherd
docker pull danmx/docker-owasp-webgoat                  # OWASP WebGoat Project docker image
docker pull vulnerables/web-owasp-nodegoat              # OWASP NodeGoat
docker pull citizenstig/nowasp                          # OWASP Mutillidae II Web Pen-Test Practice Application
docker pull bkimminich/juice-shop                       # OWASP Juice Shop
docker pull phocean/msf                                 # Docker Metasploit
docker pull frapsoft/slowhttptest                       # Application Layer DoS attack simulator
docker pull guidelacour/whatweb                         # Next generation web scanner

# nikto
git clone https://github.com/sullo/nikto.git $HOME/git/nikto
cd $HOME/git/nikto
docker build -t "sullo/nikto" .

# impacket
git clone https://github.com/SecureAuthCorp/impacket.git $HOME/git/impacket
cd $HOME/git/impacket
docker build -t "impacket:latest" .

# hacktricks
git clone https://github.com/carlospolop/hacktricks.git $HOME/git/hacktricks

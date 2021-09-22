#!/usr/bin/env bash

echo "### NixOS post install pentest resources script"

function docker_login_prompt() {
    while true; do
        read -p "docker login? [yN] " yn
        case $yn in
            [Yy]* ) docker login; break;;
            [Nn]* ) break;;
            * ) break;;
        esac
    done
}

function docker_pull_prompt() {
    while true; do
        read -p "$1 rebuilt daily, pull? [yN] " yn
        case $yn in
            [Yy]* ) docker pull $1; break;;
            [Nn]* ) break;;
            * ) break;;
        esac
    done
}

# Prompts
docker_login_prompt
docker_pull_prompt booyaabes/kali-linux-full
docker_pull_prompt firefart/dockerctf           # Docker image with some common ctf tools

# Operating Systems
docker pull alpine
docker pull ubuntu
docker pull centos
docker pull debian
docker pull amazonlinux
docker pull fedora
#docker pull kalilinux/kali-rolling

# Other stuff
docker pull owasp/zap2docker-stable                     # official OWASP ZAP
docker pull wpscanteam/wpscan                           # official WPScan
docker pull metasploitframework/metasploit-framework    # Official Metasploit
docker pull citizenstig/dvwa                            # Damn Vulnerable Web Application (DVWA)
docker pull l505/vulnerablewordpress                    # Vulnerable WordPress Installation
docker pull hmlio/vaas-cve-2014-6271                    # Vulnerability as a service: Shellshock
docker pull hmlio/vaas-cve-2014-0160                    # Vulnerability as a service: Heartbleed
docker pull opendns/security-ninjas                     # Security Ninjas
docker pull diogomonica/docker-bench-security           # Docker Bench for Security
docker pull ismisepaul/securityshepherd                 # OWASP Security Shepherd
docker pull danmx/docker-owasp-webgoat                  # OWASP WebGoat Project docker image
docker pull vulnerables/web-owasp-nodegoat              # OWASP NodeGoat
docker pull citizenstig/nowasp                          # OWASP Mutillidae II Web Pen-Test Practice Application
docker pull bkimminich/juice-shop                       # OWASP Juice Shop
docker pull phocean/msf                                 # Docker Metasploit
docker pull frapsoft/slowhttptest                       # Application Layer DoS attack simulator
docker pull guidelacour/whatweb                         # Next generation web scanner
docker pull opensecurity/cmsscan                        # CMS Scanner: Scan Wordpress, Drupal, Joomla, vBulletin
docker pull epi052/feroxbuster                          # A fast, simple, recursive content discovery tool written in Rust
docker pull mikesplain/openvas                          # OpenVAS is a full-featured vulnerability scanner
docker pull mpepping/cyberchef                          # The Cyber Swiss Army Knife
docker pull phocean/beef                                # BeEF framework for XSS browser exploitation
docker pull byt3bl33d3r/crackmapexec                    # A swiss army knife for pentesting networks
docker pull xerosecurity/sn1per                         # Discover the attack surface and prioritize risks
docker pull rossja/ncc-scoutsuite                       # Multi-Cloud Security Auditing Tool
docker pull dstotijn/hetty                              # Hetty is an HTTP toolkit for security research
docker pull stefanscherer/winrm                         # The ultimate WinRM shell for hacking/pentesting
docker pull eystsen/altoro                              # Altoro Mutual - Demo Vulnerable Web Bank
docker pull mutzel/all-in-one-hackazon:postinstall      # LAMP Hackazon deployment in a single container
docker pull tuxotron/tiredful-api                       # Broken web application based on REST API
docker pull tuxotron/xvwa                               # Xtreme Vulnerable Web Application
docker pull filebrowser/filebrowser                     # Web File Browser 
docker pull remnux/ciphey                               # Automatically decrypt, decode, and crack

# hetty fs
mkdir $HOME/.hetty

###
###
### Education
###
###
# papers-we-love
git clone https://github.com/papers-we-love/papers-we-love.git $HOME/git/education/papers-we-love
cd $HOME/git/education/papers-we-love
git pull

# public-apis
git clone https://github.com/public-apis/public-apis.git $HOME/git/education/public-apis
cd $HOME/git/education/public-apis
git pull

# awesome
git clone https://github.com/sindresorhus/awesome.git $HOME/git/education/awesome
cd $HOME/git/education/free-programming-books
git pull

# free-programming-books
git clone https://github.com/EbookFoundation/free-programming-books.git $HOME/git/education/free-programming-books
cd $HOME/git/education/free-programming-books
git pull

# coding-interview-university
git clone https://github.com/jwasham/coding-interview-university.git $HOME/git/education/coding-interview-university
cd $HOME/git/education/coding-interview-university
git pull

# awesome-selfhosted
git clone https://github.com/awesome-selfhosted/awesome-selfhosted.git $HOME/git/education/awesome-selfhosted
cd $HOME/git/education/awesome-selfhosted
git pull

# awesome-docker
git clone https://github.com/veggiemonk/awesome-docker.git $HOME/git/education/awesome-docker
cd $HOME/git/education/awesome-docker
git pull

# awesome-interview-questions
git clone https://github.com/DopplerHQ/awesome-interview-questions.git $HOME/git/education/awesome-interview-questions
cd $HOME/git/education/awesome-interview-questions
git pull

###
###
### Pentest Education
###
###
# RedTeam-Tactics-and-Techniques
git clone https://github.com/mantvydasb/RedTeam-Tactics-and-Techniques.git $HOME/git/pentest-education/RedTeam-Tactics-and-Techniques
cd $HOME/git/pentest-education/RedTeam-Tactics-and-Techniques
git pull

# top10webseclist
git clone https://github.com/irsdl/top10webseclist.git $HOME/git/pentest-education/top10webseclist
cd $HOME/git/pentest-education/top10webseclist
git pull

# awesome-hacking
git clone https://github.com/carpedm20/awesome-hacking.git $HOME/git/pentest-education/awesome-hacking
cd $HOME/git/pentest-education/awesome-hacking
git pull

# android-security-awesome
git clone https://github.com/ashishb/android-security-awesome.git $HOME/git/pentest-education/android-security-awesome
cd $HOME/git/pentest-education/android-security-awesome
git pull

# awesome-ctf
git clone https://github.com/apsdehal/awesome-ctf.git $HOME/git/pentest-education/awesome-ctf
cd $HOME/git/pentest-education/awesome-ctf
git pull

# awesome-api-security
git clone https://github.com/arainho/awesome-api-security.git $HOME/git/pentest-education/awesome-api-security
cd $HOME/git/pentest-education/awesome-api-security
git pull

# Pentest-Tools
git clone https://github.com/S3cur3Th1sSh1t/Pentest-Tools.git $HOME/git/pentest-education/Pentest-Tools
cd $HOME/git/pentest-education/Pentest-Tools
git pull

# awesome-pentest-cheat-sheets
git clone https://github.com/coreb1t/awesome-pentest-cheat-sheets.git $HOME/git/pentest-education/awesome-pentest-cheat-sheets
cd $HOME/git/pentest-education/awesome-pentest-cheat-sheets
git pull

# Pentest-Cheat-Sheets
git clone https://github.com/Kitsun3Sec/Pentest-Cheat-Sheets.git $HOME/git/pentest-education/Pentest-Cheat-Sheets
cd $HOME/git/pentest-education/Pentest-Cheat-Sheets
git pull

# awesome-web-security
git clone https://github.com/qazbnm456/awesome-web-security.git $HOME/git/pentest-education/awesome-web-security
cd $HOME/git/pentest-education/awesome-web-security
git pull

# awesome-honeypots
git clone https://github.com/paralax/awesome-honeypots.git $HOME/git/pentest-education/awesome-honeypots
cd $HOME/git/pentest-education/awesome-honeypots
git pull

# awesome-appsec
git clone https://github.com/paragonie/awesome-appsec.git $HOME/git/pentest-education/awesome-appsec
cd $HOME/git/pentest-education/awesome-appsec
git pull

# DockerCheatSheet
git clone https://github.com/eon01/DockerCheatSheet.git $HOME/git/pentest-education/DockerCheatSheet
cd $HOME/git/pentest-education/DockerCheatSheet
git pull

# awesome-mobile-security
git clone https://github.com/vaib25vicky/awesome-mobile-security.git $HOME/git/pentest-education/awesome-mobile-security
cd $HOME/git/pentest-education/awesome-mobile-security
git pull

# Java-Deserialization-Cheat-Sheet
git clone https://github.com/GrrrDog/Java-Deserialization-Cheat-Sheet.git $HOME/git/pentest-education/Java-Deserialization-Cheat-Sheet
cd $HOME/git/pentest-education/Java-Deserialization-Cheat-Sheet
git pull

# DefaultCreds-cheat-sheet
git clone https://github.com/ihebski/DefaultCreds-cheat-sheet.git $HOME/git/pentest-education/DefaultCreds-cheat-sheet
cd $HOME/git/pentest-education/DefaultCreds-cheat-sheet
git pull

# Active-Directory-Exploitation-Cheat-Sheet
git clone https://github.com/S1ckB0y1337/Active-Directory-Exploitation-Cheat-Sheet.git $HOME/git/pentest-education/Active-Directory-Exploitation-Cheat-Sheet
cd $HOME/git/pentest-education/Active-Directory-Exploitation-Cheat-Sheet
git pull

# awesome-shodan-queries
git clone https://github.com/jakejarvis/awesome-shodan-queries.git $HOME/git/pentest-education/awesome-shodan-queries
cd $HOME/git/pentest-education/awesome-shodan-queries
git pull

# Cheatsheet-God
git clone https://github.com/OlivierLaflamme/Cheatsheet-God.git $HOME/git/pentest-education/Cheatsheet-God
cd $HOME/git/pentest-education/Cheatsheet-God
git pull

# PENTESTING-BIBLE
git clone https://github.com/blaCCkHatHacEEkr/PENTESTING-BIBLE.git $HOME/git/pentest-education/PENTESTING-BIBLE
cd $HOME/git/pentest-education/PENTESTING-BIBLE
git pull

# JustTryHarder
git clone https://github.com/sinfulz/JustTryHarder.git $HOME/git/pentest-education/JustTryHarder
cd $HOME/git/pentest-education/JustTryHarder
git pull

# exploitdb
git clone https://github.com/offensive-security/exploitdb.git $HOME/git/pentest-education/exploitdb
cd $HOME/git/pentest-education/exploitdb
git pull

# Awesome-Pentest
git clone https://github.com/Muhammd/Awesome-Pentest.git $HOME/git/pentest-education/Awesome-Pentest
cd $HOME/git/pentest-education/Awesome-Pentest
git pull

# awesome-security
git clone https://github.com/sbilly/awesome-security.git $HOME/git/pentest-education/awesome-security
cd $HOME/git/pentest-education/awesome-security
git pull

# test-your-sysadmin-skills
git clone https://github.com/trimstray/test-your-sysadmin-skills.git $HOME/git/pentest-education/test-your-sysadmin-skills
cd $HOME/git/pentest-education/test-your-sysadmin-skills
git pull

# docker-labs
git clone https://github.com/docker/labs.git $HOME/git/pentest-education/docker-labs
cd $HOME/git/pentest-education/docker-labs
git pull

# How-To-Secure-A-Linux-Server
git clone https://github.com/imthenachoman/How-To-Secure-A-Linux-Server.git $HOME/git/pentest-education/How-To-Secure-A-Linux-Server
cd $HOME/git/pentest-education/How-To-Secure-A-Linux-Server
git pull

# hacker101
git clone https://github.com/Hacker0x01/hacker101.git $HOME/git/pentest-education/hacker101
cd $HOME/git/pentest-education/hacker101
git pull

# API-Security-Checklist
git clone https://github.com/shieldfy/API-Security-Checklist.git $HOME/git/pentest-education/API-Security-Checklist
cd $HOME/git/pentest-education/API-Security-Checklist
git pull

# CheatSheetSeries
git clone https://github.com/OWASP/CheatSheetSeries.git $HOME/git/pentest-education/CheatSheetSeries
cd $HOME/git/pentest-education/CheatSheetSeries
git pull

# PayloadsAllTheThings
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git $HOME/git/pentest-education/PayloadsAllTheThings
cd $HOME/git/pentest-education/PayloadsAllTheThings
git pull

# awesome-pentest
git clone https://github.com/enaqx/awesome-pentest.git $HOME/git/pentest-education/awesome-pentest
cd $HOME/git/pentest-education/awesome-pentest
git pull

# awesome-awesomeness
git clone https://github.com/bayandin/awesome-awesomeness.git $HOME/git/pentest-education/awesome-awesomeness
cd $HOME/git/pentest-education/awesome-awesomeness
git pull

# the-book-of-secret-knowledge
git clone https://github.com/trimstray/the-book-of-secret-knowledge.git $HOME/git/pentest-education/the-book-of-secret-knowledge
cd $HOME/git/pentest-education/the-book-of-secret-knowledge
git pull

# Awesome-Hacking
git clone https://github.com/Hack-with-Github/Awesome-Hacking.git $HOME/git/pentest-education/Awesome-Hacking
cd $HOME/git/pentest-education/Awesome-Hacking
git pull

###
###
### TOOLS
###
###
# EyeWitness
git clone https://github.com/FortyNorthSecurity/EyeWitness.git $HOME/git/pentest-tools/EyeWitness
cd $HOME/git/pentest-tools/EyeWitness
git pull
docker build --build-arg user=$USER --tag eyewitness --file ./Python/Dockerfile .

# crawlab
git clone https://github.com/crawlab-team/crawlab.git $HOME/git/pentest-tools/crawlab
cd $HOME/git/pentest-tools/crawlab
git pull

# feroxbuster
git clone https://github.com/epi052/feroxbuster.git $HOME/git/pentest-tools/feroxbuster
cd $HOME/git/pentest-tools/feroxbuster
git pull

# Astra
git clone https://github.com/flipkart-incubator/Astra.git $HOME/git/pentest-tools/Astra
cd $HOME/git/pentest-tools/Astra
git pull

# pwndoc
git clone https://github.com/pwndoc/pwndoc.git $HOME/git/pentest-tools/pwndoc
cd $HOME/git/pentest-tools/pwndoc
git pull

# pentest-tools
git clone https://github.com/gwen001/pentest-tools.git $HOME/git/pentest-tools/gwen001-pentest-tools
cd $HOME/git/pentest-tools/gwen001-pentest-tools
git pull

# awesome-stacks
git clone https://github.com/ethibox/awesome-stacks.git $HOME/git/pentest-tools/awesome-stacks
cd $HOME/git/pentest-tools/awesome-stacks
git pull

# Portainer
git clone https://github.com/portainer/portainer $HOME/git/pentest-tools/portainer
cd $HOME/git/pentest-tools/portainer
git pull

# Hack-Tools
git clone https://github.com/LasCC/Hack-Tools.git $HOME/git/pentest-tools/Hack-Tools
cd $HOME/git/pentest-tools/Hack-Tools
git pull

# spiderfoot
git clone https://github.com/smicallef/spiderfoot.git $HOME/git/pentest-tools/spiderfoot
cd $HOME/git/pentest-tools/spiderfoot
git pull

# rengine
git clone https://github.com/yogeshojha/rengine.git $HOME/git/pentest-tools/rengine
cd $HOME/git/pentest-tools/rengine
git pull

# commix
git clone https://github.com/commixproject/commix.git $HOME/git/pentest-tools/commix
cd $HOME/git/pentest-tools/commix
git pull

# social-analyzer
git clone https://github.com/qeeqbox/social-analyzer.git $HOME/git/pentest-tools/social-analyzer
cd $HOME/git/pentest-tools/social-analyzer
git pull

# zaproxy
git clone https://github.com/zaproxy/zaproxy.git $HOME/git/pentest-tools/zaproxy
cd $HOME/git/pentest-tools/zaproxy
git pull

# routersploit
git clone https://www.github.com/threat9/routersploit $HOME/git/pentest-tools/routersploit
cd $HOME/git/pentest-tools/routersploit
git pull
docker build -t routersploit .

# caddy
git clone https://github.com/caddyserver/caddy.git $HOME/git/pentest-tools/caddy
cd $HOME/git/pentest-tools/caddy
git pull

# scanless
git clone https://github.com/vesche/scanless.git $HOME/git/pentest-tools/scanless
cd $HOME/git/pentest-tools/scanless
git pull
docker build -t scanless .

# linux-exploit-suggester
git clone https://github.com/mzet-/linux-exploit-suggester.git $HOME/git/pentest-tools/linux-exploit-suggester
cd $HOME/git/pentest-tools/linux-exploit-suggester
git pull

# PEASS-ng
git clone https://github.com/carlospolop/PEASS-ng.git $HOME/git/pentest-tools/PEASS-ng
cd $HOME/git/pentest-tools/PEASS-ng
git pull

# github-dorks
git clone https://github.com/techgaun/github-dorks.git $HOME/git/pentest-tools/github-dorks
cd $HOME/git/pentest-tools/github-dorks
git pull

# joomscan
git clone https://github.com/OWASP/joomscan.git $HOME/git/pentest-tools/joomscan
cd $HOME/git/pentest-tools/joomscan
git pull
docker build -t rezasp/joomscan .

# nikto
git clone https://github.com/sullo/nikto.git $HOME/git/pentest-tools/nikto
cd $HOME/git/pentest-tools/nikto
git pull
docker build -t "sullo/nikto" .

# impacket
git clone https://github.com/SecureAuthCorp/impacket.git $HOME/git/pentest-tools/impacket
cd $HOME/git/pentest-tools/impacket
git pull
docker build -t "impacket:latest" .

# hacktricks
git clone https://github.com/carlospolop/hacktricks.git $HOME/git/pentest-tools/hacktricks
cd $HOME/git/pentest-tools/hacktricks
git pull

# droopescan
git clone https://github.com/droope/droopescan.git $HOME/git/pentest-tools/droopescan
cd $HOME/git/pentest-tools/droopescan
git pull
docker build -t droope/droopescan .

# vulnx
git clone https://github.com/anouarbensaad/VulnX.git $HOME/git/pentest-tools/VulnX
cd $HOME/git/pentest-tools/VulnX
git pull
docker build -t vulnx ./docker/

# Arjun
git clone https://github.com/s0md3v/Arjun.git $HOME/git/pentest-tools/Arjun
cd $HOME/git/pentest-tools/Arjun
git pull

# Parameth
git clone https://github.com/maK-/parameth.git $HOME/git/pentest-tools/parameth
cd $HOME/git/pentest-tools/parameth
git pull

# x8
git clone https://github.com/Sh1Yo/x8 $HOME/git/pentest-tools/x8
cd $HOME/git/pentest-tools/x8
git pull

# automated-pentest
git clone https://github.com/vishnudxb/automated-pentest.git $HOME/git/pentest-tools/automated-pentest
cd $HOME/git/pentest-tools/automated-pentest
git pull

# w3af
git clone --depth 1 https://github.com/andresriancho/w3af.git $HOME/git/pentest-tools/w3af
cd $HOME/git/pentest-tools/w3af
git pull

###
###
### Misc tools
###
###
git clone https://github.com/ethibox/awesome-stacks.git $HOME/git/misc/awesome-stacks
cd $HOME/git/misc/awesome-stacks
git pull

###
###
### Wordlists
###
###
git clone https://github.com/random-robbie/bruteforce-lists.git $HOME/git/wordlists/bruteforce-lists
cd $HOME/git/wordlists/bruteforce-lists
git pull

git clone https://github.com/google/fuzzing.git $HOME/git/wordlists/fuzzing
cd $HOME/git/wordlists/fuzzing
git pull

wget https://gist.github.com/jhaddix/b80ea67d85c13206125806f0828f4d10/raw/c81a34fe84731430741e0463eb6076129c20c4c0/content_discovery_all.txt -o $HOME/git/wordlists/content_discovery_all.txt

git clone https://github.com/six2dez/OneListForAll.git $HOME/git/wordlists/OneListForAll
cd $HOME/git/wordlists/OneListForAll
git pull

# ISOs / VMs
#mkdir $HOME/VMs
#wget https://az792536.vo.msecnd.net/vms/VMBuild_20190311/VirtualBox/MSEdge/MSEdge.Win10.VirtualBox.zip -o $HOME/VMs/MSEdge.Win10.VirtualBox.zip
#cd $HOME/VMs
#unzip $HOME/VMs/MSEdge.Win10.VirtualBox.zip
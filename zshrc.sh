export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# SSH key 
alias ssh-key.generate="ssh-keygen -b 2048 -t rsa"
alias ssh-key.add="ssh-add"
alias ssh-agent.start="eval `ssh-agent -s`"

# ls commands
alias lls="ls -al "
# lbys = ls by size
alias lsbs="ls -alhS"
# lbyt = ls by time
alias lsbt="ls -alht"
# cl = copy last content
alias cl='bash -c "$(fc -ln -1)" | pbcopy'

# copy last command
alias last="fc -ln -1 | pbcopy"

# new and save content of clipboard, clean clipboard
alias new="pbpaste | cat >"
alias save="pbpaste | cat >"
alias cbclean="pbcopy </dev/null"
alias clean.cb="pbcopy </dev/null"

# Zsh
alias zshvi="vi ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias zshshow="cat ~/.zshrc"

# Python
alias python.activate="source python3/bin/activate && python --version"
alias python.deactivate="deactivate && python --version"

# Built-in
alias myip="curl ifconfig.co"
alias hostsvi="sudo vi /etc/hosts"
alias sha256.check="shasum -a 256"
alias python.server="python -m SimpleHTTPServer"

# Softwares
alias composerCn="echo 'composer config repo.packagist composer https://packagist.phpcomposer.com' | pbcopy"
alias chromex="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --disable-web-security"
alias st="subl"

# Docker
alias d.kill.running.containers="docker ps | awk  '{print $1}' | xargs docker stop"
alias d.remove.all.containers="docker rm $(docker ps -a -q)"
alias d.ps.full="echo -e '\033[36m running containers(docker ps) \033[0m' && docker ps && for (( i=0; i < 100; i++ )); do echo -n '\033[36m--\033[0m'; done && echo '' && echo '\033[36m all containers(docker ps -a) \033[0m' && docker ps -a"
alias d.logs="docker logs --tail 100 --follow --timestamps"
alias d.exec="docker exec -it"
alias d.build="docker build"
alias d.build.nocache="docker build --no-cache"
alias d.images="docker images"
alias docker.tag="docker tag"

# Docker compose
alias dcup="docker-compose up -d && sleep 2s && docker.ps.full"
alias dcdown="docker-compose down && sleep 2s && docker.ps.full"
alias dcstart="docker-compose start && sleep 2s && docker.ps.full"
alias dcstop="docker-compose stop && sleep 2s && docker.ps.full"
alias dcre="docker-compose stop && echo 'Stop!' && docker-compose start && echo 'start!' && sleep 2s && docker.ps.full"
alias dcreup="docker-compose down && echo 'Down!' && docker-compose up -d && echo 'Up!' && sleep 2s && docker.ps.full"

# Docker function
dcomposer () {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --user $(id -u):$(id -g) \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume $(pwd):/app \
        composer "$@"
}


dnode () {
    docker run --rm -v $(pwd):/app -w /app node:alpine "$@"
}


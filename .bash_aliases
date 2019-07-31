# ls
alias lsa='ls -lha'

#vim
alias vi='vim +startinsert'

#cd 
alias :='cd ..'
alias ::='cd ../..'
alias :::='cd ../../..'

# grep for process
function gps {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# update packages
alias update='apt-get update && apt-get upgrade'

# networkin
alias ncl='nc -nlvp'
alias ports='netstat -tulpn'
alias listen="lsof -P -i -n" 
alias pyserve='sudo python -m SimpleHTTPServer'
alias pingsniff='tcpdump -i eth0 -X icmp'
alias tcpsniff='tcpdump -i eth0 -X tcp and port not 22'
alias udpsniff='tcpdump -i eth0 -X udp'
alias arpsniff='tcpdump -i eth0 -X arp'
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'

# bash
alias reload='source ~/.bashrc'
alias treload='tmux source-file ~/.tmux.conf'

#git
alias add='git add'
alias commit='tox -e commit && git commit'
alias push='tox -e push && git push'
alias status='git status'
alias stash='git stash'
alias gpom='git push origin master'

# tmux
alias tm='tmux attach || tmux new-session'
alias tmls=tmux list-sessions'

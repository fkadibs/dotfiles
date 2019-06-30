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

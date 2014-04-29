set PATH $PATH (find ~/.gvm/*/current/bin -maxdepth 0)
set PATH $PATH /usr/local/mysql/bin/

alias ps='ps aux -o user,uid,pid,ppid,nice,%cpu,%mem,rss,vsize,etime,args'
alias psg='ps | head -n 1 ; and ps | grep -i'
alias hig='history | grep -i'


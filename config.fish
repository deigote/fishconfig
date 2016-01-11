# SDK Man
if test -d ~/.sdkman
	for candidate in (find ~/.sdkman/candidates -name current -maxdepth 2)
		set -x PATH $PATH "$candidate"/bin
	end
end

# MySQL
if test -d ~/local/mysql 
	set -x PATH $PATH ~/local/mysql/bin/ ~/local/mysql/support-files/
end

# Activator
if test -d ~/local/activator
	set -x PATH $PATH ~/local/activator
end

# Java and friends
# set -x JAVA_TOOL_OPTIONS "-Dfile.encoding=UTF8 -Xmx4096m -Xms256m -XX:PermSize=256M -XX:MaxPermSize=4096M"
# set -x JAVA_OPTS $JAVA_TOOL_OPTIONS
# set -x GRAILS_OPTS $JAVA_TOOL_OPTIONS
# set -x ANDROID_HOME /usr/local/opt/android-sdk
set -x FREGE_HOME ~/local/frege

alias ps='ps auxw -o user,uid,pid,ppid,nice,%cpu,%mem,rss,vsize,etime,args'
alias psg='ps | head -n 1 ; and ps | grep -i'
alias hig='history | grep -i'
alias grep='grep -i --color'

# Non commitable stuff :)
if test -f ~/.config/fish/as24.fish
	source ~/.config/fish/as24.fish
end

# Modules
source ~/.config/fish/fish-modules/add_modules_to_path.fish

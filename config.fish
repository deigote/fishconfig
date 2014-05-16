set PATH $PATH (find ~/.gvm/*/current/bin -maxdepth 0)
set PATH $PATH $HOME/local/mysql/bin/ $HOME/local/mysql/support-files/

# Java and friends
set JAVA_TOOL_OPTIONS "-Dfile.encoding=UTF8 -Xmx4096m -Xms256m -XX:PermSize=256M -XX:MaxPermSize=4096M"
set JAVA_OPTS $JAVA_TOOL_OPTIONS
set GRAILS_OPTS $JAVA_TOOL_OPTIONS

# Android SDK
set ANDROID_HOME /usr/local/opt/android-sdk

alias ps='ps auxw -o user,uid,pid,ppid,nice,%cpu,%mem,rss,vsize,etime,args'
alias psg='ps | head -n 1 ; and ps | grep -i'
alias hig='history | grep -i'
alias grep='grep -i --color'

# Modules
for module_dir in (find $HOME/.config/fish/modules -type d -mindepth 1 -maxdepth 1) 
	if test -d $module_dir/functions
		set fish_function_path $fish_function_path $module_dir/functions
	end
	if test -d $module_dir/completions
		set fish_complete_path $fish_complete_path $module_dir/completions
	end
end

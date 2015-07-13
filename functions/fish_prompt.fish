function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
   if set -q CMD_DURATION
      echo \a(set_color 555555)\> Took $CMD_DURATION ms
      set -l time_sec (echo $CMD_DURATION)
      if test $time_sec -gt 10000 ;and which terminal-notifier > /dev/null
         terminal-notifier -message "Shell command (commandline) is done!" -title "Command done"
      end
   end
   set git_ps (__git_ps1)
   if test ! -z "$git_ps" 
   	set_color cyan
	echo -n (__git_ps1)
        if [ (_is_git_dirty) ]
           echo " *"
        else
           echo ""
        end
#   else
#	echo ""
   end
   set_color green
   echo -n (basename (pwd | sed "s,^$HOME,~,"))
   set_color 555555
   echo -n ' '\$' '
   set_color normal
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
   set -l last_cmd_status $status

   if set -q CMD_DURATION
      echo \a(set_color 555555)\> Took $CMD_DURATION ms, returned $last_cmd_status
      set -l time_sec (echo $CMD_DURATION)
      if test $time_sec -gt 10000 ;and which terminal-notifier > /dev/null
         terminal-notifier -message "Shell command (commandline) is done!" -title "Command done"
      end
   else
      echo \a(set_color 555555)\> Returned $last_cmd_status
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

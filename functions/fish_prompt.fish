function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set_color green
  echo -n (basename (pwd | sed "s,^$HOME,~,"))
  set_color cyan
  echo -n (__git_ps1)
  if [ (_is_git_dirty) ]
    echo -n " *"
  end  
  echo -n ' $ '
  set_color normal
end

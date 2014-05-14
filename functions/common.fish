function print_msg
	set_color cyan
	command echo -n '### '
        command echo $argv
	set_color normal
end

function print_error
	set_color red
	command echo -n '### '
        command echo $argv
	set_color normal
end

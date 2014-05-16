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

function read_with_default
	set default_value "$argv[1]"
	if test (count $argv) -gt 1
		set read_prompt $argv[2]
	else
		set read_prompt ''
	end		
	read -p "echo $read_prompt' '" selected_value
	if test -z $selected_value
		echo $default_value
	else
		echo $selected_value
	end
end

function execute_on_confirm
	set command_to_confirm $argv[1]
	set confirm (read_with_default 'Y' "Execute \'$command_to_confirm\' [Y/n]")
	if test (echo $confirm | tr 'Y' 'y') = 'y'
		eval $command_to_confirm
	end
end


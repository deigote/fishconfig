function ff
	if test (count $argv) -gt 1 -a -d "$argv[1]"
		set directory $argv[1]
		set searchterm $argv[2]
		if test (count $argv) -gt 2
			set other_args $argv[3..-1]
		end
	else
		set directory "."
		set searchterm $argv[1]
		if test (count $argv) -gt 1
			set other_args $argv[2..-1]
		end
	end
	echo $directory
	echo $searchterm
	set command "find \"$directory\" -iname '*$searchterm*' ! -name '*.svn-base' $other_args"
	echo $command
	eval $command
end

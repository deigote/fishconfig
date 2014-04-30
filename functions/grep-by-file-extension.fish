function grep-by-file-extension
	set extension $argv[1]
	set searchterm $argv[2]
	set paths_to_search $argv[3..-1]
	set command "grep -R --include='*.$extension' \"$searchterm\" $paths_to_search"
	echo $command
	eval $command
end


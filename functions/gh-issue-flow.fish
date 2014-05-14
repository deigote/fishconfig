function gh-issue-update-label
	set issue_no $argv[1]
        set labels (ghi label --list)
	print_msg "Do you want to change the label? Select the number and press enter or just press enter to skip this step"
	set label_idx 1 ; for i in $labels ; echo "["$label_idx"] "$i ; set label_idx (expr $label_idx + 1) ; end
	set -e label_idx
	read label_idx
	if test $label_idx -ge (count labels)
		echo "Changing the label to '$labels[$label_idx]'"
		ghi edit $issue_no --label $labels[$label_idx] > /dev/null
		ghi comment $issue_no -m "Label changed to '$labels[$label_idx]'" > /dev/null
	end
end

function gh-issue-to-branch
	set issue_no $argv[1]
	set issue_title (ghi show $issue_no | head -n 1 | awk -F"#"$issue_no": " '{ print $2 }')
	echo feature/(command echo $issue_title | tr A-Z a-z | sed -e 's/[^a-zA-Z0-9\-]/-/g' | sed -e 's/^-*//' -e 's/-*$//')-\#$issue_no
end

function gh-issue-flow
	set action $argv[1]
	set issue_no $argv[2]
        set branch_title (gh-issue-to-branch $issue_no)
	git show-ref --verify --quiet "refs/heads/$branch_title" ;and set is_new_branch false ;or set is_new_branch true

	if test $is_new_branch = 'false'
		print_msg "Checking out existing branch '$branch_title'"
		git checkout "$branch_title"
	end

	if test $action = 'start' -a $is_new_branch = 'true'
		print_msg "Checking out new branch '$branch_title'"
		git checkout -b "$branch_title"
		print_msg "Claiming the issue..."
		ghi edit --claim $issue_no > /dev/null
		print_msg "Marking implementation started with a comment..."
		gh-issue-update-label $issue_no
	else if test $action = 'publish' 
		print_msg "Pushing against origin"
		git push origin "$branch_title" --set-upstream
		gh-issue-update-label $issue_no
	else if test $action = 'end'
		print_msg "Pushing against origin"
		git push origin "$branch_title"
		print_msg "Deleting local branch"
		git checkout develop
		git branch -D "$branch_title"
		gh-issue-update-label $issue_no	
	else
		print_error "Unknown action! Try start, publish or end"
	end

end


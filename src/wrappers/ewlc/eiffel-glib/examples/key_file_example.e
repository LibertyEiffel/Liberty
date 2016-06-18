class KEY_FILE_EXAMPLE
insert
	FILE_TOOLS rename file_exists as obsolete_file_exists end
	G_KEY_FILE_FLAGS

create {ANY} make
feature {ANY}
	make
		local
			group, key: STRING
			groups_iterator, keys_iterator: ITERATOR[STRING]
		do
			if is_readable(file) then
				create keyfile.load_from_file
				(file, g_key_file_keep_comments | g_key_file_keep_translations)
			else
				create keyfile.make
			end

			groups_iterator := keyfile.groups.get_new_iterator
			from groups_iterator.start until groups_iterator.is_off loop
				group:=groups_iterator.item
				std_output.put_string(group_label)
				std_output.put_string(group); std_output.put_new_line
				
				keys_iterator:=keyfile.keys_of(group).get_new_iterator
				from keys_iterator.start until keys_iterator.is_off loop
					key:=keys_iterator.item
					std_output.put_string(key) ':'.print_on(std_output)
					std_output.put_string(keyfile.value(group,key))
					std_output.put_new_line
					keys_iterator.next
				end
				
				groups_iterator.next
			end
		end

	
	keyfile: G_KEY_FILE

	file: STRING is "test.ini"
	group_label: STRING is "Group: "
end

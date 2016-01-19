class KEY_FILE_EXAMPLE
insert
	FILE_TOOLS rename file_exists as obsolete_file_exists end
	G_KEY_FILE_FLAGS

create {ANY} make
feature {ANY}
	make is
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

-- Copyright (C) 2009 Paolo Redaelli, 2013 Cyril Adrian

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
--
-- This library is distributed in the hopeOA that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
 

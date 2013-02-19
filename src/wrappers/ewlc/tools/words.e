class WORDS
	-- An hashed set of words, usually read from a file

inherit HASHED_SET[STRING]

creation make

feature 
	add_from_file (a_file_name: STRING) is
		-- Add to Current the words read from the file named `a_file_name'. If
		-- it does not exists or if it is not a file nothing is done.
	require
		a_file_name/=Void
	local 
		words: ARRAY[STRING]; word,line: STRING; file: TEXT_FILE_READ
		file_tools: FILE_TOOLS
	do
		create file.connect_to(a_file_name)
		if file.is_connected then
			check 
				file_tools.file_exists(a_file_name)
				file_tools.is_file(a_file_name) 
			end
			if use_suboptiomal_implementation then
				debug print_notice end
				from file.read_line
				until file.end_of_input
				loop
					line := file.last_string
					if line/=Void then 
						words := line.split
						if words/=Void then
							words.do_all(agent add)
						end
					end
					file.read_line
				end
			else 
				-- "correct" implementation
				from file.read_word 
				until file.end_of_input 
				loop
					word:=file.last_string 
					if word/=Void then 
						add(word.twin)
						file.read_word 
					end
				end
			end
		end
	end
feature {} -- Constants and notes
	use_suboptiomal_implementation: BOOLEAN is True
		-- Is suboptimal implementation used? Such an implementation
		-- cirmumvents a bug - found in March 2009, - deeply rooted in the io
		-- cluster. A more direct implementation triggers a precondition
		-- violation in io cluster.

	print_notice is 
		-- Notify the user of suboptimal implementation
	once
		print(once 
		"WORDS.add_from_file uses a suboptimal implementation that cirmumvent a bug - found in %
		%March 2009 - deeply rooted in the io cluster. A more direct implementation triggers a %
		%precondition violation in io cluster.")
	end
end

-- Copyright 2008,2009 Paolo Redaelli

-- eiffel-gcc-xml  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- eiffel-gcc-xml is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.


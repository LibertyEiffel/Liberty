note
	description: "A single complete demo widget for gtk-demo application."
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

deferred class DEMO
inherit GTK_CONTAINER 

feature {ANY} 
	name: STRING
			-- Demo name
		deferred 
		end

	description: STRING
			-- Demo description
		deferred
		end
	
	source_code: STRING 
			-- Demo source code, loaded at runtime
	
	filename: STRING
			-- Filename where the sourcecode is stored.
		deferred 
		end 

	subdemos: COLLECTION [DEMO] 
			-- Eventual sub-demos

	has_children, has_subdemos: BOOLEAN
		do
			Result := subdemos /= Void
		end

	--window: GTK_WINDOW

feature {}
	load_source_code
		local file: TEXT_FILE_READ
		do
			create file.connect_to (filename)
			check file_connected: file.is_connected end
			create source_code.make_empty
			file.read_tail_in (source_code)
		ensure source_code_loaded: source_code /= Void
		end
	
invariant
	name_not_void: name /= Void
	source_code_loaded: source_code /= Void
end

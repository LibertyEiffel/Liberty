class TYPEDEFS
	-- A dictionary of C_TYPEDEFs accessible by their names
	
	-- The contained typedefs will be wrapped together as dummy queries into a deferred class 
	
	-- When the wrappers generator command is invoked with the proper flag
	-- ("--standard-typedefs" ) it will also emit the queries for C types that
	-- have different sizes on different architectures and for the type
	-- definition of C99 standard.

	-- Each query is named like a C typedef and its Result type is the
	-- Eiffel equivalent of the fundamental type the typedef refers to.

	-- For example:

	-- gsize: INTEGER_64 is
	--    -- typedef unsigned long int gsize;
	-- do
	-- end

	-- Those queries shall never be invoked but rather used in other
	-- features as anchors like: do_stuff (a_size: like gsize)


inherit LINKED_LIST[C_TYPEDEF] 

insert SHARED_SETTINGS

create {ANY} make

feature {ANY} 
	emit_wrappers is
		local path: POSIX_PATH_NAME; file: OUTPUT_STREAM
		do
			create path.make_from_string(directory)
			path.add_last(settings.typedefs.as_lower+once ".e")
			log(once "Outputting anchor queries (for typedefs) into @(1) on `@(2)'.%N",
			<<settings.typedefs, path.to_string>>)
			create {TEXT_FILE_WRITE} file.connect_to(path.to_string)

			file.put_string(automatically_generated_header)
			file.put_string(deferred_class)
			file.put_string(settings.typedefs) 
			file.put_new_line
			file.put_string(inherits_string)
			if settings.are_standard_typedefs_emitted then
				file.put_string(typedefs_features_header)
				emit_standard_typedefs
			end
			file.put_string(typedefs_features_header)
			do_all(agent {C_TYPEDEF}.wrap_on(file))
			file.put_string(footer)
			file.disconnect
			file:=Void
			log_string(once " done.%N")
		end

end -- class TYPEDEFS
-- Copyright 2008,2009,2010 Paolo Redaelli

-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.

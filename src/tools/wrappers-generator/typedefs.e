class TYPEDEFS
	-- A dictionary of C_TYPEDEFs accessible by their name, that will be wrapped together as dummy queries into a deferred class 
	

	-- Each query is named like a C typedef and its Result type is the
	-- Eiffel equivalent of the fundamental type the typedef refers to.

	-- For example:

	-- gsize: INTEGER_64 is
	--    -- typedef unsigned long int gsize;
	-- do
	-- end

	-- Those queries shall never be invoked but rather used in other
	-- features as anchors like: do_stuff (a_size: like gsize)

inherit HASHED_DICTIONARY[C_TYPEDEF, UNICODE_STRING]

insert SHARED_SETTINGS

creation make

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
			file.put_string(struct_inherits) --line
			file.put_string(typedefs_features_header)
			do_all(agent {C_TYPEDEF}.wrap_on(file))
			file.put_string(footer)
			file.disconnect
			file:=Void
			log_string(once " done.%N")
		end

end -- class TYPEDEFS

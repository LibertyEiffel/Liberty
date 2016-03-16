-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class UNDO_CODE_ENUM

-- Wrapper of enum undo_code defined in file /usr/include/readline/readline.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = begin_low_level)  or else
				(a_value = delete_low_level)  or else
				(a_value = end_external_low_level)  or else
				(a_value = insert_external_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_begin
               do
                       value := begin_low_level
               end

	set_delete
               do
                       value := delete_low_level
               end

	set_end_external
               do
                       value := end_external_low_level
               end

	set_insert_external
               do
                       value := insert_external_low_level
               end

feature {ANY} -- Queries
       is_begin: BOOLEAN
               do
                       Result := (value=begin_low_level)
               end

       is_delete: BOOLEAN
               do
                       Result := (value=delete_low_level)
               end

       is_end_external: BOOLEAN
               do
                       Result := (value=end_external_low_level)
               end

       is_insert_external: BOOLEAN
               do
                       Result := (value=insert_external_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     begin_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UNDO_BEGIN"
                       }"
               end

     delete_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UNDO_DELETE"
                       }"
               end

     end_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UNDO_END"
                       }"
               end

     insert_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UNDO_INSERT"
                       }"
               end


end -- class UNDO_CODE_ENUM

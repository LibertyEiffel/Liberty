-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTRASHSTACK_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_trash_stack_height (a_stack_p: POINTER): NATURAL 
               -- g_trash_stack_height
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_trash_stack_height"
               }"
               end

	g_trash_stack_peek (a_stack_p: POINTER): POINTER 
               -- g_trash_stack_peek
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_trash_stack_peek"
               }"
               end

	g_trash_stack_pop (a_stack_p: POINTER): POINTER 
               -- g_trash_stack_pop
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_trash_stack_pop"
               }"
               end

	g_trash_stack_push (a_stack_p: POINTER; a_data_p: POINTER) 
               -- g_trash_stack_push
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_trash_stack_push"
               }"
               end


end -- class GTRASHSTACK_EXTERNALS

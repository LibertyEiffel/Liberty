-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMCONTEXTSIMPLE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_im_context_simple_new: POINTER is
 		-- gtk_im_context_simple_new (node at line 3140)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_simple_new()"
		}"
		end

	gtk_im_context_simple_add_table (a_context_simple: POINTER; a_data: POINTER; a_max_seq_len: INTEGER_32; a_n_seqs: INTEGER_32) is
 		-- gtk_im_context_simple_add_table (node at line 20281)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_simple_add_table"
		}"
		end

	gtk_im_context_simple_get_type: NATURAL_32 is
 		-- gtk_im_context_simple_get_type (node at line 30518)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_simple_get_type()"
		}"
		end


end -- class GTKIMCONTEXTSIMPLE_EXTERNALS

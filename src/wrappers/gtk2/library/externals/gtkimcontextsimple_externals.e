-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMCONTEXTSIMPLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_im_context_simple_add_table (a_context_simple: POINTER; a_data: POINTER; a_max_seq_len: INTEGER; a_n_seqs: INTEGER) is
 		-- gtk_im_context_simple_add_table
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_simple_add_table"
		}"
		end

	gtk_im_context_simple_get_type: like long_unsigned is
 		-- gtk_im_context_simple_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_simple_get_type()"
		}"
		end

	gtk_im_context_simple_new: POINTER is
 		-- gtk_im_context_simple_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_context_simple_new()"
		}"
		end


end -- class GTKIMCONTEXTSIMPLE_EXTERNALS

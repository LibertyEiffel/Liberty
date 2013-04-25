-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKTREEMODELFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gtk_tree_model_iters_persist_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_tree_model_iters_persist is
		do
			value := value.bit_or(gtk_tree_model_iters_persist_low_level)
		end

	unset_gtk_tree_model_iters_persist is
		do
			value := value.bit_xor(gtk_tree_model_iters_persist_low_level)
		end

feature {ANY} -- Queries
	is_gtk_tree_model_iters_persist: BOOLEAN is
		do
			Result := (value=gtk_tree_model_iters_persist_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_tree_model_iters_persist_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_TREE_MODEL_ITERS_PERSIST"
 			}"
 		end


end -- class GTKTREEMODELFLAGS_ENUM

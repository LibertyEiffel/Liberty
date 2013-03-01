-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATK_RELATION_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = null_low_level)  or else
				(a_value = controlled_by_low_level)  or else
				(a_value = controller_for_low_level)  or else
				(a_value = label_for_low_level)  or else
				(a_value = labelled_by_low_level)  or else
				(a_value = member_of_low_level)  or else
				(a_value = node_child_of_low_level)  or else
				(a_value = flows_to_low_level)  or else
				(a_value = flows_from_low_level)  or else
				(a_value = subwindow_of_low_level)  or else
				(a_value = embeds_low_level)  or else
				(a_value = embedded_by_low_level)  or else
				(a_value = popup_for_low_level)  or else
				(a_value = parent_window_of_low_level)  or else
				(a_value = described_by_low_level)  or else
				(a_value = description_for_low_level)  or else
				(a_value = node_parent_of_low_level)  or else
				(a_value = last_defined_low_level) )
		end

feature -- Setters
	default_create,
	set_null is
		do
			value := null_low_level
		end

	set_controlled_by is
		do
			value := controlled_by_low_level
		end

	set_controller_for is
		do
			value := controller_for_low_level
		end

	set_label_for is
		do
			value := label_for_low_level
		end

	set_labelled_by is
		do
			value := labelled_by_low_level
		end

	set_member_of is
		do
			value := member_of_low_level
		end

	set_node_child_of is
		do
			value := node_child_of_low_level
		end

	set_flows_to is
		do
			value := flows_to_low_level
		end

	set_flows_from is
		do
			value := flows_from_low_level
		end

	set_subwindow_of is
		do
			value := subwindow_of_low_level
		end

	set_embeds is
		do
			value := embeds_low_level
		end

	set_embedded_by is
		do
			value := embedded_by_low_level
		end

	set_popup_for is
		do
			value := popup_for_low_level
		end

	set_parent_window_of is
		do
			value := parent_window_of_low_level
		end

	set_described_by is
		do
			value := described_by_low_level
		end

	set_description_for is
		do
			value := description_for_low_level
		end

	set_node_parent_of is
		do
			value := node_parent_of_low_level
		end

	set_last_defined is
		do
			value := last_defined_low_level
		end

feature -- Queries
	null: BOOLEAN is
		do
			Result := (value=null_low_level)
		end

	controlled_by: BOOLEAN is
		do
			Result := (value=controlled_by_low_level)
		end

	controller_for: BOOLEAN is
		do
			Result := (value=controller_for_low_level)
		end

	label_for: BOOLEAN is
		do
			Result := (value=label_for_low_level)
		end

	labelled_by: BOOLEAN is
		do
			Result := (value=labelled_by_low_level)
		end

	member_of: BOOLEAN is
		do
			Result := (value=member_of_low_level)
		end

	node_child_of: BOOLEAN is
		do
			Result := (value=node_child_of_low_level)
		end

	flows_to: BOOLEAN is
		do
			Result := (value=flows_to_low_level)
		end

	flows_from: BOOLEAN is
		do
			Result := (value=flows_from_low_level)
		end

	subwindow_of: BOOLEAN is
		do
			Result := (value=subwindow_of_low_level)
		end

	embeds: BOOLEAN is
		do
			Result := (value=embeds_low_level)
		end

	embedded_by: BOOLEAN is
		do
			Result := (value=embedded_by_low_level)
		end

	popup_for: BOOLEAN is
		do
			Result := (value=popup_for_low_level)
		end

	parent_window_of: BOOLEAN is
		do
			Result := (value=parent_window_of_low_level)
		end

	described_by: BOOLEAN is
		do
			Result := (value=described_by_low_level)
		end

	description_for: BOOLEAN is
		do
			Result := (value=description_for_low_level)
		end

	node_parent_of: BOOLEAN is
		do
			Result := (value=node_parent_of_low_level)
		end

	last_defined: BOOLEAN is
		do
			Result := (value=last_defined_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	null_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_NULL"
 			}"
 		end

	controlled_by_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_CONTROLLED_BY"
 			}"
 		end

	controller_for_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_CONTROLLER_FOR"
 			}"
 		end

	label_for_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_LABEL_FOR"
 			}"
 		end

	labelled_by_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_LABELLED_BY"
 			}"
 		end

	member_of_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_MEMBER_OF"
 			}"
 		end

	node_child_of_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_NODE_CHILD_OF"
 			}"
 		end

	flows_to_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_FLOWS_TO"
 			}"
 		end

	flows_from_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_FLOWS_FROM"
 			}"
 		end

	subwindow_of_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_SUBWINDOW_OF"
 			}"
 		end

	embeds_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_EMBEDS"
 			}"
 		end

	embedded_by_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_EMBEDDED_BY"
 			}"
 		end

	popup_for_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_POPUP_FOR"
 			}"
 		end

	parent_window_of_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_PARENT_WINDOW_OF"
 			}"
 		end

	described_by_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_DESCRIBED_BY"
 			}"
 		end

	description_for_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_DESCRIPTION_FOR"
 			}"
 		end

	node_parent_of_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_NODE_PARENT_OF"
 			}"
 		end

	last_defined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_LAST_DEFINED"
 			}"
 		end


end -- class ATK_RELATION_TYPE_ENUM

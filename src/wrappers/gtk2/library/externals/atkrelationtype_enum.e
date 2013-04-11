-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATKRELATIONTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = atk_relation_controlled_by_low_level)  or else
				(a_value = atk_relation_controller_for_low_level)  or else
				(a_value = atk_relation_described_by_low_level)  or else
				(a_value = atk_relation_description_for_low_level)  or else
				(a_value = atk_relation_embedded_by_low_level)  or else
				(a_value = atk_relation_embeds_low_level)  or else
				(a_value = atk_relation_flows_from_low_level)  or else
				(a_value = atk_relation_flows_to_low_level)  or else
				(a_value = atk_relation_label_for_low_level)  or else
				(a_value = atk_relation_labelled_by_low_level)  or else
				(a_value = atk_relation_last_defined_low_level)  or else
				(a_value = atk_relation_member_of_low_level)  or else
				(a_value = atk_relation_node_child_of_low_level)  or else
				(a_value = atk_relation_node_parent_of_low_level)  or else
				(a_value = atk_relation_null_low_level)  or else
				(a_value = atk_relation_parent_window_of_low_level)  or else
				(a_value = atk_relation_popup_for_low_level)  or else
				(a_value = atk_relation_subwindow_of_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_atk_relation_controlled_by is
		do
			value := atk_relation_controlled_by_low_level
		end

	set_atk_relation_controller_for is
		do
			value := atk_relation_controller_for_low_level
		end

	set_atk_relation_described_by is
		do
			value := atk_relation_described_by_low_level
		end

	set_atk_relation_description_for is
		do
			value := atk_relation_description_for_low_level
		end

	set_atk_relation_embedded_by is
		do
			value := atk_relation_embedded_by_low_level
		end

	set_atk_relation_embeds is
		do
			value := atk_relation_embeds_low_level
		end

	set_atk_relation_flows_from is
		do
			value := atk_relation_flows_from_low_level
		end

	set_atk_relation_flows_to is
		do
			value := atk_relation_flows_to_low_level
		end

	set_atk_relation_label_for is
		do
			value := atk_relation_label_for_low_level
		end

	set_atk_relation_labelled_by is
		do
			value := atk_relation_labelled_by_low_level
		end

	set_atk_relation_last_defined is
		do
			value := atk_relation_last_defined_low_level
		end

	set_atk_relation_member_of is
		do
			value := atk_relation_member_of_low_level
		end

	set_atk_relation_node_child_of is
		do
			value := atk_relation_node_child_of_low_level
		end

	set_atk_relation_node_parent_of is
		do
			value := atk_relation_node_parent_of_low_level
		end

	set_atk_relation_null is
		do
			value := atk_relation_null_low_level
		end

	set_atk_relation_parent_window_of is
		do
			value := atk_relation_parent_window_of_low_level
		end

	set_atk_relation_popup_for is
		do
			value := atk_relation_popup_for_low_level
		end

	set_atk_relation_subwindow_of is
		do
			value := atk_relation_subwindow_of_low_level
		end

feature {ANY} -- Queries
	is_atk_relation_controlled_by: BOOLEAN is
		do
			Result := (value=atk_relation_controlled_by_low_level)
		end

	is_atk_relation_controller_for: BOOLEAN is
		do
			Result := (value=atk_relation_controller_for_low_level)
		end

	is_atk_relation_described_by: BOOLEAN is
		do
			Result := (value=atk_relation_described_by_low_level)
		end

	is_atk_relation_description_for: BOOLEAN is
		do
			Result := (value=atk_relation_description_for_low_level)
		end

	is_atk_relation_embedded_by: BOOLEAN is
		do
			Result := (value=atk_relation_embedded_by_low_level)
		end

	is_atk_relation_embeds: BOOLEAN is
		do
			Result := (value=atk_relation_embeds_low_level)
		end

	is_atk_relation_flows_from: BOOLEAN is
		do
			Result := (value=atk_relation_flows_from_low_level)
		end

	is_atk_relation_flows_to: BOOLEAN is
		do
			Result := (value=atk_relation_flows_to_low_level)
		end

	is_atk_relation_label_for: BOOLEAN is
		do
			Result := (value=atk_relation_label_for_low_level)
		end

	is_atk_relation_labelled_by: BOOLEAN is
		do
			Result := (value=atk_relation_labelled_by_low_level)
		end

	is_atk_relation_last_defined: BOOLEAN is
		do
			Result := (value=atk_relation_last_defined_low_level)
		end

	is_atk_relation_member_of: BOOLEAN is
		do
			Result := (value=atk_relation_member_of_low_level)
		end

	is_atk_relation_node_child_of: BOOLEAN is
		do
			Result := (value=atk_relation_node_child_of_low_level)
		end

	is_atk_relation_node_parent_of: BOOLEAN is
		do
			Result := (value=atk_relation_node_parent_of_low_level)
		end

	is_atk_relation_null: BOOLEAN is
		do
			Result := (value=atk_relation_null_low_level)
		end

	is_atk_relation_parent_window_of: BOOLEAN is
		do
			Result := (value=atk_relation_parent_window_of_low_level)
		end

	is_atk_relation_popup_for: BOOLEAN is
		do
			Result := (value=atk_relation_popup_for_low_level)
		end

	is_atk_relation_subwindow_of: BOOLEAN is
		do
			Result := (value=atk_relation_subwindow_of_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	atk_relation_controlled_by_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_CONTROLLED_BY"
 			}"
 		end

	atk_relation_controller_for_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_CONTROLLER_FOR"
 			}"
 		end

	atk_relation_described_by_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_DESCRIBED_BY"
 			}"
 		end

	atk_relation_description_for_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_DESCRIPTION_FOR"
 			}"
 		end

	atk_relation_embedded_by_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_EMBEDDED_BY"
 			}"
 		end

	atk_relation_embeds_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_EMBEDS"
 			}"
 		end

	atk_relation_flows_from_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_FLOWS_FROM"
 			}"
 		end

	atk_relation_flows_to_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_FLOWS_TO"
 			}"
 		end

	atk_relation_label_for_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_LABEL_FOR"
 			}"
 		end

	atk_relation_labelled_by_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_LABELLED_BY"
 			}"
 		end

	atk_relation_last_defined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_LAST_DEFINED"
 			}"
 		end

	atk_relation_member_of_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_MEMBER_OF"
 			}"
 		end

	atk_relation_node_child_of_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_NODE_CHILD_OF"
 			}"
 		end

	atk_relation_node_parent_of_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_NODE_PARENT_OF"
 			}"
 		end

	atk_relation_null_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_NULL"
 			}"
 		end

	atk_relation_parent_window_of_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_PARENT_WINDOW_OF"
 			}"
 		end

	atk_relation_popup_for_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_POPUP_FOR"
 			}"
 		end

	atk_relation_subwindow_of_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_RELATION_SUBWINDOW_OF"
 			}"
 		end


end -- class ATKRELATIONTYPE_ENUM

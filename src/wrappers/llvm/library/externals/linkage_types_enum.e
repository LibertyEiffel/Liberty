-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LINKAGE_TYPES_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = external_linkage_low_level)  or else
				(a_value = available_externally_linkage_low_level)  or else
				(a_value = link_once_any_linkage_low_level)  or else
				(a_value = link_once_odrlinkage_low_level)  or else
				(a_value = weak_any_linkage_low_level)  or else
				(a_value = weak_odrlinkage_low_level)  or else
				(a_value = appending_linkage_low_level)  or else
				(a_value = internal_linkage_low_level)  or else
				(a_value = private_linkage_low_level)  or else
				(a_value = linker_private_linkage_low_level)  or else
				(a_value = dllimport_linkage_low_level)  or else
				(a_value = dllexport_linkage_low_level)  or else
				(a_value = external_weak_linkage_low_level)  or else
				(a_value = common_linkage_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_external_linkage is
		do
			value := external_linkage_low_level
		end

	set_available_externally_linkage is
		do
			value := available_externally_linkage_low_level
		end

	set_link_once_any_linkage is
		do
			value := link_once_any_linkage_low_level
		end

	set_link_once_odrlinkage is
		do
			value := link_once_odrlinkage_low_level
		end

	set_weak_any_linkage is
		do
			value := weak_any_linkage_low_level
		end

	set_weak_odrlinkage is
		do
			value := weak_odrlinkage_low_level
		end

	set_appending_linkage is
		do
			value := appending_linkage_low_level
		end

	set_internal_linkage is
		do
			value := internal_linkage_low_level
		end

	set_private_linkage is
		do
			value := private_linkage_low_level
		end

	set_linker_private_linkage is
		do
			value := linker_private_linkage_low_level
		end

	set_dllimport_linkage is
		do
			value := dllimport_linkage_low_level
		end

	set_dllexport_linkage is
		do
			value := dllexport_linkage_low_level
		end

	set_external_weak_linkage is
		do
			value := external_weak_linkage_low_level
		end

	set_common_linkage is
		do
			value := common_linkage_low_level
		end

feature {ANY} -- Queries
	external_linkage: BOOLEAN is
		do
			Result := (value=external_linkage_low_level)
		end

	available_externally_linkage: BOOLEAN is
		do
			Result := (value=available_externally_linkage_low_level)
		end

	link_once_any_linkage: BOOLEAN is
		do
			Result := (value=link_once_any_linkage_low_level)
		end

	link_once_odrlinkage: BOOLEAN is
		do
			Result := (value=link_once_odrlinkage_low_level)
		end

	weak_any_linkage: BOOLEAN is
		do
			Result := (value=weak_any_linkage_low_level)
		end

	weak_odrlinkage: BOOLEAN is
		do
			Result := (value=weak_odrlinkage_low_level)
		end

	appending_linkage: BOOLEAN is
		do
			Result := (value=appending_linkage_low_level)
		end

	internal_linkage: BOOLEAN is
		do
			Result := (value=internal_linkage_low_level)
		end

	private_linkage: BOOLEAN is
		do
			Result := (value=private_linkage_low_level)
		end

	linker_private_linkage: BOOLEAN is
		do
			Result := (value=linker_private_linkage_low_level)
		end

	dllimport_linkage: BOOLEAN is
		do
			Result := (value=dllimport_linkage_low_level)
		end

	dllexport_linkage: BOOLEAN is
		do
			Result := (value=dllexport_linkage_low_level)
		end

	external_weak_linkage: BOOLEAN is
		do
			Result := (value=external_weak_linkage_low_level)
		end

	common_linkage: BOOLEAN is
		do
			Result := (value=common_linkage_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	external_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ExternalLinkage"
 			}"
 		end

	available_externally_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "AvailableExternallyLinkage"
 			}"
 		end

	link_once_any_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LinkOnceAnyLinkage"
 			}"
 		end

	link_once_odrlinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LinkOnceODRLinkage"
 			}"
 		end

	weak_any_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "WeakAnyLinkage"
 			}"
 		end

	weak_odrlinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "WeakODRLinkage"
 			}"
 		end

	appending_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "AppendingLinkage"
 			}"
 		end

	internal_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "InternalLinkage"
 			}"
 		end

	private_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PrivateLinkage"
 			}"
 		end

	linker_private_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LinkerPrivateLinkage"
 			}"
 		end

	dllimport_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "DLLImportLinkage"
 			}"
 		end

	dllexport_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "DLLExportLinkage"
 			}"
 		end

	external_weak_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ExternalWeakLinkage"
 			}"
 		end

	common_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CommonLinkage"
 			}"
 		end


end -- class LINKAGE_TYPES_ENUM

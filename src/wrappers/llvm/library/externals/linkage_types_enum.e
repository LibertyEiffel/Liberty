-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LINKAGE_TYPES_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = externallinkage_low_level)  or else
				(a_value = linkonceanylinkage_low_level)  or else
				(a_value = linkonceodrlinkage_low_level)  or else
				(a_value = weakanylinkage_low_level)  or else
				(a_value = weakodrlinkage_low_level)  or else
				(a_value = appendinglinkage_low_level)  or else
				(a_value = internallinkage_low_level)  or else
				(a_value = privatelinkage_low_level)  or else
				(a_value = linkerprivatelinkage_low_level)  or else
				(a_value = dllimportlinkage_low_level)  or else
				(a_value = dllexportlinkage_low_level)  or else
				(a_value = externalweaklinkage_low_level)  or else
				(a_value = ghostlinkage_low_level)  or else
				(a_value = commonlinkage_low_level) )
		end

feature -- Setters
	default_create,
	set_externallinkage is
		do
			value := externallinkage_low_level
		end

	set_linkonceanylinkage is
		do
			value := linkonceanylinkage_low_level
		end

	set_linkonceodrlinkage is
		do
			value := linkonceodrlinkage_low_level
		end

	set_weakanylinkage is
		do
			value := weakanylinkage_low_level
		end

	set_weakodrlinkage is
		do
			value := weakodrlinkage_low_level
		end

	set_appendinglinkage is
		do
			value := appendinglinkage_low_level
		end

	set_internallinkage is
		do
			value := internallinkage_low_level
		end

	set_privatelinkage is
		do
			value := privatelinkage_low_level
		end

	set_linkerprivatelinkage is
		do
			value := linkerprivatelinkage_low_level
		end

	set_dllimportlinkage is
		do
			value := dllimportlinkage_low_level
		end

	set_dllexportlinkage is
		do
			value := dllexportlinkage_low_level
		end

	set_externalweaklinkage is
		do
			value := externalweaklinkage_low_level
		end

	set_ghostlinkage is
		do
			value := ghostlinkage_low_level
		end

	set_commonlinkage is
		do
			value := commonlinkage_low_level
		end

feature -- Queries
	is_externallinkage: BOOLEAN is
		do
			Result := (value=externallinkage_low_level)
		end

	is_linkonceanylinkage: BOOLEAN is
		do
			Result := (value=linkonceanylinkage_low_level)
		end

	is_linkonceodrlinkage: BOOLEAN is
		do
			Result := (value=linkonceodrlinkage_low_level)
		end

	is_weakanylinkage: BOOLEAN is
		do
			Result := (value=weakanylinkage_low_level)
		end

	is_weakodrlinkage: BOOLEAN is
		do
			Result := (value=weakodrlinkage_low_level)
		end

	is_appendinglinkage: BOOLEAN is
		do
			Result := (value=appendinglinkage_low_level)
		end

	is_internallinkage: BOOLEAN is
		do
			Result := (value=internallinkage_low_level)
		end

	is_privatelinkage: BOOLEAN is
		do
			Result := (value=privatelinkage_low_level)
		end

	is_linkerprivatelinkage: BOOLEAN is
		do
			Result := (value=linkerprivatelinkage_low_level)
		end

	is_dllimportlinkage: BOOLEAN is
		do
			Result := (value=dllimportlinkage_low_level)
		end

	is_dllexportlinkage: BOOLEAN is
		do
			Result := (value=dllexportlinkage_low_level)
		end

	is_externalweaklinkage: BOOLEAN is
		do
			Result := (value=externalweaklinkage_low_level)
		end

	is_ghostlinkage: BOOLEAN is
		do
			Result := (value=ghostlinkage_low_level)
		end

	is_commonlinkage: BOOLEAN is
		do
			Result := (value=commonlinkage_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	externallinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ExternalLinkage"
 			}"
 		end

	linkonceanylinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LinkOnceAnyLinkage"
 			}"
 		end

	linkonceodrlinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LinkOnceODRLinkage"
 			}"
 		end

	weakanylinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "WeakAnyLinkage"
 			}"
 		end

	weakodrlinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "WeakODRLinkage"
 			}"
 		end

	appendinglinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "AppendingLinkage"
 			}"
 		end

	internallinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "InternalLinkage"
 			}"
 		end

	privatelinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PrivateLinkage"
 			}"
 		end

	linkerprivatelinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LinkerPrivateLinkage"
 			}"
 		end

	dllimportlinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DLLImportLinkage"
 			}"
 		end

	dllexportlinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DLLExportLinkage"
 			}"
 		end

	externalweaklinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ExternalWeakLinkage"
 			}"
 		end

	ghostlinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GhostLinkage"
 			}"
 		end

	commonlinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "CommonLinkage"
 			}"
 		end


end -- class LINKAGE_TYPES_ENUM

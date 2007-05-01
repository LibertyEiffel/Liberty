indexing
	description: "Access to GdaProviderInfo C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_PROVIDER_INFO_STRUCT

insert ANY undefine copy, is_equal end

feature {} -- Structure getter/setter calls
-- GdaProviderInfo

-- typedef struct {
-- 	gchar            *id;
-- 	gchar            *location;
-- 	gchar            *description;
-- 	GdaParameterList *gda_params; /* Contains a list of GdaParameter to create a DSN */
-- 	gchar            *dsn_spec; /* XML string with all the parameters required to create a DSN */
-- } GdaProviderInfo;

-- GdaProviderInfo

	-- gchar *id;
	get_id (a_struct: POINTER): POINTER is
		external "C struct GdaProviderInfo get id use <libgda/libgda.h>"
		end

	set_id (a_struct: POINTER; a_id: POINTER) is
		external "C struct GdaProviderInfo set id use <libgda/libgda.h>"
		end

	-- gchar *location;
	get_location (a_struct: POINTER): POINTER is
		external "C struct GdaProviderInfo get location use <libgda/libgda.h>"
		end

	set_location (a_struct: POINTER; a_location: POINTER) is
		external "C struct GdaProviderInfo set location use <libgda/libgda.h>"
		end

	-- gchar *description;
	get_description (a_struct: POINTER): POINTER is
		external "C struct GdaProviderInfo get description use <libgda/libgda.h>"
		end

	set_description (a_struct: POINTER; a_description: POINTER) is
		external "C struct GdaProviderInfo set description use <libgda/libgda.h>"
		end

	-- GdaParameterList *gda_params; /* Contains a list of GdaParameter
	-- to create a DSN */
	get_gda_params (a_struct: POINTER): POINTER is
		external "C struct GdaProviderInfo get gda_params use <libgda/libgda.h>"
		end

	set_gda_params (a_struct: POINTER; a_gda_params: POINTER) is
		external "C struct GdaProviderInfo set gda_params use <libgda/libgda.h>"
		end

	-- gchar *dsn_spec; /* XML string with all the parameters required
	-- to create a DSN */
	get_dsn_spec (a_struct: POINTER): POINTER is
		external "C struct GdaProviderInfo get dsn_spec use <libgda/libgda.h>"
		end

	set_dsn_spec (a_struct: POINTER; a_dsn_spec: POINTER) is
		external "C struct GdaProviderInfo set dsn_spec use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaProviderInfo)"
		end

end

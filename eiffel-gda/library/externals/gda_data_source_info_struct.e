indexing
	description: "Access to GdaDataSourceInfo C structure"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DATA_SOURCE_INFO_STRUCT
	
insert ANY undefine copy, is_equal end

feature {} -- Structure getter/setter calls
-- GdaDataSourceInfo

-- typedef struct {
-- 	gchar    *name;
-- 	gchar    *provider;
-- 	gchar    *cnc_string;
-- 	gchar    *description;
-- 	gchar    *username;
-- 	gchar    *password;
-- 	gboolean  is_global;
-- } GdaDataSourceInfo;

	--	gchar *name;
	get_name (a_struct: POINTER): POINTER is
		external "C struct GdaDataSourceInfo get name use <libgda/libgda.h>"
		end

	set_name_external (a_struct: POINTER; a_name: POINTER) is
		external "C struct GdaDataSourceInfo set name use <libgda/libgda.h>"
		end

-- 	gchar    *provider;
	get_provider (a_struct: POINTER): POINTER is
		external "C struct GdaDataSourceInfo get provider use <libgda/libgda.h>"
		end

	set_provider_external (a_struct: POINTER; a_provider: POINTER) is
		external "C struct GdaDataSourceInfo set provider use <libgda/libgda.h>"
		end

-- 	gchar    *cnc_string;
	get_cnc_string (a_struct: POINTER): POINTER is
		external "C struct GdaDataSourceInfo get cnc_string use <libgda/libgda.h>"
		end

	set_cnc_string_external (a_struct: POINTER; a_cnc_string: POINTER) is
		external "C struct GdaDataSourceInfo set cnc_string use <libgda/libgda.h>"
		end

-- 	gchar    *description;
	get_description (a_struct: POINTER): POINTER is
		external "C struct GdaDataSourceInfo get description use <libgda/libgda.h>"
		end

	set_description_external (a_struct: POINTER; a_description: POINTER) is
		external "C struct GdaDataSourceInfo set description use <libgda/libgda.h>"
		end

-- 	gchar    *username;
	get_username (a_struct: POINTER): POINTER is
		external "C struct GdaDataSourceInfo get username use <libgda/libgda.h>"
		end

	set_username_external (a_struct: POINTER; a_username: POINTER) is
		external "C struct GdaDataSourceInfo set username use <libgda/libgda.h>"
		end

-- 	gchar    *password;
	get_password (a_struct: POINTER): POINTER is
		external "C struct GdaDataSourceInfo get password use <libgda/libgda.h>"
		end

	set_password_external (a_struct: POINTER; a_password: POINTER) is
		external "C struct GdaDataSourceInfo set password use <libgda/libgda.h>"
		end

-- 	gboolean  is_global;
	get_is_global (a_struct: POINTER): INTEGER is
		external "C struct GdaDataSourceInfo get is_global use <libgda/libgda.h>"
		end

	set_is_global_external (a_struct: POINTER; a_is_global: INTEGER) is
		external "C struct GdaDataSourceInfo set is_global use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDataSourceInfo)"
		end

end

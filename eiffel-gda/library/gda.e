indexing
	description: "GDA - Gnome Data Access shared functionalities."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	details: "[
				 This class has to be inherited or inserted by all GTK
				 wrapper classes that will actually make GTK function
				 calls
				 ]"

deferred class GDA
	-- insert ANY undefine copy,is_equal,fill_tagged_out_memory end
	--	GTK_STANDARD_ENUMERATIONS undefine
	--	copy,is_equal,fill_tagged_out_memory end
insert
	GDA_BLOB_MODE_ENUM
	GDA_CLIENT_EVENT_ENUM
	GDA_COMMAND_OPTIONS_ENUM
	GDA_COMMAND_TYPE_ENUM
	GDA_CONNECTION_FEATURE_ENUM
	GDA_CONNECTION_OPTIONS_ENUM
	GDA_CONNECTION_SCHEMA_ENUM
	GDA_DATA_MODEL_ACCESS_FLAGS_ENUM
	GDA_DATA_MODEL_HINT_ENUM
	GDA_DATA_MODEL_IO_FORMAT_ENUM
	GDA_PARAMETER_LIST_PARAM_HINT_ENUM
	GDA_PARAMETER_PARAM_HINT_ENUM
	GDA_TRANSACTION_ISOLATION_ENUM
	GDA_VALUE_TYPE_ENUM
	
feature -- GDA 
	gda: LIBGDA is 
		once
			create Result
		end

	config: GDA_CONFIG is
		once
			create Result
		end
end

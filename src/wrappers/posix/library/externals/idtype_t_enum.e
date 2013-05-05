-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class IDTYPE_T_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = p_all_low_level)  or else
				(a_value = p_pgid_low_level)  or else
				(a_value = p_pid_low_level) )
		end

feature -- Setters
	default_create,
	set_p_all is
		do
			value := p_all_low_level
		end

	set_p_pgid is
		do
			value := p_pgid_low_level
		end

	set_p_pid is
		do
			value := p_pid_low_level
		end

feature -- Queries
	is_p_all: BOOLEAN is
		do
			Result := (value=p_all_low_level)
		end

	is_p_pgid: BOOLEAN is
		do
			Result := (value=p_pgid_low_level)
		end

	is_p_pid: BOOLEAN is
		do
			Result := (value=p_pid_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	p_all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "P_ALL"
 			}"
 		end

	p_pgid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "P_PGID"
 			}"
 		end

	p_pid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "P_PID"
 			}"
 		end


end -- class IDTYPE_T_ENUM

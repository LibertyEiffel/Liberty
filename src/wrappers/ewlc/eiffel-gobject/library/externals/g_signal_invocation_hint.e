note
	decription: "Wrapper for the GSignalInvocationHint structure, used to pass on additional information to callbacks during a signal emission."
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class G_SIGNAL_INVOCATION_HINT

inherit ANY undefine is_equal, copy end

feature {ANY} -- setters and getters
	
-- GSignalInvocationHint

-- typedef struct {
--   guint		signal_id;
--   GQuark	detail;
--   GSignalFlags	run_type;
-- } GSignalInvocationHint;


-- guint signal_id; 	The signal id of the signal invoking the callback
-- GQuark detail; 	The detail passed on for this emission
-- GSignalFlags run_type; 	The stage the signal emission is currently in, this field will contain one of G_SIGNAL_RUN_FIRST, G_SIGNAL_RUN_LAST or G_SIGNAL_RUN_CLEANUP.
end


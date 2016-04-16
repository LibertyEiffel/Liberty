note
	description: "Access to $struct C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_BINDING_ENTRY_STRUCT
feature {} -- Structure getter/setter calls
-- 	get_$field (a_struct: POINTER): $type is
-- 		external "C struct $struct get $field use <$include>"
-- 		end

-- 	set_$field (a_struct: POINTER; a_$field: $type) is
-- 		external "C struct $struct set $field use <$include>"
-- 		end

	--  GtkBindingEntry
	--
	-- typedef struct {
	--   /* key portion
	--    */
	--   guint                  keyval;
	--   GdkModifierType        modifiers;
	--
	--   GtkBindingSet         *binding_set;
	--   guint                 destroyed : 1;
	--   guint                 in_emission : 1;
	--   GtkBindingEntry       *set_next;
	--   GtkBindingEntry       *hash_next;
	--   GtkBindingSignal      *signals;
	-- } GtkBindingEntry;
	--
	--   --------------------------------------------------------------------------

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <$include>"
		alias "sizeof($struct)"
		end

end

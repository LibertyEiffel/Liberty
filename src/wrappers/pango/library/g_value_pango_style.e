class G_VALUE_PANGO_STYLE

inherit
	G_VALUE

insert
	PANGO_STYLE

create {ANY} make_pango_style, from_pango_style

feature {} -- Creations

	make_pango_style is
			-- create a new PangoStyle G_VALUE
		local
			ptr: POINTER
		do
			ptr := malloc_g_value
			handle := g_value_init (ptr, pango_type_style)
			check handle = ptr end
		end

	from_pango_style (a_pango_style: INTEGER) is
		local
			ptr: POINTER
		do
			ptr := malloc_g_value
			handle := g_value_init (ptr, pango_type_style)
			check handle = ptr end
			g_value_set_enum (handle, a_pango_style)
		end

feature {ANY} -- Commands

	set (a_pango_style: INTEGER) is
		require
			is_valid_pango_style (a_pango_style)
		do
			g_value_set_enum (handle, a_pango_style)
		end

feature {} -- External calls

	pango_type_style: INTEGER is
			-- The GObject type for PangoStyle.
		external "C macro use <pango/pango.h>"
		alias "PANGO_TYPE_STYLE"
		end

invariant
	holds (pango_type_style)
end -- class G_VALUE_PANGO_STYLE

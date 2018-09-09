note
	description: "enum GdkModifierType"
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

	-- A set of bit-flags to indicate the state of modifier keys and mouse
	-- buttons in various event types. Typical modifier keys are Shift,
	-- Control, Meta, Super, Hyper, Alt, Compose, Apple, CapsLock or ShiftLock.
	--
	-- Like the X Window System, GDK supports 8 modifier keys and 5 mouse
	-- buttons.
	--
	-- Since 2.10, GDK recognizes which of the Meta, Super or Hyper keys are
	-- mapped to Mod2 - Mod5, and indicates this by setting GDK_SUPER_MASK,
	-- GDK_HYPER_MASK or GDK_META_MASK in the state field of key events. 

deferred class GDK_MODIFIER_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gdk_modifier_type (a_modifier: INTEGER) : BOOLEAN
		do
			Result := True
			-- Used to be a_modifier.bit_and (gdk_modifier_mask.bit_not) = 0
			-- This is not useful, because sometimes we get some extra bits
			-- set by XKB
		end

	gdk_shift_mask: INTEGER
			-- the Shift key.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SHIFT_MASK"
		end

	gdk_lock_mask: INTEGER
			-- a Lock key (depending on the modifier mapping of the X server
			-- this may either be CapsLock or ShiftLock).
		external "C macro use <gdk/gdk.h>"
		alias "GDK_LOCK_MASK"
		end

	gdk_control_mask: INTEGER
			-- the Control key.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_CONTROL_MASK"
		end

	gdk_mod1_mask: INTEGER
			-- the fourth modifier key (it depends on the modifier mapping
			-- of the X server which key is interpreted as this modifier,
			-- but normally it is the Alt key).
		external "C macro use <gdk/gdk.h>"
		alias "GDK_MOD1_MASK"
		end

	gdk_mod2_mask: INTEGER
			-- the fifth modifier key (it depends on the modifier mapping of
			-- the X server which key is interpreted as this modifier). 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_MOD2_MASK"
		end

	gdk_mod3_mask: INTEGER
			-- the sixth modifier key (it depends on the modifier mapping of
			-- the X server which key is interpreted as this modifier). 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_MOD3_MASK"
		end

	gdk_mod4_mask: INTEGER
			-- the seventh modifier key (it depends on the modifier mapping of
			-- the X server which key is interpreted as this modifier). 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_MOD4_MASK"
		end

	gdk_mod5_mask: INTEGER
			-- the eighth modifier key (it depends on the modifier mapping of
			-- the X server which key is interpreted as this modifier). 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_MOD5_MASK"
		end

	gdk_button1_mask: INTEGER
			-- the first mouse button.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BUTTON1_MASK"
		end

	gdk_button2_mask: INTEGER
			-- the second mouse button.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BUTTON2_MASK"
		end

	gdk_button3_mask: INTEGER
			-- the third mouse button.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BUTTON3_MASK"
		end

	gdk_button4_mask: INTEGER
			-- the fourth mouse button.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BUTTON4_MASK"
		end

	gdk_button5_mask: INTEGER
			-- the fifrh mouse button.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BUTTON5_MASK"
		end

	gdk_super_mask: INTEGER
			-- the Super modifier. Since 2.10
		external "C macro use <gdk/gdk.h>"
		alias "GDK_SUPER_MASK"
		end

	gdk_hyper_mask: INTEGER
			-- the Hyper modifier. Since 2.10
		external "C macro use <gdk/gdk.h>"
		alias "GDK_HYPER_MASK"
		end

	gdk_meta_mask: INTEGER
			-- the Meta modifier. Since 2.10
		external "C macro use <gdk/gdk.h>"
		alias "GDK_META_MASK"
		end

	gdk_release_mask: INTEGER
			-- not used in GDK itself. GTK+ uses it to differentiate between
			-- (keyval, modifiers) pairs from key press and release events.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_RELEASE_MASK"
		end

	gdk_modifier_mask: INTEGER
			-- a mask covering all modifier types.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_MODIFIER_MASK"
		end

end -- class GDK_MODIFIER_TYPE

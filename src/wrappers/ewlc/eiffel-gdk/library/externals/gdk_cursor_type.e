note
	description: "Enum GdkCursorType: Specifies the type of the cursor."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

		-- Do not confuse these cursors with the signals that GTK+
		-- widgets emit. Although many of these cursors result in
		-- corresponding signals being emitted, the cursors are often
		-- transformed or filtered along the way.

deferred class GDK_CURSOR_TYPE

inherit ANY undefine is_equal, copy end

	-- typedef enum
	-- {
	--   GDK_X_CURSOR 		  = 0,
	--   GDK_ARROW 		  = 2,
	--   GDK_BASED_ARROW_DOWN    = 4,
	--   GDK_BASED_ARROW_UP 	  = 6,
	--   GDK_BOAT 		  = 8,
	--   GDK_BOGOSITY 		  = 10,
	--   GDK_BOTTOM_LEFT_CORNER  = 12,
	--   GDK_BOTTOM_RIGHT_CORNER = 14,
	--   GDK_BOTTOM_SIDE 	  = 16,
	--   GDK_BOTTOM_TEE 	  = 18,
	--   GDK_BOX_SPIRAL 	  = 20,
	--   GDK_CENTER_PTR 	  = 22,
	--   GDK_CIRCLE 		  = 24,
	--   GDK_CLOCK	 	  = 26,
	--   GDK_COFFEE_MUG 	  = 28,
	--   GDK_CROSS 		  = 30,
	--   GDK_CROSS_REVERSE 	  = 32,
	--   GDK_CROSSHAIR 	  = 34,
	--   GDK_DIAMOND_CROSS 	  = 36,
	--   GDK_DOT 		  = 38,
	--   GDK_DOTBOX 		  = 40,
	--   GDK_DOUBLE_ARROW 	  = 42,
	--   GDK_DRAFT_LARGE 	  = 44,
	--   GDK_DRAFT_SMALL 	  = 46,
	--   GDK_DRAPED_BOX 	  = 48,
	--   GDK_EXCHANGE 		  = 50,
	--   GDK_FLEUR 		  = 52,
	--   GDK_GOBBLER 		  = 54,
	--   GDK_GUMBY 		  = 56,
	--   GDK_HAND1 		  = 58,
	--   GDK_HAND2 		  = 60,
	--   GDK_HEART 		  = 62,
	--   GDK_ICON 		  = 64,
	--   GDK_IRON_CROSS 	  = 66,
	--   GDK_LEFT_PTR 		  = 68,
	--   GDK_LEFT_SIDE 	  = 70,
	--   GDK_LEFT_TEE 		  = 72,
	--   GDK_LEFTBUTTON 	  = 74,
	--   GDK_LL_ANGLE 		  = 76,
	--   GDK_LR_ANGLE 	 	  = 78,
	--   GDK_MAN 		  = 80,
	--   GDK_MIDDLEBUTTON 	  = 82,
	--   GDK_MOUSE 		  = 84,
	--   GDK_PENCIL 		  = 86,
	--   GDK_PIRATE 		  = 88,
	--   GDK_PLUS 		  = 90,
	--   GDK_QUESTION_ARROW 	  = 92,
	--   GDK_RIGHT_PTR 	  = 94,
	--   GDK_RIGHT_SIDE 	  = 96,
	--   GDK_RIGHT_TEE 	  = 98,
	--   GDK_RIGHTBUTTON 	  = 100,
	--   GDK_RTL_LOGO 		  = 102,
	--   GDK_SAILBOAT 		  = 104,
	--   GDK_SB_DOWN_ARROW 	  = 106,
	--   GDK_SB_H_DOUBLE_ARROW   = 108,
	--   GDK_SB_LEFT_ARROW 	  = 110,
	--   GDK_SB_RIGHT_ARROW 	  = 112,
	--   GDK_SB_UP_ARROW 	  = 114,
	--   GDK_SB_V_DOUBLE_ARROW   = 116,
	--   GDK_SHUTTLE 		  = 118,
	--   GDK_SIZING 		  = 120,
	--   GDK_SPIDER		  = 122,
	--   GDK_SPRAYCAN 		  = 124,
	--   GDK_STAR 		  = 126,
	--   GDK_TARGET 		  = 128,
	--   GDK_TCROSS 		  = 130,
	--   GDK_TOP_LEFT_ARROW 	  = 132,
	--   GDK_TOP_LEFT_CORNER 	  = 134,
	--   GDK_TOP_RIGHT_CORNER 	  = 136,
	--   GDK_TOP_SIDE 		  = 138,
	--   GDK_TOP_TEE 		  = 140,
	--   GDK_TREK 		  = 142,
	--   GDK_UL_ANGLE 		  = 144,
	--   GDK_UMBRELLA 		  = 146,
	--   GDK_UR_ANGLE 		  = 148,
	--   GDK_WATCH 		  = 150,
	--   GDK_XTERM 		  = 152,
	--   GDK_LAST_CURSOR,
	--   GDK_CURSOR_IS_PIXMAP 	= -1
	-- } GdkCursorType;

feature {} -- enum

	is_valid_gdk_cursor_type (a_cursor_type: INTEGER) : BOOLEAN
		do
			Result:=((a_cursor_type=gdk_cursor_arrow) or else
			         (a_cursor_type=gdk_cursor_clock) or else
			         (a_cursor_type=gdk_cursor_watch) or else
			         (a_cursor_type=gdk_cursor_last_cursor) or else
			         (a_cursor_type=gdk_cursor_ll_angle) or else
			         (a_cursor_type=gdk_cursor_lr_angle) or else
			         (a_cursor_type=gdk_cursor_ul_angle) or else
			         (a_cursor_type=gdk_cursor_ur_angle) or else
			         (a_cursor_type=gdk_cursor_top_left_corner) or else
			         (a_cursor_type=gdk_cursor_bottom_left_corner) or else
			         (a_cursor_type=gdk_cursor_top_right_corner) or else
			         (a_cursor_type=gdk_cursor_bottom_right_corner) or else
			         (a_cursor_type=gdk_cursor_bottom_side) or else
			         (a_cursor_type=gdk_cursor_top_side) or else
			         (a_cursor_type=gdk_cursor_left_side) or else
			         (a_cursor_type=gdk_cursor_right_side) or else
			         (a_cursor_type=gdk_cursor_fleur))
		end

--	gdk_cursor_: INTEGER is
--			-- 
--		external "C macro use <gdk/gdk.h>"
--		alias "GDK_CURSOR_"
--		end

	gdk_cursor_arrow: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_ARROW"
		end

	gdk_cursor_clock: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_CLOCK"
		end

	gdk_cursor_watch: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WATCH"
		end

	gdk_cursor_last_cursor: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_LAST_CURSOR"
		end

	gdk_cursor_ll_angle: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_LL_ANGLE"
		end

	gdk_cursor_lr_angle: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_LR_ANGLE"
		end

	gdk_cursor_ul_angle: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_UL_ANGLE"
		end

	gdk_cursor_ur_angle: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_UR_ANGLE"
		end

	gdk_cursor_top_left_corner: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_TOP_LEFT_CORNER"
		end

	gdk_cursor_top_right_corner: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_TOP_RIGHT_CORNER"
		end

	gdk_cursor_bottom_left_corner: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BOTTOM_LEFT_CORNER"
		end

	gdk_cursor_bottom_right_corner: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BOTTOM_RIGHT_CORNER"
		end

	gdk_cursor_top_side: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_TOP_SIDE"
		end

	gdk_cursor_bottom_side: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_BOTTOM_SIDE"
		end

	gdk_cursor_left_side: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_LEFT_SIDE"
		end

	gdk_cursor_right_side: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_RIGHT_SIDE"
		end

	gdk_cursor_fleur: INTEGER
			-- 
		external "C macro use <gdk/gdk.h>"
		alias "GDK_FLEUR"
		end

end -- GDK_CURSOR_TYPE

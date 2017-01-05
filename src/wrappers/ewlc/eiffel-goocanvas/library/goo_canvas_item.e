note
	description: "GOO_CANVAS_ITEM -- Interface for canvas items"
	copyright: "[
					GooCanvas. Copyright (C) 2005-2017: Damon Chaplin, eiffel-libraries team and others
					
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
	date: "$Date:$"
	revision "$REvision:$"

deferred class
	GOO_CANVAS_ITEM

inherit
	G_OBJECT

insert
	GOO_CANVAS_ITEM_EXTERNALS
	

feature {ANY} -- signals
--"animation-finished"                             : Run Last
--  "button-press-event"                             : Run Last
--  "button-release-event"                           : Run Last
--  "child-notify"                                   : Run First / No Recursion / Has Details / No Hooks
--  "enter-notify-event"                             : Run Last
--  "focus-in-event"                                 : Run Last
--  "focus-out-event"                                : Run Last
--  "grab-broken-event"                              : Run Last
--  "key-press-event"                                : Run Last
--  "key-release-event"                              : Run Last
--  "leave-notify-event"                             : Run Last
--  "motion-notify-event"                            : Run Last
--	
	
	

	
	
feature {} -- property names
  can_focus_property_name : STRING is "can-focus"                -- gboolean              : Read / Write
  description_property_name : STRING is "description"              -- gchararray            : Read / Write
  parent_property_name : STRING is "parent"                   -- GooCanvasItem         : Read / Write
  pointer_events_property_name : STRING is "pointer-events"           -- GooCanvasPointerEvents  : Read / Write
  title_property_name : STRING is "title"                    -- gchararray            : Read / Write
  transform_property_name : STRING is "transform"                -- GooCairoMatrix        : Read / Write
  visibility_property_name : STRING is "visibility"               -- GooCanvasItemVisibility  : Read / Write
  visibility_threshold_property_name : STRING is "visibility-threshold"     -- gdouble               : Read / Write
end

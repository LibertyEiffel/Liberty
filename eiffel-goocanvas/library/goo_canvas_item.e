deferred class
	GOO_CANVAS_ITEM

inherit
	G_OBJECT

insert
	GOO_CANVAS_ITEM_EXTERNALS
	

feature -- signals
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

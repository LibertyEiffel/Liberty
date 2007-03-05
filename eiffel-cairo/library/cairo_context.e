indexing
	description: "The cairo drawing context (cairo_t in C)"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

	wrapped_version: "1.2.4"

class CAIRO_CONTEXT
	-- CAIRO_CONTEXT (cairo_t in C) is the main object used when
	-- drawing with cairo. To draw with cairo, you create a
	-- CAIRO_CONTEXT, set the target surface, and drawing options for
	-- the CAIRO_CONTEXT, create shapes with functions like `move_to'
	-- and `line_to', and then draw shapes with `stroke' or `fill'.

	-- A CAIRO_CONTEXT contains the current state of the rendering
	-- device, including coordinates of yet to be drawn shapes.
	
	-- TODO: How to Eiffellize this? cairo_t's can be pushed to a stack
	-- via cairo_save(). They may then safely be changed, without
	-- loosing the current state. Use cairo_restore() to restore to the
	-- saved state.

inherit
	SHARED_C_STRUCT
	
insert
	CAIRO_CONTEXT_EXTERNALS
	CAIRO_PATH_EXTERNALS

	CAIRO_ANTIALIAS_TYPE
	CAIRO_FILL_RULE
	CAIRO_LINE_CAP
	CAIRO_LINE_JOIN
	CAIRO_OPERATOR
	
creation make, from_external_pointer

feature {} -- Creation
	make	(a_target: CAIRO_SURFACE) is
			-- Creates a new context with all graphics state parameters
			-- set to default values and with target as a target
			-- surface. `a_target' should be a backend-specific surface 

			-- If memory cannot be allocated, it will be a special object
			-- and `status' will be set to `cairo_status_no_memory'. You
			-- can use this object normally, but no drawing will be done.
		require target_not_void: a_target /= Void
		do
			from_external_pointer(cairo_create(a_target.handle))
			-- This function references target, so you can immediately
			-- call cairo_surface_destroy() on it if you don't need to
			-- maintain a separate reference to it.
		end
	
feature
	ref is
			-- Increases the reference count on cr by one. This prevents cr from being
			--   destroyed until a matching call to cairo_destroy() is made.
		local ptr: POINTER
		do
			ptr:=cairo_reference(handle)
		end

	unref is
			-- Decreases the reference count on cr by one. If the result
			-- is zero, then cr and all associated resources are
			-- freed. See `ref'.
		do
			cairo_destroy(handle)
		end

	status: INTEGER is
			--  the current status of this context; see CAIRO_ERROR_HANDLING. 
		do
			Result:=cairo_status(handle)
		ensure valid_status: is_valid_status(Result)
		end

	save is
			-- Makes a copy of the current state of cr and saves it on an
			-- internal stack of saved states for cr. When `restore' is
			-- called, cr will be restored to the saved state. Multiple
			-- calls to `save' and `restore' can be nested; each call to
			-- `restore' restores the state from the matching paired
			-- `save'.

			-- It isn't necessary to clear all saved states before a
			-- cairo_t is freed. If the reference count of a cairo_t
			-- drops to zero in response to a call to `unref,'
			-- any saved states will be freed along with the cairo_t.
		do
			cairo_save(handle)
		end

	restore is
			-- Restores the context to the state saved by a preceding
			-- call to `save' and removes that state from the stack of
			-- saved states.
		do
			cairo_restore(handle)
		end

	target: CAIRO_SURFACE is
			--  the target surface for the cairo context as passed to `make'.

			-- This function will always return a valid pointer, but the
			-- result can be a "nil" surface if cr is already in an error
			-- state, (ie. `status' /= cairo_status_success). A nil
			-- surface is indicated by CAIRO_SURFACE.status /=
			-- `cairo_status_success'.
		local ptr: POINTER
		do
			ptr:=cairo_get_target(handle)
			-- cairo_get_target returns the target surface. This object
			-- is owned by cairo. To keep a reference to it, you must
			-- call `ref'.
			Result:=wrappers.reference_at(ptr)
			if Result=Void then create Result.from_external_pointer(handle) end
		end

	push_group is
			-- Temporarily redirects drawing to an intermediate surface
			-- known as a group.  The redirection lasts until the group
			-- is completed by a call to cairo_pop_group() or
			-- cairo_pop_group_to_source(). These calls provide the
			-- result of any drawing to the group as a pattern, (either
			-- as an explicit object, or set as the source pattern).

			-- This group functionality can be convenient for performing
			-- intermediate compositing. One common use of a group is to
			-- render objects as opaque within the group, (so that they
			-- occlude each other), and then blend the result with
			-- translucence onto the destination.

			-- Groups can be nested arbitrarily deep by making balanced
			-- calls to cairo_push_group()/cairo_pop_group(). Each call
			-- pushes/pops the new target group onto/from a stack.

			-- The cairo_push_group() function calls cairo_save() so that
			-- any changes to the graphics state will not be visible
			-- outside the group, (the pop_group functions call
			-- cairo_restore()).

			-- By default the intermediate group will have a content type
			-- of CAIRO_CONTENT_COLOR_ALPHA. Other content types can be
			-- chosen for the group by using
			-- cairo_push_group_with_content() instead.

			-- As an example, here is how one might fill and stroke a
			-- path with translucence, but without any portion of the
			-- fill being visible under the stroke:

			-- cairo_push_group (cr);
			-- cairo_set_source (cr, fill_pattern);
			-- cairo_fill_preserve (cr);
			-- cairo_set_source (cr, stroke_pattern);
			-- cairo_stroke (cr);
			-- cairo_pop_group_to_source (cr);
			-- cairo_paint_with_alpha (cr, alpha);
		do
			cairo_push_group(handle)
		end

	
	--  cairo_push_group_with_content ()
	--
	-- void        cairo_push_group_with_content   (cairo_t *cr,
	--                                              cairo_content_t content);
	--
	--   Temporarily redirects drawing to an intermediate surface known as a group.
	--   The redirection lasts until the group is completed by a call to
	--   cairo_pop_group() or cairo_pop_group_to_source(). These calls provide the
	--   result of any drawing to the group as a pattern, (either as an explicit
	--   object, or set as the source pattern).
	--
	--   The group will have a content type of content. The ability to control this
	--   content type is the only distinction between this function and
	--   cairo_push_group() which you should see for a more detailed description of
	--   group rendering.
	--
	--   cr :      a cairo context
	--   content : a cairo_content_t indicating the type of group that will be
	--             created
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_pop_group ()
	--
	-- cairo_pattern_t* cairo_pop_group            (cairo_t *cr);
	--
	--   Terminates the redirection begun by a call to cairo_push_group() or
	--   cairo_push_group_with_content() and returns a new pattern containing the
	--   results of all drawing operations performed to the group.
	--
	--   The cairo_pop_group() function calls cairo_restore(), (balancing a call to
	--   cairo_save() by the push_group function), so that any changes to the
	--   graphics state will not be visible outside the group.
	--
	--   cr :      a cairo context
	--   Returns : a newly created (surface) pattern containing the results of all
	--             drawing operations performed to the group. The caller owns the
	--             returned object and should call cairo_pattern_destroy() when
	--             finished with it.
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_pop_group_to_source ()
	--
	-- void        cairo_pop_group_to_source       (cairo_t *cr);
	--
	--   Terminates the redirection begun by a call to cairo_push_group() or
	--   cairo_push_group_with_content() and installs the resulting pattern as the
	--   source pattern in the given cairo context.
	--
	--   The behavior of this function is equivalent to the sequence of operations:
	--
	-- cairo_pattern_t *group = cairo_pop_group (cr);
	-- cairo_set_source (cr, group);
	-- cairo_pattern_destroy (group);
	--
	--   but is more convenient as their is no need for a variable to store the
	--   short-lived pointer to the pattern.
	--
	--   The cairo_pop_group() function calls cairo_restore(), (balancing a call to
	--   cairo_save() by the push_group function), so that any changes to the
	--   graphics state will not be visible outside the group.
	--
	--   cr : a cairo context
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_get_group_target ()
	--
	-- cairo_surface_t* cairo_get_group_target     (cairo_t *cr);
	--
	--   Gets the target surface for the current group as started by the most
	--   recent call to cairo_push_group() or cairo_push_group_with_content().
	--
	--   This function will return NULL if called "outside" of any group rendering
	--   blocks, (that is, after the last balancing call to cairo_pop_group() or
	--   cairo_pop_group_to_source()).
	--
	--   cr :      a cairo context
	--   Returns : the target group surface, or NULL if none. This object is owned
	--             by cairo. To keep a reference to it, you must call
	--             cairo_surface_reference().
	--
	--   Since 1.2
	--

	set_source_rgb (a_red, a_green, a_blue: REAL) is
			-- Sets the source pattern within cr to an opaque color. This
			-- opaque color will then be used for any subsequent drawing
			-- operation until a new source pattern is set.

			-- The color components are floating point numbers in the
			-- range 0 to 1. If the values passed in are outside that
			-- range, they will be clamped.

			-- `a_red': red component of color
			-- `a_green': green component of color
			-- `a_blue':  blue component of color
		do
			cairo_set_source_rgb(handle, a_red, a_green, a_blue)
		end

	set_source_rgba (a_red, a_green, a_blue, an_alpha: REAL) is
			-- Sets the source pattern within cr to a translucent
			-- color. This color will then be used for any subsequent
			-- drawing operation until a new source pattern is set.
			
			-- The color and alpha components are floating point numbers
			-- in the range 0 to 1. If the values passed in are outside
			-- that range, they will be clamped.

			-- `a_red': red component of color
			-- `a_green': green component of color
			-- `a_blue':  blue component of color
			-- `an_alpha': alpha component of color
		do
			cairo_set_source_rgba(handle, a_red, a_green, a_blue, an_alpha)
		end

	set_source (a_source: CAIRO_PATTERN) is
			-- Sets the source pattern within context to source. This
			-- pattern will then be used for any subsequent drawing
			-- operation until a new source pattern is set.

			-- Note: The pattern's transformation matrix will be locked
			-- to the user space in effect at the time of
			-- `set_source'. This means that further modifications of the
			-- current transformation matrix will not affect the source
			-- pattern. See CAIRO_PATTERN.`set_matrix'.
		require source_not_void: a_source /= Void
		do
			cairo_set_source(handle, a_source.handle)
		end

	set_source_surface (a_surface: CAIRO_SURFACE; an_x, an_y: REAL) is
			-- A convenience feature for creating a pattern from surface
			-- and setting it as the source with `set_source'.

			-- `an_x' and `an_y' parameters give the user-space
			-- coordinate at which the surface origin should appear. (The
			-- surface origin is its upper-left corner before any
			-- transformation has been applied.) The x and y patterns are
			-- negated and then set as translation values in the pattern
			-- matrix.

			-- Other than the initial translation pattern matrix, as
			-- described above, all other pattern attributes, (such as
			-- its extend mode), are set to the default values as in
			-- CAIRO_PATTERN's `create_for_surface'. The resulting
			-- pattern can be queried with `source' so that these
			-- attributes can be modified if desired, (eg. to create a
			-- repeating pattern with CAIRO_PATTERN's `set_extend').
		
			-- `a_surface': the surface used to set the source pattern
		
			-- `an_x' : User-space X coordinate for surface origin
		
			-- `an_y' : User-space Y coordinate for surface origin
		require surface_not_void:  a_surface/=Void
		do
			cairo_set_source_surface(handle, a_surface.handle, an_x, an_y)
		end

	source: CAIRO_PATTERN is
			--  the current source pattern for context.
		local ptr: POINTER
		do
			ptr:=cairo_get_source(handle)
			-- cairo_get_source returns the current source
			-- pattern. This object is owned by cairo. To keep a
			-- reference to it, you must call CAIRO_PATTERN.`reference'.
			Result::=wrappers.reference_at(ptr)
			if Result=Void then create Result.from_external_pointer(ptr) end
		end

	set_antialias (an_antialias_type: INTEGER) is
			-- Set the antialiasing mode of the rasterizer used for
			-- drawing shapes. This value is a hint, and a particular
			-- backend may or may not support a particular value. At the
			-- current time, no backend supports
			-- `cairo_antialias_subpixel' when drawing shapes.

			-- Note that this option does not affect text rendering,
			-- instead see CAIRO_FONT.`options_set_antialias'.
		require valid_type: is_valid_antialias_type(an_antialias_type)
		do
			cairo_set_antialias(handle, an_antialias_type)
		end

	antialias: INTEGER is
			-- the current shape antialiasing mode, as set by
			-- `set_shape_antialias'.
		do
			Result:=cairo_get_antialias(handle);
		end

feature -- Dashing
	disable_dashes is
			-- Disable dashing
		do
			cairo_set_dash(handle,default_pointer,1, 0.0)
		end
	
	set_dash (some_dashes: ARRAY[REAL]; an_offset: REAL) is
			-- Sets the dash pattern to be used by `stroke'. A dash
			-- pattern is specified by dashes, an array of positive
			-- values. Each value provides the length of alternate "on"
			-- and "off" portions of the stroke. The offset specifies an
			-- offset into the pattern at which the stroke begins.
		
			-- Each "on" segment will have caps applied as if the segment
			-- were a separate sub-path. In particular, it is valid to
			-- use an "on" length of 0.0 with CAIRO_LINE_CAP_ROUND or
			-- CAIRO_LINE_CAP_SQUARE in order to distributed dots or
			-- squares along a path.

			-- Note: The length values are in user-space units as
			-- evaluated at the time of stroking. This is not necessarily
			-- the same as the user space at the time of `set_dash'.

			-- If `some_dashes'.count is 1 a symmetric pattern is assumed
			-- with alternating on and off portions of the size specified
			-- by the single value in dashes.
		
			-- If any value in dashes is negative, or if all values are
			-- 0, then cairo_t will be put into an error state with a
			-- status of CAIRO_STATUS_INVALID_DASH.

			-- `some_dashes': an array specifying alternate lengths of on
			-- and off stroke portions
		
			-- `an_offset': an offset into the dash pattern at which the
			-- stroke should start
		do
			cairo_set_dash(handle, some_dashes.storage.to_external,
								some_dashes.count, an_offset)
		end

	set_fill_rule (a_rule: INTEGER) is
			-- Set the current fill rule within the cairo context. The
			-- fill rule is used to determine which regions are inside or
			-- outside a complex (potentially self-intersecting)
			-- path. The current fill rule affects both cairo_fill and
			-- cairo_clip. See cairo_fill_rule_t for details on the
			-- semantics of each available fill rule.
		require valid_rule: is_valid_fille_rule(a_rule)
		do
			cairo_set_fill_rule(handle, a_rule)
			
		end

	fill_rule: INTEGER is
			-- the current fill rule.
		do
			Result:=cairo_get_fill_rule(handle)
		ensure valid: is_valid_fille_rule(Result)
		end

	set_line_cap (a_line_cap: INTEGER) is
			-- Sets the current line cap style within the cairo
			-- context. See CAIRO_LINE_CAP for details about how the
			-- available line cap styles are drawn.

			-- As with the other stroke parameters, the current line cap
			-- style is examined by `stroke', `stroke_extents', and
			-- `stroke_to_path', but does not have any effect during path
			-- construction.

			--   cr :       a cairo context, as a cairo_t
			--   line_cap : a line cap style, as a cairo_line_cap_t
		require is_valid_line_cap: is_valid_line_cap (a_line_cap)
		do
			cairo_set_line_cap(handle, a_line_cap)
		end

	line_cap: INTEGER is
			-- the current line cap style, as set by `set_line_cap'.
		do
			Result:=cairo_get_line_cap(handle)
		ensure is_valid_line_cap: is_valid_line_cap (Result)
		end
	
	set_line_join (a_line_join: INTEGER) is
			-- Sets the current line join style within the cairo
			-- context. See CAIRO_LINE_JOIN for details about how the
			-- available line join styles are drawn.
		
			-- As with the other stroke parameters, the current line join
			-- style is examined by `stroke', `stroke_extents,' and
			-- `stroke_to_path', but does not have any effect during path
			-- construction.
		require is_valid_line_join: is_valid_line_join (a_join)
		do
			cairo_set_line_join(handle, a_line_join)
		end

	line_join: INTEGER is
			-- the current line join style, as set by `set_line_join'.
		do
			Result:=cairo_get_line_join(handle)
		ensure is_valid_line_join: is_valid_line_join (Result)
		end

	set_line_width (a_width: REAL) is
			-- Sets the current line width within the cairo context. The
			-- line width value specifies the diameter of a pen that is
			-- circular in user space, (though device-space pen may be an
			-- ellipse in general due to scaling/shear/rotation of the
			-- CTM).
		
			-- Note: When the description above refers to user space and
			-- CTM it refers to the user space and CTM in effect at the
			-- time of the stroking operation, not the user space and CTM
			-- in effect at the time of the call to `set_line_width'. The
			-- simplest usage makes both of these spaces identical. That
			-- is, if there is no change to the CTM between a call to
			-- `set_line_with' and the stroking operation, then one can
			-- just pass user-space values to `set_line_width' and ignore
			-- this note.
		
			-- As with the other stroke parameters, the current line
			-- width is examined by `stroke', `stroke_extents', and
			-- `stroke_to_path', but does not have any effect
			-- during path construction.
		
			--   The default line width value is 2.0.
		do
			cairo_set_line_width(handle, a_width)
		end

	line_width: REAL is
			-- the current line width value exactly as set by
			-- `set_line_width'. Note that the value is unchanged even if
			-- the CTM has changed between the calls to `set_line_width'
			-- and `line_width'.
		do
			Result:=cairo_get_line_width(handle)
		end
	
	set_miter_limit (a_limit: REAL) is
		do
			cairo_set_miter_limit(handle, a_limit)
		end

	miter_limit: REAL
			-- the current miter limit, as set by `set_miter_limit'.
		do
			Result:=cairo_get_miter_limit(handle)
		end
	
	set_operator (an_operator: INTEGER) is
			-- Sets the compositing operator to be used for all drawing
			-- operations. See `CAIRO_OPERATOR' for details on the
			-- semantics of each available compositing operator.
		require valid_operator: is_valid_operator (an_operator)
		do
			cairo_set_operator(handle, an_operator)
		end

	operator: INTEGER is
			-- the current compositing operator for a cairo context.
		do
			Result:=cairo_get_operator(handle)
		ensure valid_operator: is_valid_operator (Result)
		end

	set_tolerance (a_tolerance: REAL) is
			-- Sets the tolerance used when converting paths into
			-- trapezoids. Curved segments of the path will be subdivided
			-- until the maximum deviation between the original path and
			-- the polygonal approximation is less than tolerance. The
			-- default value is 0.1. A larger value will give better
			-- performance, a smaller value, better appearance. (Reducing
			-- the value from the default value of 0.1 is unlikely to
			-- improve appearance significantly.)
		do
			cairo_set_tolerance(handle, a_tolerance)
		end

	tolerance: REAL is
			-- the current tolerance value, as set by `set_tolerance'.
		do
			Result:=cairo_get_tolerance(handle)
		end

	clip is
			-- Establishes a new clip region by intersecting the current
			-- clip region with the current path as it would be filled by
			-- `fill' and according to the current fill rule (see
			-- `set_fill_rule').

			-- After `clip,' the current path will be cleared from the
			-- cairo context.
	
			-- The current clip region affects all drawing operations by
			-- effectively masking out any changes to the surface that
			-- are outside the current clip region.
	
			-- Calling `clip' can only make the clip region smaller,
			-- never larger.  But the current clip is part of the
			-- graphics state, so a temporary restriction of the clip
			-- region can be achieved by calling `clip' within a
			-- `save'/`restore' pair. The only other means of
			-- increasing the size of the clip region is
			-- `reset_clip'.
		do
			cairo_clip(handle)
		end

	clip_preserve is
			-- Establishes a new clip region by intersecting the current
			-- clip region with the current path as it would be filled by
			-- `fill'() and according to the current fill rule (see
			-- `set_fill_rule').
			
			-- Unlike `clip'(), `clip_preserve' preserves the path
			-- within the cairo context.
		
			-- The current clip region affects all drawing operations by
			-- effectively masking out any changes to the surface that
			-- are outside the current clip region.
		
			-- Calling `clip' can only make the clip region smaller,
			-- never larger. But the current clip is part of the graphics
			-- state, so a temporary restriction of the clip region can
			-- be achieved by calling `clip' within a `save'/`restore'
			-- pair. The only other means of increasing the size of the
			-- clip region is `reset_clip'.
		do
			cairo_clip_preserve(handle)
		end

	reset_clip is
			-- Reset the current clip region to its original,
			-- unrestricted state. That is, set the clip region to an
			-- infinitely large shape containing the target
			-- surface. Equivalently, if infinity is too hard to grasp,
			-- one can imagine the clip region being reset to the exact
			-- bounds of the target surface.
	
			-- Note that code meant to be reusable should not call
			-- `reset_clip' as it will cause results unexpected by
			-- higher-level code which calls `clip'. Consider using
			-- `save' and `restore' around `clip' as a more robust means
			-- of temporarily restricting the clip region.
		do
			cairo_reset_clip(handle)
		end

	fill is
			-- A drawing operator that fills the current path according
			-- to the current fill rule, (each sub-path is implicitly
			-- closed before being filled). After cairo_fill, the current
			-- path will be cleared from the cairo context. See
			-- `set_fill_rule' and `fill_preserve'.
		do
			cairo_fill(handle)
		end

	preserve is
			-- A drawing operator that fills the current path according
			-- to the current fill rule, (each sub-path is implicitly
			-- closed before being filled). Unlike `fill',
			-- `fill_preserve' preserves the path within the cairo
			-- context.

			-- See `set_fill_rule' and `fill'.
		do
			cairo_fill_preserve(handle)
		end

	extents: TUPLE[REAL,REAL,REAL,REAL] is
			-- The extents in format [x1,y1,x2,y2]
		local an_x1,an_y1,an_x2,an_y2: REAL
		do
			cairo_fill_extents (handle,$an_x1,$an_y1,$an_x2,$an_y2)
			create Result.make_4(an_x1,an_y1,an_x2,an_y2)
		end

	in_fill (an_x, an_y: REAL): BOOLEAN is
			-- Is the given point on the area filled by doing a `stroke'
			-- operation on current context given the current path and filling
			-- parameters?

			-- See `fill', `set_fill_rule' and `fill_preserve'.
			
			-- `an_x': X coordinate of the point to test
			-- `an_y': Y coordinate of the point to test
		do
			Result:=cairo_in_fill(handle, an_x, an_y).to_boolean
		end

	mask (a_pattern: CAIRO_PATTERN) is
			-- A drawing operator that paints the current source using
			-- the alpha channel of pattern as a mask. (Opaque areas of
			-- pattern are painted with the source, transparent areas are
			-- not painted.)
		require pattern_not_void: a_pattern /= Void
		do
			cairo_mask(handle, a_pattern.handle)
		end

	mask_surface (a_surface: CAIRO_SURFACE; an_x, an_y: REAL) is
			-- A drawing operator that paints the current source using
			-- the alpha channel of surface as a mask. (Opaque areas of
			-- surface are painted with the source, transparent areas are
			-- not painted.)

			-- `an_x': X coordinate at which to place the origin of surface

			-- `an_y': Y coordinate at which to place the origin of surface
		require surface_not_void: a_surface/=Void
		do
			cairo_mask_surface(handle, a_surface.handle, an_x, an_y)
		end

	paint is
			-- A drawing operator that paints the current source
			-- everywhere within the current clip region.
		do
			cairo_paint(handle)
		end

	paint_with_alpha (an_alpha: REAL) is
			-- A drawing operator that paints the current source
			-- everywhere within the current clip region using a mask of
			-- constant `an_alpha' value. The effect is similar to
			-- `paint', but the drawing is faded out using `an_alpha'
			-- value.
		require valid_alpha: an_alpha.in_range(0.0, 1.0)
		do
			cairo_paint_with_alpha(handle, an_alpha)
		end

	stroke is
			-- A drawing operator that strokes the current path according
			-- to the current line width, line join, line cap, and dash
			-- settings. After `stroke,' the current path will be cleared
			-- from the cairo context. See `set_line_width',
			-- `set_line_join', `set_line_cap', `set_dash', and
			-- `stroke_preserve'.

			-- Note: Degenerate segments and sub-paths are treated
			-- specially and provide a useful result. These can result in
			-- two different situations:
		
			-- 1. Zero-length "on" segments set in `set_dash'. If the cap
			-- style is `cairo_line_cap_round' or `cairo_line_cap_square'
			-- then these segments will be drawn as circular dots or
			-- squares respectively. In the case of
			-- `cairo_line_cap_square', the orientation of the squares is
			-- determined by the direction of the underlying path.
	
			-- 2. A sub-path created by `move_to' followed by either a
			-- `close_path' or one or more calls to `line_to' to the same
			-- coordinate as the `move_to'. If the cap style is
			-- `cairo_line_cap_round' then these sub-paths will be drawn
			-- as circular dots.  Note that in the case of
			-- `cairo_line_cap_square' a degenerate sub-path will not be
			-- drawn at all, (since the correct orientation is
			-- indeterminate).
			
			-- In no case will a cap style of `cairo_line_cap_butt' cause
			-- anything to be drawn in the case of either degenerate
			-- segments or sub-paths.
		do
			cairo_stroke(handle)
		end

	stroke_preserve is
			-- A drawing operator that strokes the current path according
			-- to the current line width, line join, line cap, and dash
			-- settings. Unlike `stroke', cairo_stroke_preserve preserves
			-- the path within the cairo context.

			-- See `set_line_width', `set_line_join', `set_line_cap',
			-- `set_dash', and `stroke_preserve'.
		do
			cairo_stroke_preserve(handle)
		end
	
	stroke_extents: TUPLE[REAL,REAL,REAL,REAL] is
			-- The stroke extents in format [x1,y1,x2,y2]
		local an_x1,an_y1,an_x2,an_y2: REAL
		do
			cairo_stroke_extents (handle,$an_x1,$an_y1,$an_x2,$an_y2)
			create Result.make_4(an_x1,an_y1,an_x2,an_y2)
		end

	in_stroke (an_x, an_y: REAL): BOOLEAN is
			-- Is the given point is on the area stroked by doing a
			-- `stroke' operation on current context given the current
			-- path and stroking parameters?
	
			-- See `stroke', `set_line_width', `set_line_join',
			-- `set_line_cap', `set_dash', and `stroke_preserve'.

			-- `an_x': X coordinate of the point to test
		
			-- `an_y': Y coordinate of the point to test
		do
			Result:=cairo_in_stroke(handle,an_x,an_y).to_boolean
		end

	copy_page is
			-- Emits the current page for backends that support multiple
			-- pages, but doesn't clear it, so, the contents of the
			-- current page will be retained for the next page too. Use
			-- `show_page' if you want to get an empty page after the
			-- emission.
		do
			cairo_copy_page(handle)
		end

	show_page is
			-- Emits and clears the current page for backends that
			-- support multiple pages. Use `copy_page' if you don't want
			-- to clear the page.
		do
			cairo_show_page(handle)
		end

feature -- Path managing
	get_path: CAIRO_PATH is
			-- Creates a copy of the current path and returns it to the
			-- user as a cairo_path_t. See cairo_path_data_t for hints on
			-- how to iterate over the returned data structure.

			-- The returned path can be unusable, having no data and
			-- `count'=0, if either of the following conditions hold:
	
			--    1. If there is insufficient memory to copy the path.

			--    2. If the context is already in an error state.
	
			-- In either case, CAIRO_PATH's `status' will be set to
			-- `cairo_status_no_memory' (regardless of what the error
			-- status in cr might have been).
			do
			create Result.from_external_pointer(cairo_copy_path(handle))
		end

	get_flat_path: CAIRO_PATHG is
			-- Gets a newly-allocated flattened copy of the current path
	
			-- This feature is like `get_path' except that any curves in
			-- the path will be approximated with piecewise-linear
			-- approximations, (accurate to within the current tolerance
			-- value). That is, the result is guaranteed to not have any
			-- elements of type `cairo_path_curve_to' which will instead be
			-- replaced by a series of `cairo_path_line_to' elements.
		
			-- This function will always return a valid pointer, but the
			-- result will have no data (data==NULL and `count'=0), if
			-- either of the following conditions hold:

			-- 1. If there is insufficient memory to copy the path. In
			-- this case Result.`status' will be set to
			-- `cairo_status_no_memory'.
		
			-- 2. If cr is already in an error state. In this case
			-- path.status will contain the same status that would be
			-- returned by Current.`status'.
		do
			from_external_pointer(cairo_copy_path_flat(handle))
		end

	append_path (a_path: CAIRO_PATH) is
			-- Append the path onto the current path. The path may be
			-- either obtained from `get_path' or `get_flat_path' or it
			-- may be created manually. 
		require 
			path_not_void: a_path/=Void
			valid_path: a_path.status = cairo_status_success
		do        
			cairo_append_path(handle, a_path.handle)
		end

	current_point: TUPLE[REAL,REAL] is
			-- the current point [x,y] of the current path, which is
			-- conceptually the final point reached by the path so far.

			-- The current point is returned in the user-space coordinate
			-- system. If there is no defined current point then x and y
			-- will both be set to 0.0.
			
			-- Most path construction functions alter the current
			-- point. See the following for details on how they affect
			-- the current point:
	
			-- `new_path', `move_to', `line_to', `curve_to', `arc',
			-- `rel_move_to', `rel_line_to', `rel_curve_to', `text_path',
			-- `stroke_to_path'
		local an_x,an_y: REAL
		do
			cairo_get_current_point(handle,$an_x,$an_y)
			create Result.make_2(an_x,an_y)
		ensure not_void: Result/=Void
		end

	new_path is
			-- Clears the current path. After this call there will be no
			-- path and no current point.
		do
			cairo_new_path(handle)
		end

	new_sub_path is
			-- Begin a new sub-path. Note that the existing path is not
			-- affected. After this call there will be no current point.

			-- In many cases, this call is not needed since new sub-paths
			-- are frequently started with `move_to'.
		
			-- A call to `new_sub_path' is particularly useful when
			-- beginning a new sub-path with one of the `arc' calls. This
			-- makes things easier as it is no longer necessary to
			-- manually compute the arc's initial coordinates for a call
			-- to `move_to'.
		do
			cairo_new_sub_path(handle)
		end

	close_path is
			-- Adds a line segment to the path from the current point to
			-- the beginning of the current sub-path, (the most recent
			-- point passed to `move_to'), and closes this
			-- sub-path. After this call the current point will be at the
			-- joined endpoint of the sub-path.

			-- The behavior of `close_path' is distinct from simply
			-- calling `line_to' with the equivalent coordinate in the
			-- case of stroking.  When a closed sub-path is stroked,
			-- there are no caps on the ends of the sub-path. Instead,
			-- there is a line join connecting the final and initial
			-- segments of the sub-path.
		
			-- If there is no current point before the call to
			-- `close_path', this function will have no effect.

			-- Note: As of cairo version 1.2.4 any call to `close_path'
			-- will place an explicit MOVE_TO element into the path
			-- immediately after the CLOSE_PATH element, (which can be
			-- seen in `egt_path' for example). This can simplify path
			-- processing in some cases as it may not be necessary to
			-- save the "last move_to point" during processing as the
			-- MOVE_TO immediately after the CLOSE_PATH will provide that
			-- point.
		do
			cairo_close_path (handle)
		end

	arc (an_x, an_y, a_radiud, an_angle_1, an_angle_2) is
			-- Adds a circular arc of the given radius to the current
			-- path. The arc is centered at (`an_x', `an_y'), begins at
			-- `an_angle_1' and proceeds in the direction of increasing
			-- angles to end at `an_angle_2'. If `an_angle_2' is less than `an_angle_1' it
			-- will be progressively increased by 2*M_PI until it is
			-- greater than `an_angle_1'.

			-- If there is a current point, an initial line segment will
			-- be added to the path to connect the current point to the
			-- beginning of the arc.

			-- Angles are measured in radians. An angle of 0.0 is in the
			-- direction of the positive X axis (in user space). An angle
			-- of M_PI/2.0 radians (90 degrees) is in the direction of
			-- the positive Y axis (in user space). Angles increase in
			-- the direction from the positive X axis toward the positive
			-- Y axis. So with the default transformation matrix, angles
			-- increase in a clockwise direction.

			-- (To convert from degrees to radians, use
			-- degrees*(M_PI/180.)).

			-- This function gives the arc in the direction of increasing
			-- angles; see `arc_negative' to get the arc in the direction
			-- of decreasing angles.

			-- The arc is circular in user space. To achieve an
			-- elliptical arc, you can scale the current transformation
			-- matrix by different amounts in the X and Y directions. For
			-- example, to draw an ellipse in the box given by x, y,
			-- width, height:

			-- save 
			-- translate (x + width / 2., y + height / 2.)
			-- scale (1. / (height / 2.), 1. / (width / 2.))
			-- arc (0., 0., 1., 0., 2 * M_PI);
			-- restore

			-- `an_x' :     X position of the center of the arc
			-- `an_y' :     Y position of the center of the arc
			-- `a_radius' : the radius of the arc
			-- `an_angle_1' : the start angle, in radians
			-- `an_angle_2' : the end angle, in radians
		do
			cairo_arc(handle,an_x, an_y, a_radiud, an_angle_1, an_angle_2)
		end

	arc_negative  (an_x, an_y, a_radiud, an_angle_1, an_angle_2) is
			-- Adds a circular arc of the given radius to the current
			-- path. The arc is centered at (`an_x', `an_y'), begins at
			-- `an_angle_1' and proceeds in the direction of decreasing angles
			-- to end at `an_angle_2'. If `an_angle_2' is greater than `an_angle_1' it will
			-- be progressively decreased by 2*M_PI until it is greater
			-- than `an_angle_1'.
		
			-- See arc() for more details. This function differs only in
			-- the direction of the arc between the two angles.
		
			-- `an_x' :     X position of the center of the arc
			-- `an_y' :     Y position of the center of the arc
			-- `a_radius' : the radius of the arc
			-- `an_angle_1' : the start angle, in radians
			-- `an_angle_2' : the end angle, in radians
		do
			cairo_arc_negative(handle, an_x, an_y, a_radiud, an_angle_1,an_angle_2)
		end

	curve_to (x1,y1,x2,y2,x3,y3: REAL) is
			-- Adds a cubic Bezier spline to the path from the current
			-- point to position (x3, y3) in user-space coordinates,
			-- using (x1, y1) and (x2, y2) as the control points. After
			-- this call the current point will be (x3, y3).
		
			-- If there is no current point before the call to `curve_to'
			-- this function will behave as if preceded by a call to
			-- move_to (x1, y1).

			--   x1 : the X coordinate of the first control point
			--   y1 : the Y coordinate of the first control point
			--   x2 : the X coordinate of the second control point
			--   y2 : the Y coordinate of the second control point
			--   x3 : the X coordinate of the end of the curve
			--   y3 : the Y coordinate of the end of the curve
		do
			cairo_curve_to(handle, x1, y1, x2,y2, x3, y3)
		end

	line_to (an_x, an_y: REAL) is
			-- Adds a line to the path from the current point to position
			-- (`an_x', `an_y') in user-space coordinates. After this call the
			-- current point will be (`an_x', `an_y').

			-- If there is no current point before the call to `line_to'
			-- this function will behave as move_to(an_x,an_y).

			-- `an_x' :  the X coordinate of the end of the new line
			-- `an_y' :  the Y coordinate of the end of the new line
		do
			cairo_line_to(handle,an_x,an_y)
		end

	move_to (an_x, an_y: REAL) is
			-- Begin a new sub-path. After this call the current point
			-- will be (`an_x', `an_y').
		
			-- `an_x' :  the X coordinate of the new position
			-- `an_y' :  the Y coordinate of the new position
		do
				cairo_move_to(handle,an_x,an_y)
		end

	--  cairo_rectangle ()

	-- void        cairo_rectangle                 (cairo_t *cr,
	--                                              double x,
	--                                              double y,
	--                                              double width,
	--                                              double height);

	--   Adds a closed sub-path rectangle of the given size to the current path at
	--   position (x, y) in user-space coordinates.

	--   This function is logically equivalent to:

	-- cairo_move_to (cr, x, y);
	-- cairo_rel_line_to (cr, width, 0);
	-- cairo_rel_line_to (cr, 0, height);
	-- cairo_rel_line_to (cr, -width, 0);
	-- cairo_close_path (cr);

	--   cr :     a cairo context
	--   x :      the X coordinate of the top left corner of the rectangle
	--   y :      the Y coordinate to the top left corner of the rectangle
	--   width :  the width of the rectangle
	--   height : the height of the rectangle

	--   --------------------------------------------------------------------------

	--  cairo_glyph_path ()

	-- void        cairo_glyph_path                (cairo_t *cr,
	--                                              cairo_glyph_t *glyphs,
	--                                              int num_glyphs);

	--   cr :
	--   glyphs :
	--   num_glyphs :

	--   --------------------------------------------------------------------------

	--  cairo_text_path ()

	-- void        cairo_text_path                 (cairo_t *cr,
	--                                              const char *utf8);

	--   cr :
	--   utf8 :

	--   --------------------------------------------------------------------------

	--  cairo_rel_curve_to ()

	-- void        cairo_rel_curve_to              (cairo_t *cr,
	--                                              double dx1,
	--                                              double dy1,
	--                                              double dx2,
	--                                              double dy2,
	--                                              double dx3,
	--                                              double dy3);

	--   Relative-coordinate version of cairo_curve_to(). All offsets are relative
	--   to the current point. Adds a cubic Bezier spline to the path from the
	--   current point to a point offset from the current point by (dx3, dy3),
	--   using points offset by (dx1, dy1) and (dx2, dy2) as the control points.
	--   After this call the current point will be offset by (dx3, dy3).

	--   Given a current point of (x, y), cairo_rel_curve_to (cr, dx1, dy1, dx2,
	--   dy2, dx3, dy3) is logically equivalent to cairo_curve_to (cr, x + dx1, y +
	--   dy1, x + dx2, y + dy2, x + dx3, y + dy3).

	--   It is an error to call this function with no current point. Doing so will
	--   cause cr to shutdown with a status of CAIRO_STATUS_NO_CURRENT_POINT.

	--   cr :  a cairo context
	--   dx1 : the X offset to the first control point
	--   dy1 : the Y offset to the first control point
	--   dx2 : the X offset to the second control point
	--   dy2 : the Y offset to the second control point
	--   dx3 : the X offset to the end of the curve
	--   dy3 : the Y offset to the end of the curve

	--   --------------------------------------------------------------------------

	--  cairo_rel_line_to ()

	-- void        cairo_rel_line_to               (cairo_t *cr,
	--                                              double dx,
	--                                              double dy);

	--   Relative-coordinate version of cairo_line_to(). Adds a line to the path
	--   from the current point to a point that is offset from the current point by
	--   (dx, dy) in user space. After this call the current point will be offset
	--   by (dx, dy).

	--   Given a current point of (x, y), cairo_rel_line_to(cr, dx, dy) is
	--   logically equivalent to cairo_line_to (cr, x + dx, y + dy).

	--   It is an error to call this function with no current point. Doing so will
	--   cause cr to shutdown with a status of CAIRO_STATUS_NO_CURRENT_POINT.

	--   cr : a cairo context
	--   dx : the X offset to the end of the new line
	--   dy : the Y offset to the end of the new line

	--   --------------------------------------------------------------------------

	--  cairo_rel_move_to ()

	-- void        cairo_rel_move_to               (cairo_t *cr,
	--                                              double dx,
	--                                              double dy);

	--   Begin a new sub-path. After this call the current point will offset by (x,
	--   y).

	--   Given a current point of (x, y), cairo_rel_move_to(cr, dx, dy) is
	--   logically equivalent to cairo_move_to (cr, x + dx, y + dy).

	--   It is an error to call this function with no current point. Doing so will
	--   cause cr to shutdown with a status of CAIRO_STATUS_NO_CURRENT_POINT.

	--   cr : a cairo context
	--   dx : the X offset
	--   dy : the Y offset

end -- class CAIRO_CONTEXT

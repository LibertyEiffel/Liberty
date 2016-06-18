note
	description: "Patterns -- Gradients and filtered sources"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli,
					Soluciones Informaticas Libres S.A. (Except),
					Cairo team
					
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
	revision: "$Revision:$"
	wrapped_version: "1.2.4"

class CAIRO_PATTERN

inherit
	C_STRUCT
	REFERENCE_COUNTED

insert
	CAIRO_PATTERN_EXTERNALS
	CAIRO_PATTERN_TYPE
	CAIRO_EXTEND
	CAIRO_FILTER
	CAIRO_STATUS

create {ANY} make_rgb, make_rgba, from_external_pointer

feature {} -- Creation
	make_rgb (a_red, a_green, a_blue: REAL)
			-- Creates a new cairo_pattern_t corresponding to an opaque
			-- color. The color components are floating point numbers in
			-- the range 0 to 1. If the values passed in are outside that
			-- range, they will be clamped.
		
			-- `a_red':     red component of the color
			-- `a_green':   green component of the color
			-- `a_blue' :    blue component of the color
		do
			-- cairo_pattern_create_rgb the newly created cairo_pattern_t
			-- if succesful, or an error pattern in case of no
			-- memory. The caller owns the returned object and should
			-- call cairo_pattern_destroy() when finished with it. This
			-- function will always return a valid pointer, but if an
			-- error occurred the pattern status will be set to an error.
			-- To inspect the status of a pattern use
			-- cairo_pattern_status().
			from_external_pointer(cairo_pattern_create_rgb
										 (a_red, a_green, a_blue))
		end
	
	make_rgba (a_red, a_green, a_blue, an_alpha: REAL)
			-- Creates a new pattern corresponding to a translucent
			-- color. The color components are floating point numbers in
			-- the range 0 to 1. If the values passed in are outside that
			-- range, they will be clamped.
		
			-- `a_red':     red component of the color
			-- `a_green':   green component of the color
			-- `a_blue':    blue component of the color
			-- `an_alpha':   alpha component of the color
		do
			from_external_pointer(cairo_pattern_create_rgba
										 (a_red, a_green, a_blue, an_alpha))
			-- cairo_pattern_create_rgba returns the newly created
			-- cairo_pattern_t if succesful, or an error pattern in case
			-- of no memory. The caller owns the returned object and
			-- should call cairo_pattern_destroy() when finished with
			-- it. This function will always return a valid pointer, but
			-- if an error occurred the pattern status will be set to an
			-- error.  To inspect the status of a pattern use
			-- cairo_pattern_status().
		end

feature {ANY} -- Access

	status: INTEGER
			-- Pattern status; useful to check whether an error has
			-- previously occurred for this pattern.
		do
			Result:=cairo_pattern_status(handle)
		ensure valid: ((Result = cairo_status_success) or else
						(Result = cairo_status_no_memory) or else
						(Result = cairo_status_pattern_type_mismatch))
		end
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_pattern_set_matrix ()
	--
	-- void        cairo_pattern_set_matrix        (cairo_pattern_t *pattern,
	--                                              const cairo_matrix_t *matrix);
	--
	--   Sets the pattern's transformation matrix to matrix. This matrix is a
	--   transformation from user space to pattern space.
	--
	--   When a pattern is first created it always has the identity matrix for its
	--   transformation matrix, which means that pattern space is initially
	--   identical to user space.
	--
	--   Important: Please note that the direction of this transformation matrix is
	--   from user space to pattern space. This means that if you imagine the flow
	--   from a pattern to user space (and on to device space), then coordinates in
	--   that flow will be transformed by the inverse of the pattern matrix.
	--
	--   For example, if you want to make a pattern appear twice as large as it
	--   does by default the correct code to use is:
	--
	-- cairo_matrix_init_scale (&matrix, 0.5, 0.5);
	-- cairo_pattern_set_matrix (pattern, &matrix);
	--
	--   Meanwhile, using values of 2.0 rather than 0.5 in the code above would
	--   cause the pattern to appear at half of its default size.
	--
	--   Also, please note the discussion of the user-space locking semantics of
	--   cairo_set_source().
	--
	--   pattern : a cairo_pattern_t
	--   matrix :  a cairo_matrix_t
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_pattern_get_matrix ()
	--
	-- void        cairo_pattern_get_matrix        (cairo_pattern_t *pattern,
	--                                              cairo_matrix_t *matrix);
	--
	--   Stores the pattern's transformation matrix into matrix.
	--
	--   pattern : a cairo_pattern_t
	--   matrix :  return value for the matrix

	type: INTEGER
			-- This function returns the type a pattern. See CAIRO_PATTERN_TYPE
			-- for available types.
		do
			Result := cairo_pattern_get_type (handle)
		ensure
			is_valid_pattern_type (Result)
		end

	set_filter (a_filter: INTEGER)
			-- Sets the filter to be used for resizing when using this pattern.
			-- See CAIRO_FILTER for details on each filter.
		require
			is_valid_filter (a_filter)
		do
			cairo_pattern_set_filter (handle, a_filter)
		end

	filter: INTEGER
			-- Gets the current filter for a pattern. See CAIRO_FILTER for
			-- details on each filter.
		do
			Result := cairo_pattern_get_filter (handle)
		ensure
			is_valid_filter (Result)
		end

	set_extend (a_extend: INTEGER)
			-- Sets the mode to be used for drawing outside the area of a
			-- pattern. See CAIRO_EXTEND for details on the semantics of each
			-- extend strategy.
		require
			is_valid_extend (a_extend)
		do
			cairo_pattern_set_extend (handle, a_extend)
		end

	extend: INTEGER
			-- Gets the current extend mode for a pattern. See CAIRO_EXTEND for
			-- details on the semantics of each extend strategy.
		do
			Result := cairo_pattern_get_extend (handle)
		ensure
			is_valid_extend (Result)
		end

feature {ANY} -- Memory handling
	unref
			-- Decreases the reference count on pattern by one. If the
			-- result is zero, then pattern and all associated resources
			-- are freed. See `ref'
		do
			cairo_pattern_destroy(handle)
		end

	ref
			-- Increases the reference count on pattern by one. This
			-- prevents pattern from being destroyed until a matching
			-- call to cairo_pattern_destroy() is made.
			--
			-- This feature is currently hidden because memory handling 
			-- should be automatically done by Eiffel garbage collector.
			--
			-- Wrapped as 'ref' to not collide with C_STRUCT.reference
		local p: POINTER
		do
			p := cairo_pattern_reference(handle)
		end

end -- class CAIRO_PATTERN

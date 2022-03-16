note
	description: "Glob-style pattern matching."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, Glib developers
					
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

class G_PATTERN
	-- Glob-style pattern matching - matches strings against patterns
	-- containing '*' (wildcard) and '?' (joker).
	
	-- G_PATTERN match a string against a pattern containing '*' and
	-- '?' wildcards with similar semantics as the standard glob()
	-- function: '*' matches an arbitrary, possibly empty, string, '?'
	-- matches an arbitrary character.

	-- Note that in contrast to glob(), the '/' character can be
	-- matched by the wildcards, there are no '[...]' character ranges
	-- and '*' and '?' can not be escaped to include them literally in
	-- a pattern.

	-- When multiple strings must be matched against the same pattern,
	-- it is better to compile the pattern to a GPatternSpec using
	-- `make' and use `match_string' instead of `match_simple'. This
	-- avoids the overhead of repeated pattern compilation.

inherit
		C_STRUCT redefine is_equal, free end
		EIFFEL_OWNED redefine free end

create {ANY} make

create {WRAPPER, WRAPPER_HANDLER} from_external_pointer

feature {} -- Creation

	make (a_pattern: STRING)
			-- Compiles `a_pattern' into a G_PATTERN.

			-- TODO: `a_pattern' should be a zero-terminated UTF-8
			-- encoded string.
		require pattern_not_void: a_pattern /= Void
		do
			from_external_pointer(g_pattern_spec_new(a_pattern.to_external))
		end

feature {ANY} 
	is_equal (another: like Current): BOOLEAN
			-- Compares Current and `another' patterns. Will they match
			-- the same set of strings?
		do
			Result:=(g_pattern_spec_equal(Current.handle,
													another.handle)).to_boolean
		end

	match (a_string: STRING): BOOLEAN
			-- Matches a string against a compiled pattern.

			-- TODO: a_string should be an UTF8 string.
		
			-- TODO: provide a variant of the call the require the
			-- reversed string, since there is an algorithm requiring the
			-- reverse of the string than in some cases is (much) more
			-- efficient. See the comment in feature code for further
			-- informations.
		require string_not_void: a_string/=Void
		do
			-- Passing the correct length of the string given is
			-- mandatory. The reversed string can be omitted by passing
			-- NULL, this is more efficient if the reversed version of
			-- the string to be matched is not at hand, as
			-- g_pattern_match() will only construct it if the compiled
			-- pattern requires reverse matches.

			-- Note that, if the user code will (possibly) match a string
			-- against a multitude of patterns containing wildcards,
			-- chances are high that some patterns will require a
			-- reversed string. In this case, it's more efficient to
			-- provide the reversed string to avoid multiple
			-- constructions thereof in the various calls to
			-- g_pattern_match().

			-- Note also that the reverse of a UTF-8 encoded string can
			-- in general not be obtained by g_strreverse(). This works
			-- only if the string doesn't contain any multibyte
			-- characters. Glib offers the g_utf_strreverse() function to
			-- reverse UTF-8 encoded strings.

			-- pspec :           a GPatternSpec.
			-- string_length :   the length of string.
			-- string :          the UTF-8 encoded string to match.
			-- string_reversed : the reverse of string or NULL.
			Result:=(g_pattern_match(handle, a_string.count, a_string.to_external,
											 default_pointer)).to_boolean
		end

	match_string (a_string: STRING): BOOLEAN
			-- Matches `a_string' against Current compiled pattern. If
			-- the string is to be matched against more than one pattern,
			-- consider using `match' instead while supplying the
			-- reversed string.

			-- TODO: `a_string' should be an UTF-8 encoded string to
			-- match.
		require string_not_void: a_string/=Void
		do
			Result:=g_pattern_match_string(handle,a_string.to_external).to_boolean
		end
	
	match_simple (a_pattern, a_string: STRING): BOOLEAN
			--  Matches `a_string' against `a_pattern' given as a
			--  string. If this function is to be called in a loop, it's
			--  more efficient to compile the pattern once with `make'
			--  and call `match_string' repetively.

			-- TODO: `a_pattern': the UTF-8 encoded pattern.

			-- TODO: `a_string': the UTF-8 encoded string to match.
		require
			pattern_not_void: a_pattern/=Void
			string_not_void: a_string/=Void
		do
			Result:=g_pattern_match_simple(a_pattern.to_external, a_string.to_external).to_boolean
		end

feature {} -- External calls

	g_pattern_spec_new (a_pattern: POINTER): POINTER
			--  GPatternSpec* g_pattern_spec_new (const gchar *pattern);
		external "C use <glib.h>"
		end

	free (a_pattern: POINTER)
			--  void g_pattern_spec_free (GPatternSpec *pspec);
		external "C use <glib.h>"
		alias "g_pattern_spec_free"
		end

	g_pattern_spec_equal (a_pspec1,a_pspec2: POINTER): INTEGER
			--  gboolean g_pattern_spec_equal (GPatternSpec *pspec1,
			--  GPatternSpec *pspec2);
		external "C use <glib.h>"
		end

	g_pattern_match (a_pspec: POINTER; a_string_length: INTEGER; a_string, a_string_reversed: POINTER): INTEGER
			-- gboolean g_pattern_match (GPatternSpec *pspec, guint
			-- string_length, const gchar *string, const gchar
			-- *string_reversed);
		external "C use <glib.h>"
		end

	g_pattern_match_string (a_pspec, a_string: POINTER): INTEGER
			--  gboolean g_pattern_match_string (GPatternSpec *pspec,
			--  const gchar *string);
		external "C use <glib.h>"
		end

	g_pattern_match_simple (a_pattern,a_string: POINTER): INTEGER
			--  gboolean g_pattern_match_simple (const gchar *pattern,
			--  const gchar *string);
		external "C use <glib.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <glib.h>"
		alias "sizeof(GPatternSpec)"
		end

end -- class class G_PATTERN


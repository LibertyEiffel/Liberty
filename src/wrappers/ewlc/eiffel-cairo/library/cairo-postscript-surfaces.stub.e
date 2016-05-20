note
	description: "."
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

class FOO

inherit
	(SHARED_?)C_STRUCT

insert
	FOO_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: Cairo: A Vector Graphics Library (start)
	--   Link: Surfaces (parent)
	--   Link: PNG Support (previous)
	--   Link: Win32 Surfaces (next)
	--   Link: Part I. Tutorial (part)
	--   Link: Part II. Reference (part)
	--   Link: Drawing (chapter)
	--   Link: Fonts (chapter)
	--   Link: Surfaces (chapter)
	--   Link: Utilities (chapter)
	--   Link: Index (index)
	--   Link: Index of new symbols in 1.2 (index)
	--   Link: Appendix A. Creating a language binding for cairo (appendix)
	--
	--   Prev Up Home             Cairo: A Vector Graphics Library             Next
	--   Top  |  Description
	--
	--   PostScript Surfaces
	--
	--   PostScript Surfaces -- Rendering PostScript documents
	--
	--Synopsis
	--
	--
	--
	--
	-- cairo_surface_t* cairo_ps_surface_create    (const char *filename,
	--                                              double width_in_points,
	--                                              double height_in_points);
	-- cairo_surface_t* cairo_ps_surface_create_for_stream
	--                                             (cairo_write_func_t write_func,
	--                                              void *closure,
	--                                              double width_in_points,
	--                                              double height_in_points);
	-- void        cairo_ps_surface_set_size       (cairo_surface_t *surface,
	--                                              double width_in_points,
	--                                              double height_in_points);
	-- void        cairo_ps_surface_dsc_begin_setup
	--                                             (cairo_surface_t *surface);
	-- void        cairo_ps_surface_dsc_begin_page_setup
	--                                             (cairo_surface_t *surface);
	-- void        cairo_ps_surface_dsc_comment    (cairo_surface_t *surface,
	--                                              const char *comment);
	--
	--Description
	--
	--Details
	--
	--  cairo_ps_surface_create ()
	--
	-- cairo_surface_t* cairo_ps_surface_create    (const char *filename,
	--                                              double width_in_points,
	--                                              double height_in_points);
	--
	--   Creates a PostScript surface of the specified size in points to be written
	--   to filename. See cairo_ps_surface_create_for_stream() for a more flexible
	--   mechanism for handling the PostScript output than simply writing it to a
	--   named file.
	--
	--   Note that the size of individual pages of the PostScript output can vary.
	--   See cairo_ps_surface_set_size().
	--
	--   filename :         a filename for the PS output (must be writable)
	--   width_in_points :  width of the surface, in points (1 point == 1/72.0
	--                      inch)
	--   height_in_points : height of the surface, in points (1 point == 1/72.0
	--                      inch)
	--   Returns :          a pointer to the newly created surface. The caller owns
	--                      the surface and should call cairo_surface_destroy when
	--                      done with it. This function always returns a valid
	--                      pointer, but it will return a pointer to a "nil"
	--                      surface if an error such as out of memory occurs. You
	--                      can use cairo_surface_status() to check for this.
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_ps_surface_create_for_stream ()
	--
	-- cairo_surface_t* cairo_ps_surface_create_for_stream
	--                                             (cairo_write_func_t write_func,
	--                                              void *closure,
	--                                              double width_in_points,
	--                                              double height_in_points);
	--
	--   Creates a PostScript surface of the specified size in points to be written
	--   incrementally to the stream represented by write_func and closure. See
	--   cairo_ps_surface_create() for a more convenient way to simply direct the
	--   PostScript output to a named file.
	--
	--   Note that the size of individual pages of the PostScript output can vary.
	--   See cairo_ps_surface_set_size().
	--
	--   write_func :       a cairo_write_func_t to accept the output data
	--   closure :          the closure argument for write_func
	--   width_in_points :  width of the surface, in points (1 point == 1/72.0
	--                      inch)
	--   height_in_points : height of the surface, in points (1 point == 1/72.0
	--                      inch)
	--   Returns :          a pointer to the newly created surface. The caller owns
	--                      the surface and should call cairo_surface_destroy when
	--                      done with it. This function always returns a valid
	--                      pointer, but it will return a pointer to a "nil"
	--                      surface if an error such as out of memory occurs. You
	--                      can use cairo_surface_status() to check for this.
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_ps_surface_set_size ()
	--
	-- void        cairo_ps_surface_set_size       (cairo_surface_t *surface,
	--                                              double width_in_points,
	--                                              double height_in_points);
	--
	--   Changes the size of a PostScript surface for the current (and subsequent)
	--   pages.
	--
	--   This function should only be called before any drawing operations have
	--   been performed on the current page. The simplest way to do this is to call
	--   this function immediately after creating the surface or immediately after
	--   completing a page with either cairo_show_page() or cairo_copy_page().
	--
	--   surface :          a PostScript cairo_surface_t
	--   width_in_points :  new surface width, in points (1 point == 1/72.0 inch)
	--   height_in_points : new surface height, in points (1 point == 1/72.0 inch)
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_ps_surface_dsc_begin_setup ()
	--
	-- void        cairo_ps_surface_dsc_begin_setup
	--                                             (cairo_surface_t *surface);
	--
	--   This function indicates that subsequent calls to
	--   cairo_ps_surface_dsc_comment() should direct comments to the Setup section
	--   of the PostScript output.
	--
	--   This function should be called at most once per surface, and must be
	--   called before any call to cairo_ps_surface_dsc_begin_page_setup() and
	--   before any drawing is performed to the surface.
	--
	--   See cairo_ps_surface_dsc_comment() for more details.
	--
	--   surface : a PostScript cairo_surface_t
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_ps_surface_dsc_begin_page_setup ()
	--
	-- void        cairo_ps_surface_dsc_begin_page_setup
	--                                             (cairo_surface_t *surface);
	--
	--   This function indicates that subsequent calls to
	--   cairo_ps_surface_dsc_comment() should direct comments to the PageSetup
	--   section of the PostScript output.
	--
	--   This function call is only needed for the first page of a surface. It
	--   should be called after any call to cairo_ps_surface_dsc_begin_setup() and
	--   before any drawing is performed to the surface.
	--
	--   See cairo_ps_surface_dsc_comment() for more details.
	--
	--   surface : a PostScript cairo_surface_t
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_ps_surface_dsc_comment ()
	--
	-- void        cairo_ps_surface_dsc_comment    (cairo_surface_t *surface,
	--                                              const char *comment);
	--
	--   Emit a comment into the PostScript output for the given surface.
	--
	--   The comment is expected to conform to the PostScript Language Document
	--   Structuring Conventions (DSC). Please see that manual for details on the
	--   available comments and their meanings. In particular, the %IncludeFeature
	--   comment allows a device-independent means of controlling printer device
	--   features. So the PostScript Printer Description Files Specification will
	--   also be a useful reference.
	--
	--   The comment string must begin with a percent character (%) and the total
	--   length of the string (including any initial percent characters) must not
	--   exceed 255 characters. Violating either of these conditions will place
	--   surface into an error state. But beyond these two conditions, this
	--   function will not enforce conformance of the comment with any particular
	--   specification.
	--
	--   The comment string should not have a trailing newline.
	--
	--   The DSC specifies different sections in which particular comments can
	--   appear. This function provides for comments to be emitted within three
	--   sections: the header, the Setup section, and the PageSetup section.
	--   Comments appearing in the first two sections apply to the entire document
	--   while comments in the BeginPageSetup section apply only to a single page.
	--
	--   For comments to appear in the header section, this function should be
	--   called after the surface is created, but before a call to
	--   cairo_ps_surface_begin_setup().
	--
	--   For comments to appear in the Setup section, this function should be
	--   called after a call to cairo_ps_surface_begin_setup() but before a call to
	--   cairo_ps_surface_begin_page_setup().
	--
	--   For comments to appear in the PageSetup section, this function should be
	--   called after a call to cairo_ps_surface_begin_page_setup().
	--
	--   Note that it is only necessary to call cairo_ps_surface_begin_page_setup()
	--   for the first page of any surface. After a call to cairo_show_page() or
	--   cairo_copy_page() comments are unambiguously directed to the PageSetup
	--   section of the current page. But it doesn't hurt to call this function at
	--   the beginning of every page as that consistency may make the calling code
	--   simpler.
	--
	--   As a final note, cairo automatically generates several comments on its
	--   own. As such, applications must not manually generate any of the following
	--   comments:
	--
	--   Header section: %!PS-Adobe-3.0, %Creator, %CreationDate, %Pages,
	--   %BoundingBox, %DocumentData, %LanguageLevel, %EndComments.
	--
	--   Setup section: %BeginSetup, %EndSetup
	--
	--   PageSetup section: %BeginPageSetup, %PageBoundingBox, %EndPageSetup.
	--
	--   Other sections: %BeginProlog, %EndProlog, %Page, %Trailer, %EOF
	--
	--   Here is an example sequence showing how this function might be used:
	--
	-- cairo_surface_t *surface = cairo_ps_surface_create (filename, width, height);
	-- ...
	-- cairo_ps_surface_dsc_comment (surface, "%Title: My excellent document");
	-- cairo_ps_surface_dsc_comment (surface, "%Copyright: Copyright (C) 2006 Cairo Lover")
	-- ...
	-- cairo_ps_surface_dsc_begin_setup (surface);
	-- cairo_ps_surface_dsc_comment (surface, "%IncludeFeature: *MediaColor White");
	-- ...
	-- cairo_ps_surface_dsc_begin_page_setup (surface);
	-- cairo_ps_surface_dsc_comment (surface, "%IncludeFeature: *PageSize A3");
	-- cairo_ps_surface_dsc_comment (surface, "%IncludeFeature: *InputSlot LargeCapacity");
	-- cairo_ps_surface_dsc_comment (surface, "%IncludeFeature: *MediaType Glossy");
	-- cairo_ps_surface_dsc_comment (surface, "%IncludeFeature: *MediaColor Blue");
	-- ... draw to first page here ..
	-- cairo_show_page (cr);
	-- ...
	-- cairo_ps_surface_dsc_comment (surface, "%IncludeFeature: *PageSize A5");
	-- ...
	--
	--   surface : a PostScript cairo_surface_t
	--   comment : a comment string to be emitted into the PostScript output
	--
	--   Since 1.2

end -- class FOO

note
	description: "."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "1.2.4"

class FOO

inherit
	(SHARED_?)C_STRUCT

insert
	FOO_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: Cairo: A Vector Graphics Library (start)
	--   Link: Utilities (parent)
	--   Link: Error handling (previous)
	--   Link: Types (next)
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
	--   Version Information
	--
	--   Version Information -- Compile-time and run-time version checks.
	--
	--Synopsis
	--
	--
	--
	--
	-- #define     CAIRO_VERSION
	-- #define     CAIRO_VERSION_MAJOR
	-- #define     CAIRO_VERSION_MINOR
	-- #define     CAIRO_VERSION_MICRO
	-- #define     CAIRO_VERSION_STRING
	-- #define     CAIRO_VERSION_ENCODE            (major, minor, micro)
	-- int         cairo_version                   (void);
	-- const char* cairo_version_string            (void);
	--
	--Description
	--
	--   Cairo has a three-part version number scheme. In this scheme, we use even
	--   vs. odd numbers to distinguish fixed points in the software vs.
	--   in-progress development, (such as from CVS instead of a tar file, or as a
	--   "snapshot" tar file as opposed to a "release" tar file).
	--
	--  _____ Major. Always 1, until we invent a new scheme.
	-- /  ___ Minor. Even/Odd = Release/Snapshot (tar files) or Branch/Head (CVS)
	-- | /  _ Micro. Even/Odd = Tar-file/CVS
	-- | | /
	-- 1.0.0
	--
	--   Here are a few examples of versions that one might see.
	--
	-- Releases
	-- --------
	-- 1.0.0 - A major release
	-- 1.0.2 - A subsequent maintenance release
	-- 1.2.0 - Another major release
	--
	-- Snapshots
	-- ---------
	-- 1.1.2 - A snapshot (working toward the 1.2.0 release)
	--
	-- In-progress development (eg. from CVS)
	-- --------------------------------------
	-- 1.0.1 - Development on a maintenance branch (toward 1.0.2 release)
	-- 1.1.1 - Development on head (toward 1.1.2 snapshot and 1.2.0 release)
	--
	--  Compatibility
	--
	--   The API/ABI compatibility guarantees for various versions are as follows.
	--   First, let's assume some cairo-using application code that is successfully
	--   using the API/ABI "from" one version of cairo. Then let's ask the question
	--   whether this same code can be moved "to" the API/ABI of another version of
	--   cairo.
	--
	--   Moving from a release to any later version (release, snapshot,
	--   development) is always guaranteed to provide compatibility.
	--
	--   Moving from a snapshot to any later version is not guaranteed to provide
	--   compatibility, since snapshots may introduce new API that ends up being
	--   removed before the next release.
	--
	--   Moving from an in-development version (odd micro component) to any later
	--   version is not guaranteed to provide compatibility. In fact, there's not
	--   even a guarantee that the code will even continue to work with the same
	--   in-development version number. This is because these numbers don't
	--   correspond to any fixed state of the software, but rather the many states
	--   between snapshots and releases.
	--
	--   --------------------------------------------------------------------------
	--
	--  Examining the version
	--
	--   Cairo provides the ability to examine the version at either compile-time
	--   or run-time and in both a human-readable form as well as an encoded form
	--   suitable for direct comparison. Cairo also provides a macro
	--   (CAIRO_VERSION_ENCODE) to perform the encoding.
	--
	-- Compile-time
	-- ------------
	-- CAIRO_VERSION_STRING    Human-readable
	-- CAIRO_VERSION           Encoded, suitable for comparison
	--
	-- Run-time
	-- --------
	-- cairo_version_string()  Human-readable
	-- cairo_version()         Encoded, suitable for comparison
	--
	--   For example, checking that the cairo version is greater than or equal to
	--   1.0.0 could be achieved at compile-time or run-time as follows:
	--
	-- #if CAIRO_VERSION >= CAIRO_VERSION_ENCODE(1, 0, 0)
	-- printf ("Compiling with suitable cairo version: %s\n", CAIRO_VERSION_STRING);
	-- #endif
	--
	-- if (cairo_version() >= CAIRO_VERSION_ENCODE(1, 0, 0))
	--     printf ("Running with suitable cairo version: %s\n", cairo_version_string());
	--
	--Details
	--
	--  CAIRO_VERSION
	--
	-- #define     CAIRO_VERSION
	--
	--   --------------------------------------------------------------------------
	--
	--  CAIRO_VERSION_MAJOR
	--
	-- #define CAIRO_VERSION_MAJOR 1
	--
	--   --------------------------------------------------------------------------
	--
	--  CAIRO_VERSION_MINOR
	--
	-- #define CAIRO_VERSION_MINOR 2
	--
	--   --------------------------------------------------------------------------
	--
	--  CAIRO_VERSION_MICRO
	--
	-- #define CAIRO_VERSION_MICRO 4
	--
	--   --------------------------------------------------------------------------
	--
	--  CAIRO_VERSION_STRING
	--
	-- #define CAIRO_VERSION_STRING "1.2.4"
	--
	--   --------------------------------------------------------------------------
	--
	--  CAIRO_VERSION_ENCODE()
	--
	-- #define     CAIRO_VERSION_ENCODE(major, minor, micro)
	--
	--   major :
	--   minor :
	--   micro :
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_version ()
	--
	-- int         cairo_version                   (void);
	--
	--   Returns the version of the cairo library encoded in a single integer as
	--   per CAIRO_VERSION_ENCODE. The encoding ensures that later versions compare
	--   greater than earlier versions.
	--
	--   A run-time comparison to check that cairo's version is greater than or
	--   equal to version X.Y.Z could be performed as follows:
	--
	-- if (cairo_version() >= CAIRO_VERSION_ENCODE(X,Y,Z)) {...}
	--
	--   See also cairo_version_string() as well as the compile-time equivalents
	--   CAIRO_VERSION and CAIRO_VERSION_STRING.
	--
	--   Returns : the encoded version.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_version_string ()
	--
	-- const char* cairo_version_string            (void);
	--
	--   Returns the version of the cairo library as a human-readable string of the
	--   form "X.Y.Z".
	--
	--   See also cairo_version() as well as the compile-time equivalents
	--   CAIRO_VERSION_STRING and CAIRO_VERSION.
	--
	--   Returns : a string containing the version.

end -- class FOO

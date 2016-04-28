note
	description: "."
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
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

	wrapped_version: "Unknown"

class GCONF_GCONF_ERROR

inherit
	(SHARED_?)C_STRUCT

insert
	GCONF_GCONF_ERROR_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: GConf Reference Manual (start)
	--   Link: Using the GConf library (parent)
	--   Link: GConfEngine (previous)
	--   Link: gconf-internals (next)
	--   Link: Using the GConf library (chapter)
	--
	--   Prev Up Home                  GConf Reference Manual                  Next
	--   Top  |  Description
	--
	--   GError
	--
	--   GError -- error reporting.
	--
	--Synopsis
	--
	--
	--
	--
	-- enum                GConfError;
	-- GError*             gconf_error_new                     (GConfError en,
	--                                                          const gchar *format,
	--                                                          ...);
	-- GQuark              gconf_error_quark                   (void);
	-- void                gconf_set_error                     (GError **err,
	--                                                          GConfError en,
	--                                                          const gchar *format,
	--                                                          ...);
	-- GError*             gconf_compose_errors                (GError *err1,
	--                                                          GError *err2);
	--
	--Description
	--
	--   The GError object is used to report errors that occur in GConf library
	--   routines. All functions that report errors work the same way:
	--
	--     o The last argument to the function is a GError**, a pointer to a
	--       location where a GError* can be placed.
	--
	--     o This last argument may be NULL, in which case no error will be
	--       returned.
	--
	--     o If non-NULL, the argument should be the address of a GError* variable,
	--       which should be initialized to NULL.
	--
	--     o If an error occurs, a GError will be allocated and placed in the
	--       return location; the caller must free the GError with g_error_free().
	--       If no error occurs, the return location will be left untouched. That
	--       is, the test error != NULL should always be a reliable indicator of
	--       whether the operation failed.
	--
	--   It's also common that the return value of a function indicates whether or
	--   not an error occurred. Typically, TRUE is returned on success. In some
	--   cases, a NULL return value indicates failure. Either way, if the return
	--   value indicates failure and you passed a non-NULL value for the last
	--   argument to the function, a GError will be returned. If the return value
	--   indicates success, then a GError will never be returned. These
	--   relationships are guaranteed; that is, you can reliably use the return
	--   value to decide whether a GError was placed in the return location. If a
	--   function does not indicate success/failure by return value, you must check
	--   whether the GError is NULL to detect errors.
	--
	--   Here's a short error handling example:
	--
	--   GError* err = NULL;
	--
	--   if (!gconf_init(&err))
	--     {
	--       fprintf(stderr, _("Failed to init GConf: %s\n"), err->message);
	--       g_error_free(err);
	--       err = NULL;
	--     }
	--
	--Details
	--
	--  enum GConfError
	--
	-- typedef enum {
	--   GCONF_ERROR_SUCCESS = 0,
	--   GCONF_ERROR_FAILED = 1,        /* Something didn't work, don't know why, probably unrecoverable
	--                                     so there's no point having a more specific errno */
	--
	--   GCONF_ERROR_NO_SERVER = 2,     /* Server can't be launched/contacted */
	--   GCONF_ERROR_NO_PERMISSION = 3, /* don't have permission for that */
	--   GCONF_ERROR_BAD_ADDRESS = 4,   /* Address couldn't be resolved */
	--   GCONF_ERROR_BAD_KEY = 5,       /* directory or key isn't valid (contains bad
	--                                     characters, or malformed slash arrangement) */
	--   GCONF_ERROR_PARSE_ERROR = 6,   /* Syntax error when parsing */
	--   GCONF_ERROR_CORRUPT = 7,       /* Fatal error parsing/loading information inside the backend */
	--   GCONF_ERROR_TYPE_MISMATCH = 8, /* Type requested doesn't match type found */
	--   GCONF_ERROR_IS_DIR = 9,        /* Requested key operation on a dir */
	--   GCONF_ERROR_IS_KEY = 10,       /* Requested dir operation on a key */
	--   GCONF_ERROR_OVERRIDDEN = 11,   /* Read-only source at front of path has set the value */
	--   GCONF_ERROR_OAF_ERROR = 12,    /* liboaf error */
	--   GCONF_ERROR_LOCAL_ENGINE = 13, /* Tried to use remote operations on a local engine */
	--   GCONF_ERROR_LOCK_FAILED = 14,  /* Failed to get a lockfile */
	--   GCONF_ERROR_NO_WRITABLE_DATABASE = 15, /* nowhere to write a value */
	--   GCONF_ERROR_IN_SHUTDOWN = 16   /* server is shutting down */
	-- } GConfError;
	--
	--   The GConfError enumeration allows client applications to differentiate
	--   between different kinds of error. You may wish to take specific actions
	--   depending on the error type.
	--
	--   GCONF_ERROR_SUCCESS              indicates that no error occurred, won't
	--                                    be returned in a GError.
	--   GCONF_ERROR_FAILED               indicates failure, but no more specific
	--                                    GConfError applied.
	--   GCONF_ERROR_NO_SERVER            indicates that the GConf server couldn't
	--                                    be contacted, probably a CORBA problem.
	--   GCONF_ERROR_NO_PERMISSION        indicates that permission to access some
	--                                    resource was denied.
	--   GCONF_ERROR_BAD_ADDRESS          indicates that a configuration source
	--                                    address was syntactically invalid or
	--                                    impossible to resolve.
	--   GCONF_ERROR_BAD_KEY              indicates that a key was malformed.
	--   GCONF_ERROR_PARSE_ERROR          indicates that some parsing was done
	--                                    (perhaps in a backend) and it failed.
	--   GCONF_ERROR_CORRUPT              indicates that some part of the database
	--                                    is corrupt.
	--   GCONF_ERROR_TYPE_MISMATCH        indicates that a specific type was
	--                                    required, and another type was found.
	--   GCONF_ERROR_IS_DIR               indicates that an operation only
	--                                    applicable to keys was performed on a
	--                                    directory.
	--   GCONF_ERROR_IS_KEY               indicates that an operation only
	--                                    applicable to directories was performed
	--                                    on a key.
	--   GCONF_ERROR_OVERRIDDEN           indicates that the administrator has
	--                                    imposed a mandatory value, and it could
	--                                    not be changed.
	--   GCONF_ERROR_OAF_ERROR
	--   GCONF_ERROR_LOCAL_ENGINE
	--   GCONF_ERROR_LOCK_FAILED
	--   GCONF_ERROR_NO_WRITABLE_DATABASE
	--   GCONF_ERROR_IN_SHUTDOWN
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_error_new ()
	--
	-- GError*             gconf_error_new                     (GConfError en,
	--                                                          const gchar *format,
	--                                                          ...);
	--
	--   Creates a new error. Normally the GConf library does this, but you might
	--   find a reason to do it as well. en is the error number, format is a
	--   printf()-style format for the error message, and the variable argument
	--   list is the same as in printf().
	--
	--   en :      the error number.
	--   format :  printf()-style format for error description.
	--   ... :     arguments required by the format.
	--   Returns : newly-allocated GError.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_error_quark ()
	--
	-- GQuark              gconf_error_quark                   (void);
	--
	--   Converts the string 'gconf-error-quark' to a GQuark and returns the value.
	--
	--   Returns : the GQuark representing the string.
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_set_error ()
	--
	-- void                gconf_set_error                     (GError **err,
	--                                                          GConfError en,
	--                                                          const gchar *format,
	--                                                          ...);
	--
	--   Internal function.
	--
	--   err :
	--   en :
	--   format :
	--   ... :
	--
	--   --------------------------------------------------------------------------
	--
	--  gconf_compose_errors ()
	--
	-- GError*             gconf_compose_errors                (GError *err1,
	--                                                          GError *err2);
	--
	--   Internal function.
	--
	--   err1 :
	--   err2 :
	--   Returns :

end -- class GCONF_GCONF_ERROR

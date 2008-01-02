indexing
	description: "GdaReferer, an interface to know when on object is completely defined."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GDA developers
					
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

	wrapped_version: "3.0.1"

deferred class GDA_REFERER
	-- GdaReferer, an interface to know when on object is completely
	-- defined.

	-- Some objects can be initialized in an uncomplete state. This is
	-- the case for example of a primary key database constraint, when
	-- we don't know, at creation time, which field it applies
	-- to. These objects implement this interface to at least signal
	-- when they are ready to be used.

	-- Also some objects need to be created <b>before</b> other objects
	-- they will need to be operational even exist; they implement this
	-- interface.

	-- This interface is particularly important for the GdaQuery and
	-- related objects: the individual components of a query are
	-- completely defined when they reference objects defined in a data
	-- dictionary (a GdaDict object).  When any of the components of a
	-- query relates to an element not defined in a dictionary, the
	-- query can still be used but it's not completely defined.

inherit G_OBJECT undefine copy, is_equal end
	-- TODO: if ever necessary:  GInterface

	--Known Implementations: GdaReferer is implemented by GdaParameter,
	--GdaQueryFieldFunc, GdaQueryJoin, GdaQueryFieldAgg,
	--GdaDictConstraint, GdaQueryFieldValue, GdaQueryCondition,
	--GdaQueryFieldAll, GdaQueryTarget, GdaQuery and
	--GdaQueryFieldField.

feature 
	--
	--
	--Signals
	--
	--
	--   "activated"                                      : Run First
	--   "deactivated"                                    : Run First
	--
	--
	--  gda_referer_activate ()
	--
	-- gboolean            gda_referer_activate                (GdaReferer *iface);
	--
	--   Tries to activate the object, does nothing if the object is already
	--   active.
	--
	--   iface :   an object which implements the GdaReferer interface
	--   Returns : TRUE if the object is active after the call
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_referer_deactivate ()
	--
	-- void                gda_referer_deactivate              (GdaReferer *iface);
	--
	--   Deactivates the object. This is the opposite to function
	--   gda_referer_activate(). If the object is already non active, then nothing
	--   happens.
	--
	--   iface : an object which implements the GdaReferer interface
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_referer_is_active ()
	--
	-- gboolean            gda_referer_is_active               (GdaReferer *iface);
	--
	--   Get the status of an object
	--
	--   iface :   an object which implements the GdaReferer interface
	--   Returns : TRUE if the object is active
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_referer_get_ref_objects ()
	--
	-- GSList*             gda_referer_get_ref_objects         (GdaReferer *iface);
	--
	--   Get the list of objects which are referenced by iface. The returned list
	--   is a new list. If iface is not active, then the returned list is
	--   incomplete.
	--
	--   iface :   an object which implements the GdaReferer interface
	--   Returns : a new list of referenced objects
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_referer_replace_refs ()
	--
	-- void                gda_referer_replace_refs            (GdaReferer *iface,
	--                                                          GHashTable *replacements);
	--
	--   Ask iface to replace references to objects listed as keys in the
	--   replacements hash table with references to objects of the corresponding
	--   value.
	--
	--   It's up to the caller to make sure each pair of (key, value) objects in
	--   replacements are of the same type, and that it makes sense to procede to
	--   the replacement.
	--
	--   The object implementing this interface will accept to do any work only if
	--   it is already active.
	--
	--   iface :        an object which implements the GdaReferer interface
	--   replacements : a GHashTable
	--
	--Signal Details
	--
	--  The "activated" signal
	--
	-- void                user_function                      (GdaReferer *gdareferer,
	--                                                         gpointer    user_data)       : Run First
	--
	--   dbreferer : the object which received the signal.
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "deactivated" signal
	--
	-- void                user_function                      (GdaReferer *gdareferer,
	--                                                         gpointer    user_data)       : Run First
	--
	--   dbreferer : the object which received the signal.
	--   user_data : user data set when the signal handler was connected.
feature {} -- External calls
	--                     GdaReferer;
	-- gboolean            gda_referer_activate                (GdaReferer *iface);
	-- void                gda_referer_deactivate              (GdaReferer *iface);
	-- gboolean            gda_referer_is_active               (GdaReferer *iface);
	-- GSList*             gda_referer_get_ref_objects         (GdaReferer *iface);
	-- void                gda_referer_replace_refs            (GdaReferer *iface,GHashTable *replacements);

end -- class GDA_REFERER

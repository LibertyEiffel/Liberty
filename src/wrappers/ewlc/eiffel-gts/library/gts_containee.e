note
	description: "GTS Containee class."
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, GTS team
					
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

deferred class GTS_CONTAINEE

inherit GTS_OBJECT

-- insert FOO_EXTERNALS

feature {ANY} 

	is_contained (a_container: GTS_CONTAINER): BOOLEAN
		require container_not_void: a_container /= Void
		do
			Result := (gts_containee_is_contained (handle, a_container.handle)).to_boolean
		end

	replace_with (a_replacement: GTS_CONTAINEE)
		require replacemente_not_void: a_replacement /= Void
		do
			gts_containee_replace (handle, a_replacement.handle)
		end

feature {} -- Unwrapped 

-- GTS_CONTAINEE_CLASS()

-- #define GTS_CONTAINEE_CLASS(klass)

-- klass :

-- -----------------------------------------------------------------------------------------------------------

-- GTS_CONTAINEE()

-- #define GTS_CONTAINEE(obj)

-- obj :

-- -----------------------------------------------------------------------------------------------------------

-- GTS_IS_CONTAINEE()

-- #define GTS_IS_CONTAINEE(obj)

-- obj :

-- -----------------------------------------------------------------------------------------------------------

-- GtsContaineeClass

-- typedef struct {
-- GtsObjectClass parent_class;

-- void (* add_container) (GtsContainee *, GtsContainer *);
-- void (* remove_container) (GtsContainee *, GtsContainer *);
-- void (* foreach) (GtsContainee *, GtsFunc, gpointer);
-- gboolean (* is_contained) (GtsContainee *, GtsContainer *);
-- void (* replace) (GtsContainee *, GtsContainee *);
-- } GtsContaineeClass;

-- -----------------------------------------------------------------------------------------------------------

-- GtsContainee

-- typedef struct {
-- GtsObject object;
-- } GtsContainee;

-- The containee object.

-- GtsObject object; The parent object.

-- -----------------------------------------------------------------------------------------------------------

-- gts_containee_class ()

-- GtsContaineeClass* gts_containee_class (void);

-- Returns :

-- -----------------------------------------------------------------------------------------------------------

-- gts_containee_new ()

-- GtsContainee* gts_containee_new (GtsContaineeClass *klass);

-- klass :
-- Returns :


--   GTS_SLIST_CONTAINEE_CLASS()

--  #define     GTS_SLIST_CONTAINEE_CLASS(klass)

--     klass :

--    -----------------------------------------------------------------------------------------------------------

--   GTS_SLIST_CONTAINEE()

--  #define     GTS_SLIST_CONTAINEE(obj)

--     obj :

--    -----------------------------------------------------------------------------------------------------------

--   GTS_IS_SLIST_CONTAINEE()

--  #define     GTS_IS_SLIST_CONTAINEE(obj)

--     obj :

--    -----------------------------------------------------------------------------------------------------------

--   GtsSListContaineeClass

--  typedef struct {
--    GtsContaineeClass parent_class;
--  } GtsSListContaineeClass;

--    -----------------------------------------------------------------------------------------------------------

--   GtsSListContainee

--  typedef struct {
--    GtsContainee containee;

--    GSList * containers;
--  } GtsSListContainee;

--    The singly-linked list containee object.

--     GtsContainee containee;  The parent object.
--     GSList *containers;      A list of GtsContainer containing this object.

--    -----------------------------------------------------------------------------------------------------------

--   gts_slist_containee_class ()

--  GtsSListContaineeClass* gts_slist_containee_class
--                                              (void);
feature {} -- External calls
--  #define     GTS_CONTAINEE_CLASS             (klass)
--  #define     GTS_CONTAINEE                   (obj)
--  #define     GTS_IS_CONTAINEE                (obj)

	gts_containee_class: POINTER
			--  GtsContaineeClass* gts_containee_class      (void);
		external "C use <gts.h>"
		end

	gts_containee_new (klass: POINTER): POINTER
			-- GtsContainee* gts_containee_new (GtsContaineeClass *klass);
		external "C use <gts.h>"
		end

	gts_containee_is_contained (an_item, a_container: POINTER): INTEGER
			-- gboolean gts_containee_is_contained (GtsContainee *item, GtsContainer *c);
		external "C use <gts.h>"
		end

	gts_containee_replace (an_item, a_with: POINTER)
			-- void gts_containee_replace (GtsContainee *item, GtsContainee *with);
		external "C use <gts.h>"
		end

 
-- #define GTS_SLIST_CONTAINEE_CLASS (klass)
-- #define GTS_SLIST_CONTAINEE (obj)
-- #define GTS_IS_SLIST_CONTAINEE (obj)
 
	gts_slist_containee_class: POINTER
			-- GtsSListContaineeClass* gts_slist_containee_class;
		external "C use <gts.h>"
		end

end -- class GTS_CONTAINEE

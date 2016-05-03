note
	description: "Container classes."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

			--  GNU Triangulated Surface Library
deferred class GTS_CONTAINER

inherit GTS_OBJECT

feature {} -- Creation


	--   GTS_CONTAINER_CLASS()

--  #define     GTS_CONTAINER_CLASS(klass)

--     klass :

--    -----------------------------------------------------------------------------------------------------------

--   GTS_CONTAINER()

--  #define     GTS_CONTAINER(obj)

--     obj :

--    -----------------------------------------------------------------------------------------------------------

--   GTS_IS_CONTAINER()

--  #define     GTS_IS_CONTAINER(obj)

--     obj :

--    -----------------------------------------------------------------------------------------------------------

--   GtsContainerClass

--  typedef struct {
--    GtsSListContaineeClass parent_class;

--    void  (* add)     (GtsContainer *, GtsContainee *);
--    void  (* remove)  (GtsContainer *, GtsContainee *);
--    void  (* foreach) (GtsContainer *, GtsFunc, gpointer);
--    guint (* size)    (GtsContainer *);
--  } GtsContainerClass;

--    -----------------------------------------------------------------------------------------------------------

--   GtsContainer

--  typedef struct {
--    GtsSListContainee object;
--  } GtsContainer;

--    The container object.

--     GtsSListContainee object;  The parent object.

--    -----------------------------------------------------------------------------------------------------------

--   gts_container_class ()

--  GtsContainerClass* gts_container_class      (void);

--     Returns :

--    -----------------------------------------------------------------------------------------------------------

--   gts_container_new ()

--  GtsContainer* gts_container_new             (GtsContainerClass *klass);

--     klass :
--     Returns :

feature {ANY}
	add (an_item: GTS_CONTAINEE) is
		require item_not_void: an_item /= Void
		do
			gts_container_add (handle, an_item.handle)
		end

	remove  (an_item: GTS_CONTAINEE) is
		require item_not_void: an_item /= Void
		do
			gts_container_remove (handle, an_item.handle)
		end

	count: INTEGER is
		-- Number of elementes in the container. Note: in the original GTS 
		-- terminology this would be called `size'.
		obsolete "Should be NATURAL"
		do
			Result := gts_container_size(handle)
		ensure positive: Result >= 0 
		end

	-- TODO: foreach ()
	
	--  void gts_container_foreach (GtsContainer *c, GtsFunc func, -- gpointer
	--  data);

	--   GTS_HASH_CONTAINER_CLASS()
	
	--  #define     GTS_HASH_CONTAINER_CLASS(klass)
	
	--     klass :
	
	--   GTS_HASH_CONTAINER()

--  #define     GTS_HASH_CONTAINER(obj)

--     obj :

--    -----------------------------------------------------------------------------------------------------------

--   GTS_IS_HASH_CONTAINER()

--  #define     GTS_IS_HASH_CONTAINER(obj)

--     obj :

--    -----------------------------------------------------------------------------------------------------------

--   GtsHashContainerClass

--  typedef struct {
--    GtsContainerClass parent_class;
--  } GtsHashContainerClass;

--    -----------------------------------------------------------------------------------------------------------

--   GtsHashContainer

--  typedef struct {
--    GtsContainer c;

--    GHashTable * items;
--    gboolean frozen;
--  } GtsHashContainer;

--    -----------------------------------------------------------------------------------------------------------

--   gts_hash_container_class ()

--  GtsHashContainerClass* gts_hash_container_class
--                                              (void);

--     Returns :

--    -----------------------------------------------------------------------------------------------------------

--   GTS_SLIST_CONTAINER_CLASS()

--  #define     GTS_SLIST_CONTAINER_CLASS(klass)

--     klass :

--    -----------------------------------------------------------------------------------------------------------

--   GTS_SLIST_CONTAINER()

--  #define     GTS_SLIST_CONTAINER(obj)

--     obj :

--    -----------------------------------------------------------------------------------------------------------

--   GTS_IS_SLIST_CONTAINER()

--  #define     GTS_IS_SLIST_CONTAINER(obj)

--     obj :

--    -----------------------------------------------------------------------------------------------------------

--   GtsSListContainerClass

--  typedef struct {
--    GtsContainerClass parent_class;
--  } GtsSListContainerClass;

--    -----------------------------------------------------------------------------------------------------------

--   GtsSListContainer

--  typedef struct {
--    GtsContainer c;

--    GSList * items;
--    gboolean frozen;
--  } GtsSListContainer;

--    -----------------------------------------------------------------------------------------------------------

--   gts_slist_container_class ()

--  GtsSListContainerClass* gts_slist_container_class
--                                              (void);

--     Returns :
feature {} -- External calls
	-- #define     GTS_CONTAINER_CLASS             (klass)
	-- #define     GTS_CONTAINER                   (obj)
	-- #define     GTS_IS_CONTAINER                (obj)
	
	gts_container_class: POINTER is
			-- 	GtsContainerClass* gts_container_class (void);
		external "C use <gts.h>"
		end

	gts_container_new (klass: POINTER): POINTER is
			-- 	GtsContainer* gts_container_new (GtsContainerClass *klass);
		external "C use <gts.h>"
		end

	gts_container_add (a_container, an_item: POINTER) is
			-- 	void gts_container_add (GtsContainer *c, GtsContainee *item);
		external "C use <gts.h>"
		end
	
	gts_container_remove (a_container, an_item: POINTER) is
			-- 	void gts_container_remove (GtsContainer *c, GtsContainee *item);
		external "C use <gts.h>"
		end
	
	 gts_container_size (a_container: POINTER): INTEGER is
			-- 	guint gts_container_size (GtsContainer *c);
		external "C use <gts.h>"
		ensure natural: Result >= 0
		end

	gts_container_foreach (a_container, a_function, some_data: POINTER) is
			--  void gts_container_foreach (GtsContainer *c, GtsFunc func, gpointer data);
		external "C use <gts.h>"
		end
	
	-- #define GTS_HASH_CONTAINER_CLASS (klass)
	-- #define GTS_HASH_CONTAINER (obj)
	-- #define GTS_IS_HASH_CONTAINER (obj)
	
	gts_hash_container_class: POINTER is
			--  GtsHashContainerClass* gts_hash_container_class (void);
		external "C use <gts.h>"
		end
	

	--  #define GTS_SLIST_CONTAINER_CLASS (klass)
	--  #define GTS_SLIST_CONTAINER (obj)
	--  #define GTS_IS_SLIST_CONTAINER (obj)

	gts_slist_container_class: POINTER is
			--  GtsSListContainerClass* gts_slist_container_class (void);
		external "C use <gts.h>"
		end


end -- class GTS_CONTAINER

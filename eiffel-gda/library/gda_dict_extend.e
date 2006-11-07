indexing
	description: "GdaDictExtend Makes GdaDict manage other types of objects."
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

					-- Description: As provided by libgda, the GdaDict
					-- object manages objects related to a database
					-- structure (a GdaDictDatabase object) and its
					-- environment (data types, functions, etc). However it
					-- might be convenient to make the GdaDict object
					-- handle arbitrary lists of objects of the same type
					-- (provided objects inherit GdaObject).

					-- To "register" a new type of object to a dictionary,
					-- all one has to do is create a GdaDictRegisterStruct
					-- structure, and call the
					-- gda_dict_register_object_type() function. It is also
					-- possible to make that registration automatic for any
					-- new GdaDict object using the
					-- gda_dict_class_always_register() function.
					
obsolete class GDA_DICT_EXTEND

inherit GDA_OBJECT

insert GDA_DICT_EXTEND_EXTERNALS

creation make, from_external_pointer

feature {} -- Creation
--              GdaDictRegisterStruct;
--  void        (*GdaDictRegFreeFunc)           (GdaDict *,
--                                               GdaDictRegisterStruct *);
--  gboolean    (*GdaDictRegSyncFunc)           (GdaDict *,
--                                               const gchar *limit_object_name,
--                                               GError **);
--  GSList*     (*GdaDictRegGetListFunc)        (GdaDict *);
--  gboolean    (*GdaDictRegSaveFunc)           (GdaDict *,
--                                               xmlNodePtr ,
--                                               GError **);
--  gboolean    (*GdaDictRegLoadFunc)           (GdaDict *,
--                                               xmlNodePtr ,
--                                               GError **);
--  GdaObject*  (*GdaDictGetObjFunc)            (GdaDict *,
--                                               const gchar *);
--  void        gda_dict_class_always_register  (GdaDictRegFunc );
--  void        gda_dict_register_object_type   (GdaDict *dict,
--                                               GdaDictRegisterStruct *reg);
--  GdaDictRegisterStruct* gda_dict_get_object_type_registration
--                                              (GdaDict *dict,
--                                               GType type);


--   GdaDictRegisterStruct

--  typedef struct {
--          /* general information */
--          GType                  type; /* type of object, always valid */
--          gboolean               sort; /* TRUE if lists of objects are sorted by object name */
--          GdaDictRegFreeFunc     free; /* to free @GdaDictRegisterStruct or NULL if just g_free() */

--          /* lists of objects */
--          GSList                *all_objects;
--          GSList                *assumed_objects;

--          /* operations on lists */
--          gchar                 *dbms_sync_key;
--          gchar                 *dbms_sync_descr;
--          GdaDictRegSyncFunc     dbms_sync; /* DBMS sync, or NULL if no sync possible */
--          GdaDictRegGetListFunc  get_objects; /* get the list of objects, or NULL if generic method */
--          GdaDictGetObjFunc      get_by_name; /* get a specific object, or NULL if generic method */

--          /* XML related */
--          const gchar           *xml_group_tag; /* tag for the group of objects in XML file, or NULL if no storage */
--          GdaDictRegSaveFunc     load_xml_tree; /* loading from XML file, or NULL if no loading */
--          GdaDictRegLoadFunc     save_xml_tree; /* saving to XML file, or NULL if no saving*/
--  } GdaDictRegisterStruct;

--    GType type;                        the GType type of object to register
--    gboolean sort;                     TRUE if sorting based on the name of the object (as provided by
--                                       gda_object_get_name()) must be applied when storing objects in the assumed_objects
--                                       list
--    GdaDictRegFreeFunc free;           a function to call when the structure is destroyed, if NULL, then g_free() is used
--    GSList *all_objects;               a list of all the objects of this type which have been declared and which are
--                                       assumed (read only)
--    GSList *assumed_objects;           a list of all the objects of this type which are assumed by the dictionary (read
--                                       only)
--    gchar *dbms_sync_key;
--    gchar *dbms_sync_descr;
--    GdaDictRegSyncFunc dbms_sync;      a function which is called when updating the lists of objects with the database, or
--                                       NULL if no update is possible
--    GdaDictRegGetListFunc get_objects; a function to get the list of objects, used by gda_dict_get_objects(), or NULL to
--                                       use default implementation
--    GdaDictGetObjFunc get_by_name;     a function to get an object from its name, used by gda_dict_get_object_by_name(), or
--                                       NULL to use default implementation
--    const gchar *xml_group_tag;        the name of the tag belog which are listed all the objects when saving or loading in
--                                       an XML file
--    GdaDictRegSaveFunc load_xml_tree;  the function used to save in an XML tree, or NULL if saving not supported
--    GdaDictRegLoadFunc save_xml_tree;  the function used to load from an XML tree, or NULL if loading not supported

--    -----------------------------------------------------------------------------------------------------------------------

--   GdaDictRegFreeFunc ()

--  void        (*GdaDictRegFreeFunc)           (GdaDict *,
--                                               GdaDictRegisterStruct *);

--    Param1 :
--    Param2 :

--    -----------------------------------------------------------------------------------------------------------------------

--   GdaDictRegSyncFunc ()

--  gboolean    (*GdaDictRegSyncFunc)           (GdaDict *,
--                                               const gchar *limit_object_name,
--                                               GError **);

--    Param1 :
--    limit_object_name :
--    Param3 :
--    Returns :

--    -----------------------------------------------------------------------------------------------------------------------

--   GdaDictRegGetListFunc ()

--  GSList*     (*GdaDictRegGetListFunc)        (GdaDict *);

--    Param1 :
--    Returns :

--    -----------------------------------------------------------------------------------------------------------------------

--   GdaDictRegSaveFunc ()

--  gboolean    (*GdaDictRegSaveFunc)           (GdaDict *,
--                                               xmlNodePtr ,
--                                               GError **);

--    Param1 :
--    Param2 :
--    Param3 :
--    Returns :

--    -----------------------------------------------------------------------------------------------------------------------

--   GdaDictRegLoadFunc ()

--  gboolean    (*GdaDictRegLoadFunc)           (GdaDict *,
--                                               xmlNodePtr ,
--                                               GError **);

--    Param1 :
--    Param2 :
--    Param3 :
--    Returns :

--    -----------------------------------------------------------------------------------------------------------------------

--   GdaDictGetObjFunc ()

--  GdaObject*  (*GdaDictGetObjFunc)            (GdaDict *,
--                                               const gchar *);

--    Param1 :
--    Param2 :
--    Returns :

--    -----------------------------------------------------------------------------------------------------------------------

--   gda_dict_class_always_register ()

--  void        gda_dict_class_always_register  (GdaDictRegFunc );

--    Make sure all new GdaDict object will use func to register a type of object

--    Param1 :

--    -----------------------------------------------------------------------------------------------------------------------

--   gda_dict_register_object_type ()

--  void        gda_dict_register_object_type   (GdaDict *dict,
--                                               GdaDictRegisterStruct *reg);

--    Make dict manage objects of type reg->type.

--    dict : a GdaDict object
--    reg :  a GdaDictRegisterStruct structure

--    -----------------------------------------------------------------------------------------------------------------------

--   gda_dict_get_object_type_registration ()

--  GdaDictRegisterStruct* gda_dict_get_object_type_registration
--                                              (GdaDict *dict,
--                                               GType type);

--    Get a pointer to the GdaDictRegisterStruct structure for the type type of objects.

--    dict :    a GdaDict object
--    type :    e Gtype
--    Returns : the GdaDictRegisterStruct pointer, or NULL if type is not registered

end -- class GDA_DICT_EXTEND

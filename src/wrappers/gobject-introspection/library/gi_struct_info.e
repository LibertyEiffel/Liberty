   Link: GObject Introspection Reference Manual (start)
   Link: GIRepository structs (parent)
   Link: GITypeInfo (previous)
   Link: GIUnionInfo (next)

   Prev Up Home                                GObject Introspection Reference Manual                                 Next
   Top  |  Description

   GIStructInfo

   GIStructInfo — Struct representing a C structure

Synopsis

 #define             GI_IS_STRUCT_INFO                   (info)
 typedef             GIStructInfo;
 gint                g_struct_info_get_n_fields          (GIStructInfo *info);
 GIFieldInfo *       g_struct_info_get_field             (GIStructInfo *info,
                                                          gint n);
 gint                g_struct_info_get_n_methods         (GIStructInfo *info);
 GIFunctionInfo *    g_struct_info_get_method            (GIStructInfo *info,
                                                          gint n);
 GIFunctionInfo *    g_struct_info_find_method           (GIStructInfo *info,
                                                          const gchar *name);
 gsize               g_struct_info_get_size              (GIStructInfo *info);
 gsize               g_struct_info_get_alignment         (GIStructInfo *info);
 gboolean            g_struct_info_is_gtype_struct       (GIStructInfo *info);
 gboolean            g_struct_info_is_foreign            (GIStructInfo *info);

Description

   GIStructInfo represents a generic C structure type.

   A structure has methods and fields.

Struct hierarchy

   GIBaseInfo
    +----GIRegisteredTypeInfo
          +----GIStructInfo

Details

  GI_IS_STRUCT_INFO()

 #define             GI_IS_STRUCT_INFO(info)

   -----------------------------------------------------------------------------------------------------------------------

  GIStructInfo

 typedef GIBaseInfo GIStructInfo;

   Represents a struct.

   -----------------------------------------------------------------------------------------------------------------------

  g_struct_info_get_n_fields ()

 gint                g_struct_info_get_n_fields          (GIStructInfo *info);

   Obtain the number of fields this structure has.

   info :    a GIStructInfo
   Returns : number of fields

   -----------------------------------------------------------------------------------------------------------------------

  g_struct_info_get_field ()

 GIFieldInfo *       g_struct_info_get_field             (GIStructInfo *info,
                                                          gint n);

   Obtain the type information for field with specified index.

   info :    a GIStructInfo
   n :       a field index
   Returns : the GIFieldInfo, free it with g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_struct_info_get_n_methods ()

 gint                g_struct_info_get_n_methods         (GIStructInfo *info);

   Obtain the number of methods this structure has.

   info :    a GIStructInfo
   Returns : number of methods

   -----------------------------------------------------------------------------------------------------------------------

  g_struct_info_get_method ()

 GIFunctionInfo *    g_struct_info_get_method            (GIStructInfo *info,
                                                          gint n);

   Obtain the type information for method with specified index.

   info :    a GIStructInfo
   n :       a method index
   Returns : the GIFunctionInfo, free it with g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_struct_info_find_method ()

 GIFunctionInfo *    g_struct_info_find_method           (GIStructInfo *info,
                                                          const gchar *name);

   Obtain the type information for method named name.

   info :    a GIStructInfo
   name :    a method name
   Returns : the GIFunctionInfo, free it with g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_struct_info_get_size ()

 gsize               g_struct_info_get_size              (GIStructInfo *info);

   Obtain the total size of the structure.

   info :    a GIStructInfo
   Returns : size of the structure in bytes

   -----------------------------------------------------------------------------------------------------------------------

  g_struct_info_get_alignment ()

 gsize               g_struct_info_get_alignment         (GIStructInfo *info);

   Obtain the required alignment of the structure.

   info :    a GIStructInfo
   Returns : required alignment in bytes

   -----------------------------------------------------------------------------------------------------------------------

  g_struct_info_is_gtype_struct ()

 gboolean            g_struct_info_is_gtype_struct       (GIStructInfo *info);

   Return true if this structure represents the "class structure" for some GObject or GInterface. This function is mainly
   useful to hide this kind of structure from generated public APIs.

   info :    a GIStructInfo
   Returns : TRUE if this is a class struct, FALSE otherwise

   -----------------------------------------------------------------------------------------------------------------------

  g_struct_info_is_foreign ()

 gboolean            g_struct_info_is_foreign            (GIStructInfo *info);

   -----------------------------------------------------------------------------------------------------------------------

                                                Generated by GTK-Doc V1.18.1

References

   Visible links
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/index.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-repository-structs.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GITypeInfo.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GITypeInfo.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-repository-structs.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/index.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#gi-GIStructInfo.synopsis
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#gi-GIStructInfo.description
   . GI_IS_STRUCT_INFO()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GI-IS-STRUCT-INFO:CAPS
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . g_struct_info_get_n_fields ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#g-struct-info-get-n-fields
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIFieldInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFieldInfo.html#GIFieldInfo
   . g_struct_info_get_field ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#g-struct-info-get-field
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . g_struct_info_get_n_methods ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#g-struct-info-get-n-methods
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIFunctionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFunctionInfo.html#GIFunctionInfo
   . g_struct_info_get_method ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#g-struct-info-get-method
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIFunctionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFunctionInfo.html#GIFunctionInfo
   . g_struct_info_find_method ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#g-struct-info-find-method
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . g_struct_info_get_size ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#g-struct-info-get-size
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . g_struct_info_get_alignment ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#g-struct-info-get-alignment
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . g_struct_info_is_gtype_struct ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#g-struct-info-is-gtype-struct
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . g_struct_info_is_foreign ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#g-struct-info-is-foreign
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIBaseInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIBaseInfo.html
   . GIRegisteredTypeInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIRegisteredTypeInfo.html
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIFieldInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFieldInfo.html#GIFieldInfo
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIFieldInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFieldInfo.html#GIFieldInfo
   . g_base_info_unref ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIBaseInfo.html#g-base-info-unref
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIFunctionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFunctionInfo.html#GIFunctionInfo
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIFunctionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFunctionInfo.html#GIFunctionInfo
   . g_base_info_unref ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIBaseInfo.html#g-base-info-unref
   . GIFunctionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFunctionInfo.html#GIFunctionInfo
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIFunctionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFunctionInfo.html#GIFunctionInfo
   . g_base_info_unref ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIBaseInfo.html#g-base-info-unref
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo
   . GIStructInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html#GIStructInfo

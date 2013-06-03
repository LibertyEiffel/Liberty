   Link: GObject Introspection Reference Manual (start)
   Link: GIRepository structs (parent)
   Link: GIStructInfo (previous)
   Link: GIFieldInfo (next)

   Prev Up Home                                GObject Introspection Reference Manual                                 Next
   Top  |  Description

   GIUnionInfo

   GIUnionInfo — Struct representing a union.

Synopsis

 #define             GI_IS_UNION_INFO                    (info)
 typedef             GIUnionInfo;
 gint                g_union_info_get_n_fields           (GIUnionInfo *info);
 GIFieldInfo *       g_union_info_get_field              (GIUnionInfo *info,
                                                          gint n);
 gint                g_union_info_get_n_methods          (GIUnionInfo *info);
 GIFunctionInfo *    g_union_info_get_method             (GIUnionInfo *info,
                                                          gint n);
 gboolean            g_union_info_is_discriminated       (GIUnionInfo *info);
 gint                g_union_info_get_discriminator_offset
                                                         (GIUnionInfo *info);
 GITypeInfo *        g_union_info_get_discriminator_type (GIUnionInfo *info);
 GIConstantInfo *    g_union_info_get_discriminator      (GIUnionInfo *info,
                                                          gint n);
 GIFunctionInfo *    g_union_info_find_method            (GIUnionInfo *info,
                                                          const gchar *name);
 gsize               g_union_info_get_size               (GIUnionInfo *info);
 gsize               g_union_info_get_alignment          (GIUnionInfo *info);

Description

   GIUnionInfo represents a union type.

   A union has methods and fields. Unions can optionally have a discriminator, which is a field deciding what type of real
   union fields is valid for specified instance.

Struct hierarchy

   GIBaseInfo
    +----GIRegisteredTypeInfo
          +----GIUnionInfo

Details

  GI_IS_UNION_INFO()

 #define             GI_IS_UNION_INFO(info)

   -----------------------------------------------------------------------------------------------------------------------

  GIUnionInfo

 typedef GIBaseInfo GIUnionInfo;

   Represents a union.

   -----------------------------------------------------------------------------------------------------------------------

  g_union_info_get_n_fields ()

 gint                g_union_info_get_n_fields           (GIUnionInfo *info);

   Obtain the number of fields this union has.

   info :    a GIUnionInfo
   Returns : number of fields

   -----------------------------------------------------------------------------------------------------------------------

  g_union_info_get_field ()

 GIFieldInfo *       g_union_info_get_field              (GIUnionInfo *info,
                                                          gint n);

   Obtain the type information for field with specified index.

   info :    a GIUnionInfo
   n :       a field index
   Returns : the GIFieldInfo, free it with g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_union_info_get_n_methods ()

 gint                g_union_info_get_n_methods          (GIUnionInfo *info);

   Obtain the number of methods this union has.

   info :    a GIUnionInfo
   Returns : number of methods

   -----------------------------------------------------------------------------------------------------------------------

  g_union_info_get_method ()

 GIFunctionInfo *    g_union_info_get_method             (GIUnionInfo *info,
                                                          gint n);

   Obtain the type information for method with specified index.

   info :    a GIUnionInfo
   n :       a method index
   Returns : the GIFunctionInfo, free it with g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_union_info_is_discriminated ()

 gboolean            g_union_info_is_discriminated       (GIUnionInfo *info);

   Return true if this union contains discriminator field.

   info :    a GIUnionInfo
   Returns : TRUE if this is a discriminated union, FALSE otherwise

   -----------------------------------------------------------------------------------------------------------------------

  g_union_info_get_discriminator_offset ()

 gint                g_union_info_get_discriminator_offset
                                                         (GIUnionInfo *info);

   -----------------------------------------------------------------------------------------------------------------------

  g_union_info_get_discriminator_type ()

 GITypeInfo *        g_union_info_get_discriminator_type (GIUnionInfo *info);

   Obtain the type information of the union discriminator.

   info :    a GIUnionInfo
   Returns : the GITypeInfo, free it with g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_union_info_get_discriminator ()

 GIConstantInfo *    g_union_info_get_discriminator      (GIUnionInfo *info,
                                                          gint n);

   Obtain discriminator value assigned for n-th union field, i.e. n-th union field is the active one if discriminator
   contains this constant.

   info :    a GIUnionInfo
   n :       a union field index
   Returns : the GIConstantInfo, free it with g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_union_info_find_method ()

 GIFunctionInfo *    g_union_info_find_method            (GIUnionInfo *info,
                                                          const gchar *name);

   Obtain the type information for method named name.

   info :    a GIUnionInfo
   name :    a method name
   Returns : the GIFunctionInfo, free it with g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_union_info_get_size ()

 gsize               g_union_info_get_size               (GIUnionInfo *info);

   Obtain the total size of the union.

   info :    a GIUnionInfo
   Returns : size of the union in bytes

   -----------------------------------------------------------------------------------------------------------------------

  g_union_info_get_alignment ()

 gsize               g_union_info_get_alignment          (GIUnionInfo *info);

   Obtain the required alignment of the union.

   info :    a GIUnionInfo
   Returns : required alignment in bytes

   -----------------------------------------------------------------------------------------------------------------------

                                                Generated by GTK-Doc V1.18.1

References

   Visible links
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/index.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-repository-structs.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFieldInfo.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIStructInfo.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-repository-structs.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/index.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFieldInfo.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#gi-GIUnionInfo.synopsis
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#gi-GIUnionInfo.description
   . GI_IS_UNION_INFO()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GI-IS-UNION-INFO:CAPS
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . g_union_info_get_n_fields ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#g-union-info-get-n-fields
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIFieldInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFieldInfo.html#GIFieldInfo
   . g_union_info_get_field ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#g-union-info-get-field
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . g_union_info_get_n_methods ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#g-union-info-get-n-methods
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIFunctionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFunctionInfo.html#GIFunctionInfo
   . g_union_info_get_method ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#g-union-info-get-method
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . g_union_info_is_discriminated ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#g-union-info-is-discriminated
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . g_union_info_get_discriminator_offset ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#g-union-info-get-discriminator-offset
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GITypeInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GITypeInfo.html#GITypeInfo
   . g_union_info_get_discriminator_type ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#g-union-info-get-discriminator-type
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIConstantInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIConstantInfo.html#GIConstantInfo
   . g_union_info_get_discriminator ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#g-union-info-get-discriminator
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIFunctionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFunctionInfo.html#GIFunctionInfo
   . g_union_info_find_method ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#g-union-info-find-method
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . g_union_info_get_size ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#g-union-info-get-size
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . g_union_info_get_alignment ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#g-union-info-get-alignment
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIBaseInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIBaseInfo.html
   . GIRegisteredTypeInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIRegisteredTypeInfo.html
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIFieldInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFieldInfo.html#GIFieldInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIFieldInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFieldInfo.html#GIFieldInfo
   . g_base_info_unref ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIBaseInfo.html#g-base-info-unref
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIFunctionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFunctionInfo.html#GIFunctionInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIFunctionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFunctionInfo.html#GIFunctionInfo
   . g_base_info_unref ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIBaseInfo.html#g-base-info-unref
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GITypeInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GITypeInfo.html#GITypeInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GITypeInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GITypeInfo.html#GITypeInfo
   . g_base_info_unref ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIBaseInfo.html#g-base-info-unref
   . GIConstantInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIConstantInfo.html#GIConstantInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIConstantInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIConstantInfo.html#GIConstantInfo
   . g_base_info_unref ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIBaseInfo.html#g-base-info-unref
   . GIFunctionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFunctionInfo.html#GIFunctionInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIFunctionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFunctionInfo.html#GIFunctionInfo
   . g_base_info_unref ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIBaseInfo.html#g-base-info-unref
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo
   . GIUnionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIUnionInfo.html#GIUnionInfo

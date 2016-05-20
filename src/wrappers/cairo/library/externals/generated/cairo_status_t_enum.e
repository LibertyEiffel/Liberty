-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_STATUS_T_ENUM

-- Wrapper of enum _cairo_status defined in file /usr/include/cairo/cairo.h line 310
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = clip_not_representable_low_level)  or else
				(a_value = device_error_low_level)  or else
				(a_value = device_finished_low_level)  or else
				(a_value = device_type_mismatch_low_level)  or else
				(a_value = file_not_found_low_level)  or else
				(a_value = font_type_mismatch_low_level)  or else
				(a_value = invalid_clusters_low_level)  or else
				(a_value = invalid_content_low_level)  or else
				(a_value = invalid_dash_low_level)  or else
				(a_value = invalid_dsc_comment_low_level)  or else
				(a_value = invalid_format_low_level)  or else
				(a_value = invalid_index_low_level)  or else
				(a_value = invalid_matrix_low_level)  or else
				(a_value = invalid_mesh_construction_low_level)  or else
				(a_value = invalid_path_data_low_level)  or else
				(a_value = invalid_pop_group_low_level)  or else
				(a_value = invalid_restore_low_level)  or else
				(a_value = invalid_size_low_level)  or else
				(a_value = invalid_slant_low_level)  or else
				(a_value = invalid_status_low_level)  or else
				(a_value = invalid_stride_low_level)  or else
				(a_value = invalid_string_low_level)  or else
				(a_value = invalid_visual_low_level)  or else
				(a_value = invalid_weight_low_level)  or else
				(a_value = jbig2_global_missing_low_level)  or else
				(a_value = last_status_low_level)  or else
				(a_value = negative_count_low_level)  or else
				(a_value = no_current_point_low_level)  or else
				(a_value = no_memory_low_level)  or else
				(a_value = null_pointer_low_level)  or else
				(a_value = pattern_type_mismatch_low_level)  or else
				(a_value = read_error_low_level)  or else
				(a_value = success_low_level)  or else
				(a_value = surface_finished_low_level)  or else
				(a_value = surface_type_mismatch_low_level)  or else
				(a_value = temp_file_error_low_level)  or else
				(a_value = user_font_error_low_level)  or else
				(a_value = user_font_immutable_low_level)  or else
				(a_value = user_font_not_implemented_low_level)  or else
				(a_value = write_error_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_clip_not_representable
               do
                       value := clip_not_representable_low_level
               end

	set_device_error
               do
                       value := device_error_low_level
               end

	set_device_finished
               do
                       value := device_finished_low_level
               end

	set_device_type_mismatch
               do
                       value := device_type_mismatch_low_level
               end

	set_file_not_found
               do
                       value := file_not_found_low_level
               end

	set_font_type_mismatch
               do
                       value := font_type_mismatch_low_level
               end

	set_invalid_clusters
               do
                       value := invalid_clusters_low_level
               end

	set_invalid_content
               do
                       value := invalid_content_low_level
               end

	set_invalid_dash
               do
                       value := invalid_dash_low_level
               end

	set_invalid_dsc_comment
               do
                       value := invalid_dsc_comment_low_level
               end

	set_invalid_format
               do
                       value := invalid_format_low_level
               end

	set_invalid_index
               do
                       value := invalid_index_low_level
               end

	set_invalid_matrix
               do
                       value := invalid_matrix_low_level
               end

	set_invalid_mesh_construction
               do
                       value := invalid_mesh_construction_low_level
               end

	set_invalid_path_data
               do
                       value := invalid_path_data_low_level
               end

	set_invalid_pop_group
               do
                       value := invalid_pop_group_low_level
               end

	set_invalid_restore
               do
                       value := invalid_restore_low_level
               end

	set_invalid_size
               do
                       value := invalid_size_low_level
               end

	set_invalid_slant
               do
                       value := invalid_slant_low_level
               end

	set_invalid_status
               do
                       value := invalid_status_low_level
               end

	set_invalid_stride
               do
                       value := invalid_stride_low_level
               end

	set_invalid_string
               do
                       value := invalid_string_low_level
               end

	set_invalid_visual
               do
                       value := invalid_visual_low_level
               end

	set_invalid_weight
               do
                       value := invalid_weight_low_level
               end

	set_jbig2_global_missing
               do
                       value := jbig2_global_missing_low_level
               end

	set_last_status
               do
                       value := last_status_low_level
               end

	set_negative_count
               do
                       value := negative_count_low_level
               end

	set_no_current_point
               do
                       value := no_current_point_low_level
               end

	set_no_memory
               do
                       value := no_memory_low_level
               end

	set_null_pointer
               do
                       value := null_pointer_low_level
               end

	set_pattern_type_mismatch
               do
                       value := pattern_type_mismatch_low_level
               end

	set_read_error
               do
                       value := read_error_low_level
               end

	set_success
               do
                       value := success_low_level
               end

	set_surface_finished
               do
                       value := surface_finished_low_level
               end

	set_surface_type_mismatch
               do
                       value := surface_type_mismatch_low_level
               end

	set_temp_file_error
               do
                       value := temp_file_error_low_level
               end

	set_user_font_error
               do
                       value := user_font_error_low_level
               end

	set_user_font_immutable
               do
                       value := user_font_immutable_low_level
               end

	set_user_font_not_implemented
               do
                       value := user_font_not_implemented_low_level
               end

	set_write_error
               do
                       value := write_error_low_level
               end

feature {ANY} -- Queries
       is_clip_not_representable: BOOLEAN
               do
                       Result := (value=clip_not_representable_low_level)
               end

       is_device_error: BOOLEAN
               do
                       Result := (value=device_error_low_level)
               end

       is_device_finished: BOOLEAN
               do
                       Result := (value=device_finished_low_level)
               end

       is_device_type_mismatch: BOOLEAN
               do
                       Result := (value=device_type_mismatch_low_level)
               end

       is_file_not_found: BOOLEAN
               do
                       Result := (value=file_not_found_low_level)
               end

       is_font_type_mismatch: BOOLEAN
               do
                       Result := (value=font_type_mismatch_low_level)
               end

       is_invalid_clusters: BOOLEAN
               do
                       Result := (value=invalid_clusters_low_level)
               end

       is_invalid_content: BOOLEAN
               do
                       Result := (value=invalid_content_low_level)
               end

       is_invalid_dash: BOOLEAN
               do
                       Result := (value=invalid_dash_low_level)
               end

       is_invalid_dsc_comment: BOOLEAN
               do
                       Result := (value=invalid_dsc_comment_low_level)
               end

       is_invalid_format: BOOLEAN
               do
                       Result := (value=invalid_format_low_level)
               end

       is_invalid_index: BOOLEAN
               do
                       Result := (value=invalid_index_low_level)
               end

       is_invalid_matrix: BOOLEAN
               do
                       Result := (value=invalid_matrix_low_level)
               end

       is_invalid_mesh_construction: BOOLEAN
               do
                       Result := (value=invalid_mesh_construction_low_level)
               end

       is_invalid_path_data: BOOLEAN
               do
                       Result := (value=invalid_path_data_low_level)
               end

       is_invalid_pop_group: BOOLEAN
               do
                       Result := (value=invalid_pop_group_low_level)
               end

       is_invalid_restore: BOOLEAN
               do
                       Result := (value=invalid_restore_low_level)
               end

       is_invalid_size: BOOLEAN
               do
                       Result := (value=invalid_size_low_level)
               end

       is_invalid_slant: BOOLEAN
               do
                       Result := (value=invalid_slant_low_level)
               end

       is_invalid_status: BOOLEAN
               do
                       Result := (value=invalid_status_low_level)
               end

       is_invalid_stride: BOOLEAN
               do
                       Result := (value=invalid_stride_low_level)
               end

       is_invalid_string: BOOLEAN
               do
                       Result := (value=invalid_string_low_level)
               end

       is_invalid_visual: BOOLEAN
               do
                       Result := (value=invalid_visual_low_level)
               end

       is_invalid_weight: BOOLEAN
               do
                       Result := (value=invalid_weight_low_level)
               end

       is_jbig2_global_missing: BOOLEAN
               do
                       Result := (value=jbig2_global_missing_low_level)
               end

       is_last_status: BOOLEAN
               do
                       Result := (value=last_status_low_level)
               end

       is_negative_count: BOOLEAN
               do
                       Result := (value=negative_count_low_level)
               end

       is_no_current_point: BOOLEAN
               do
                       Result := (value=no_current_point_low_level)
               end

       is_no_memory: BOOLEAN
               do
                       Result := (value=no_memory_low_level)
               end

       is_null_pointer: BOOLEAN
               do
                       Result := (value=null_pointer_low_level)
               end

       is_pattern_type_mismatch: BOOLEAN
               do
                       Result := (value=pattern_type_mismatch_low_level)
               end

       is_read_error: BOOLEAN
               do
                       Result := (value=read_error_low_level)
               end

       is_success: BOOLEAN
               do
                       Result := (value=success_low_level)
               end

       is_surface_finished: BOOLEAN
               do
                       Result := (value=surface_finished_low_level)
               end

       is_surface_type_mismatch: BOOLEAN
               do
                       Result := (value=surface_type_mismatch_low_level)
               end

       is_temp_file_error: BOOLEAN
               do
                       Result := (value=temp_file_error_low_level)
               end

       is_user_font_error: BOOLEAN
               do
                       Result := (value=user_font_error_low_level)
               end

       is_user_font_immutable: BOOLEAN
               do
                       Result := (value=user_font_immutable_low_level)
               end

       is_user_font_not_implemented: BOOLEAN
               do
                       Result := (value=user_font_not_implemented_low_level)
               end

       is_write_error: BOOLEAN
               do
                       Result := (value=write_error_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     clip_not_representable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_CLIP_NOT_REPRESENTABLE"
                       }"
               end

     device_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_DEVICE_ERROR"
                       }"
               end

     device_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_DEVICE_FINISHED"
                       }"
               end

     device_type_mismatch_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_DEVICE_TYPE_MISMATCH"
                       }"
               end

     file_not_found_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_FILE_NOT_FOUND"
                       }"
               end

     font_type_mismatch_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_FONT_TYPE_MISMATCH"
                       }"
               end

     invalid_clusters_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_CLUSTERS"
                       }"
               end

     invalid_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_CONTENT"
                       }"
               end

     invalid_dash_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_DASH"
                       }"
               end

     invalid_dsc_comment_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_DSC_COMMENT"
                       }"
               end

     invalid_format_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_FORMAT"
                       }"
               end

     invalid_index_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_INDEX"
                       }"
               end

     invalid_matrix_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_MATRIX"
                       }"
               end

     invalid_mesh_construction_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_MESH_CONSTRUCTION"
                       }"
               end

     invalid_path_data_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_PATH_DATA"
                       }"
               end

     invalid_pop_group_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_POP_GROUP"
                       }"
               end

     invalid_restore_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_RESTORE"
                       }"
               end

     invalid_size_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_SIZE"
                       }"
               end

     invalid_slant_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_SLANT"
                       }"
               end

     invalid_status_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_STATUS"
                       }"
               end

     invalid_stride_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_STRIDE"
                       }"
               end

     invalid_string_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_STRING"
                       }"
               end

     invalid_visual_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_VISUAL"
                       }"
               end

     invalid_weight_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_INVALID_WEIGHT"
                       }"
               end

     jbig2_global_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_JBIG2_GLOBAL_MISSING"
                       }"
               end

     last_status_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_LAST_STATUS"
                       }"
               end

     negative_count_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_NEGATIVE_COUNT"
                       }"
               end

     no_current_point_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_NO_CURRENT_POINT"
                       }"
               end

     no_memory_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_NO_MEMORY"
                       }"
               end

     null_pointer_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_NULL_POINTER"
                       }"
               end

     pattern_type_mismatch_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_PATTERN_TYPE_MISMATCH"
                       }"
               end

     read_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_READ_ERROR"
                       }"
               end

     success_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_SUCCESS"
                       }"
               end

     surface_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_SURFACE_FINISHED"
                       }"
               end

     surface_type_mismatch_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_SURFACE_TYPE_MISMATCH"
                       }"
               end

     temp_file_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_TEMP_FILE_ERROR"
                       }"
               end

     user_font_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_USER_FONT_ERROR"
                       }"
               end

     user_font_immutable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_USER_FONT_IMMUTABLE"
                       }"
               end

     user_font_not_implemented_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED"
                       }"
               end

     write_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_STATUS_WRITE_ERROR"
                       }"
               end


end -- class CAIRO_STATUS_T_ENUM

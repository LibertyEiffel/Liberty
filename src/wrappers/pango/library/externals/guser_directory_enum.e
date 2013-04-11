-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUSER_DIRECTORY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = directory_desktop_low_level)  or else
				(a_value = directory_documents_low_level)  or else
				(a_value = directory_download_low_level)  or else
				(a_value = directory_music_low_level)  or else
				(a_value = directory_pictures_low_level)  or else
				(a_value = directory_public_share_low_level)  or else
				(a_value = directory_templates_low_level)  or else
				(a_value = directory_videos_low_level)  or else
				(a_value = n_directories_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_directory_desktop is
		do
			value := directory_desktop_low_level
		end

	set_directory_documents is
		do
			value := directory_documents_low_level
		end

	set_directory_download is
		do
			value := directory_download_low_level
		end

	set_directory_music is
		do
			value := directory_music_low_level
		end

	set_directory_pictures is
		do
			value := directory_pictures_low_level
		end

	set_directory_public_share is
		do
			value := directory_public_share_low_level
		end

	set_directory_templates is
		do
			value := directory_templates_low_level
		end

	set_directory_videos is
		do
			value := directory_videos_low_level
		end

	set_n_directories is
		do
			value := n_directories_low_level
		end

feature {ANY} -- Queries
	is_directory_desktop: BOOLEAN is
		do
			Result := (value=directory_desktop_low_level)
		end

	is_directory_documents: BOOLEAN is
		do
			Result := (value=directory_documents_low_level)
		end

	is_directory_download: BOOLEAN is
		do
			Result := (value=directory_download_low_level)
		end

	is_directory_music: BOOLEAN is
		do
			Result := (value=directory_music_low_level)
		end

	is_directory_pictures: BOOLEAN is
		do
			Result := (value=directory_pictures_low_level)
		end

	is_directory_public_share: BOOLEAN is
		do
			Result := (value=directory_public_share_low_level)
		end

	is_directory_templates: BOOLEAN is
		do
			Result := (value=directory_templates_low_level)
		end

	is_directory_videos: BOOLEAN is
		do
			Result := (value=directory_videos_low_level)
		end

	is_n_directories: BOOLEAN is
		do
			Result := (value=n_directories_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	directory_desktop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_DESKTOP"
 			}"
 		end

	directory_documents_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_DOCUMENTS"
 			}"
 		end

	directory_download_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_DOWNLOAD"
 			}"
 		end

	directory_music_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_MUSIC"
 			}"
 		end

	directory_pictures_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_PICTURES"
 			}"
 		end

	directory_public_share_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_PUBLIC_SHARE"
 			}"
 		end

	directory_templates_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_TEMPLATES"
 			}"
 		end

	directory_videos_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_VIDEOS"
 			}"
 		end

	n_directories_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_N_DIRECTORIES"
 			}"
 		end


end -- class GUSER_DIRECTORY_ENUM

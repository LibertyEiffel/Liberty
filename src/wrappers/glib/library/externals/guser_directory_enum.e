-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUSER_DIRECTORY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = directory__desktop_low_level)  or else
				(a_value = directory__download_low_level)  or else
				(a_value = directory__music_low_level)  or else
				(a_value = directory__pictures_low_level)  or else
				(a_value = directory__public__share_low_level)  or else
				(a_value = directory__templates_low_level)  or else
				(a_value = directory__videos_low_level)  or else
				(a_value = n__directories_low_level) )
		end

feature -- Setters
	default_create,
	set_directory__desktop is
		do
			value := directory__desktop_low_level
		end

	set_directory__download is
		do
			value := directory__download_low_level
		end

	set_directory__music is
		do
			value := directory__music_low_level
		end

	set_directory__pictures is
		do
			value := directory__pictures_low_level
		end

	set_directory__public__share is
		do
			value := directory__public__share_low_level
		end

	set_directory__templates is
		do
			value := directory__templates_low_level
		end

	set_directory__videos is
		do
			value := directory__videos_low_level
		end

	set_n__directories is
		do
			value := n__directories_low_level
		end

feature -- Queries
	is_directory__desktop: BOOLEAN is
		do
			Result := (value=directory__desktop_low_level)
		end

	is_directory__download: BOOLEAN is
		do
			Result := (value=directory__download_low_level)
		end

	is_directory__music: BOOLEAN is
		do
			Result := (value=directory__music_low_level)
		end

	is_directory__pictures: BOOLEAN is
		do
			Result := (value=directory__pictures_low_level)
		end

	is_directory__public__share: BOOLEAN is
		do
			Result := (value=directory__public__share_low_level)
		end

	is_directory__templates: BOOLEAN is
		do
			Result := (value=directory__templates_low_level)
		end

	is_directory__videos: BOOLEAN is
		do
			Result := (value=directory__videos_low_level)
		end

	is_n__directories: BOOLEAN is
		do
			Result := (value=n__directories_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	directory__desktop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_DESKTOP"
 			}"
 		end

	directory__download_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_DOWNLOAD"
 			}"
 		end

	directory__music_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_MUSIC"
 			}"
 		end

	directory__pictures_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_PICTURES"
 			}"
 		end

	directory__public__share_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_PUBLIC_SHARE"
 			}"
 		end

	directory__templates_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_TEMPLATES"
 			}"
 		end

	directory__videos_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_DIRECTORY_VIDEOS"
 			}"
 		end

	n__directories_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_USER_N_DIRECTORIES"
 			}"
 		end


end -- class GUSER_DIRECTORY_ENUM

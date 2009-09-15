-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class G_USER_DIRECTORY

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_user_directory_desktop) or else 
				(a_value = g_user_directory_documents) or else 
				(a_value = g_user_directory_download) or else 
				(a_value = g_user_directory_music) or else 
				(a_value = g_user_directory_pictures) or else 
				(a_value = g_user_directory_public_share) or else 
				(a_value = g_user_directory_templates) or else 
				(a_value = g_user_directory_videos) or else 
				(a_value = g_user_n_directories))
		end

feature -- Setters
	default_create,  set_desktop is
	
		do
			value := g_user_directory_desktop
		end

	 set_documents is
	
		do
			value := g_user_directory_documents
		end

	 set_download is
	
		do
			value := g_user_directory_download
		end

	 set_music is
	
		do
			value := g_user_directory_music
		end

	 set_pictures is
	
		do
			value := g_user_directory_pictures
		end

	 set_public_share is
	
		do
			value := g_user_directory_public_share
		end

	 set_templates is
	
		do
			value := g_user_directory_templates
		end

	 set_videos is
	
		do
			value := g_user_directory_videos
		end

	 set_ies is
	
		do
			value := g_user_n_directories
		end

feature -- Queries
	is_desktop: BOOLEAN is
		
		do
			Result := (value=g_user_directory_desktop)
		end

	is_documents: BOOLEAN is
		
		do
			Result := (value=g_user_directory_documents)
		end

	is_download: BOOLEAN is
		
		do
			Result := (value=g_user_directory_download)
		end

	is_music: BOOLEAN is
		
		do
			Result := (value=g_user_directory_music)
		end

	is_pictures: BOOLEAN is
		
		do
			Result := (value=g_user_directory_pictures)
		end

	is_public_share: BOOLEAN is
		
		do
			Result := (value=g_user_directory_public_share)
		end

	is_templates: BOOLEAN is
		
		do
			Result := (value=g_user_directory_templates)
		end

	is_videos: BOOLEAN is
		
		do
			Result := (value=g_user_directory_videos)
		end

	is_ies: BOOLEAN is
		
		do
			Result := (value=g_user_n_directories)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_user_directory_desktop: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_USER_DIRECTORY_DESKTOP"
 			}"
 		end

	g_user_directory_documents: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_USER_DIRECTORY_DOCUMENTS"
 			}"
 		end

	g_user_directory_download: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_USER_DIRECTORY_DOWNLOAD"
 			}"
 		end

	g_user_directory_music: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_USER_DIRECTORY_MUSIC"
 			}"
 		end

	g_user_directory_pictures: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_USER_DIRECTORY_PICTURES"
 			}"
 		end

	g_user_directory_public_share: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_USER_DIRECTORY_PUBLIC_SHARE"
 			}"
 		end

	g_user_directory_templates: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_USER_DIRECTORY_TEMPLATES"
 			}"
 		end

	g_user_directory_videos: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_USER_DIRECTORY_VIDEOS"
 			}"
 		end

	g_user_n_directories: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_USER_N_DIRECTORIES"
 			}"
 		end

end


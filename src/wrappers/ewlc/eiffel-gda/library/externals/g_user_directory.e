-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_USER_DIRECTORY
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
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


feature {ANY} -- Setters
	default_create, set_directory_desktop is
		do
			value := g_user_directory_desktop
		end

	set_directory_documents is
		do
			value := g_user_directory_documents
		end

	set_directory_download is
		do
			value := g_user_directory_download
		end

	set_directory_music is
		do
			value := g_user_directory_music
		end

	set_directory_pictures is
		do
			value := g_user_directory_pictures
		end

	set_directory_public_share is
		do
			value := g_user_directory_public_share
		end

	set_directory_templates is
		do
			value := g_user_directory_templates
		end

	set_directory_videos is
		do
			value := g_user_directory_videos
		end

	set_n_directories is
		do
			value := g_user_n_directories
		end


feature {ANY} -- Queries
	is_directory_desktop: BOOLEAN is
		do
			Result := (value=g_user_directory_desktop)
		end

	is_directory_documents: BOOLEAN is
		do
			Result := (value=g_user_directory_documents)
		end

	is_directory_download: BOOLEAN is
		do
			Result := (value=g_user_directory_download)
		end

	is_directory_music: BOOLEAN is
		do
			Result := (value=g_user_directory_music)
		end

	is_directory_pictures: BOOLEAN is
		do
			Result := (value=g_user_directory_pictures)
		end

	is_directory_public_share: BOOLEAN is
		do
			Result := (value=g_user_directory_public_share)
		end

	is_directory_templates: BOOLEAN is
		do
			Result := (value=g_user_directory_templates)
		end

	is_directory_videos: BOOLEAN is
		do
			Result := (value=g_user_directory_videos)
		end

	is_n_directories: BOOLEAN is
		do
			Result := (value=g_user_n_directories)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_user_directory_desktop: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_USER_DIRECTORY_DESKTOP"
		end

	g_user_directory_documents: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_USER_DIRECTORY_DOCUMENTS"
		end

	g_user_directory_download: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_USER_DIRECTORY_DOWNLOAD"
		end

	g_user_directory_music: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_USER_DIRECTORY_MUSIC"
		end

	g_user_directory_pictures: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_USER_DIRECTORY_PICTURES"
		end

	g_user_directory_public_share: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_USER_DIRECTORY_PUBLIC_SHARE"
		end

	g_user_directory_templates: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_USER_DIRECTORY_TEMPLATES"
		end

	g_user_directory_videos: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_USER_DIRECTORY_VIDEOS"
		end

	g_user_n_directories: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_USER_N_DIRECTORIES"
		end


end


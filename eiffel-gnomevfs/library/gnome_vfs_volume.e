indexing
	description: "GnomeVFSVolume -- Abstraction for a mounted file system or a network location."
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
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

class GNOME_VFS_VOLUME

inherit
	G_OBJECT
		redefine
			type, ref, unref
		end
	COMPARABLE
	
insert
	GNOME_VFS_VOLUME_TYPE

creation make, from_external_pointer

feature -- Creation
	compare (another: like Current): BOOLEAN is
		do
			Result:=gnome_vfs_volume_compare(handle,another.handle)
		end

	
	eject is
		-- TODO: document it; there is a "GnomeVFSVolumeOpCallback 
		-- callback" undocumented parameter....
		do
			gnome_vfs_volume_eject(handle,default_pointer,default_pointer)
		end

	activation_uri: STRING is
			-- the activation uri of volume.
		do
			create Result.from_external(gnome_vfs_volume_get_activation_uri(handle))
		ensure not_void: Result /= Void
		end

	device_path: STRING is
			-- for device path of volume.
		do
			create Result.from_external(gnome_vfs_volume_get_device_path(handle))
		ensure not_void: Result /= Void
		end

	device_type: INTEGER is
			-- the device type for volume.
		do
			Result:=gnome_vfs_volume_get_device_type(handle)
		ensure is_valid_volume_type(Result)
		end

	display_name: STRING is
			--  the display name of volume.
		do
			create Result.from_external(gnome_vfs_volume_get_display_name(handle))
		ensure not_void: Result /= Void
		end

	drive: GNOME_VFS_DRIVE is
			-- the drive for the volume.
		do
			create Result.from_external_pointer(gnome_vfs_volume_get_drive(handle))
		ensure not_void: Result/=Void
		end

	filesystem_type: STRING is
			-- the filesystem type of volume.
		do
			create Result.from_external(gnome_vfs_volume_get_filesystem_type(handle))
		ensure not_void: Result/=Void
		end

	hal_udi: STRING is
			-- the unique device id of volume.
		do
			create Result.from_external(gnome_vfs_volume_get_hal_udi(handle))
		ensure not_void: Result/=Void
		end

	icon: STRING is
			--  the icon filename of volume.
		do
			create Result.from_external(gnome_vfs_volume_get_icon(handle))
		ensure not_void: Result/=Void
		end

	id: INTEGER_32 is
			-- the id for the volume.

			-- TODO: should be NATURAL
		do
			Result:=gnome_vfs_volume_get_id(handle)
		end

	type: INTEGER is
		do
			Result:=gnome_vfs_volume_get_type
		end

	volume_type: INTEGER is
			-- the volume type for volume.
		do
			Result:=gnome_vfs_volume_get_volume_type(handle)
		end

	handles_trash: BOOLEAN is
			-- Does the volume handle trash?
		do
			Result:=gnome_vfs_volume_handles_trash(handle).to_boolean
		end

	is_mounted: BOOLEAN is
		-- Is the volume mounted?
		do
			Result:=gnome_vfs_volume_is_mounted(handle).to_boolean
		end

   is_read_only: BOOLEAN is
			-- Is the volume read-only to the user?
		do
			Result:=gnome_vfs_volume_is_read_only(handle).to_boolean
		end

	is_user_visible: BOOLEAN is
			-- Is the volume visible to the user?
		do
			Result:=gnome_vfs_volume_is_user_visible(handle).to_boolean
		end

	ref is
			--    Increases the refcount of the volume by 1.
		local p: POINTER
		do
			p:=gnome_vfs_volume_ref(handle)
		end

	-- TODO: GType gnome_vfs_volume_type_get_type (void);

	unmount is
			-- TODO: gnome_vfs_volume_unmount is undocumented; it has
			-- unknown GnomeVFSVolumeOpCallback callback and gpointer
			-- user_data parameters
		do
			gnome_vfs_volume_unmount(handle,default_pointer,default_pointer)
		end

	unref is
			-- Decreases the refcount of the volume by 1.
		do
			gnome_vfs_volume_unref(handle)
		end

	--   gnome_vfs_connect_to_server ()
	
	--  void gnome_vfs_connect_to_server (char *uri, char
	--  *display_name, char *icon);
	
	--    uri :
	--    display_name :
	--    icon :

feature {} -- Unwrapped code
	--   GNOME_IS_VFS_VOLUME()

	--  #define GNOME_IS_VFS_VOLUME(o) (G_TYPE_CHECK_INSTANCE_TYPE ((o),
	--  GNOME_VFS_TYPE_VOLUME))

	--    o :

	--   GNOME_IS_VFS_VOLUME_CLASS()

	--  #define GNOME_IS_VFS_VOLUME_CLASS(k) (G_TYPE_CHECK_CLASS_TYPE ((k), GNOME_VFS_TYPE_VOLUME))

	--    k :

   

	--   GNOME_VFS_TYPE_VOLUME

	--  #define GNOME_VFS_TYPE_VOLUME        (gnome_vfs_volume_get_type ())

   

	--   GNOME_VFS_VOLUME()

	--  #define GNOME_VFS_VOLUME(o)          (G_TYPE_CHECK_INSTANCE_CAST ((o), GNOME_VFS_TYPE_VOLUME, GnomeVFSVolume))

	--    o :

   

	--   GNOME_VFS_VOLUME_CLASS()

	--  #define GNOME_VFS_VOLUME_CLASS(k)    (G_TYPE_CHECK_CLASS_CAST((k), GNOME_VFS_TYPE_VOLUME, GnomeVFSVolumeClass))

	--    k :

   

	--   GnomeVFSVolume

	--  typedef struct _GnomeVFSVolume GnomeVFSVolume;

   

	--   GnomeVFSVolumeClass

	--  typedef struct {
	--          GObjectClass parent_class;
	--  } GnomeVFSVolumeClass;

   

	--   GnomeVFSVolumeOpCallback ()

	--  void        (*GnomeVFSVolumeOpCallback)     (gboolean succeeded,
	--                                               char *error,
	--                                               char *detailed_error,
	--                                               gpointer data);

	--    succeeded :
	--    error :
	--    detailed_error :
	--    data :

   
feature {}
	--  #define     GNOME_IS_VFS_VOLUME             (o)
	--  #define     GNOME_IS_VFS_VOLUME_CLASS       (k)
	--  #define     GNOME_VFS_TYPE_VOLUME
	--  #define     GNOME_VFS_VOLUME                (o)
	--  #define     GNOME_VFS_VOLUME_CLASS          (k)
	-- GnomeVFSVolume;
	-- GnomeVFSVolumeClass;
	
	-- void (*GnomeVFSVolumeOpCallback) (gboolean succeeded, char
	-- *error, char *detailed_error, gpointer data);

	-- enum GnomeVFSVolumeType;

	gnome_vfs_volume_compare (an_a, a_b: POINTER): INTEGER is
			-- gint gnome_vfs_volume_compare (GnomeVFSVolume *a,
			-- GnomeVFSVolume *b);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_eject (a_volume, a_callback, a_user_data: POINTER) is
			--  void gnome_vfs_volume_eject (GnomeVFSVolume *volume,
			--  GnomeVFSVolumeOpCallback callback, gpointer user_data);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_get_activation_uri (a_volume: POINTER): POINTER is
			--  char* gnome_vfs_volume_get_activation_uri (GnomeVFSVolume *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_get_device_path (a_volume: POINTER): POINTER is
			--  char* gnome_vfs_volume_get_device_path (GnomeVFSVolume *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_get_device_type (a_volume: POINTER): INTEGER is
			-- GnomeVFSDeviceType gnome_vfs_volume_get_device_type
			-- (GnomeVFSVolume *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_get_display_name (a_volume: POINTER): POINTER is
			-- char* gnome_vfs_volume_get_display_name (GnomeVFSVolume
			-- *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_volume_get_drive (a_volume: POINTER): POINTER is
			-- GnomeVFSDrive* gnome_vfs_volume_get_drive (GnomeVFSVolume
			-- *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_volume_get_filesystem_type (a_volume: POINTER): POINTER is
			-- char* gnome_vfs_volume_get_filesystem_type (GnomeVFSVolume
			-- *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_get_hal_udi (a_volume: POINTER): POINTER is
			-- char* gnome_vfs_volume_get_hal_udi (GnomeVFSVolume
			-- *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_get_icon (a_volume: POINTER): POINTER is
			-- char* gnome_vfs_volume_get_icon (GnomeVFSVolume *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_get_id (a_volume: POINTER): INTEGER is
			--  gulong gnome_vfs_volume_get_id (GnomeVFSVolume *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_get_type: INTEGER is
			--  GType gnome_vfs_volume_get_type (void);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_get_volume_type (a_volume: POINTER): INTEGER is
			--  GnomeVFSVolumeType gnome_vfs_volume_get_volume_type (GnomeVFSVolume *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_handles_trash (a_volume: POINTER): INTEGER is
			--  gboolean gnome_vfs_volume_handles_trash (GnomeVFSVolume *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_is_mounted (a_volume: POINTER): INTEGER is
			--  gboolean gnome_vfs_volume_is_mounted (GnomeVFSVolume *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_volume_is_read_only (a_volume: POINTER): INTEGER is
			--  gboolean gnome_vfs_volume_is_read_only (GnomeVFSVolume *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_volume_is_user_visible (a_volume: POINTER): INTEGER is
			--  gboolean gnome_vfs_volume_is_user_visible (GnomeVFSVolume *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_volume_ref (a_volume: POINTER): POINTER is
			--  GnomeVFSVolume* gnome_vfs_volume_ref (GnomeVFSVolume *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_type_get_type: INTEGER is
			--  GType gnome_vfs_volume_type_get_type (void);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_unmount (a_volume, a_callback, user_data: POINTER) is
			-- void gnome_vfs_volume_unmount (GnomeVFSVolume *volume,
			-- GnomeVFSVolumeOpCallback callback, gpointer user_data);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_volume_unref (a_volume: POINTER) is
			-- void gnome_vfs_volume_unref (GnomeVFSVolume *volume);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_connect_to_server (a_uri, a_display_name, a_icon: POINTER) is
			-- void gnome_vfs_connect_to_server (char *uri, char
			-- *display_name, char *icon);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
end -- class GNOME_VFS_VOLUME

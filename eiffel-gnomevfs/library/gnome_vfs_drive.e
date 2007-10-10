indexing
	description: "GnomeVFSDrive: Container for GnomeVFSVolume (floppy drive, CD reader, ...)."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GnomeVFS copyright holder 
					
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

class GNOME_VFS_DRIVE

inherit G_OBJECT

creation  from_external_pointer

feature {} -- Creation


--  enum        GnomeVFSDeviceType;
--              GnomeVFSDrive;
--              GnomeVFSDriveClass;
--  #define     GNOME_IS_VFS_DRIVE              (o)
--  #define     GNOME_IS_VFS_DRIVE_CLASS        (k)
--  #define     GNOME_VFS_TYPE_DRIVE
--  #define     GNOME_VFS_DRIVE                 (o)
--  #define     GNOME_VFS_DRIVE_CLASS           (k)
--  gint        gnome_vfs_drive_compare         (GnomeVFSDrive *a,
--                                               GnomeVFSDrive *b);
--  void        gnome_vfs_drive_eject           (GnomeVFSDrive *drive,
--                                               GnomeVFSVolumeOpCallback callback,
--                                               gpointer user_data);
--  char*       gnome_vfs_drive_get_activation_uri
--                                              (GnomeVFSDrive *drive);
--  char*       gnome_vfs_drive_get_device_path (GnomeVFSDrive *drive);
--  GnomeVFSDeviceType gnome_vfs_drive_get_device_type
--                                              (GnomeVFSDrive *drive);
--  char*       gnome_vfs_drive_get_display_name
--                                              (GnomeVFSDrive *drive);
--  char*       gnome_vfs_drive_get_hal_udi     (GnomeVFSDrive *drive);
--  char*       gnome_vfs_drive_get_icon        (GnomeVFSDrive *drive);
--  gulong      gnome_vfs_drive_get_id          (GnomeVFSDrive *drive);
--  GnomeVFSVolume* gnome_vfs_drive_get_mounted_volume
--                                              (GnomeVFSDrive *drive);
--  GList*      gnome_vfs_drive_get_mounted_volumes
--                                              (GnomeVFSDrive *drive);
--  void        gnome_vfs_drive_volume_list_free
--                                              (GList *volumes);
--  GType       gnome_vfs_drive_get_type        (void);
--  gboolean    gnome_vfs_drive_is_connected    (GnomeVFSDrive *drive);
--  gboolean    gnome_vfs_drive_is_mounted      (GnomeVFSDrive *drive);
--  gboolean    gnome_vfs_drive_is_user_visible (GnomeVFSDrive *drive);
--  void        gnome_vfs_drive_mount           (GnomeVFSDrive *drive,
--                                               GnomeVFSVolumeOpCallback callback,
--                                               gpointer user_data);
--  GnomeVFSDrive* gnome_vfs_drive_ref          (GnomeVFSDrive *drive);
--  void        gnome_vfs_drive_unmount         (GnomeVFSDrive *drive,
--                                               GnomeVFSVolumeOpCallback callback,
--                                               gpointer user_data);
--  void        gnome_vfs_drive_unref           (GnomeVFSDrive *drive);

-- Object Hierarchy


--    GObject
--     +----GnomeVFSDrive

-- Signals


--  "volume-mounted"
--              void        user_function      (GnomeVFSDrive  *vfsdrive,
--                                              GnomeVFSVolume *arg1,
--                                              gpointer        user_data)      : Run first
--  "volume-pre-unmount"
--              void        user_function      (GnomeVFSDrive  *vfsdrive,
--                                              GnomeVFSVolume *arg1,
--                                              gpointer        user_data)      : Run first
--  "volume-unmounted"
--              void        user_function      (GnomeVFSDrive  *vfsdrive,
--                                              GnomeVFSVolume *arg1,
--                                              gpointer        user_data)      : Run first

-- Description

-- Details

--   enum GnomeVFSDeviceType

--  typedef enum {
--          GNOME_VFS_DEVICE_TYPE_UNKNOWN,
--          GNOME_VFS_DEVICE_TYPE_AUDIO_CD,
--          GNOME_VFS_DEVICE_TYPE_VIDEO_DVD,
--          GNOME_VFS_DEVICE_TYPE_HARDDRIVE,
--          GNOME_VFS_DEVICE_TYPE_CDROM,
--          GNOME_VFS_DEVICE_TYPE_FLOPPY,
--          GNOME_VFS_DEVICE_TYPE_ZIP,
--          GNOME_VFS_DEVICE_TYPE_JAZ,
--          GNOME_VFS_DEVICE_TYPE_NFS,
--          GNOME_VFS_DEVICE_TYPE_AUTOFS,
--          GNOME_VFS_DEVICE_TYPE_CAMERA,
--          GNOME_VFS_DEVICE_TYPE_MEMORY_STICK,
--          GNOME_VFS_DEVICE_TYPE_SMB,
--          GNOME_VFS_DEVICE_TYPE_APPLE,
--          GNOME_VFS_DEVICE_TYPE_MUSIC_PLAYER,
--          GNOME_VFS_DEVICE_TYPE_WINDOWS,
--          GNOME_VFS_DEVICE_TYPE_LOOPBACK,
--          GNOME_VFS_DEVICE_TYPE_NETWORK
--  } GnomeVFSDeviceType;

--    --------------------------------------------------------------------------

--   GnomeVFSDrive

--  typedef struct _GnomeVFSDrive GnomeVFSDrive;

--    --------------------------------------------------------------------------

--   GnomeVFSDriveClass

--  typedef struct {
--          GObjectClass parent_class;

--          void (* volume_mounted)         (GnomeVFSDrive *drive,
--                                           GnomeVFSVolume *volume);
--          void (* volume_pre_unmount)     (GnomeVFSDrive *drive,
--                                           GnomeVFSVolume *volume);
--          void (* volume_unmounted)       (GnomeVFSDrive *drive,
--                                           GnomeVFSVolume *volume);
--  } GnomeVFSDriveClass;

--    --------------------------------------------------------------------------

--   GNOME_IS_VFS_DRIVE()

--  #define GNOME_IS_VFS_DRIVE(o)       (G_TYPE_CHECK_INSTANCE_TYPE ((o), GNOME_VFS_TYPE_DRIVE))

--    o :

--    --------------------------------------------------------------------------

--   GNOME_IS_VFS_DRIVE_CLASS()

--  #define GNOME_IS_VFS_DRIVE_CLASS(k) (G_TYPE_CHECK_CLASS_TYPE ((k), GNOME_VFS_TYPE_DRIVE))

--    k :

--    --------------------------------------------------------------------------

--   GNOME_VFS_TYPE_DRIVE

--  #define GNOME_VFS_TYPE_DRIVE        (gnome_vfs_drive_get_type ())

--    --------------------------------------------------------------------------

--   GNOME_VFS_DRIVE()

--  #define GNOME_VFS_DRIVE(o)          (G_TYPE_CHECK_INSTANCE_CAST ((o), GNOME_VFS_TYPE_DRIVE, GnomeVFSDrive))

--    o :

--    --------------------------------------------------------------------------

--   GNOME_VFS_DRIVE_CLASS()

--  #define GNOME_VFS_DRIVE_CLASS(k)    (G_TYPE_CHECK_CLASS_CAST((k), GNOME_VFS_TYPE_DRIVE, GnomeVFSDriveClass))

--    k :

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_compare ()

--  gint        gnome_vfs_drive_compare         (GnomeVFSDrive *a,
--                                               GnomeVFSDrive *b);

--    a :       a GnomeVFSDrive.
--    b :       a GnomeVFSDrive.
--    Returns : 0 if the drives are same.

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_eject ()

--  void        gnome_vfs_drive_eject           (GnomeVFSDrive *drive,
--                                               GnomeVFSVolumeOpCallback callback,
--                                               gpointer user_data);

--    drive :
--    callback :
--    user_data :

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_get_activation_uri ()

--  char*       gnome_vfs_drive_get_activation_uri
--                                              (GnomeVFSDrive *drive);

--    drive :   a GnomeVFSDrive.
--    Returns : a newly allocated string for the activation uri of the drive.

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_get_device_path ()

--  char*       gnome_vfs_drive_get_device_path (GnomeVFSDrive *drive);

--    drive :   a GnomeVFSDrive.
--    Returns : a newly allocated string for the device path of the drive.

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_get_device_type ()

--  GnomeVFSDeviceType gnome_vfs_drive_get_device_type
--                                              (GnomeVFSDrive *drive);

--    drive :   a GnomeVFSDrive.
--    Returns : device type, a GnomeVFSDeviceType value.

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_get_display_name ()

--  char*       gnome_vfs_drive_get_display_name
--                                              (GnomeVFSDrive *drive);

--    drive :   a GnomeVFSDrive.
--    Returns : a newly allocated string for the display name of the drive.

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_get_hal_udi ()

--  char*       gnome_vfs_drive_get_hal_udi     (GnomeVFSDrive *drive);

--    drive :   a GnomeVFSDrive.
--    Returns : a newly allocated string for the unique device id of the drive.

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_get_icon ()

--  char*       gnome_vfs_drive_get_icon        (GnomeVFSDrive *drive);

--    drive :   a GnomeVFSDrive.
--    Returns : a newly allocated string for the icon filename of the drive.

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_get_id ()

--  gulong      gnome_vfs_drive_get_id          (GnomeVFSDrive *drive);

--    drive :   a GnomeVFSDrive.
--    Returns : drive id, a gulong value.

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_get_mounted_volume ()

--  GnomeVFSVolume* gnome_vfs_drive_get_mounted_volume
--                                              (GnomeVFSDrive *drive);

--   Warning

--    gnome_vfs_drive_get_mounted_volume is deprecated and should not be used in
--    newly-written code. Use gnome_vfs_drive_get_mounted_volumes()
--    instead.

--    Returns the first mounted volume for the drive.

--    drive :   a GnomeVFSDrive.
--    Returns : a GnomeVFSVolume.

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_get_mounted_volumes ()

--  GList*      gnome_vfs_drive_get_mounted_volumes
--                                              (GnomeVFSDrive *drive);

--    drive :   a GnomeVFSDrive.
--    Returns : list of mounted volumes for the drive.

--    Since 2.8

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_volume_list_free ()

--  void        gnome_vfs_drive_volume_list_free
--                                              (GList *volumes);

--    Frees the list volumes.

--    volumes : list of GnomeVFSVolumes to be freed.

--    Since 2.8

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_get_type ()

--  GType       gnome_vfs_drive_get_type        (void);

--    Returns :

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_is_connected ()

--  gboolean    gnome_vfs_drive_is_connected    (GnomeVFSDrive *drive);

--    drive :   a GnomeVFSDrive.
--    Returns : TRUE if the drive is connected, FALSE otherwise.

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_is_mounted ()

--  gboolean    gnome_vfs_drive_is_mounted      (GnomeVFSDrive *drive);

--    drive :   a GnomeVFSDrive.
--    Returns : TRUE if the drive is mounted, FALSE otherwise.

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_is_user_visible ()

--  gboolean    gnome_vfs_drive_is_user_visible (GnomeVFSDrive *drive);

--    drive :   a GnomeVFSDrive.
--    Returns : TRUE if the drive is visible to the user, FALSE otherwise.

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_mount ()

--  void        gnome_vfs_drive_mount           (GnomeVFSDrive *drive,
--                                               GnomeVFSVolumeOpCallback callback,
--                                               gpointer user_data);

--    drive :
--    callback :
--    user_data :

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_ref ()

--  GnomeVFSDrive* gnome_vfs_drive_ref          (GnomeVFSDrive *drive);

--    Increases the refcount of the drive by 1.

--    drive :   a GnomeVFSDrive.
--    Returns : the drive.

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_unmount ()

--  void        gnome_vfs_drive_unmount         (GnomeVFSDrive *drive,
--                                               GnomeVFSVolumeOpCallback callback,
--                                               gpointer user_data);

--    drive :
--    callback :
--    user_data :

--    Since 2.6

--    --------------------------------------------------------------------------

--   gnome_vfs_drive_unref ()

--  void        gnome_vfs_drive_unref           (GnomeVFSDrive *drive);

--    Decreases the refcount of the drive by 1.

--    drive : a GnomeVFSDrive.

--    Since 2.6

-- Signal Details

--   The "volume-mounted" signal

--  void        user_function                  (GnomeVFSDrive  *vfsdrive,
--                                              GnomeVFSVolume *arg1,
--                                              gpointer        user_data)      : Run first

--    vfsdrive :  the object which received the signal.
--    arg1 :
--    user_data : user data set when the signal handler was connected.

--    --------------------------------------------------------------------------

--   The "volume-pre-unmount" signal

--  void        user_function                  (GnomeVFSDrive  *vfsdrive,
--                                              GnomeVFSVolume *arg1,
--                                              gpointer        user_data)      : Run first

--    vfsdrive :  the object which received the signal.
--    arg1 :
--    user_data : user data set when the signal handler was connected.

--    --------------------------------------------------------------------------

--   The "volume-unmounted" signal

--  void        user_function                  (GnomeVFSDrive  *vfsdrive,
--                                              GnomeVFSVolume *arg1,
--                                              gpointer        user_data)      : Run first

--    vfsdrive :  the object which received the signal.
--    arg1 :
--    user_data : user data set when the signal handler was connected.
end -- class GNOME_VFS_DRIVE

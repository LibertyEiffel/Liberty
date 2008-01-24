indexing
	description: "Enum GtkAccelFlags"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gtk_accel_flags.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GTK_ACCEL_FLAGS
       -- Enum GtkAccelFlags

insert ENUM

creation set_gtk_accel_visible

feature -- Setters

    set_gtk_accel_visible is 
       do
          value := gtk_accel_visible 
       ensure is_gtk_accel_visible 
       end

    set_= is 
       do
          value := = 
       ensure is_= 
       end

    set_1 is 
       do
          value := 1 
       ensure is_1 
       end

    set_<< is 
       do
          value := << 
       ensure is_<< 
       end

    set_0 is 
       do
          value := 0 
       ensure is_0 
       end

    set_/bin is 
       do
          value := /bin 
       ensure is_/bin 
       end

    set_/boot is 
       do
          value := /boot 
       ensure is_/boot 
       end

    set_/cdrom is 
       do
          value := /cdrom 
       ensure is_/cdrom 
       end

    set_/dev is 
       do
          value := /dev 
       ensure is_/dev 
       end

    set_/etc is 
       do
          value := /etc 
       ensure is_/etc 
       end

    set_/home is 
       do
          value := /home 
       ensure is_/home 
       end

    set_/initrd.img is 
       do
          value := /initrd.img 
       ensure is_/initrd.img 
       end

    set_/initrd.img.old is 
       do
          value := /initrd.img.old 
       ensure is_/initrd.img.old 
       end

    set_/lib is 
       do
          value := /lib 
       ensure is_/lib 
       end

    set_/lost+found is 
       do
          value := /lost+found 
       ensure is_/lost+found 
       end

    set_/media is 
       do
          value := /media 
       ensure is_/media 
       end

    set_/mnt is 
       do
          value := /mnt 
       ensure is_/mnt 
       end

    set_/net is 
       do
          value := /net 
       ensure is_/net 
       end

    set_/opt is 
       do
          value := /opt 
       ensure is_/opt 
       end

    set_/proc is 
       do
          value := /proc 
       ensure is_/proc 
       end

    set_/root is 
       do
          value := /root 
       ensure is_/root 
       end

    set_/sbin is 
       do
          value := /sbin 
       ensure is_/sbin 
       end

    set_/smb is 
       do
          value := /smb 
       ensure is_/smb 
       end

    set_/srv is 
       do
          value := /srv 
       ensure is_/srv 
       end

    set_/sys is 
       do
          value := /sys 
       ensure is_/sys 
       end

    set_/tmp is 
       do
          value := /tmp 
       ensure is_/tmp 
       end

    set_/usr is 
       do
          value := /usr 
       ensure is_/usr 
       end

    set_/var is 
       do
          value := /var 
       ensure is_/var 
       end

    set_/vmlinuz is 
       do
          value := /vmlinuz 
       ensure is_/vmlinuz 
       end

    set_/vmlinuz.old is 
       do
          value := /vmlinuz.old 
       ensure is_/vmlinuz.old 
       end

    set_display is 
       do
          value := display 
       ensure is_display 
       end

    set_in is 
       do
          value := in 
       ensure is_in 
       end

    set_gtkaccellabel? is 
       do
          value := gtkaccellabel? 
       ensure is_gtkaccellabel? 
       end

    set_*/ is 
       do
          value := */ 
       ensure is_*/ 
       end

    set_gtk_accel_locked is 
       do
          value := gtk_accel_locked 
       ensure is_gtk_accel_locked 
       end

    set_= is 
       do
          value := = 
       ensure is_= 
       end

    set_1 is 
       do
          value := 1 
       ensure is_1 
       end

    set_<< is 
       do
          value := << 
       ensure is_<< 
       end

    set_1 is 
       do
          value := 1 
       ensure is_1 
       end

    set_/bin is 
       do
          value := /bin 
       ensure is_/bin 
       end

    set_/boot is 
       do
          value := /boot 
       ensure is_/boot 
       end

    set_/cdrom is 
       do
          value := /cdrom 
       ensure is_/cdrom 
       end

    set_/dev is 
       do
          value := /dev 
       ensure is_/dev 
       end

    set_/etc is 
       do
          value := /etc 
       ensure is_/etc 
       end

    set_/home is 
       do
          value := /home 
       ensure is_/home 
       end

    set_/initrd.img is 
       do
          value := /initrd.img 
       ensure is_/initrd.img 
       end

    set_/initrd.img.old is 
       do
          value := /initrd.img.old 
       ensure is_/initrd.img.old 
       end

    set_/lib is 
       do
          value := /lib 
       ensure is_/lib 
       end

    set_/lost+found is 
       do
          value := /lost+found 
       ensure is_/lost+found 
       end

    set_/media is 
       do
          value := /media 
       ensure is_/media 
       end

    set_/mnt is 
       do
          value := /mnt 
       ensure is_/mnt 
       end

    set_/net is 
       do
          value := /net 
       ensure is_/net 
       end

    set_/opt is 
       do
          value := /opt 
       ensure is_/opt 
       end

    set_/proc is 
       do
          value := /proc 
       ensure is_/proc 
       end

    set_/root is 
       do
          value := /root 
       ensure is_/root 
       end

    set_/sbin is 
       do
          value := /sbin 
       ensure is_/sbin 
       end

    set_/smb is 
       do
          value := /smb 
       ensure is_/smb 
       end

    set_/srv is 
       do
          value := /srv 
       ensure is_/srv 
       end

    set_/sys is 
       do
          value := /sys 
       ensure is_/sys 
       end

    set_/tmp is 
       do
          value := /tmp 
       ensure is_/tmp 
       end

    set_/usr is 
       do
          value := /usr 
       ensure is_/usr 
       end

    set_/var is 
       do
          value := /var 
       ensure is_/var 
       end

    set_/vmlinuz is 
       do
          value := /vmlinuz 
       ensure is_/vmlinuz 
       end

    set_/vmlinuz.old is 
       do
          value := /vmlinuz.old 
       ensure is_/vmlinuz.old 
       end

    set_is is 
       do
          value := is 
       ensure is_is 
       end

    set_it is 
       do
          value := it 
       ensure is_it 
       end

    set_removable? is 
       do
          value := removable? 
       ensure is_removable? 
       end

    set_*/ is 
       do
          value := */ 
       ensure is_*/ 
       end

    set_gtk_accel_mask is 
       do
          value := gtk_accel_mask 
       ensure is_gtk_accel_mask 
       end

    set_= is 
       do
          value := = 
       ensure is_= 
       end

    set_0x07 is 
       do
          value := 0x07 
       ensure is_0x07 
       end

feature -- Queries

    is_gtk_accel_visible: BOOLEAN is do Result:=(value=gtk_accel_visible) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_0: BOOLEAN is do Result:=(value=0) end

    is_/bin: BOOLEAN is do Result:=(value=/bin) end

    is_/boot: BOOLEAN is do Result:=(value=/boot) end

    is_/cdrom: BOOLEAN is do Result:=(value=/cdrom) end

    is_/dev: BOOLEAN is do Result:=(value=/dev) end

    is_/etc: BOOLEAN is do Result:=(value=/etc) end

    is_/home: BOOLEAN is do Result:=(value=/home) end

    is_/initrd.img: BOOLEAN is do Result:=(value=/initrd.img) end

    is_/initrd.img.old: BOOLEAN is do Result:=(value=/initrd.img.old) end

    is_/lib: BOOLEAN is do Result:=(value=/lib) end

    is_/lost+found: BOOLEAN is do Result:=(value=/lost+found) end

    is_/media: BOOLEAN is do Result:=(value=/media) end

    is_/mnt: BOOLEAN is do Result:=(value=/mnt) end

    is_/net: BOOLEAN is do Result:=(value=/net) end

    is_/opt: BOOLEAN is do Result:=(value=/opt) end

    is_/proc: BOOLEAN is do Result:=(value=/proc) end

    is_/root: BOOLEAN is do Result:=(value=/root) end

    is_/sbin: BOOLEAN is do Result:=(value=/sbin) end

    is_/smb: BOOLEAN is do Result:=(value=/smb) end

    is_/srv: BOOLEAN is do Result:=(value=/srv) end

    is_/sys: BOOLEAN is do Result:=(value=/sys) end

    is_/tmp: BOOLEAN is do Result:=(value=/tmp) end

    is_/usr: BOOLEAN is do Result:=(value=/usr) end

    is_/var: BOOLEAN is do Result:=(value=/var) end

    is_/vmlinuz: BOOLEAN is do Result:=(value=/vmlinuz) end

    is_/vmlinuz.old: BOOLEAN is do Result:=(value=/vmlinuz.old) end

    is_display: BOOLEAN is do Result:=(value=display) end

    is_in: BOOLEAN is do Result:=(value=in) end

    is_gtkaccellabel?: BOOLEAN is do Result:=(value=gtkaccellabel?) end

    is_*/: BOOLEAN is do Result:=(value=*/) end

    is_gtk_accel_locked: BOOLEAN is do Result:=(value=gtk_accel_locked) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_/bin: BOOLEAN is do Result:=(value=/bin) end

    is_/boot: BOOLEAN is do Result:=(value=/boot) end

    is_/cdrom: BOOLEAN is do Result:=(value=/cdrom) end

    is_/dev: BOOLEAN is do Result:=(value=/dev) end

    is_/etc: BOOLEAN is do Result:=(value=/etc) end

    is_/home: BOOLEAN is do Result:=(value=/home) end

    is_/initrd.img: BOOLEAN is do Result:=(value=/initrd.img) end

    is_/initrd.img.old: BOOLEAN is do Result:=(value=/initrd.img.old) end

    is_/lib: BOOLEAN is do Result:=(value=/lib) end

    is_/lost+found: BOOLEAN is do Result:=(value=/lost+found) end

    is_/media: BOOLEAN is do Result:=(value=/media) end

    is_/mnt: BOOLEAN is do Result:=(value=/mnt) end

    is_/net: BOOLEAN is do Result:=(value=/net) end

    is_/opt: BOOLEAN is do Result:=(value=/opt) end

    is_/proc: BOOLEAN is do Result:=(value=/proc) end

    is_/root: BOOLEAN is do Result:=(value=/root) end

    is_/sbin: BOOLEAN is do Result:=(value=/sbin) end

    is_/smb: BOOLEAN is do Result:=(value=/smb) end

    is_/srv: BOOLEAN is do Result:=(value=/srv) end

    is_/sys: BOOLEAN is do Result:=(value=/sys) end

    is_/tmp: BOOLEAN is do Result:=(value=/tmp) end

    is_/usr: BOOLEAN is do Result:=(value=/usr) end

    is_/var: BOOLEAN is do Result:=(value=/var) end

    is_/vmlinuz: BOOLEAN is do Result:=(value=/vmlinuz) end

    is_/vmlinuz.old: BOOLEAN is do Result:=(value=/vmlinuz.old) end

    is_is: BOOLEAN is do Result:=(value=is) end

    is_it: BOOLEAN is do Result:=(value=it) end

    is_removable?: BOOLEAN is do Result:=(value=removable?) end

    is_*/: BOOLEAN is do Result:=(value=*/) end

    is_gtk_accel_mask: BOOLEAN is do Result:=(value=gtk_accel_mask) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_0x07: BOOLEAN is do Result:=(value=0x07) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gtk_accel_visible) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=0) or else
                    (a_value=/bin) or else
                    (a_value=/boot) or else
                    (a_value=/cdrom) or else
                    (a_value=/dev) or else
                    (a_value=/etc) or else
                    (a_value=/home) or else
                    (a_value=/initrd.img) or else
                    (a_value=/initrd.img.old) or else
                    (a_value=/lib) or else
                    (a_value=/lost+found) or else
                    (a_value=/media) or else
                    (a_value=/mnt) or else
                    (a_value=/net) or else
                    (a_value=/opt) or else
                    (a_value=/proc) or else
                    (a_value=/root) or else
                    (a_value=/sbin) or else
                    (a_value=/smb) or else
                    (a_value=/srv) or else
                    (a_value=/sys) or else
                    (a_value=/tmp) or else
                    (a_value=/usr) or else
                    (a_value=/var) or else
                    (a_value=/vmlinuz) or else
                    (a_value=/vmlinuz.old) or else
                    (a_value=display) or else
                    (a_value=in) or else
                    (a_value=gtkaccellabel?) or else
                    (a_value=*/) or else
                    (a_value=gtk_accel_locked) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=1) or else
                    (a_value=/bin) or else
                    (a_value=/boot) or else
                    (a_value=/cdrom) or else
                    (a_value=/dev) or else
                    (a_value=/etc) or else
                    (a_value=/home) or else
                    (a_value=/initrd.img) or else
                    (a_value=/initrd.img.old) or else
                    (a_value=/lib) or else
                    (a_value=/lost+found) or else
                    (a_value=/media) or else
                    (a_value=/mnt) or else
                    (a_value=/net) or else
                    (a_value=/opt) or else
                    (a_value=/proc) or else
                    (a_value=/root) or else
                    (a_value=/sbin) or else
                    (a_value=/smb) or else
                    (a_value=/srv) or else
                    (a_value=/sys) or else
                    (a_value=/tmp) or else
                    (a_value=/usr) or else
                    (a_value=/var) or else
                    (a_value=/vmlinuz) or else
                    (a_value=/vmlinuz.old) or else
                    (a_value=is) or else
                    (a_value=it) or else
                    (a_value=removable?) or else
                    (a_value=*/) or else
                    (a_value=gtk_accel_mask) or else
                    (a_value==) or else
                    (a_value=0x07) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gtk_accel_visible: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_ACCEL_VISIBLE"
         end

    =: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "="
         end

    1: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "<<"
         end

    0: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "0"
         end

    /bin: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/bin"
         end

    /boot: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/boot"
         end

    /cdrom: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/cdrom"
         end

    /dev: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/dev"
         end

    /etc: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/etc"
         end

    /home: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/home"
         end

    /initrd.img: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/initrd.img"
         end

    /initrd.img.old: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/initrd.img.old"
         end

    /lib: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/lib"
         end

    /lost+found: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/lost+found"
         end

    /media: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/media"
         end

    /mnt: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/mnt"
         end

    /net: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/net"
         end

    /opt: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/opt"
         end

    /proc: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/proc"
         end

    /root: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/root"
         end

    /sbin: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/sbin"
         end

    /smb: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/smb"
         end

    /srv: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/srv"
         end

    /sys: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/sys"
         end

    /tmp: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/tmp"
         end

    /usr: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/usr"
         end

    /var: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/var"
         end

    /vmlinuz: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/vmlinuz"
         end

    /vmlinuz.old: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/vmlinuz.old"
         end

    display: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "display"
         end

    in: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "in"
         end

    gtkaccellabel?: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GtkAccelLabel?"
         end

    */: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "*/"
         end

    gtk_accel_locked: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_ACCEL_LOCKED"
         end

    =: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "="
         end

    1: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "<<"
         end

    1: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "1"
         end

    /bin: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/bin"
         end

    /boot: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/boot"
         end

    /cdrom: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/cdrom"
         end

    /dev: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/dev"
         end

    /etc: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/etc"
         end

    /home: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/home"
         end

    /initrd.img: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/initrd.img"
         end

    /initrd.img.old: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/initrd.img.old"
         end

    /lib: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/lib"
         end

    /lost+found: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/lost+found"
         end

    /media: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/media"
         end

    /mnt: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/mnt"
         end

    /net: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/net"
         end

    /opt: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/opt"
         end

    /proc: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/proc"
         end

    /root: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/root"
         end

    /sbin: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/sbin"
         end

    /smb: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/smb"
         end

    /srv: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/srv"
         end

    /sys: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/sys"
         end

    /tmp: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/tmp"
         end

    /usr: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/usr"
         end

    /var: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/var"
         end

    /vmlinuz: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/vmlinuz"
         end

    /vmlinuz.old: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "/vmlinuz.old"
         end

    is: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "is"
         end

    it: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "it"
         end

    removable?: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "removable?"
         end

    */: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "*/"
         end

    gtk_accel_mask: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_ACCEL_MASK"
         end

    =: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "="
         end

    0x07: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "0x07"
         end

end -- class GTK_ACCEL_FLAGS

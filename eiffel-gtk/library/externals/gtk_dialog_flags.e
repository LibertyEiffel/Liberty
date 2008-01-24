indexing
	description: "Enum GtkDialogFlags"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gtk_dialog_flags.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GTK_DIALOG_FLAGS
       -- Enum GtkDialogFlags

insert ENUM

creation set_gtk_dialog_modal

feature -- Setters

    set_gtk_dialog_modal is 
       do
          value := gtk_dialog_modal 
       ensure is_gtk_dialog_modal 
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

    set_call is 
       do
          value := call 
       ensure is_call 
       end

    set_gtk_window_set_modal is 
       do
          value := gtk_window_set_modal 
       ensure is_gtk_window_set_modal 
       end

    set_(win is 
       do
          value := (win 
       ensure is_(win 
       end

    set_true) is 
       do
          value := true) 
       ensure is_true) 
       end

    set_*/ is 
       do
          value := */ 
       ensure is_*/ 
       end

    set_gtk_dialog_destroy_with_parent is 
       do
          value := gtk_dialog_destroy_with_parent 
       ensure is_gtk_dialog_destroy_with_parent 
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

    set_call is 
       do
          value := call 
       ensure is_call 
       end

    set_gtk_window_set_destroy_with_parent is 
       do
          value := gtk_window_set_destroy_with_parent 
       ensure is_gtk_window_set_destroy_with_parent 
       end

    set_() is 
       do
          value := () 
       ensure is_() 
       end

    set_*/ is 
       do
          value := */ 
       ensure is_*/ 
       end

    set_gtk_dialog_no_separator is 
       do
          value := gtk_dialog_no_separator 
       ensure is_gtk_dialog_no_separator 
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

    set_2 is 
       do
          value := 2 
       ensure is_2 
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

    set_no is 
       do
          value := no 
       ensure is_no 
       end

    set_separator is 
       do
          value := separator 
       ensure is_separator 
       end

    set_bar is 
       do
          value := bar 
       ensure is_bar 
       end

    set_above is 
       do
          value := above 
       ensure is_above 
       end

    set_buttons is 
       do
          value := buttons 
       ensure is_buttons 
       end

    set_*/ is 
       do
          value := */ 
       ensure is_*/ 
       end

feature -- Queries

    is_gtk_dialog_modal: BOOLEAN is do Result:=(value=gtk_dialog_modal) end

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

    is_call: BOOLEAN is do Result:=(value=call) end

    is_gtk_window_set_modal: BOOLEAN is do Result:=(value=gtk_window_set_modal) end

    is_(win: BOOLEAN is do Result:=(value=(win) end

    is_true): BOOLEAN is do Result:=(value=true)) end

    is_*/: BOOLEAN is do Result:=(value=*/) end

    is_gtk_dialog_destroy_with_parent: BOOLEAN is do Result:=(value=gtk_dialog_destroy_with_parent) end

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

    is_call: BOOLEAN is do Result:=(value=call) end

    is_gtk_window_set_destroy_with_parent: BOOLEAN is do Result:=(value=gtk_window_set_destroy_with_parent) end

    is_(): BOOLEAN is do Result:=(value=()) end

    is_*/: BOOLEAN is do Result:=(value=*/) end

    is_gtk_dialog_no_separator: BOOLEAN is do Result:=(value=gtk_dialog_no_separator) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_2: BOOLEAN is do Result:=(value=2) end

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

    is_no: BOOLEAN is do Result:=(value=no) end

    is_separator: BOOLEAN is do Result:=(value=separator) end

    is_bar: BOOLEAN is do Result:=(value=bar) end

    is_above: BOOLEAN is do Result:=(value=above) end

    is_buttons: BOOLEAN is do Result:=(value=buttons) end

    is_*/: BOOLEAN is do Result:=(value=*/) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gtk_dialog_modal) or else
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
                    (a_value=call) or else
                    (a_value=gtk_window_set_modal) or else
                    (a_value=(win) or else
                    (a_value=true)) or else
                    (a_value=*/) or else
                    (a_value=gtk_dialog_destroy_with_parent) or else
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
                    (a_value=call) or else
                    (a_value=gtk_window_set_destroy_with_parent) or else
                    (a_value=()) or else
                    (a_value=*/) or else
                    (a_value=gtk_dialog_no_separator) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=2) or else
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
                    (a_value=no) or else
                    (a_value=separator) or else
                    (a_value=bar) or else
                    (a_value=above) or else
                    (a_value=buttons) or else
                    (a_value=*/) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gtk_dialog_modal: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_DIALOG_MODAL"
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

    call: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "call"
         end

    gtk_window_set_modal: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "gtk_window_set_modal"
         end

    (win: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "(win"
         end

    true): INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "TRUE)"
         end

    */: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "*/"
         end

    gtk_dialog_destroy_with_parent: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_DIALOG_DESTROY_WITH_PARENT"
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

    call: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "call"
         end

    gtk_window_set_destroy_with_parent: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "gtk_window_set_destroy_with_parent"
         end

    (): INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "()"
         end

    */: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "*/"
         end

    gtk_dialog_no_separator: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_DIALOG_NO_SEPARATOR"
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

    2: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "2"
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

    no: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "no"
         end

    separator: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "separator"
         end

    bar: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "bar"
         end

    above: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "above"
         end

    buttons: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "buttons"
         end

    */: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "*/"
         end

end -- class GTK_DIALOG_FLAGS

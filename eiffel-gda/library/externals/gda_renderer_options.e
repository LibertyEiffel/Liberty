indexing
	description: "Enum GdaRendererOptions"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_renderer_options.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_RENDERER_OPTIONS
       -- Enum GdaRendererOptions

insert ENUM

creation set_gda_renderer_extra_pretty_sql

feature -- Setters

    set_gda_renderer_extra_pretty_sql is 
       do
          value := gda_renderer_extra_pretty_sql 
       ensure is_gda_renderer_extra_pretty_sql 
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

    set_gda_renderer_params_as_detailed is 
       do
          value := gda_renderer_params_as_detailed 
       ensure is_gda_renderer_params_as_detailed 
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

    set_gda_renderer_error_if_default is 
       do
          value := gda_renderer_error_if_default 
       ensure is_gda_renderer_error_if_default 
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

    set_gda_renderer_fields_no_target_alias is 
       do
          value := gda_renderer_fields_no_target_alias 
       ensure is_gda_renderer_fields_no_target_alias 
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

    set_3 is 
       do
          value := 3 
       ensure is_3 
       end

    set_gda_renderer_params_as_colon is 
       do
          value := gda_renderer_params_as_colon 
       ensure is_gda_renderer_params_as_colon 
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

    set_4/* is 
       do
          value := 4/* 
       ensure is_4/* 
       end

    set_params is 
       do
          value := params 
       ensure is_params 
       end

    set_as is 
       do
          value := as 
       ensure is_as 
       end

    set_:param_name is 
       do
          value := :param_name 
       ensure is_:param_name 
       end

    set_*/ is 
       do
          value := */ 
       ensure is_*/ 
       end

    set_gda_renderer_params_as_dollar is 
       do
          value := gda_renderer_params_as_dollar 
       ensure is_gda_renderer_params_as_dollar 
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

    set_5 is 
       do
          value := 5 
       ensure is_5 
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

    set_params is 
       do
          value := params 
       ensure is_params 
       end

    set_as is 
       do
          value := as 
       ensure is_as 
       end

    set_$1 is 
       do
          value := $1 
       ensure is_$1 
       end

    set_$2 is 
       do
          value := $2 
       ensure is_$2 
       end

    set_etc is 
       do
          value := etc 
       ensure is_etc 
       end

    set_(starts is 
       do
          value := (starts 
       ensure is_(starts 
       end

    set_at is 
       do
          value := at 
       ensure is_at 
       end

    set_$1) is 
       do
          value := $1) 
       ensure is_$1) 
       end

    set_*/ is 
       do
          value := */ 
       ensure is_*/ 
       end

feature -- Queries

    is_gda_renderer_extra_pretty_sql: BOOLEAN is do Result:=(value=gda_renderer_extra_pretty_sql) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_0: BOOLEAN is do Result:=(value=0) end

    is_gda_renderer_params_as_detailed: BOOLEAN is do Result:=(value=gda_renderer_params_as_detailed) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_gda_renderer_error_if_default: BOOLEAN is do Result:=(value=gda_renderer_error_if_default) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_2: BOOLEAN is do Result:=(value=2) end

    is_gda_renderer_fields_no_target_alias: BOOLEAN is do Result:=(value=gda_renderer_fields_no_target_alias) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_3: BOOLEAN is do Result:=(value=3) end

    is_gda_renderer_params_as_colon: BOOLEAN is do Result:=(value=gda_renderer_params_as_colon) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_4/*: BOOLEAN is do Result:=(value=4/*) end

    is_params: BOOLEAN is do Result:=(value=params) end

    is_as: BOOLEAN is do Result:=(value=as) end

    is_:param_name: BOOLEAN is do Result:=(value=:param_name) end

    is_*/: BOOLEAN is do Result:=(value=*/) end

    is_gda_renderer_params_as_dollar: BOOLEAN is do Result:=(value=gda_renderer_params_as_dollar) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_5: BOOLEAN is do Result:=(value=5) end

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

    is_params: BOOLEAN is do Result:=(value=params) end

    is_as: BOOLEAN is do Result:=(value=as) end

    is_$1: BOOLEAN is do Result:=(value=$1) end

    is_$2: BOOLEAN is do Result:=(value=$2) end

    is_etc: BOOLEAN is do Result:=(value=etc) end

    is_(starts: BOOLEAN is do Result:=(value=(starts) end

    is_at: BOOLEAN is do Result:=(value=at) end

    is_$1): BOOLEAN is do Result:=(value=$1)) end

    is_*/: BOOLEAN is do Result:=(value=*/) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_renderer_extra_pretty_sql) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=0) or else
                    (a_value=gda_renderer_params_as_detailed) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=1) or else
                    (a_value=gda_renderer_error_if_default) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=2) or else
                    (a_value=gda_renderer_fields_no_target_alias) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=3) or else
                    (a_value=gda_renderer_params_as_colon) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=4/*) or else
                    (a_value=params) or else
                    (a_value=as) or else
                    (a_value=:param_name) or else
                    (a_value=*/) or else
                    (a_value=gda_renderer_params_as_dollar) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=5) or else
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
                    (a_value=params) or else
                    (a_value=as) or else
                    (a_value=$1) or else
                    (a_value=$2) or else
                    (a_value=etc) or else
                    (a_value=(starts) or else
                    (a_value=at) or else
                    (a_value=$1)) or else
                    (a_value=*/) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_renderer_extra_pretty_sql: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "GDA_RENDERER_EXTRA_PRETTY_SQL"
         end

    =: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "="
         end

    1: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "<<"
         end

    0: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "0"
         end

    gda_renderer_params_as_detailed: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "GDA_RENDERER_PARAMS_AS_DETAILED"
         end

    =: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "="
         end

    1: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "<<"
         end

    1: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "1"
         end

    gda_renderer_error_if_default: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "GDA_RENDERER_ERROR_IF_DEFAULT"
         end

    =: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "="
         end

    1: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "<<"
         end

    2: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "2"
         end

    gda_renderer_fields_no_target_alias: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "GDA_RENDERER_FIELDS_NO_TARGET_ALIAS"
         end

    =: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "="
         end

    1: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "<<"
         end

    3: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "3"
         end

    gda_renderer_params_as_colon: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "GDA_RENDERER_PARAMS_AS_COLON"
         end

    =: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "="
         end

    1: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "<<"
         end

    4/*: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "4/*"
         end

    params: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "params"
         end

    as: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "as"
         end

    :param_name: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias ":param_name"
         end

    */: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "*/"
         end

    gda_renderer_params_as_dollar: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "GDA_RENDERER_PARAMS_AS_DOLLAR"
         end

    =: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "="
         end

    1: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "<<"
         end

    5: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "5"
         end

    /bin: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/bin"
         end

    /boot: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/boot"
         end

    /cdrom: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/cdrom"
         end

    /dev: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/dev"
         end

    /etc: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/etc"
         end

    /home: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/home"
         end

    /initrd.img: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/initrd.img"
         end

    /initrd.img.old: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/initrd.img.old"
         end

    /lib: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/lib"
         end

    /lost+found: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/lost+found"
         end

    /media: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/media"
         end

    /mnt: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/mnt"
         end

    /net: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/net"
         end

    /opt: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/opt"
         end

    /proc: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/proc"
         end

    /root: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/root"
         end

    /sbin: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/sbin"
         end

    /smb: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/smb"
         end

    /srv: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/srv"
         end

    /sys: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/sys"
         end

    /tmp: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/tmp"
         end

    /usr: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/usr"
         end

    /var: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/var"
         end

    /vmlinuz: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/vmlinuz"
         end

    /vmlinuz.old: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "/vmlinuz.old"
         end

    params: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "params"
         end

    as: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "as"
         end

    $1: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "$1"
         end

    $2: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "$2"
         end

    etc: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "etc"
         end

    (starts: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "(starts"
         end

    at: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "at"
         end

    $1): INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "$1)"
         end

    */: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-renderer.h"
         alias "*/"
         end

end -- class GDA_RENDERER_OPTIONS

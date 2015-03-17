class AUX_WOJ01_REF

inherit
   AUX_WOJ01_DEF

create {ANY}
   make

feature {ANY}
   s: STRING

   make
      do
         create s.make(0)
      end

   set (i: INTEGER)
      do
         s := i.out
      end

end -- class AUX_WOJ01_REF

class AUX_WOJ01_REF

inherit
   AUX_WOJ01_DEF

create {ANY}
   make

feature {ANY}
   s: STRING

   make is
      do
         create s.make(0)
      end

   set (i: INTEGER) is
      do
         s := i.out
      end

end -- class AUX_WOJ01_REF

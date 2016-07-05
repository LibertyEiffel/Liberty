deferred class AUX_A [ G ]

inherit
   ARRAY [ G ]
      rename
         make as array_make
      end

-------------------------------------------------------------------------------
feature {ANY}     -- Public features

   make is
      deferred
      end
-------------------------------------------------------------------------------
end         -- class AUX_A

deferred class EDC_TYPED_RECORD[D_ -> EDC_DESCRIPTOR[K_], K_ -> TUPLE]

inherit
   EDC_RECORD

feature {ANY}
   descriptor: D_

feature {ANY}
   delete
      do
         descriptor.delete(Current)
      end

invariant
   descriptor /= Void

end

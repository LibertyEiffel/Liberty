-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class EIFFELTEST_NETWORK

feature {ANY}
   port: INTEGER

feature {}
   access: like access_
      local
         address: IPV4_ADDRESS
      do
         Result := access_
         if Result = Void then
            create address.make(127,0,0,1)
            create Result.make(address, port, True)
            access_ := Result
            access_.set_address_reuse(True)
         end
      end

   access_: TCP_ACCESS
   port_: INTEGER

   port_is_invariant: BOOLEAN
      do
         if port_ = 0 then
            port_ := port
         else
            Result := port_ = port
         end
      end

invariant
   port > 0
   port_is_invariant

end -- class EIFFELTEST_NETWORK

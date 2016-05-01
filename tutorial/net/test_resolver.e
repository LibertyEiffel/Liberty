class TEST_RESOLVER
   --
   -- Originally written by Serge Romanchenko <se@sir.nensi.net>
   --

create {ANY}
   make

feature {ANY}
   make
      local
         h: LOCALHOST
      do
         create h.make
         io.put_line("Your hostname is: ..... " + h.host_name)
         io.put_line("Your domainname is: ... " + h.domain_name)
         io.put_line("So, your FQDN is:...... " + h.fqdn)
         -- NOTE: only root has permission to do the following :)

         h.set_host_name("newname")
         if h.last_error /= Void then
            io.put_line("There was an error while trying to set the new hostname:")
            io.put_line(h.last_error)
         end

         h.set_domain_name("new.domain.name")
         if h.last_error /= Void then
            io.put_line("There was an error while trying to set the new domainname:")
            io.put_line(h.last_error)
         end
      end

end -- class TEST_RESOLVER

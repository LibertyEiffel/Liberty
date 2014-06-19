class EXAMPLE_DEBUG

create {ANY}
   make

feature {}
   make
      local
         a: AUX_EXAMPLE_DEBUG_A; b: AUX_EXAMPLE_DEBUG_B; c: AUX_EXAMPLE_DEBUG_C
      do
         debug ("trace 1")
            -- Not executed (Default key overridden by per-class option)
            io.put_string(generating_type)
            io.put_string(": Debug 1%N")
         end
         debug ("trace 2")
            -- Not executed (Default key overridden by per-class option)
            io.put_string(generating_type)
            io.put_string(": Debug 2%N")
         end
         debug ("trace 3")
            -- Executed (Per-class option)
            io.put_string(generating_type)
            io.put_string(": Debug 3%N")
         end
         debug ("trace 4")
            -- Executed (Per-class option)
            io.put_string(generating_type)
            io.put_string(": Debug 4%N")
         end
         debug ("trace 5")
            -- Not executed (Key not set for this cluster)
            io.put_string(generating_type)
            io.put_string(": Debug 5%N")
         end
         debug ("trace 6")
            -- Not executed (Key not set for this cluster)
            io.put_string(generating_type)
            io.put_string(": Debug 6%N")
         end
         debug ("trace 7")
            -- Not executed (Key not set for this class)
            io.put_string(generating_type)
            io.put_string(": Debug 7%N")
         end
         create a.make
         create b.make
         create c.make
      end

end -- class EXAMPLE_DEBUG

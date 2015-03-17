class AUX_EXAMPLE_DEBUG_B

create {ANY}
   make

feature {}
   make
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
            -- Not executed (Key not set for this class)
            io.put_string(generating_type)
            io.put_string(": Debug 3%N")
         end
         debug ("trace 4")
            -- Not executed (Key not set for this class)
            io.put_string(generating_type)
            io.put_string(": Debug 4%N")
         end
         debug ("trace 5")
            -- Not executed (Per-cluster key overridden by per-class option)
            io.put_string(generating_type)
            io.put_string(": Debug 5%N")
         end
         debug ("trace 6")
            -- Not executed (Per-cluster key overridden by per-class option)
            io.put_string(generating_type)
            io.put_string(": Debug 6%N")
         end
         debug ("trace 7")
            -- Executed (Per-class option)
            io.put_string(generating_type)
            io.put_string(": Debug 7%N")
         end
      end

end -- class AUX_EXAMPLE_DEBUG_B

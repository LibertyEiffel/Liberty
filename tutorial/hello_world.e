class HELLO_WORLD
   --
   -- The "Hello World" example.
   --
   -- To compile type command: se c hello_world
   --
   -- Then, run the generated executable file named "a.out" or "hello_world.exe"
   -- depending of your favorite operating system / C-compiler.
   --
   -- To compile an optimized version type : se c hello_world -boost -O2
   --

create {ANY}
   main

feature {ANY}
   main
      do
         io.put_string("Hello World.%N")
      end

end -- class HELLO_WORLD

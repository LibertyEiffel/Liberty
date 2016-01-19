These are preliminary wrappers for libglade. Add these files to the
loadpath/ACE file and use the following:

   c_compiler_options : "$(pkg-config --cflags gtk+-2.0 libglade-2.0)"
   linker_options : "$(pkg-config --libs gtk+-2.0 libglade-2.0)"

Signal autoconnection is not working yet (and I am not sure if it will ever
be!). So you will need to manually connect signals.

Make sure that libglade2.0 and libglade2.0-dev are installed on your
machine.

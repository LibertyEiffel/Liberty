****** Warning: Actually, `Void' has no accurate type. Keep in
mind that `Void' is just a way to denote the default value for
a type or to denote the lack of an object. One can use `Void'
as the right-hand-side of an assignment or to replace some actual
argument. (See "http://wiki.liberty-eiffel.org/index.php/Void"
for details.) At time being, the type ANY will be used for this
occurrence `Void'. Please update your code with a more accurate
expression, may be by adding an extra non-initialized local variable.

Line 14 column 16 in BAD_VOID2 (/home/et/Liberty/test/language/error_warning_msg/bad_void2.e):
         c := [Void]
               ^    
------
****** Warning: Using `Void' as an item of a manifest TUPLE is
not good practice because `Void' has no accurate type. You can
work around by using an extra non-initialized local variable of
some accurate type. Another work around is to use an explicit
creation of the TUPLE. As an example `create {TUPLE[STRING,ANY]}.make_2(Void,Void)'
can be used to create a TUPLE[STRING,ANY] with default values.

Line 14 column 16 in BAD_VOID2 (/home/et/Liberty/test/language/error_warning_msg/bad_void2.e):
         c := [Void]
               ^    
------
****** Fatal Error:  Bad assignment. Cannot assign `[Void]' which
is of type TUPLE[ANY] into `c' which is of type TUPLE[STRING].

The source lines relevant to this message are the following:

Line 14 columns 10, 15 in BAD_VOID2 (/home/et/Liberty/test/language/error_warning_msg/bad_void2.e):
         c := [Void]
         ^    ^     
------

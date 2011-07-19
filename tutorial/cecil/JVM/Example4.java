import root4.*;

public class Example4 {

    public static void main(String[] args) {
	/* To run this example, procede like this :
	   
           compile_to_jvm root4
           /bin/rm -f root4.class
           javac Example4.java
           java Example4
	   
	*/

	root4 root;
	string eiffel_string;

	/* To initialize the Eiffel runtime :
	 */
	_any._initialize_eiffel_runtime(args);
  
	/* Creation of the root object :
	 */
	root = new root4();
	eiffel_string = ( string )( root.get_string() );
	root.put_string( eiffel_string );

	// print the capacity and count of the string.
	System.out.println( "eiffel_string capacity: " +
			    eiffel_string.capacity +
			    ", count: " +
			    eiffel_string.count );

	// Build a Java String from the Eiffel string, and print it.
	String eiffel_string_in_java = new String( eiffel_string.storage,
						   0,
						   eiffel_string.count );
	System.out.println( "Java printing the converted eiffel: '" +
			    eiffel_string_in_java + "'" );

	// Build and Eiffel string from a Java String, and print it from Eiffel.
	// Note that the byte buffer does not have to be null terminated.
	String js = "Hello from Java";
	string new_eiffel_string = new string();
	new_eiffel_string.storage = js.getBytes();
	new_eiffel_string.capacity = new_eiffel_string.storage.length;
	new_eiffel_string.count = new_eiffel_string.storage.length;
	
	root.put_string( new_eiffel_string );
    }
}

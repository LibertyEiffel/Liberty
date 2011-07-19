import root3.*;

public class Example3 {
    /* To run this example, procede like this :

       compile_to_jvm root3
       /bin/rm -f root3.class
       javac Example3.java
       java Example3
       
    */
    public static void main(String[] args) {
	root3 root;
	string eiffel_string;
	
	/* To initialize the Eiffel runtime :
	 */
	_any._initialize_eiffel_runtime(args);
	
	/* Creation of the root object :
	 */
	root = new root3();
	
	eiffel_string = (string)(root.get_string());
	
	root.put_string(eiffel_string);
	
  }
}

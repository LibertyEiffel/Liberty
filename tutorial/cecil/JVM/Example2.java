import root2.*;

public class Example2 {
    /* To run this example, procede like this :

           compile_to_jvm root2
           /bin/rm -f root2.class
           javac Example2.java
           java Example2

    */
  public static void main(String[] args) {
      root2 root;
      string eiffel_string;

      /* To initialize the Eiffel runtime :
       */
      _any._initialize_eiffel_runtime(args);

      /* Creation of the root object :
       */
      root = new root2();

      eiffel_string = (string)(root.get_string());

      root.put_string(eiffel_string);

  }
}

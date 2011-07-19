import hello_world._any;
import hello_world.hello_world;

public class Example1 {
    /* To run this example, procede like this :

           compile_to_jvm hello_world
           /bin/rm -f hello_world.class
           javac Example1.java
           java Example1

    */
  public static void main(String[] args) {
      hello_world root;

      /* To initialize the Eiffel runtime :
       */
      _any._initialize_eiffel_runtime(args);

      /* Creation of the root object :
       */
      root = new hello_world();

      /* Launching the root procedure :
       */
      root.make();

      /* Launching again the root procedure :
       */
      root.make();
  }
}

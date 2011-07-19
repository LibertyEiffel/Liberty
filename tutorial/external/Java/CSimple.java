/* CSimple.java */

import example5._any;
import example5.example5;

class CSimple
{
	
   public static void main( java.lang.String[] args )
   {
      
// initialize the Eiffel runtime
      
		java.lang.String a[] = new java.lang.String[0]; // no command line args
		_any._initialize_eiffel_runtime( a );

// create an instance of example5

		example5 theE = new example5();
		
// note that the Eiffel creation procedure has not been called, and that 
// Eiffel object attributes can be read and written from Java

 		System.out.println( "value of example5.eiffel_integer: " + theE.eiffel_integer );
 		theE.eiffel_integer = 2;
 		System.out.println( "value of example5.eiffel_integer: " + theE.eiffel_integer );

// now call the Eiffel creation procedure

		theE.make();
 		System.out.println( "value of example5.eiffel_integer: " + theE.eiffel_integer );

// create an instance of CSimple

      CSimple csimple = new CSimple();
      
// call the proc1 procedure with argument 13

      csimple.proc1( theE, 13 );
 		System.out.println( "value of example5.eiffel_integer: " + theE.eiffel_integer );

// call the proc1 procedure with argument -11

      csimple.proc1( theE, -11 );
 		System.out.println( "value of example5.eiffel_integer: " + theE.eiffel_integer );
      
// call the proc2 procedure with argument 13

      csimple.proc2( theE, 103 );
 		System.out.println( "value of example5.eiffel_integer: " + theE.eiffel_integer );

// call the proc2 procedure with argument -11

      csimple.proc2( theE, -101 );
 		System.out.println( "value of example5.eiffel_integer: " + theE.eiffel_integer );
//      
 		System.out.println( "main() in CSimple ended." );
   }

   public CSimple()
   {
   }


   public void proc1( example5 theE, int i )
   {
      try
      {
         theE.proc1( i );
      }
      catch ( java.lang.Exception e )
      {
   		System.out.println( "Exception was thrown: " + e.getMessage() );
      }
   }
   
   public void proc2( example5 theE, int i )
   {
      try
      {
         theE.proc2( i );
      }
      catch ( java.lang.Exception e )
      {
   		System.out.println( "Exception was thrown: " + e.getMessage() );
      }
   }
   
}

/* End of file */

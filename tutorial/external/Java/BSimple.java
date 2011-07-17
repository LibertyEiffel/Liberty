/* BSimple.java */

class BSimple
{
	
   public BSimple()
   {
		theInteger = 1;
   }


   public void proc( int i ) throws java.lang.Exception
   {
      java.lang.Exception e;
      
      if ( i >= 0 )
      {
         theInteger = i;
      }
      else
      {
         e = new java.lang.Exception( "exception in BSimple.proc: i=" + i + " < 0" );
         throw( e );
      }

   }
   
	public int theInteger;

}

/* End of file */

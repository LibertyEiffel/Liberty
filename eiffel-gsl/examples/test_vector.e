indexing
	description: ""
	copyright: "(C) 2006 Raphael Mack <rmack@student.ethz.ch>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class TEST_VECTOR
creation make
feature make is
		local i: INTEGER
		do
			create vector_64.make (10)
			create vector_32.make (10)
			print ("Foo%N")
			from i:=0 until i>=10 loop
				vector_64.put (0.123456789 * i, i)
				vector_32.put ((0.123456789 * i).force_to_real_32, i)
				i := i + 1
			end

			print ("Bar%N")
			from i:=0 until i>=10 loop
				-- Shame on Rapha for just copiing from Paolo
				-- provide something as easy but performing
				print ("v64(" + i.out + ") = " + vector_64.item(i).out + "%N")
				print ("v32(" + i.out + ") = " + vector_32.item(i).out + "%N")
				i:=i+1
			end

--			try_to_access_outside_boundaries
--			print ("Foo bar%N")

--			create matrix.from_collection ( {ARRAY2[REAL] 0,3, 0,3,
--														<< 1.0, 2.0, 3.0, 4.0;
--															2.0, 3.0, 4.0, 5.0;
--															0.0, 0.0, 9.0, 8.0;
--															4.0, 4.0, 3.0, 3.0>>})
		end

	vector_64: GSL_VECTOR_64
	vector_32: GSL_VECTOR_32

--	try_to_access_outside_boundaries is
--		local tried: BOOLEAN
--		do
--			if not tried then print (matrix.item(20,20).out) end
--		rescue
--			print ("Shameful access outside buondaries!%N")
--			tried := True
--			retry
--		end
	
	--TODO: Eiffelize those :
	-- 			The next program shows how to write a matrix to a file.

	-- #include <stdio.h>
	-- #include <gsl/gsl_matrix.h>

	-- int
	-- main (void)
	-- {
	--   int i, j, k = 0; 
	--   gsl_matrix * m = gsl_matrix_alloc (100, 100);
	--   gsl_matrix * a = gsl_matrix_alloc (100, 100);
  
	--   for (i = 0; i < 100; i++)
	-- 	for (j = 0; j < 100; j++)
	-- 		gsl_matrix_set (m, i, j, 0.23 + i + j);

	--   {  
	-- 	FILE * f = fopen ("test.dat", "wb");
	-- 	gsl_matrix_fwrite (f, m);
	-- 	fclose (f);
	--   }

	--   {  
	-- 	FILE * f = fopen ("test.dat", "rb");
	-- 	gsl_matrix_fread (f, a);
	-- 	fclose (f);
	--   }

	--   for (i = 0; i < 100; i++)
	-- 	for (j = 0; j < 100; j++)
	-- 		{
	-- 		  double mij = gsl_matrix_get (m, i, j);
	-- 		  double aij = gsl_matrix_get (a, i, j);
	-- 		  if (mij != aij) k++;
	-- 		}

	--   printf ("differences = %d (should be zero)\n", k);
	--   return (k > 0);
	-- }

	-- After running this program the file `test.dat' should contain the elements of m, written in binary format. The matrix which is read back in using the function gsl_matrix_fread should be exactly equal to the original matrix.

	-- The following program demonstrates the use of vector views. The program computes the column norms of a matrix.

	-- #include <math.h>
	-- #include <stdio.h>
	-- #include <gsl/gsl_matrix.h>
	-- #include <gsl/gsl_blas.h>

	-- int
	-- main (void)
	-- {
	--   size_t i,j;

	--   gsl_matrix *m = gsl_matrix_alloc (10, 10);

	--   for (i = 0; i < 10; i++)
	-- 	for (j = 0; j < 10; j++)
	-- 		gsl_matrix_set (m, i, j, sin (i) + cos (j));

	--   for (j = 0; j < 10; j++)
	-- 	{
	-- 		gsl_vector_view column = gsl_matrix_column (m, j);
	-- 		double d;

	-- 		d = gsl_blas_dnrm2 (&column.vector);

	-- 		printf ("matrix column %d, norm = %g\n", j, d);
	-- 	}

	--   gsl_matrix_free (m);

	--   return 0;
	-- }

	-- Here is the output of the program,

	-- $ ./a.out
	-- matrix column 0, norm = 4.31461
	-- matrix column 1, norm = 3.1205
	-- matrix column 2, norm = 2.19316
	-- matrix column 3, norm = 3.26114
	-- matrix column 4, norm = 2.53416
	-- matrix column 5, norm = 2.57281
	-- matrix column 6, norm = 4.20469
	-- matrix column 7, norm = 3.65202
	-- matrix column 8, norm = 2.08524
	-- matrix column 9, norm = 3.07313

	-- The results can be confirmed using GNU OCTAVE,

	-- $ octave
	-- GNU Octave, version 2.0.16.92
	-- octave> m = sin(0:9)' * ones(1,10) 
	-- 					+ ones(10,1) * cos(0:9); 
	-- octave> sqrt(sum(m.^2))
	-- ans =
	--   4.3146  3.1205  2.1932  3.2611  2.5342  2.5728
	--   4.2047  3.6520  2.0852  3.0731
end

			

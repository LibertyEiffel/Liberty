indexing
	description: "Real matrix."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	-- TODO: use all the return values of the functions. Currently discarded.
	
			-- TODO: Eiffelize this documentation: Matrices

			-- Matrices are defined by a gsl_matrix structure which
			-- describes a generalized slice of a block. Like a vector it
			-- represents a set of elements in an area of memory, but
			-- uses two indices instead of one.

			-- The gsl_matrix structure contains six components, the two
			-- dimensions of the matrix, a physical dimension, a pointer
			-- to the memory where the elements of the matrix are stored,
			-- data, a pointer to the block owned by the matrix block, if
			-- any, and an ownership flag, owner. The physical dimension
			-- determines the memory layout and can differ from the
			-- matrix dimension to allow the use of submatrices. 

			-- Matrices are stored in row-major order, meaning that each
			-- row of elements forms a contiguous block in memory. This
			-- is the standard "C-language ordering" of two-dimensional
			-- arrays. Note that FORTRAN stores arrays in column-major
			-- order. The number of rows is size1. The range of valid row
			-- indices runs from 0 to size1-1. Similarly size2 is the
			-- number of columns. The range of valid column indices runs
			-- from 0 to size2-1. The physical row dimension tda, or
			-- trailing dimension, specifies the size of a row of the
			-- matrix as laid out in memory.

			-- For example, in the following matrix size1 is 3, size2 is
			-- 4, and tda is 8. The physical memory layout of the matrix
			-- begins in the top left hand-corner and proceeds from left
			-- to right along each row in turn.

			-- 00 01 02 03 XX XX XX XX
			-- 10 11 12 13 XX XX XX XX
			-- 20 21 22 23 XX XX XX XX

			-- Each unused memory location is represented by "XX". The
			-- pointer data gives the location of the first element of
			-- the matrix in memory. The pointer block stores the
			-- location of the memory block in which the elements of the
			-- matrix are located (if any). If the matrix owns this block
			-- then the owner field is set to one and the block will be
			-- deallocated when the matrix is freed. If the matrix is
			-- only a slice of a block owned by another object then the
			-- owner field is zero and any underlying block will not be
			-- freed.

class GSL_MATRIX
inherit

	C_STRUCT rename make as allocate_struct redefine copy,dispose end
	GSL_MATRIX_EXTERNALS
	GSL_MATRIX_STRUCT
	
creation make, make_zero, from_collection
	
feature {NONE} -- Creation
	
	make (rows, columns: INTEGER) is
		require
			valid_rows: rows > 0
			valid_columns: columns > 0 
			-- Creates a matrix of size `rows' by `columns'. Matrix's elements are uninitialized
		do
			-- returns a pointer to a newly initialized matrix struct. A
			-- new block is allocated for the elements of the matrix, and
			-- stored in the block component of the matrix struct. The
			-- block is "owned" by the matrix, and will be deallocated
			-- when the matrix is deallocated.

			handle := gsl_matrix_alloc (rows,columns)
			
			-- The functions for allocating memory to a matrix follow the
			-- style of malloc and free. They also perform their own
			-- error checking. If there is insufficient memory available
			-- to allocate a vector then the functions call the GSL error
			-- handler (with an error number of GSL_ENOMEM) in addition
			-- to returning a null pointer. Thus if you use the library
			-- error handler to abort your program then it isn't
			-- necessary to check every alloc.
		end
	
	make_zero  (rows, columns: INTEGER) is
			-- Creates a matrix of size `rows' by `columns' and
			-- initializes all the elements of the matrix to zero.
		require
			valid_rows: rows > 0
			valid_columns: columns > 0 
		do
			handle :=  gsl_matrix_calloc (rows,columns)
		end
	
	from_collection (a_collection: COLLECTION2[REAL]) is
		require valid_collection: a_collection/=Void
		do
		ensure implemented: False
		end
feature {NONE} -- Disposing
	dispose is
		do
			gsl_matrix_free (handle)
			-- This function frees a previously allocated matrix m. If
			-- the matrix was created using gsl_matrix_alloc then the
			-- block underlying the matrix will also be deallocated. If
			-- the matrix has been created from another object then the
			-- memory is still owned by that object and will not be
			-- deallocated.
			handle := Null
		end
	
feature -- Accessing

	item (i, j: INTEGER): REAL is
			-- the (i,j)-th element of Current matrix m
		require
			is_valid_index (i,j)
		do
			-- If i or j lie outside the allowed range of 0 to n1-1 and 0
			-- to n2-1 then the error handler is invoked and 0 is
			-- returned.
			Result:=gsl_matrix_get (handle, i, j)
		end

	put (an_x: REAL; i,j: INTEGER) is
			-- Sets the value of the (i,j)-th element of Current matrix to `an_x'.
		require
			is_valid_index (i,j)
		do
			gsl_matrix_set (handle, i,j, an_x)
			-- This function sets the value of the (i,j)-th element of a matrix m to x. If i or j lies outside the allowed range of 0 to n1-1 and 0 to n2-1 then the error handler is invoked. 
		end

	-- Note: currently wrapping double * gsl_matrix_ptr (gsl_matrix *
	-- m, size_t i, size_t j) and const double * gsl_matrix_const_ptr
	-- (const gsl_matrix * m, size_t i, size_t j) seems not to be
	-- useful. Infact their docs says: "These functions return a
	-- pointer to the (i,j)-th element of a matrix m. If i or j lie
	-- outside the allowed range of 0 to n1-1 and 0 to n2-1 then the
	-- error handler is invoked and a null pointer is returned.". Paolo
	-- 2006-03-19

feature -- Initializing matrix elements
	set_all (an_x: REAL) is
			-- sets all the elements of Current matrix to the value `an_x'. 
		do
			gsl_matrix_set_all (handle, an_x)
		end

	set_zero is
			-- sets all the elements of the matrix to zero.
		do
			gsl_matrix_set_zero (handle)
		end

	set_identity is
			-- Sets the elements of the matrix to the corresponding
			-- elements of the identity matrix, m(i,j) = \delta(i,j),
			-- i.e. a unit diagonal with all off-diagonal elements
			-- zero. This applies to both square and rectangular
			-- matrices.
		do
			gsl_matrix_set_identity (handle)
		end

feature -- TODO: Reading and writing matrices

-- The library provides functions for reading and writing matrices to a file as binary data or formatted text.

-- Function: int gsl_matrix_fwrite (FILE * stream, const gsl_matrix * m)
-- 	This function writes the elements of the matrix m to the stream stream in binary format. The return value is 0 for success and GSL_EFAILED if there was a problem writing to the file. Since the data is written in the native binary format it may not be portable between different architectures. 

-- Function: int gsl_matrix_fread (FILE * stream, gsl_matrix * m)
-- 	This function reads into the matrix m from the open stream stream in binary format. The matrix m must be preallocated with the correct dimensions since the function uses the size of m to determine how many bytes to read. The return value is 0 for success and GSL_EFAILED if there was a problem reading from the file. The data is assumed to have been written in the native binary format on the same architecture. 

-- Function: int gsl_matrix_fprintf (FILE * stream, const gsl_matrix * m, const char * format)
-- 	This function writes the elements of the matrix m line-by-line to the stream stream using the format specifier format, which should be one of the %g, %e or %f formats for floating point numbers and %d for integers. The function returns 0 for success and GSL_EFAILED if there was a problem writing to the file. 

-- Function: int gsl_matrix_fscanf (FILE * stream, gsl_matrix * m)
-- 	This function reads formatted data from the stream stream into the matrix m. The matrix m must be preallocated with the correct dimensions since the function uses the size of m to determine how many numbers to read. The function returns 0 for success and GSL_EFAILED if there was a problem reading from the file. 

feature -- TODO: Matrix views

-- A matrix view is a temporary object, stored on the stack, which can be used to operate on a subset of matrix elements. Matrix views can be defined for both constant and non-constant matrices using separate types that preserve constness. A matrix view has the type gsl_matrix_view and a constant matrix view has the type gsl_matrix_const_view. In both cases the elements of the view can by accessed using the matrix component of the view object. A pointer gsl_matrix * or const gsl_matrix * can be obtained by taking the address of the matrix component with the & operator. In addition to matrix views it is also possible to create vector views of a matrix, such as row or column views.

-- Function: gsl_matrix_view gsl_matrix_submatrix (gsl_matrix * m, size_t k1, size_t k2, size_t n1, size_t n2)
-- Function: gsl_matrix_const_view gsl_matrix_const_submatrix (const gsl_matrix * m, size_t k1, size_t k2, size_t n1, size_t n2)
-- 	These functions return a matrix view of a submatrix of the matrix m. The upper-left element of the submatrix is the element (k1,k2) of the original matrix. The submatrix has n1 rows and n2 columns. The physical number of columns in memory given by tda is unchanged. Mathematically, the (i,j)-th element of the new matrix is given by,

-- 	m'(i,j) = m->data[(k1*m->tda + k2) + i*m->tda + j]

-- 	where the index i runs from 0 to n1-1 and the index j runs from 0 to n2-1.

-- 	The data pointer of the returned matrix struct is set to null if the combined parameters (i,j,n1,n2,tda) overrun the ends of the original matrix.

-- 	The new matrix view is only a view of the block underlying the existing matrix, m. The block containing the elements of m is not owned by the new matrix view. When the view goes out of scope the original matrix m and its block will continue to exist. The original memory can only be deallocated by freeing the original matrix. Of course, the original matrix should not be deallocated while the view is still in use.

-- 	The function gsl_matrix_const_submatrix is equivalent to gsl_matrix_submatrix but can be used for matrices which are declared const. 

-- Function: gsl_matrix_view gsl_matrix_view_array (double * base, size_t n1, size_t n2)
-- Function: gsl_matrix_const_view gsl_matrix_const_view_array (const double * base, size_t n1, size_t n2)
-- 	These functions return a matrix view of the array base. The matrix has n1 rows and n2 columns. The physical number of columns in memory is also given by n2. Mathematically, the (i,j)-th element of the new matrix is given by,

-- 	m'(i,j) = base[i*n2 + j]

-- 	where the index i runs from 0 to n1-1 and the index j runs from 0 to n2-1.

-- 	The new matrix is only a view of the array base. When the view goes out of scope the original array base will continue to exist. The original memory can only be deallocated by freeing the original array. Of course, the original array should not be deallocated while the view is still in use.

-- 	The function gsl_matrix_const_view_array is equivalent to gsl_matrix_view_array but can be used for matrices which are declared const. 

-- Function: gsl_matrix_view gsl_matrix_view_array_with_tda (double * base, size_t n1, size_t n2, size_t tda)
-- Function: gsl_matrix_const_view gsl_matrix_const_view_array_with_tda (const double * base, size_t n1, size_t n2, size_t tda)
-- 	These functions return a matrix view of the array base with a physical number of columns tda which may differ from the corresponding dimension of the matrix. The matrix has n1 rows and n2 columns, and the physical number of columns in memory is given by tda. Mathematically, the (i,j)-th element of the new matrix is given by,

-- 	m'(i,j) = base[i*tda + j]

-- 	where the index i runs from 0 to n1-1 and the index j runs from 0 to n2-1.

-- 	The new matrix is only a view of the array base. When the view goes out of scope the original array base will continue to exist. The original memory can only be deallocated by freeing the original array. Of course, the original array should not be deallocated while the view is still in use.

-- 	The function gsl_matrix_const_view_array_with_tda is equivalent to gsl_matrix_view_array_with_tda but can be used for matrices which are declared const. 

-- Function: gsl_matrix_view gsl_matrix_view_vector (gsl_vector * v, size_t n1, size_t n2)
-- Function: gsl_matrix_const_view gsl_matrix_const_view_vector (const gsl_vector * v, size_t n1, size_t n2)
-- 	These functions return a matrix view of the vector v. The matrix has n1 rows and n2 columns. The vector must have unit stride. The physical number of columns in memory is also given by n2. Mathematically, the (i,j)-th element of the new matrix is given by,

-- 	m'(i,j) = v->data[i*n2 + j]

-- 	where the index i runs from 0 to n1-1 and the index j runs from 0 to n2-1.

-- 	The new matrix is only a view of the vector v. When the view goes out of scope the original vector v will continue to exist. The original memory can only be deallocated by freeing the original vector. Of course, the original vector should not be deallocated while the view is still in use.

-- 	The function gsl_matrix_const_view_vector is equivalent to gsl_matrix_view_vector but can be used for matrices which are declared const. 

-- Function: gsl_matrix_view gsl_matrix_view_vector_with_tda (gsl_vector * v, size_t n1, size_t n2, size_t tda)
-- Function: gsl_matrix_const_view gsl_matrix_const_view_vector_with_tda (const gsl_vector * v, size_t n1, size_t n2, size_t tda)
-- 	These functions return a matrix view of the vector v with a physical number of columns tda which may differ from the corresponding matrix dimension. The vector must have unit stride. The matrix has n1 rows and n2 columns, and the physical number of columns in memory is given by tda. Mathematically, the (i,j)-th element of the new matrix is given by,

-- 	m'(i,j) = v->data[i*tda + j]

-- 	where the index i runs from 0 to n1-1 and the index j runs from 0 to n2-1.

-- 	The new matrix is only a view of the vector v. When the view goes out of scope the original vector v will continue to exist. The original memory can only be deallocated by freeing the original vector. Of course, the original vector should not be deallocated while the view is still in use.

-- 	The function gsl_matrix_const_view_vector_with_tda is equivalent to gsl_matrix_view_vector_with_tda but can be used for matrices which are declared const. 

feature -- Row and column views

-- In general there are two ways to access an object, by reference or by copying. The functions described in this section create vector views which allow access to a row or column of a matrix by reference. Modifying elements of the view is equivalent to modifying the matrix, since both the vector view and the matrix point to the same memory block.

-- Function: gsl_vector_view gsl_matrix_row (gsl_matrix * m, size_t i)
-- Function: gsl_vector_const_view gsl_matrix_const_row (const gsl_matrix * m, size_t i)
-- 	These functions return a vector view of the i-th row of the matrix m. The data pointer of the new vector is set to null if i is out of range.

-- 	The function gsl_vector_const_row is equivalent to gsl_matrix_row but can be used for matrices which are declared const. 

-- Function: gsl_vector_view gsl_matrix_column (gsl_matrix * m, size_t j)
-- Function: gsl_vector_const_view gsl_matrix_const_column (const gsl_matrix * m, size_t j)
-- 	These functions return a vector view of the j-th column of the matrix m. The data pointer of the new vector is set to null if j is out of range.

-- 	The function gsl_vector_const_column is equivalent to gsl_matrix_column but can be used for matrices which are declared const. 

-- Function: gsl_vector_view gsl_matrix_diagonal (gsl_matrix * m)
-- Function: gsl_vector_const_view gsl_matrix_const_diagonal (const gsl_matrix * m)
-- 	These functions returns a vector view of the diagonal of the matrix m. The matrix m is not required to be square. For a rectangular matrix the length of the diagonal is the same as the smaller dimension of the matrix.

-- 	The function gsl_matrix_const_diagonal is equivalent to gsl_matrix_diagonal but can be used for matrices which are declared const. 

-- Function: gsl_vector_view gsl_matrix_subdiagonal (gsl_matrix * m, size_t k)
-- Function: gsl_vector_const_view gsl_matrix_const_subdiagonal (const gsl_matrix * m, size_t k)
-- 	These functions return a vector view of the k-th subdiagonal of the matrix m. The matrix m is not required to be square. The diagonal of the matrix corresponds to k = 0.

-- 	The function gsl_matrix_const_subdiagonal is equivalent to gsl_matrix_subdiagonal but can be used for matrices which are declared const. 

-- Function: gsl_vector_view gsl_matrix_superdiagonal (gsl_matrix * m, size_t k)
-- Function: gsl_vector_const_view gsl_matrix_const_superdiagonal (const gsl_matrix * m, size_t k)
-- 	These functions return a vector view of the k-th superdiagonal of the matrix m. The matrix m is not required to be square. The diagonal of the matrix corresponds to k = 0.

-- 	The function gsl_matrix_const_superdiagonal is equivalent to gsl_matrix_superdiagonal but can be used for matrices which are declared const. 

feature -- Copying matrices
	copy (other: like Current) is
			-- copies the elements of the `other' matrix into the
			-- Current. The two matrices must have the same size.
		require
			valid_other: other /= Void
			same_size: has_same_size (other)
		local res:INTEGER
		do
			res:=gsl_matrix_memcpy (handle,other.handle)
		end

	swap (other: like Current) is
			-- Exchanges the elements of the matrices Current and `other'
			-- by copying. The two matrices must have the same size.
		require
			valid_other: other /= Void
			same_size: has_same_size (other)
		local res:INTEGER
		do
			res:=gsl_matrix_swap (handle,other.handle)
			
feature -- Copying rows and columns
	-- TODO: Eiffelize this "Features described in this section copy a
	-- row or column of a matrix into a vector. This allows the
	-- elements of the vector and the matrix to be modified
	-- independently. Note that if the matrix and the vector point to
	-- overlapping regions of memory then the result will be
	-- undefined. The same effect can be achieved with more generality
	-- using gsl_vector_memcpy with vector views of rows and columns."

-- TODO: uncomment those once GSL_VECTOR is implemented
-- 	copy_row_on (i: INTEGER; a_vector: GSL_VECTOR) is
-- 			--  Copies the elements of the i-th row of Current matrix m
-- 			--  into `a_vector'. The length of the vector must be the
-- 			--  same as the length of the row.
-- 		require
-- 			valid_row: is_valid_row (i)
-- 			vector_not_void: a_vector /= Void
-- 			valid_vector: vector.count = column_number
-- 		local res: INTEGER
-- 		do
-- 			res := gsl_matrix_get_row (a_vector.handle, handle, i)
-- 		end

-- 	copy_column_on (j: INTEGER; a_vector: GSL_VECTOR) is
-- 			-- Copies the elements of the j-th column of the Current
-- 			-- matrix into `a_vector'. The length of the vector must be
-- 			-- the same as the length of the column.
-- 		require
-- 			valid_row: is_valid_column (j)
-- 			vector_not_void: a_vector /= Void
-- 			valid_vector: vector.count = row_number
-- 		local res: INTEGER
-- 		do
-- 			res := gsl_matrix_get_col (a_vector.handle, handle, j)
-- 		end

-- 	set_row  (i: INTEGER; a_vector: GSL_VECTOR) is
-- 			-- Copies the elements of `a_vector' into the i-th row of the
-- 			-- Current matrix. The length of the vector must be the same
-- 			-- as the length of the row.
-- 		require
-- 			valid_row: is_valid_row (i)
-- 			vector_not_void: a_vector /= Void
-- 			valid_vector: vector.count = column_number
-- 		local res: INTEGER
-- 		do
-- 			res := gsl_matrix_set_row (handle, i, a_vector.handle)
-- 		end
	
-- 	set_column  (i: INTEGER; a_vector: GSL_VECTOR) is
-- 			-- Copies the elements of `a_vector' into the i-th column of the
-- 			-- Current matrix. The length of the vector must be the same
-- 			-- as the length of the column.
-- 		require
-- 			valid_column: is_valid_column (j)
-- 			vector_not_void: a_vector /= Void
-- 			valid_vector: vector.count = row_number
-- 		local res: INTEGER
-- 		do
-- 			res := gsl_matrix_set_col (handle, j, a_vector.handle)
-- 		end
	
feature -- Exchanging rows and columns

	swap_rows (i,j: INTEGER) is
			-- exchanges the i-th and j-th rows of the Current matrix in-place.
		require
			valid_i_index: is_valid_row (i)
			valid_j_index: is_valid_row (j)
		local res: INTEGER
		do
			res:= gsl_matrix_swap_rows (handle,i,j)
		end
	
	swap_columns (i,j: INTEGER) is
			-- exchanges the i-th and j-th columns of the Current matrix in-place.
		require
			valid_i_index: is_valid_column (i)
			valid_j_index: is_valid_column (j)
		local res: INTEGER
		do
			res:= gsl_matrix_swap_columns (handle,i,j)
		end

	-- TODO: Function: int gsl_matrix_swap_rowcol (gsl_matrix * m,
	-- size_t i, size_t j) This function exchanges the i-th row and
	-- j-th column of the matrix m in-place. The matrix must be square
	-- for this operation to be possible.
	
	-- TODO: Function: int gsl_matrix_transpose_memcpy (gsl_matrix *
	-- dest, const gsl_matrix * src) This function makes the matrix
	-- dest the transpose of the matrix src by copying the elements of
	-- src into dest. This function works for all matrices provided
	-- that the dimensions of the matrix dest match the transposed
	-- dimensions of the matrix src.
	
	-- TODO: Function: int gsl_matrix_transpose (gsl_matrix * m) --
	-- This function replaces the matrix m by its transpose by copying
	-- the elements of the matrix in-place. The matrix must be square
	-- for this operation to be possible.

feature -- Matrix operations

	add (other: like Current) is
			-- adds the elements of `other' matrix (b) to the elements of
			-- Current matrix (a), a'(i,j) = a(i,j) + b(i,j). The two
			-- matrices must have the same dimensions.
		require same_size: has_same_size (other)
		local res: INTEGER
		do
			res := gsl_matrix_add (handle, other.handle)
		end

	sub (other: like Current) is
			-- Subtract  the elements of `other' matrix (b) to the elements of
			-- Current matrix (a), a'(i,j) = a(i,j) - b(i,j). The two
			-- matrices must have the same dimensions.
		require same_size: has_same_size (other)
		local res: INTEGER
		do
			res := gsl_matrix_sub (handle, other.handle)
		end

	mul_elements (other: like Current) is
			-- Multiplies the elements of Current matrix (a) by the
			-- elements of `other' matrix (b) a'(i,j) = a(i,j) *
			-- b(i,j). The two matrices must have the same dimensions.
		require same_size: has_same_size (other)
		local res: INTEGER
		do
			res := gsl_matrix_mul_elements (handle, other.handle)
		end

	div_elements (other: like Current) is
			-- Divides the elements of Current matrix (a) by the
			-- elements of `other' matrix (b) a'(i,j) = a(i,j) /
			-- b(i,j). The two matrices must have the same dimensions.
		require same_size: has_same_size (other)
		local res: INTEGER
		do
			res := gsl_matrix_div_elements (handle, other.handle)
		end

	scale (an_x: REAL) is
			-- Multiplies the elements of Current matrix (a) by the constant factor x, a'(i,j) = x a(i,j).
		local res: INTEGER
		do
			res := gsl_matrix_scale (handle, an_x)
		end

	add_constant (a_constant: REAL) is
			-- Adds `a_constant' (x) to the elements of the matrix a, a'(i,j) = a(i,j) + x. 
		local res: INTEGER
		do
			res := gsl_matrix_add_constant (handle, a_constant)
		end

feature -- Finding maximum and minimum elements of matrices
	max: REAL is
			-- the maximum value in the matrix m. 
		do
			Result := gsl_matrix_max (handle)
		end
	
	min: REAL is
			-- the minimum value in the matrix m. 
		do
			Result:= gsl_matrix_min (handle)
		end

	-- TODO: void gsl_matrix_minmax (const gsl_matrix * m, double *
	-- min_out, double * max_out) This function returns the minimum and
	-- maximum values in the matrix m, storing them in min_out and
	-- max_out.

	-- TODO: Function: void gsl_matrix_max_index (const gsl_matrix * m,
	-- size_t * imax, size_t * jmax) This function returns the indices
	-- of the maximum value in the matrix m, storing them in imax and
	-- jmax. When there are several equal maximum elements then the
	-- first element found is returned, searching in row-major order.
	
	-- TODO: Function: void gsl_matrix_min_index (const gsl_matrix * m,
	-- size_t * imax, size_t * jmax) This function returns the indices
	-- of the minimum value in the matrix m, storing them in imax and
	-- jmax. When there are several equal minimum elements then the
	-- first element found is returned, searching in row-major order.

	-- TODO Function: void gsl_matrix_minmax_index (const gsl_matrix *
	-- m, size_t * imin, size_t * imax) This function returns the
	-- indices of the minimum and maximum values in the matrix m,
	-- storing them in (imin,jmin) and (imax,jmax). When there are
	-- several equal minimum or maximum elements then the first
	-- elements found are returned, searching in row-major order.

feature -- Matrix properties
	is_null: BOOLEAN is
			-- Are  all the elements of the matrix zero?
		do
			Result := (gsl_matrix_isnull (handle)).to_boolean
		end
	
feature -- Matrix size
	is_valid_index	(i,j: INTEGER): BOOLEAN is
		do
			Result := (i.in_range(0,row_number-1) and
						  j.in_range(0,column_number-1))
		end
				
	is_valid_row (an_i: INTEGER): BOOLEAN is
		do
			Result:= an_i.in_range (0,row_number-1)
		end

	is_valid_column (a_j: INTEGER): BOOLEAN is
		do
			Result:= a_j.in_range (0,column_number-1)
		end

	row_number: INTEGER is
		do
			Result:=get_size1(handle)
			-- ensure positive: Result > 0
		end
	
	column_number: INTEGER is
		do
			Result:=get_size2(handle)
			-- ensure positive: Result > 0
		end

	has_same_size (other: like Current): BOOLEAN is
		require valid_other:other/=Void
		do
			Result := ((row_number = other.row_number) and
						  (column_number = other.column_number))
		end
end

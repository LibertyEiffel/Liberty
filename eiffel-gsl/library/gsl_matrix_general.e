indexing
	description: "general matrix"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>%
   %Raphael Mack <mail@raphael-mack.de>"
	authors: "Paolo Redaelli, Raphael Mack"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
         -- TODO: Eiffelize this documentation: Matrices
         -- TODO: add views
         -- TODO: add error handling
         --       use all the return values of the functions. Currently discarded.
         -- TODO: add stream reading/writing
         -- TODO: add row/column vector access (views?), 
         --       (uncommenting existing code?)
         -- TODO: implement has, fast_has, replace, fast_replace, subcollection2
   
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


deferred class GSL_MATRIX_GENERAL[TYPE_]

insert
	WRAPPER
      undefine
         out, fill_tagged_out_memory
		end

	COLLECTION2 [TYPE_]
      redefine
         out
      end

   GSL_ERRNO
      undefine
         out, copy, is_equal, fill_tagged_out_memory
      end
   
feature -- Creating
	make_zero  (rows, columns: INTEGER) is
			-- Creates a matrix of size `rows' by `columns' and
			-- initializes all the elements of the matrix to zero.
		require
			valid_rows: rows >= 0
			valid_columns: columns >= 0
		do
			if handle.is_not_null then
				gsl_matrix_free(handle)
			end
			set_handle(gsl_matrix_calloc (rows, columns))
      ensure
         row_cnt: rows = count1
         loc_cnt: columns = count2
		end

	make (rows, columns: INTEGER) is
			-- Creates a matrix of size `rows' by `columns'. Matrix's elements are 
			-- uninitialized, you should probably prefere make_zero.
		require
			valid_rows: rows >= 0
			valid_columns: columns >= 0
		do
			if handle.is_not_null then
				gsl_matrix_free (handle)
			end
			set_handle(gsl_matrix_alloc (rows, columns))
      ensure
         row_cnt: rows = count1
         loc_cnt: columns = count2				
		end

	make_identity  (rows, columns: INTEGER) is
			-- Creates a matrix of size `rows' by `columns' and
			-- initializes all the elements except the diagonal to 0
         -- the diagonal is 1
		require
			valid_rows: rows >= 0
			valid_columns: columns >= 0
		do
         make(rows, columns)
         set_identity
      ensure
         row_cnt: rows = count1
         loc_cnt: columns = count2
		end
		
	from_collection2 (model: COLLECTION2[like item]) is
			--  Uses `model' to initialize Current.
		local
			i, j: INTEGER
		do
			make(model.count1, model.count2)
			from
				i := model.lower1
			until
				i > model.upper1
			loop
				from
					j := model.lower2
				until
					j > model.upper2
				loop
					put (model.item(i, j), i, j)
					j := j + 1
				end
				i := i + 1
			end				
		end

	from_model (model: COLLECTION[COLLECTION[TYPE_]]) is
			-- The `model' is used to fill line by line Current.
		local
			i, j, cols, rows: INTEGER_32
			subcollection: COLLECTION[TYPE_]
         it: ITERATOR[COLLECTION[TYPE_]]
		do
         rows := model.count
         from
            -- find the biggest subcollection
            it := model.get_new_iterator
            it.start
         until
            it.is_off
         loop
            cols := cols.max(it.item.count)
            it.next
         end
         sedb_breakpoint
         make_zero(rows, cols)
         
         from
            i := model.lower
         until
            i > model.upper
         loop
            subcollection := model.item (i)
            from
               j := subcollection.lower
            until
               j > subcollection.upper
            loop
               put (subcollection.item(j),
                    i - model.lower,
                    j - subcollection.lower)
               j := j + 1
            end
            i := i + 1
         end
      end

   from_transposed(model: like Current) is
         -- This function makes the matrix Current the transpose of
         -- the matrix src by copying the elements of model into Current.
      local
         res: INTEGER_32
      do
			make(model.count2, model.count1)
         handle_code(gsl_matrix_transpose_memcpy(handle, model.handle))
      end
   
feature {} -- Disposing
	dispose is
		do
			gsl_matrix_free (handle)
			-- This function frees a previously allocated matrix m. If
			-- the matrix was created using gsl_matrix_alloc then the
			-- block underlying the matrix will also be deallocated. If
			-- the matrix has been created from another object then the
			-- memory is still owned by that object and will not be
			-- deallocated.
			handle := default_pointer
         -- we may violate the invariant here, since the object is 
         -- destroyed from now on.
		end
	
feature -- Accessing
	item(i, j: INTEGER): TYPE_ is
			-- the (i,j)-th element of Current matrix m
		do
			-- If i or j lie outside the allowed range of 0 to n1-1 and 0
			-- to n2-1 then the error handler is invoked and 0 is
			-- returned.
			Result := gsl_matrix_get (handle, i, j)
		end

	put (an_x: TYPE_; i, j: INTEGER) is
			-- Sets the value of the (i,j)-th element of Current matrix to `an_x'.
		do
			gsl_matrix_set (handle, i, j, an_x)
		end

	force (element: like item; line, column: INTEGER) is
			-- Put `element' at position (`line',`column'). Collection is
			-- resized first when (`line',`column') is not inside current
			-- bounds. New bounds are initialized with default values.
			-- Required to be a COLLECTION2
      local
         new_count1, new_count2: INTEGER_32         
		do
         if not valid_index(line, column) then
            new_count1 := count1.max(line + 1)
            new_count2 := count2.max(column + 1)
            enlarge(new_count1, new_count2)
         end
         put(element, line, column)   
		ensure then
			size_ok: valid_index(line, column)
		end


   enlarge(rows, columns: INTEGER_32) is
         -- enlarges the matrix, preserving values, new fields will 
         -- be initialized to 0
      require
         not_less_rows: rows > count1
         not_less_cols: columns > count2
      local
         tmp: POINTER
         i, j: INTEGER_32
         old_count1, old_count2: INTEGER_32
      do
         old_count1 := count1
         old_count2 := count2
         tmp := handle
         set_handle(gsl_matrix_calloc (rows, columns))
         from
            i := 0
         until
            i >= old_count1
         loop
            from
               j := 0
            until
               j >= old_count2
            loop
               put(gsl_matrix_get(tmp, i, j), i, j)
               j := j + 1
            end
            i := i + 1
         end
         gsl_matrix_free(tmp)
      ensure
         valid_count1: count1 = rows
         valid_count2: count2 = columns
      end

feature -- Initializing matrix elements
	set_all_with (an_x: TYPE_) is
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

feature -- Copying matrices
	copy (other: like Current) is
			-- copies the elements of the `other' matrix into the
			-- Current.
		do
         if handle.is_null then
            -- invariant handle.is_not_null is not satisfied, if copy 
            -- is called as creation procedure
            make(other.line_count, other.column_count)
         elseif not has_same_size(other) then
            gsl_matrix_free(handle)
            make(other.line_count, other.column_count)
         end
         
         handle_code(gsl_matrix_memcpy (handle, other.handle))
		end

	swap_with (other: like Current) is
			-- Exchanges the elements of the matrices Current and `other'
			-- by copying. The two matrices must have the same size.
		require
			valid_other: other /= Void
			same_size: has_same_size (other)
		local
			res: INTEGER
		do
         res := gsl_matrix_swap (handle, other.handle)
			check
				-- TODO: res prüfen
				True
			end
		end
	
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
-- 			valid_row: valid_line (i)
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
-- 			valid_row: valid_column (j)
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
-- 			valid_row: valid_line (i)
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
-- 			valid_column: valid_column (j)
-- 			vector_not_void: a_vector /= Void
-- 			valid_vector: vector.count = row_number
-- 		local res: INTEGER
-- 		do
-- 			res := gsl_matrix_set_col (handle, j, a_vector.handle)
-- 		end
	
feature -- Exchanging rows and columns

	swap_rows (i, j: INTEGER) is
			-- exchanges the i-th and j-th rows of the Current matrix in-place.
		require
			valid_i_index: valid_line (i)
			valid_j_index: valid_line (j)
		do
			handle_code(gsl_matrix_swap_rows (handle, i, j))
		end
	
	swap_columns (i,j: INTEGER_32) is
			-- exchanges the i-th and j-th columns of the Current matrix in-place.
		require
			valid_i_index: valid_column (i)
			valid_j_index: valid_column (j)
		do
			handle_code(gsl_matrix_swap_columns (handle, i, j))
		end

   swap_rowcol (i, j: INTEGER_32) is
         -- This function exchanges the i-th row and
         -- j-th column of the matrix m in-place. The matrix must be square
         -- for this operation to be possible.
      require
         row: valid_line(i)
         col: valid_column(j)
         square: count1 = count2
      do
         handle_code(gsl_matrix_swap_rowcol(handle, i, j))
      ensure
         -- TODO: (old row(i)).is_equal(col(j))???
         -- TODO: (old col(j)).is_equal(row(i))???
         True
      end

   transpose is
         -- This function replaces the matrix m by its transpose by copying
         -- the elements of the matrix in-place. The matrix must be square
         -- for this operation to be possible.
      require
         square: count1 = count2
      do
         handle_code(gsl_matrix_transpose(handle))
      ensure
         -- TODO: add a meaningful postcondition
         True
      end
   
feature -- Matrix operations

	plus (other: like Current) is
			-- adds the elements of `other' matrix (b) to the elements of
			-- Current matrix (a), a'(i,j) = a(i,j) + b(i,j). The two
			-- matrices must have the same dimensions.
		require
			same_size: has_same_size (other)
		do
			handle_code(gsl_matrix_add (handle, other.handle))
		end

	sub (other: like Current) is
			-- Subtract  the elements of `other' matrix (b) to the elements of
			-- Current matrix (a), a'(i,j) = a(i,j) - b(i,j). The two
			-- matrices must have the same dimensions.
		require
			same_size: has_same_size (other)
		do
			handle_code(gsl_matrix_sub (handle, other.handle))
		end

	mul_elements (other: like Current) is
			-- Multiplies the elements of Current matrix (a) by the
			-- elements of `other' matrix (b) a'(i,j) = a(i,j) *
			-- b(i,j). The two matrices must have the same dimensions.
		require
			same_size: has_same_size (other)
		do
			handle_code(gsl_matrix_mul_elements (handle, other.handle))
		end

	div_elements (other: like Current) is
			-- Divides the elements of Current matrix (a) by the
			-- elements of `other' matrix (b) a'(i,j) = a(i,j) /
			-- b(i,j). The two matrices must have the same dimensions.
		require
			same_size: has_same_size (other)
		do
			handle_code(gsl_matrix_div_elements (handle, other.handle))
		end

	scale (an_x: REAL_32) is
			-- Multiplies the elements of Current matrix (a) by the constant factor x, a'(i,j) = x a(i,j).
		do
         handle_code(gsl_matrix_scale (handle, an_x))
		end

	add_constant (a_constant: REAL_32) is
			-- Adds `a_constant' (x) to the elements of the matrix a, a'(i,j) = a(i,j) + x. 
		do
			handle_code(gsl_matrix_add_constant (handle, a_constant))
		end

feature -- Finding maximum and minimum elements of matrices
	max: TYPE_ is
			-- the maximum value in the matrix m.
         -- TODO: what if matrix dimension is 0,0? Is this calle defined?
		do
			Result := gsl_matrix_max (handle)
		end
	
	min: TYPE_ is
			-- the minimum value in the matrix m. 
         -- TODO: what if matrix dimension is 0,0? Is this calle defined?
		do
			Result := gsl_matrix_min (handle)
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

feature -- Matrix properties, looking and comparison:
	all_default: BOOLEAN is
			-- Are  all the elements of the matrix zero?
		do
			Result := (gsl_matrix_isnull (handle)).to_boolean
		end

feature {ANY} -- Counting:
	count1: INTEGER_32 is
			-- Size of the first dimension (row count).
		do
			Result := get_size1(handle)
		end

	count2: INTEGER_32 is
			-- Size of the second dimension (line count)
		do
			Result := get_size2(handle)
		end

	count: INTEGER_32 is
			-- Total number of elements.
		do
			Result := line_count * column_count
		end

feature {ANY} -- Indexing:
	lower1, lower2: INTEGER_32 is 0

	upper1, row_upper: INTEGER_32 is
		do
			Result := line_count - 1
		end
	
	upper2, column_upper: INTEGER_32 is
		do
			Result := column_count - 1
		end

	has_same_size (other: like Current): BOOLEAN is
		require valid_other:other/=Void
		do
			Result := ((line_count = other.line_count) and
						  (column_count = other.column_count))
		end

feature {ANY}
   out: STRING is
         -- print in nice, readable format
      local
         line, column: INTEGER_32
      do
         create Result.make(count * 5)
			Result.append(once "[")
			from
				line := lower1
			until
				line > upper1
			loop
				from
					column := lower2
				until
					column > upper2
				loop
               Result.append(item(line, column).out)
					column := column + 1
               if column <= upper2 then
                  Result.extend(',')
               end
				end
				line := line + 1
            if line <= upper1 then
               Result.extend('%N')
            end
			end
         Result.extend(']')
         
      end

feature {ANY}
	swap (line1, column1, line2, column2: INTEGER_32) is
			-- Swap the element at index (`line1',`column1') with the
			-- the element at index (`line2',`column2').
      -- TOOD: add precondition
		local
			temp: like item
		do
			temp := item (line1,column1)
			put (item(line2,column2), line1, column1)
			put (temp, line2, column2)
		end

feature {ANY} -- Miscellaneous features:
	occurrences, fast_occurrences (an_x: like item): INTEGER_32 is
			-- Number of occurrences using `='.
			-- `occurrences' and `fast_occurrences' are the same feature		
		local
			i, j: INTEGER_32
		do
			from
				i := lower1
			until
				i < upper1
			loop
				from
					j := lower2
				until
					j < upper2
				loop
					if item(i, j) = an_x then
						Result := Result + 1
					end
					j := j + 1
				end
				i := i + 1
			end
		end

   -- TODO: implement me correctly!
	has, fast_has (x: like item): BOOLEAN is
			--  Search if a element x is in the array using `='. `has'
			--  and `fast_has' are the same feature
		local
			i, j: INTEGER_32
		do
			from
				i := lower1
			until
				Result = False or else i < upper1
			loop
				from
					j := lower2
				until
					Result = False or else j < upper2
				loop
					if item(i, j) = x then
						Result := True
					end
					j := j + 1
				end
				i := i + 1
			end
		end

	replace_all (old_value, new_value: like item) is
			-- Replace all occurrences of the element `old_value' by `new_value'
			-- using `is_equal' for comparison.
			-- See also `fast_replace_all' to choose the apropriate one.
		obsolete "Unimplemented!"
		do
			-- Nothing
		ensure then implemented: False
		end

	fast_replace_all (old_value, new_value: like item) is
			-- Replace all occurrences of the element `old_value' by `new_value'
			-- using operator `=' for comparison.
			-- See also `replace_all' to choose the apropriate one.
		obsolete "Unimplemented!"
		do
			-- Nothing
		ensure then implemented: False
		end

	sub_collection2 (line_min, line_max, column_min, column_max: INTEGER_32): like Current is
			-- Create a new object using selected area of `Current'.
		obsolete "Unimplemented!"
		do
			-- Nothing
		ensure then implemented: False
		end

feature {} -- Implement manifest generic creation.
	manifest_make (needed_capacity: INTEGER_32; rows, columns: INTEGER_32) is
			-- Create an GSL_MATRIX[TYPE_] using rows, columns as sizes.
		do
			make_zero(rows, columns)
		end

	manifest_put (index: INTEGER_32; element: like item) is
		do
			put (element, index//count2, index\\count2)
		end

feature {} -- External calls
	gsl_matrix_alloc (a_n1, a_n2: INTEGER_32): POINTER is
		deferred
		end
	
	gsl_matrix_calloc (n1, n2: INTEGER_32): POINTER is
		deferred
		end
	
	gsl_matrix_free (a_gsl_matrix: POINTER) is
		require
			a_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_get (a_gsl_matrix: POINTER; a_i, a_j: INTEGER_32): TYPE_ is
		require
			a_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_set (a_gsl_matrix: POINTER; a_i, a_j: INTEGER_32; an_x: TYPE_) is
		require
			a_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_ptr (a_gsl_matrix: POINTER; a_i, a_j: INTEGER_32): POINTER  is
		require
			a_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_set_all (a_gsl_matrix: POINTER; an_x: TYPE_) is
		require
			a_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_set_zero (a_gsl_matrix: POINTER) is
		require
			a_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_set_identity (a_gsl_matrix: POINTER) is
		require
			a_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_fwrite (a_stream, a_gsl_matrix: POINTER): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
			a_stream.is_not_null
		deferred
		end

	gsl_matrix_fread (a_stream, a_gsl_matrix: POINTER): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
			a_stream.is_not_null
		deferred
		end

	gsl_matrix_fprintf (a_stream, a_gsl_matrix, a_format: POINTER): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
			a_stream.is_not_null
			a_format.is_not_null
		deferred
		end
	
	gsl_matrix_fscanf (a_stream, a_gsl_matrix: POINTER): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
			a_stream.is_not_null
		deferred
		end
	
	-- TODO: gsl_matrix_view gsl_matrix_submatrix (a_gsl_matrix: POINTER, k1: INTEGER, k2: INTEGER, n1: INTEGER, n2: INTEGER)
	-- TODO gsl_matrix_const_view gsl_matrix_const_submatrix (const a_gsl_matrix: POINTER, k1: INTEGER, k2: INTEGER, n1: INTEGER, n2: INTEGER)

	-- TODO: gsl_matrix_view gsl_matrix_view_array (double * base, n1: INTEGER, n2: INTEGER)
	-- TODO: gsl_matrix_const_view gsl_matrix_const_view_array (const double * base, n1: INTEGER, n2: INTEGER)

	-- TODO: gsl_matrix_view gsl_matrix_view_array_with_tda (double * base, n1: INTEGER, n2: INTEGER, tda: INTEGER)
	-- TODO: gsl_matrix_const_view gsl_matrix_const_view_array_with_tda (const double * base, n1: INTEGER, n2: INTEGER, tda: INTEGER)

	-- TODO: gsl_matrix_view gsl_matrix_view_vector (gsl_vector * v, n1: INTEGER, n2: INTEGER)
	-- TODO: gsl_matrix_const_view gsl_matrix_const_view_vector (const gsl_vector * v, n1: INTEGER, n2: INTEGER)

	-- TODO: gsl_matrix_view gsl_matrix_view_vector_with_tda (gsl_vector * v, n1: INTEGER, n2: INTEGER, tda: INTEGER)
	-- TODO: gsl_matrix_const_view gsl_matrix_const_view_vector_with_tda (const gsl_vector * v, n1: INTEGER, n2: INTEGER, tda: INTEGER)

	gsl_matrix_memcpy (a_dest, a_src: POINTER): INTEGER_32 is
		require
			valid_source: a_src.is_not_null
			valid_dest: a_dest.is_not_null
		deferred
		end

	gsl_matrix_swap (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
			another_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_get_row (a_vector, a_gsl_matrix: POINTER; an_i: INTEGER_32): INTEGER_32 is
		require
			valid_matrix: a_gsl_matrix.is_not_null
		   valid_vector: a_vector.is_not_null
		deferred
		end

	gsl_matrix_get_col (a_gsl_vector, a_gsl_matrix: POINTER; a_j: INTEGER_32): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
			a_gsl_vector.is_not_null
		deferred
		end

	gsl_matrix_set_row (a_gsl_matrix: POINTER; an_i: INTEGER_32; a_gsl_vector: POINTER): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
			a_gsl_vector.is_not_null
		deferred
		end

	gsl_matrix_set_col (a_gsl_matrix: POINTER; an_j: INTEGER_32; a_gsl_vector: POINTER): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
			a_gsl_vector.is_not_null
		deferred
		end

	gsl_matrix_swap_rows (a_gsl_matrix: POINTER; an_i, a_j: INTEGER_32): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_swap_columns (a_gsl_matrix: POINTER; an_i, a_j: INTEGER_32): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_swap_rowcol (a_gsl_matrix: POINTER; an_i, a_j: INTEGER_32): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_transpose_memcpy (a_gsl_matrix_dest, a_gsl_matrix_src: POINTER): INTEGER_32 is
		require
			valid_source: a_gsl_matrix_src.is_not_null
			valid_destination: a_gsl_matrix_dest.is_not_null
		deferred
		end

	gsl_matrix_transpose (a_gsl_matrix: POINTER): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
		deferred
		end


	gsl_matrix_add (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
			another_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_sub (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
			another_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_mul_elements (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
			another_gsl_matrix.is_not_null
		deferred
		end
	
	gsl_matrix_div_elements (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
			another_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_scale (a_gsl_matrix: POINTER; a_scale: REAL_64): INTEGER_32 is
      -- type TYPE_ would make sense for a_scale, but in gsl it's a double...
		require
			a_gsl_matrix.is_not_null
		deferred
		end
	
	gsl_matrix_add_constant (a_gsl_matrix: POINTER; a_constant: REAL_64): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
		deferred
		end

	
	gsl_matrix_max (a_gsl_matrix: POINTER): TYPE_  is
		require
			a_gsl_matrix.is_not_null
		deferred
		end
	
	gsl_matrix_min (a_gsl_matrix: POINTER): TYPE_  is
		require
			a_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_minmax (a_gsl_matrix, a_min_out, a_max_out: POINTER) is
--TODO
		require
			a_gsl_matrix.is_not_null
			a_min_out.is_not_null
			a_max_out.is_not_null
		deferred
		end

	gsl_matrix_max_index (a_gsl_matrix, an_imax_ptr, a_jmax_ptr: POINTER) is
-- TODO
		require
			a_gsl_matrix.is_not_null
		deferred
		end

	gsl_matrix_min_index (a_gsl_matrix, an_imin_ptr, a_jmin_ptr: POINTER) is
-- TODO
		require
			a_gsl_matrix.is_not_null
		deferred
		end

		-- TODO: void gsl_matrix_minmax_index (const a_gsl_matrix: POINTER, size_t * imin, size_t * imax)
		-- Documentation and declaration mismatch! This function returns the indices of the minimum and maximum values in the matrix m, storing them in (imin,jmin) and (imax,jmax). When there are several equal minimum or maximum elements then the first elements found are returned, searching in row-major order. 
	
	gsl_matrix_isnull (a_gsl_matrix: POINTER): INTEGER_32 is
		require
			a_gsl_matrix.is_not_null
		deferred
		end

feature {} -- external struct access
	c_structure_size: INTEGER is
		deferred
		end

	get_size1 (a_matrix: POINTER): INTEGER_32 is
		require
			a_matrix.is_not_null
      deferred
		end

	get_size2 (a_matrix: POINTER): INTEGER_32 is
		require
			a_matrix.is_not_null
      deferred
		end

	get_tda (a_matrix: POINTER): INTEGER_32 is
		require
			a_matrix.is_not_null
      deferred
      end

	get_data (a_matrix: POINTER): POINTER is
		require
			a_matrix.is_not_null
      deferred
		end
	
	get_block  (a_matrix: POINTER): POINTER is
		require
			a_matrix.is_not_null
      deferred
		end

	get_owner (a_matrix: POINTER): INTEGER_32 is
		require
			a_matrix.is_not_null
      deferred
		end
	
invariant
	valid_handle: handle /= default_pointer
	
end

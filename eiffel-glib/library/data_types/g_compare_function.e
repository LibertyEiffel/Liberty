GCompareFunc ()

gint        (*GCompareFunc)                 (gconstpointer a,
															gconstpointer b);

Specifies the type of a comparison function used to compare two values. The function should return a negative integer if the first value comes before the second, 0 if they are equal, or a positive integer if the first value comes after the second.
a : 	a value.
b : 	a value to compare with.
Returns : 	negative value if a < b; zero if a = b; positive value if a > b.

indexing
	description: "Callback or an object representing a function that can be called"

deferred class CALLBACK
feature
	function (an_object,some_data: POINTER): INTEGER is deferred end
	object: G_OBJECT
			-- The object the callback will operate on
end
	

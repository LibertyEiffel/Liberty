class LIBERTY_TYPE_DESCRIPTOR

insert
	HASHABLE
		redefine
			copy
		end

create {ANY}
	make, default_create

feature {ANY}
	parameters: TRAVERSABLE[LIBERTY_TYPE]

	cluster: LIBERTY_CLUSTER is
		do
			Result := class_descriptor.cluster
		end

	name: STRING is
		do
			Result := class_descriptor.name
		end

feature {ANY}
	hash_code: INTEGER

	is_equal (other: like Current): BOOLEAN is
		local
			i, o: INTEGER
		do
			Result := class_descriptor.is_equal(other.class_descriptor) and then other.parameters.count = parameters.count
			from
				i := parameters.lower
			until
				not Result or else i > parameters.upper
			loop
				o := i - parameters.lower + other.parameters.lower
				Result := parameters.item(i).is_equal(other.parameters.item(o))
				i := i + 1
			end
		end

	copy (other: like Current) is
		do
			class_descriptor := other.class_descriptor.twin
			parameters := other.parameters
		end

	make (a_class_descriptor: like class_descriptor; a_parameters: TRAVERSABLE[LIBERTY_TYPE]) is
		require
			a_class_descriptor /= Void
			a_parameters /= Void
		do
			class_descriptor := a_class_descriptor
			parameters := a_parameters
			compute_hash_code
		ensure
			class_descriptor = a_class_descriptor
			parameters = a_parameters
		end

feature {}
	compute_hash_code is
		local
			i, h: INTEGER
		do
			h := class_descriptor.hash_code
			from
				i := parameters.lower
			until
				i > parameters.upper
			loop
				h := h #*31 + parameters.item(i).hash_code
				i := i + 1
			end
			hash_code := h
		end

feature {LIBERTY_TYPE_DESCRIPTOR}
	class_descriptor: LIBERTY_CLASS_DESCRIPTOR

end

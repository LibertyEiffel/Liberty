expanded class TRANSFORMATION
	--
	-- Written by Cyril Adrian <cyril.adrian@laposte.net>
	-- and Frederic Merizen <frederic.merizen@loria.fr>
	--

insert
	ANY
		redefine default_create, copy, is_equal
		end

feature {ANY}
	copy (other: like Current) is
		do
			q.copy(other.q)
			r.copy(other.r)
			s.copy(other.s)
			t.copy(other.t)
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := q.is_equal(other.q) and then r.is_equal(other.r) and then s.is_equal(other.s) and then t.is_equal(other.t)
		end

feature {TRANSFORMATION}
	q, r, s, t: MUTABLE_BIG_INTEGER

feature {PI_DIGIT_SPIGOT}
	qrst (a_q, a_r, a_s, a_t: INTEGER) is
		do
			q.from_integer(a_q)
			r.from_integer(a_r)
			s.from_integer(a_s)
			t.from_integer(a_t)
			k := 0
		end

	next is
		do
			k := k + 1
			q.from_integer(k)
			r.from_integer(4 * k + 2)
			s.from_integer(0)
			t.from_integer(2 * k + 1)
		end

	extract (j: INTEGER): INTEGER is
		do
			tmp1.from_integer(j)
			-- n = q*j+r
			tmp2.copy(q)
			tmp2.multiply(tmp1)
			tmp2.add(r)
			-- d = s*j+t
			tmp3.copy(s)
			tmp3.multiply(tmp1)
			tmp3.add(t)
			-- Result = n/d
			tmp2.divide(tmp3)
			Result := tmp2.to_integer
		end

	compose (a: like Current) is
		do
			tmp1.copy(s)
			-- ns = s*a.q + t*a.s
			s.multiply(a.q)
			tmp2.copy(t)
			tmp2.multiply(a.s)
			s.add(tmp2)
			-- nt = s*a.r + t*a.t
			tmp1.multiply(a.r)
			t.multiply(a.t)
			t.add(tmp1)
			-- nr = q*a.r + r*a.t
			tmp1.copy(a.r)
			tmp1.multiply(q)
			r.multiply(a.t)
			r.add(tmp1)
			-- nq = q*a.q
			q.multiply(a.q)
			k := 0
		end

feature {}
	k: INTEGER

	tmp1: MUTABLE_BIG_INTEGER is
		once
			create Result.from_integer(0)
		end

	tmp2: MUTABLE_BIG_INTEGER is
		once
			create Result.from_integer(0)
		end

	tmp3: MUTABLE_BIG_INTEGER is
		once
			create Result.from_integer(0)
		end

	default_create is
		do
			create q.from_integer(0)
			create r.from_integer(0)
			create s.from_integer(0)
			create t.from_integer(0)
		end

end -- class TRANSFORMATION

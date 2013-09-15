class BODY

creation {ANY}
	jupiter, saturn, uranus, neptune, sun

feature {ANY}
	pi: DOUBLE is 3.141592653589793

	solar_mass: DOUBLE is
		once
			Result := 4 * pi * pi
		end

	days_per_year: DOUBLE is 365.24

	x: DOUBLE

	y: DOUBLE

	z: DOUBLE

	vx: DOUBLE

	vy: DOUBLE

	vz: DOUBLE

	mass: DOUBLE

	set_x (a: DOUBLE) is
		do
			x := a
		end

	set_y (a: DOUBLE) is
		do
			y := a
		end

	set_z (a: DOUBLE) is
		do
			z := a
		end

	set_vx (a: DOUBLE) is
		do
			vx := a
		end

	set_vy (a: DOUBLE) is
		do
			vy := a
		end

	set_vz (a: DOUBLE) is
		do
			vz := a
		end

	jupiter is
		do
			x := 4.84143144246472090e+00
			y := -1.16032004402742839e+00
			z := -1.03622044471123109e-01
			vx := 1.66007664274403694e-03 * days_per_year
			vy := 7.69901118419740425e-03 * days_per_year
			vz := -0.0000690460016972063023 * days_per_year
			mass := 9.54791938424326609e-04 * solar_mass
		end

	saturn is
		do
			x := 8.34336671824457987e+00
			y := 4.12479856412430479e+00
			z := -4.03523417114321381e-01
			vx := -0.00276742510726862411 * days_per_year
			vy := 4.99852801234917238e-03 * days_per_year
			vz := 2.30417297573763929e-05 * days_per_year
			mass := 2.85885980666130812e-04 * solar_mass
		end

	uranus is
		do
			x := 1.28943695621391310e+01
			y := -1.51111514016986312e+01
			z := -2.23307578892655734e-01
			vx := 2.96460137564761618e-03 * days_per_year
			vy := 2.37847173959480950e-03 * days_per_year
			vz := -0.0000296589568540237556 * days_per_year
			mass := 4.36624404335156298e-05 * solar_mass
		end

	neptune is
		do
			x := 1.53796971148509165e+01
			y := -2.59193146099879641e+01
			z := 1.79258772950371181e-01
			vx := 2.68067772490389322e-03 * days_per_year
			vy := 1.62824170038242295e-03 * days_per_year
			vz := -0.0000951592254519715870 * days_per_year
			mass := 5.15138902046611451e-05 * solar_mass
		end

	sun is
		do
			mass := solar_mass
		end

	offset_momentum (px: DOUBLE; py: DOUBLE; pz: DOUBLE) is
		do
			vx := -px / solar_mass
			vy := -py / solar_mass
			vz := -pz / solar_mass
		end

end -- class BODY

class NBODY_SYSTEM

create {ANY}
	make

feature {ANY}
	bodies: FIXED_ARRAY[BODY]

	make
		local
			b: BODY; px: DOUBLE; py: DOUBLE; pz: DOUBLE; i: INTEGER; bi: BODY
		do
			create bodies.make(5)
			create b.sun
			bodies.put(b, 0)
			create b.jupiter
			bodies.put(b, 1)
			create b.saturn
			bodies.put(b, 2)
			create b.uranus
			bodies.put(b, 3)
			create b.neptune
			bodies.put(b, 4)
			from
				i := 0
			until
				i = 5
			loop
				bi := bodies.item(i)
				px := px + bi.vx * bi.mass
				py := py + bi.vy * bi.mass
				pz := pz + bi.vz * bi.mass
				i := i + 1
			end
			bodies.item(0).offset_momentum(px, py, pz)
		end

	advance (dt: DOUBLE)
		local
			dx: DOUBLE; dy: DOUBLE; dz: DOUBLE; distance: DOUBLE; mag: DOUBLE; i: INTEGER; j: INTEGER; bi: BODY; bj: BODY
		do
			from
				i := 0
			until
				i = 5
			loop
				bi := bodies.item(i)
				from
					j := i + 1
				until
					j = 5
				loop
					bj := bodies.item(j)
					dx := bi.x - bj.x
					dy := bi.y - bj.y
					dz := bi.z - bj.z
					distance := (dx * dx + dy * dy + dz * dz).sqrt
					mag := dt / (distance * distance * distance)
					bi.set_vx(bi.vx - dx * bj.mass * mag)
					bi.set_vy(bi.vy - dy * bj.mass * mag)
					bi.set_vz(bi.vz - dz * bj.mass * mag)
					bj.set_vx(bj.vx + dx * bi.mass * mag)
					bj.set_vy(bj.vy + dy * bi.mass * mag)
					bj.set_vz(bj.vz + dz * bi.mass * mag)
					j := j + 1
				end
				i := i + 1
			end
			from
				i := 0
			until
				i = 5
			loop
				bi := bodies.item(i)
				bi.set_x(bi.x + dt * bi.vx)
				bi.set_y(bi.y + dt * bi.vy)
				bi.set_z(bi.z + dt * bi.vz)
				i := i + 1
			end
		end

	energy: DOUBLE
		local
			dx: DOUBLE; dy: DOUBLE; dz: DOUBLE; distance: DOUBLE; e: DOUBLE; i: INTEGER; j: INTEGER; bi: BODY; bj: BODY
		do
			from
				i := 0
			until
				i = 5
			loop
				bi := bodies.item(i)
				e := e + 0.5 * bi.mass * (bi.vx * bi.vx + bi.vy * bi.vy + bi.vz * bi.vz)
				from
					j := i + 1
				until
					j = 5
				loop
					bj := bodies.item(j)
					dx := bi.x - bj.x
					dy := bi.y - bj.y
					dz := bi.z - bj.z
					distance := (dx * dx + dy * dy + dz * dz).sqrt
					e := e - bi.mass * bj.mass / distance
					j := j + 1
				end
				i := i + 1
			end
			Result := e
		end

end -- class NBODY_SYSTEM

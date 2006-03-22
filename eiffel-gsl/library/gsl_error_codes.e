indexing
	description: "values of the the GSL error code"
	copyright: "(C) 2005 Jose Bollo <jose.bollo@laposte.net>"
	license: "LGPL v2 or later"
	date: "$Date$"
	revision "$Revision$"

expanded class GSL_ERROR_CODES
	-- known code (from gsl 1.17, please check that the definition is still ok against gsl/gsl_errno.h)
	-- feature check codes helps to ensure validity
	-- code automatically generated with the following commands:
	-- [1] cat > toto  ((then select the enum body in gsl/gsl_errno.h))
	-- [2] tr -d '=,/*' < toto | sed 's/ *GSL_\([^ ]*\)  *\([^ ]*\)  *\(.*\)/\1\t\2\t\3/' > tata
	-- [3] tr '[[:upper:]]' '[[:lower:]]' < tata | awk -F '\t' '{printf "\t%s: INTEGER is %s\n\t\t-- %s\n\n",$1,$2,$3}'
	-- [4] tr '[[:upper:]]' '[[:lower:]]' < tata | awk -F '\t' '{printf "\t\t\t\t%s = gsl_%s\n",$1,$1}'
	-- [5] cut -f 1 tata | tr '[[:upper:]]' '[[:lower:]]' | paste - tata | awk '{printf "\tgsl_%s: INTEGER is\n\t\t\t-- code of GSL_%s\n\t\texternal \"plug_in\"\n\t\talias \"{\n\t\t\tlocation: \"${xxx}plugins\"\n\t\t\tmodule_name: \"gsl\"\n\t\t\tfeature_name: \"GSL_%s\"\n\t\t\t}\"\n\t\tend\n\n",$1,$2,$2}'
feature

	success: INTEGER is 0
		-- success 

	failure: INTEGER is -1
		-- generic failure 

	continue: INTEGER is -2
		-- iteration has not converged 

	edom: INTEGER is 1
		-- input domain error e.g sqrt(-1) 

	erange: INTEGER is 2
		-- output range error e.g. exp(1e100) 

	efault: INTEGER is 3
		-- invalid pointer 

	einval: INTEGER is 4
		-- invalid argument supplied by user 

	efailed: INTEGER is 5
		-- generic failure 

	efactor: INTEGER is 6
		-- factorization failed 

	esanity: INTEGER is 7
		-- sanity check failed - shouldn't happen 

	enomem: INTEGER is 8
		-- malloc failed 

	ebadfunc: INTEGER is 9
		-- problem with user-supplied function 

	erunaway: INTEGER is 10
		-- iterative process is out of control 

	emaxiter: INTEGER is 11
		-- exceeded max number of iterations 

	ezerodiv: INTEGER is 12
		-- tried to divide by zero 

	ebadtol: INTEGER is 13
		-- user specified an invalid tolerance 

	etol: INTEGER is 14
		-- failed to reach the specified tolerance 

	eundrflw: INTEGER is 15
		-- underflow 

	eovrflw: INTEGER is 16
		-- overflow  

	eloss: INTEGER is 17
		-- loss of accuracy 

	eround: INTEGER is 18
		-- failed because of roundoff error 

	ebadlen: INTEGER is 19
		-- matrix vector lengths are not conformant 

	enotsqr: INTEGER is 20
		-- matrix not square 

	esing: INTEGER is 21
		-- apparent singularity detected 

	ediverge: INTEGER is 22
		-- integral or series is divergent 

	eunsup: INTEGER is 23
		-- requested feature is not supported by the hardware 

	eunimpl: INTEGER is 24
		-- requested feature not (yet) implemented 

	ecache: INTEGER is 25
		-- cache limit exceeded 

	etable: INTEGER is 26
		-- table limit exceeded 

	enoprog: INTEGER is 27
		-- iteration is not making progress towards solution 

	enoprogj: INTEGER is 28
		-- jacobian evaluations are not improving the solution 

	etolf: INTEGER is 29
		-- cannot reach the specified tolerance in f 

	etolx: INTEGER is 30
		-- cannot reach the specified tolerance in x 

	etolg: INTEGER is 31
		-- cannot reach the specified tolerance in gradient 

	eof: INTEGER is 32
		-- end of file 

feature

	check_codes is
			-- check that the code are conform to the GSL definition
		do
			check
				success = gsl_success
				failure = gsl_failure
				continue = gsl_continue
				edom = gsl_edom
				erange = gsl_erange
				efault = gsl_efault
				einval = gsl_einval
				efailed = gsl_efailed
				efactor = gsl_efactor
				esanity = gsl_esanity
				enomem = gsl_enomem
				ebadfunc = gsl_ebadfunc
				erunaway = gsl_erunaway
				emaxiter = gsl_emaxiter
				ezerodiv = gsl_ezerodiv
				ebadtol = gsl_ebadtol
				etol = gsl_etol
				eundrflw = gsl_eundrflw
				eovrflw = gsl_eovrflw
				eloss = gsl_eloss
				eround = gsl_eround
				ebadlen = gsl_ebadlen
				enotsqr = gsl_enotsqr
				esing = gsl_esing
				ediverge = gsl_ediverge
				eunsup = gsl_eunsup
				eunimpl = gsl_eunimpl
				ecache = gsl_ecache
				etable = gsl_etable
				enoprog = gsl_enoprog
				enoprogj = gsl_enoprogj
				etolf = gsl_etolf
				etolx = gsl_etolx
				etolg = gsl_etolg
				eof = gsl_eof
			end
		end

feature {}

	gsl_success: INTEGER is
			-- code of GSL_SUCCESS
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_SUCCESS"
		end

	gsl_failure: INTEGER is
			-- code of GSL_FAILURE
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_FAILURE"
		end

	gsl_continue: INTEGER is
			-- code of GSL_CONTINUE
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_CONTINUE"
		end

	gsl_edom: INTEGER is
			-- code of GSL_EDOM
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EDOM"
		end

	gsl_erange: INTEGER is
			-- code of GSL_ERANGE
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ERANGE"
		end

	gsl_efault: INTEGER is
			-- code of GSL_EFAULT
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EFAULT"
		end

	gsl_einval: INTEGER is
			-- code of GSL_EINVAL
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EINVAL"
		end

	gsl_efailed: INTEGER is
			-- code of GSL_EFAILED
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EFAILED"
		end

	gsl_efactor: INTEGER is
			-- code of GSL_EFACTOR
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EFACTOR"
		end

	gsl_esanity: INTEGER is
			-- code of GSL_ESANITY
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ESANITY"
		end

	gsl_enomem: INTEGER is
			-- code of GSL_ENOMEM
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ENOMEM"
		end

	gsl_ebadfunc: INTEGER is
			-- code of GSL_EBADFUNC
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EBADFUNC"
		end

	gsl_erunaway: INTEGER is
			-- code of GSL_ERUNAWAY
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ERUNAWAY"
		end

	gsl_emaxiter: INTEGER is
			-- code of GSL_EMAXITER
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EMAXITER"
		end

	gsl_ezerodiv: INTEGER is
			-- code of GSL_EZERODIV
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EZERODIV"
		end

	gsl_ebadtol: INTEGER is
			-- code of GSL_EBADTOL
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EBADTOL"
		end

	gsl_etol: INTEGER is
			-- code of GSL_ETOL
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ETOL"
		end

	gsl_eundrflw: INTEGER is
			-- code of GSL_EUNDRFLW
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EUNDRFLW"
		end

	gsl_eovrflw: INTEGER is
			-- code of GSL_EOVRFLW
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EOVRFLW"
		end

	gsl_eloss: INTEGER is
			-- code of GSL_ELOSS
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ELOSS"
		end

	gsl_eround: INTEGER is
			-- code of GSL_EROUND
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EROUND"
		end

	gsl_ebadlen: INTEGER is
			-- code of GSL_EBADLEN
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EBADLEN"
		end

	gsl_enotsqr: INTEGER is
			-- code of GSL_ENOTSQR
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ENOTSQR"
		end

	gsl_esing: INTEGER is
			-- code of GSL_ESING
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ESING"
		end

	gsl_ediverge: INTEGER is
			-- code of GSL_EDIVERGE
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EDIVERGE"
		end

	gsl_eunsup: INTEGER is
			-- code of GSL_EUNSUP
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EUNSUP"
		end

	gsl_eunimpl: INTEGER is
			-- code of GSL_EUNIMPL
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EUNIMPL"
		end

	gsl_ecache: INTEGER is
			-- code of GSL_ECACHE
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ECACHE"
		end

	gsl_etable: INTEGER is
			-- code of GSL_ETABLE
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ETABLE"
		end

	gsl_enoprog: INTEGER is
			-- code of GSL_ENOPROG
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ENOPROG"
		end

	gsl_enoprogj: INTEGER is
			-- code of GSL_ENOPROGJ
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ENOPROGJ"
		end

	gsl_etolf: INTEGER is
			-- code of GSL_ETOLF
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ETOLF"
		end

	gsl_etolx: INTEGER is
			-- code of GSL_ETOLX
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ETOLX"
		end

	gsl_etolg: INTEGER is
			-- code of GSL_ETOLG
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_ETOLG"
		end

	gsl_eof: INTEGER is
			-- code of GSL_EOF
		external "C use <gsl/gsl_errno.h>"
		alias "GSL_EOF"
		end

end


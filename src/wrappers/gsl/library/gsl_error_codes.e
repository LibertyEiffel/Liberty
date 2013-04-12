indexing
	description: "values of the the GSL error code"
	copyright: "(C) 2005 Jose Bollo <jose.bollo@laposte.net> %
   %2006 Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date$"
	revision "$Revision$"

expanded class GSL_ERROR_CODES
	-- known code (from gsl 1.4, please check that the definition is still ok against gsl/gsl_errno.h)
	-- feature check codes helps to ensure validity
	-- code automatically generated with the following commands:
	-- [1] cat > toto  ((then select the enum body in gsl/gsl_errno.h))
	-- [2] tr -d '=,/*' < toto | sed 's/ *GSL_\([^ ]*\)  *\([^ ]*\)  *\(.*\)/\1\t\2\t\3/' > tata
	-- [3] tr '[[:upper:]]' '[[:lower:]]' < tata | awk -F '\t' '{printf "\t%s: INTEGER is %s\n\t\t-- %s\n\n",$1,$2,$3}'
	-- [4] tr '[[:upper:]]' '[[:lower:]]' < tata | awk -F '\t' '{printf "\t\t\t\t%s = gsl_%s\n",$1,$1}'
	-- [5] cut -f 1 tata | tr '[[:upper:]]' '[[:lower:]]' | paste - tata | awk '{printf "\tgsl_%s: INTEGER is\n\t\t\t-- code of GSL_%s\n\t\texternal \"plug_in\"\n\t\talias \"{\n\t\t\tlocation: "externals"

   -- changed constants to begin with a capital letter
   -- also changed to match plugin scheme

feature {ANY}

	Success: INTEGER is 0
		-- success 

	Failure: INTEGER is -1
		-- generic failure 

	Continue: INTEGER is -2
		-- iteration has not converged 

	Edom: INTEGER is 1
		-- input domain error e.g sqrt(-1) 

	Erange: INTEGER is 2
		-- output range error e.g. exp(1e100) 

	Efault: INTEGER is 3
		-- invalid pointer 

	Einval: INTEGER is 4
		-- invalid argument supplied by user 

	Efailed: INTEGER is 5
		-- generic failure 

	Efactor: INTEGER is 6
		-- factorization failed 

	Esanity: INTEGER is 7
		-- sanity check failed - shouldn't happen 

	Enomem: INTEGER is 8
		-- malloc failed 

	Ebadfunc: INTEGER is 9
		-- problem with user-supplied function 

	Erunaway: INTEGER is 10
		-- iterative process is out of control 

	Emaxiter: INTEGER is 11
		-- exceeded max number of iterations 

	Ezerodiv: INTEGER is 12
		-- tried to divide by zero 

	Ebadtol: INTEGER is 13
		-- user specified an invalid tolerance 

	Etol: INTEGER is 14
		-- failed to reach the specified tolerance 

	Eundrflw: INTEGER is 15
		-- underflow 

	Eovrflw: INTEGER is 16
		-- overflow  

	Eloss: INTEGER is 17
		-- loss of accuracy 

	Eround: INTEGER is 18
		-- failed because of roundoff error 

	Ebadlen: INTEGER is 19
		-- matrix vector lengths are not conformant 

	Enotsqr: INTEGER is 20
		-- matrix not square 

	Esing: INTEGER is 21
		-- apparent singularity detected 

	Ediverge: INTEGER is 22
		-- integral or series is divergent 

	Eunsup: INTEGER is 23
		-- requested feature is not supported by the hardware 

	Eunimpl: INTEGER is 24
		-- requested feature not (yet) implemented 

	Ecache: INTEGER is 25
		-- cache limit exceeded 

	Etable: INTEGER is 26
		-- table limit exceeded 

	Enoprog: INTEGER is 27
		-- iteration is not making progress towards solution 

	Enoprogj: INTEGER is 28
		-- jacobian evaluations are not improving the solution 

	Etolf: INTEGER is 29
		-- cannot reach the specified tolerance in f 

	Etolx: INTEGER is 30
		-- cannot reach the specified tolerance in x 

	Etolg: INTEGER is 31
		-- cannot reach the specified tolerance in gradient 

	Eof: INTEGER is 32
		-- end of file 

feature {ANY}

	check_codes is
			-- check that the code are conform to the GSL definition
		do
			check
				Success = gsl_success
				Failure = gsl_failure
				Continue = gsl_continue
				Edom = gsl_edom
				Erange = gsl_erange
				Efault = gsl_efault
				Einval = gsl_einval
				Efailed = gsl_efailed
				Efactor = gsl_efactor
				Esanity = gsl_esanity
				Enomem = gsl_enomem
				Ebadfunc = gsl_ebadfunc
				Erunaway = gsl_erunaway
				Emaxiter = gsl_emaxiter
				Ezerodiv = gsl_ezerodiv
				Ebadtol = gsl_ebadtol
				Etol = gsl_etol
				Eundrflw = gsl_eundrflw
				Eovrflw = gsl_eovrflw
				Eloss = gsl_eloss
				Eround = gsl_eround
				Ebadlen = gsl_ebadlen
				Enotsqr = gsl_enotsqr
				Esing = gsl_esing
				Ediverge = gsl_ediverge
				Eunsup = gsl_eunsup
				Eunimpl = gsl_eunimpl
				Ecache = gsl_ecache
				Etable = gsl_etable
				Enoprog = gsl_enoprog
				Enoprogj = gsl_enoprogj
				Etolf = gsl_etolf
				Etolx = gsl_etolx
				Etolg = gsl_etolg
				Eof = gsl_eof
			end
		end

feature {}

	gsl_success: INTEGER is
			-- code of GSL_SUCCESS
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_SUCCESS"
         }"
		end

	gsl_failure: INTEGER is
			-- code of GSL_FAILURE
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_FAILURE"
         }"
		end

	gsl_continue: INTEGER is
			-- code of GSL_CONTINUE
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_CONTINUE"
         }"
		end

	gsl_edom: INTEGER is
			-- code of GSL_EDOM
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EDOM"
         }"
		end

	gsl_erange: INTEGER is
			-- code of GSL_ERANGE
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ERANGE"
         }"
		end

	gsl_efault: INTEGER is
			-- code of GSL_EFAULT
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EFAULT"
         }"
		end

	gsl_einval: INTEGER is
			-- code of GSL_EINVAL
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EINVAL"
         }"
		end

	gsl_efailed: INTEGER is
			-- code of GSL_EFAILED
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EFAILED"
         }"
		end

	gsl_efactor: INTEGER is
			-- code of GSL_EFACTOR
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EFACTOR"
         }"
		end

	gsl_esanity: INTEGER is
			-- code of GSL_ESANITY
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ESANITY"
         }"
		end

	gsl_enomem: INTEGER is
			-- code of GSL_ENOMEM
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ENOMEM"
         }"
		end

	gsl_ebadfunc: INTEGER is
			-- code of GSL_EBADFUNC
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EBADFUNC"
         }"
		end

	gsl_erunaway: INTEGER is
			-- code of GSL_ERUNAWAY
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ERUNAWAY"
         }"
		end

	gsl_emaxiter: INTEGER is
			-- code of GSL_EMAXITER
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EMAXITER"
         }"
		end

	gsl_ezerodiv: INTEGER is
			-- code of GSL_EZERODIV
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EZERODIV"
         }"
		end

	gsl_ebadtol: INTEGER is
			-- code of GSL_EBADTOL
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EBADTOL"
         }"
		end

	gsl_etol: INTEGER is
			-- code of GSL_ETOL
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ETOL"
         }"
		end

	gsl_eundrflw: INTEGER is
			-- code of GSL_EUNDRFLW
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EUNDRFLW"
         }"
		end

	gsl_eovrflw: INTEGER is
			-- code of GSL_EOVRFLW
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EOVRFLW"
         }"
		end

	gsl_eloss: INTEGER is
			-- code of GSL_ELOSS
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ELOSS"
         }"
		end

	gsl_eround: INTEGER is
			-- code of GSL_EROUND
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EROUND"
         }"
		end

	gsl_ebadlen: INTEGER is
			-- code of GSL_EBADLEN
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EBADLEN"
         }"
		end

	gsl_enotsqr: INTEGER is
			-- code of GSL_ENOTSQR
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ENOTSQR"
         }"
		end

	gsl_esing: INTEGER is
			-- code of GSL_ESING
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ESING"
         }"
		end

	gsl_ediverge: INTEGER is
			-- code of GSL_EDIVERGE
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EDIVERGE"
         }"
		end

	gsl_eunsup: INTEGER is
			-- code of GSL_EUNSUP
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EUNSUP"
         }"
		end

	gsl_eunimpl: INTEGER is
			-- code of GSL_EUNIMPL
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EUNIMPL"
         }"
		end

	gsl_ecache: INTEGER is
			-- code of GSL_ECACHE
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ECACHE"
         }"
		end

	gsl_etable: INTEGER is
			-- code of GSL_ETABLE
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ETABLE"
         }"
		end

	gsl_enoprog: INTEGER is
			-- code of GSL_ENOPROG
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ENOPROG"
         }"
		end

	gsl_enoprogj: INTEGER is
			-- code of GSL_ENOPROGJ
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ENOPROGJ"
         }"
		end

	gsl_etolf: INTEGER is
			-- code of GSL_ETOLF
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ETOLF"
         }"
		end

	gsl_etolx: INTEGER is
			-- code of GSL_ETOLX
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ETOLX"
         }"
		end

	gsl_etolg: INTEGER is
			-- code of GSL_ETOLG
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_ETOLG"
         }"
		end

	gsl_eof: INTEGER is
			-- code of GSL_EOF
		external "plug_in"
		alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "GSL_EOF"
         }"
		end

end


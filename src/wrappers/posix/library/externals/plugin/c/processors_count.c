#ifndef LIBERTY_EIFFEL_PROCESSORS_COUNT
#   define LIBERTY_EIFFEL_PROCESSORS_COUNT 1

// Obtain the number of processers in the system.
int processors_count() {

#   ifdef WIN32
    // Windows
    SYSTEM_INFO sysinfo;
    GetSystemInfo( &sysinfo );
    return sysinfo.dwNumberOfProcessors;

#   elif defined(linux)
        // Linux, Solaris, & AIX (per comments):
        return sysconf( _SC_NPROCESSORS_ONLN );
#   elif defined(__FreeBSD__)
        // FreeBSD, MacOS X, NetBSD, OpenBSD, etc.:

        int numCPU; 
        int mib[4];
        size_t len = sizeof(numCPU);

        /* set the mib for hw.ncpu */
        mib[0] = CTL_HW;
        mib[1] = HW_AVAILCPU;  // alternatively, try HW_NCPU;

        /* get the number of CPUs from the system */
        sysctl(mib, 2, &numCPU, &len, NULL, 0);

        if (numCPU < 1) {
            mib[1] = HW_NCPU;
            sysctl( mib, 2, &numCPU, &len, NULL, 0 );

            if (numCPU < 1) numCPU = 1;
        }

#   elif defined(__hppa__)|| defined(__hppa) || defined(__hp9000) || \
      defined(__hp9000s300) || defined(hp9000s300) || \
      defined(__hp9000s700) || defined(hp9000s700) || \
      defined(__hp9000s800) || defined(hp9000s800) || defined(hp9000s820)

        // HPUX:
        return mpctl(MPC_GETNUMSPUS, NULL, NULL);
//TODO: find IRIX preprocessor directive
//#   elif defined something to recognize IRIX
//        // IRIX:
//        return sysconf( _SC_NPROC_ONLN );
#   endif
}
// on Mac OS X using Objective-C (10.5 and higher) this code will also work:

//    NSUInteger a = [[NSProcessInfo processInfo] processorCount];
//    NSUInteger b = [[NSProcessInfo processInfo] activeProcessorCount];
#endif

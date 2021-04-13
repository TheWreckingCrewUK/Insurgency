#define DEBUG_MODE
//#define PERFORMANCE_MODE

#ifdef DEBUG_MODE
	#define DEBUG_LOG(SCRIPT) \
		systemChat ("TWC_Insurgency_LOG: " + __FILE__ + " " + SCRIPT); \
		diag_log ("TWC_Insurgency_LOG: " + __FILE__ + " " + SCRIPT);
#endif

#ifndef DEBUG_MODE
	#define DEBUG_LOG(SCRIPT)
#endif

//Variables for constant use
#define INFINITE_DISTANCE 999999
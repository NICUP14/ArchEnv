//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	// {"CPU: ",  "top -bn1 | awk '/%Cpu/ {print 100 - $8 \"%\"}'",            1,              0},
	// {"GPU: ",  "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	1,		0},
	{"BAT0: ", "~/.local/scripts/battery.sh BAT0",	                        30,		0},
	{"BAT1: ", "~/.local/scripts/battery.sh BAT1",	                        30,		0},
	{"",   "date \"+%H:%M\"",					        1,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;

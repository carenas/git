#include "../git-compat-util.h"

pid_t getpgid(pid_t pid)
{
	return pid ? pid : getpid();
}

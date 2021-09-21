#include "../git-compat-util.h"

void *memrchr(const void *s, int c, size_t n)
{
	const unsigned char *cp = (unsigned char *)s + n;

	if (!n)
		return NULL;
	do {
		if (*(--cp) == (unsigned char)c)
			return (void *)cp;
	} while (--n);
	return NULL;
}

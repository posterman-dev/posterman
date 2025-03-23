#ifndef __PM_UTIL_H__
#define __PM_UTIL_H__

#include <stdio.h>

#define pm_loud_printf(arg...) pm_loud_fprintf(stdout, arg)
void pm_loud_fprintf(FILE* f, const char* fmt, ...);

#endif

#ifndef __PM_UTIL_H__
#define __PM_UTIL_H__

#include <pm_bool.h>

#include <stdio.h>

void pm_set_quiet(PMBOOL t);

#define pm_loud_printf(arg...) pm_loud_fprintf(stdout, arg)
void pm_loud_fprintf(FILE* f, const char* fmt, ...);

#endif

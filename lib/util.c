#include <pm_util.h>
#include <pm_bool.h>

#include <stdio.h>
#include <stdarg.h>

PMBOOL pm_quiet = PMFALSE;

void pm_set_quiet(PMBOOL t) { pm_quiet = t; }

void pm_loud_fprintf(FILE* f, const char* fmt, ...) {
	va_list va;
	if(pm_quiet) return;
	va_start(va, fmt);
	vfprintf(f, fmt, va);
	va_end(va);
}

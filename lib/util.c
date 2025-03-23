#include <pm_util.h>

#include <stdio.h>
#include <stdarg.h>

void pm_loud_fprintf(FILE* f, const char* fmt, ...) {
	va_list va;
	va_start(va, fmt);
	vfprintf(f, fmt, va);
	va_end(va);
}

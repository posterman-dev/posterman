#ifndef __PM_VERSION_H__
#define __PM_VERSION_H__

#define PM_VERSION "1.0.0"

typedef struct pm_version {
	int  major;
	int  minor;
	int  patch;
	char full[64];
} pm_version_t;

void pm_get_version(pm_version_t* version);

#endif

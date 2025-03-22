#include <pm_version.h>

#include <string.h>

void pm_get_version(pm_version_t* version){
	strcpy(version->full, PM_VERSION);
}

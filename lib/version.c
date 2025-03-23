#include <pm_version.h>

#include <string.h>
#include <stdlib.h>

void pm_get_version(pm_version_t* version){
	char* cpstr = malloc(strlen(PM_VERSION) + 1);
	int i;
	int incr = 0;
	int old = 0;
	strcpy(cpstr, PM_VERSION);
	strcpy(version->full, PM_VERSION);
	for(i = 0;; i++){
		if(cpstr[i] == '.' || cpstr[i] == 0){
			int num;
			cpstr[i] = 0;
			num = atoi(cpstr + old);
			if(incr == 0){
				version->major = num;
			}else if(incr == 1){
				version->minor = num;
			}else if(incr == 2){
				version->patch = num;
			}
			old = i + 1;
			incr++;
			if(incr == 3) break;
		}
	}
}

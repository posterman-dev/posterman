#include <stdio.h>

#include <pm_version.h>

int main(int argc, char** argv){
	pm_version_t ver;
	pm_get_version(&ver);
	return 0;
}

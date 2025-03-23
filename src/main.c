#include <pm_version.h>
#include <pm_util.h>

#include <stdio.h>
#include <string.h>

int main(int argc, char** argv) {
	pm_version_t ver;
	int	     i;
	pm_get_version(&ver);
	pm_set_quiet(PMFALSE);
	for(i = 1; i < argc; i++) {
		if(argv[i][0] == '-') {
			if(strcmp(argv[i], "-V") == 0 || strcmp(argv[i], "--version") == 0) {
				printf("%s\n", ver.full);
				return 0;
			} else if(strcmp(argv[i], "-q") == 0 || strcmp(argv[i], "--quiet") == 0) {
				pm_set_quiet(PMTRUE);
			} else {
				fprintf(stderr, "Unknown flag: %s\n", argv[i]);
				return 1;
			}
		}
	}
	pm_loud_printf("PosterMan %s (%s)\n", ver.full, BUILD_DATE);
	pm_loud_printf("This software is supplied under the public-domain, and comes with NO WARRANTY.\n");
	return 0;
}

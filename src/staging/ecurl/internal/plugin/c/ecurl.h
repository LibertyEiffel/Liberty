#define CURL_NO_OLDIES
#include <curl/curl.h>

void ecurl_auto_init(void);

void ecurl_init_write_function(void *handle, void *userp);
void ecurl_init_read_function(void *handle, void *userp);

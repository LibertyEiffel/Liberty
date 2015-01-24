#define CURL_NO_OLDIES
#include <curl/curl.h>

void ecurl_auto_init(void);

#define curl_easy_init curl_easy_init()

void ecurl_init_write_function(void *handle, void *userp);
void ecurl_init_read_function(void *handle, void *userp);

#define CURL_NO_OLDIES
#include <curl/curl.h>

void ecurl_auto_init(void);

#define curl_easy_init curl_easy_init()
#define curl_multi_init curl_multi_init()

void ecurl_init_write_function(void *handle, void *userp);
void ecurl_init_read_function(void *handle, void *userp);

void* ecurl_multi_info_easy_handle(CURLMsg *msg);
int   ecurl_multi_info_easy_code(CURLMsg *msg);
int   ecurl_multi_info_easy_done(CURLMsg *msg);

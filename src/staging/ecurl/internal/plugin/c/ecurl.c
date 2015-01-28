#include "eiffel_curl.h"

static void ecurl_se_handler(se_handler_action_t action, void*data) {
     switch(action) {
     case SE_HANDLE_NO_MORE_MEMORY:
     case SE_HANDLE_RUNTIME_ERROR:
     case SE_HANDLE_DIE_WITH_CODE:
     case SE_HANDLE_NORMAL_EXIT:
          curl_global_cleanup();
     }
}

void ecurl_auto_init(void) {
     CURLcode code;
     code = curl_global_init(CURL_GLOBAL_ALL);
     if (code) {
          fprintf(stderr, "**** ecurl_auto_init: global init returned %d (%s)\n", code, curl_easy_strerror(code));
     } else {
          register_handler(ecurl_se_handler);
     }
}

static size_t ecurl_write_function(void *buffer, size_t size, size_t nmemb, void *userp) {
     size_t result = size * nmemb;
     ecurl_write_callback(userp, buffer, (int)result);
     return result;
}

void ecurl_init_write_function(void *handle, void *userp) {
     curl_easy_setopt(handle, CURLOPT_WRITEFUNCTION, ecurl_write_function);
     curl_easy_setopt(handle, CURLOPT_WRITEDATA, userp);
}

static size_t ecurl_read_function(char *buffer, size_t size, size_t nitems, void *userp) {
     return (size_t)ecurl_read_callback(userp, buffer, (int)(size * nitems));
}

void ecurl_init_read_function(void *handle, void *userp) {
     curl_easy_setopt(handle, CURLOPT_READFUNCTION, ecurl_read_function);
     curl_easy_setopt(handle, CURLOPT_READDATA, userp);
     curl_easy_setopt(handle, CURLOPT_UPLOAD, 1L);
}

void* ecurl_multi_info_easy_handle(CURLMsg *msg) {
   return msg->easy_handle;
}

int ecurl_multi_info_easy_code(CURLMsg *msg) {
   return msg->data.result;
}

int ecurl_multi_info_easy_done(CURLMsg *msg) {
   return CURLMSG_DONE == msg->msg;
}

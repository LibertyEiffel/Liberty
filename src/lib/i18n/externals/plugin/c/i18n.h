#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE || (defined __APPLE__ && defined __MACH__)

#include <stdio.h>
#include <stdlib.h>
#include <libintl.h>
#include <locale.h>
#include <time.h>
#include <langinfo.h>

#else

#endif

extern void  i18n_set_system_locale (void* language, void* country, void* encoding);
extern void* i18n_get_environment_language (void);
extern void* i18n_localized_time (int64_t time);
extern void* i18n_localized_date (int64_t time);
extern void* i18n_localized_time_and_date (int64_t time);
extern void* i18n_localized_day (int32_t day);
extern void* i18n_localized_abbreviated_day (int32_t day);
extern void* i18n_localized_month (int32_t month);
extern void* i18n_localized_abbreviated_month (int32_t month);
extern void* i18n_localized_radix_character (void);
extern void* i18n_localized_thousands_separator (void);
extern void* i18n_localized_yes (void);
extern void* i18n_localized_no (void);
extern void* i18n_localized_ante_meridiem (void);
extern void* i18n_localized_post_meridiem (void);
extern void* i18n_localized_text (void* text_id);

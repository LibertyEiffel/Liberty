#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE || (defined __APPLE__ && defined __MACH__)

void i18n_set_system_locale (void* language, void* country, void* encoding) {
  static char locale[32];
  if (country == NULL) {
    snprintf(locale, 32, "%s", (char*)language);
  } else if (encoding == NULL) {
    snprintf(locale, 32, "%s_%s", (char*)language, (char*)country);
  } else {
    snprintf(locale, 32, "%s_%s.%s", (char*)language, (char*)country, (char*)encoding);
  }
  setlocale(LC_ALL, locale);
}

void* i18n_get_environment_language (void) {
  char* result = NULL;
  result = getenv("LANGUAGE");
  if (result == NULL) {
    result = getenv("LC_ALL");
    if (result == NULL) {
      result = getenv("LANG");
    }
  }
  return result;
}

void* i18n_localized_time (int64_t time) {
  static char result[128];
  struct tm* tm;
  time_t t = (time_t)time;
  char* format = nl_langinfo(T_FMT);
  tm = localtime(&t);
  strftime(result, 128, format, tm);
  return result;
}

void* i18n_localized_date (int64_t time) {
  static char result[128];
  struct tm* tm;
  time_t t = (time_t)time;
  char* format = nl_langinfo(D_FMT);
  tm = localtime(&t);
  strftime(result, 128, format, tm);
  return result;
}

void* i18n_localized_time_and_date (int64_t time) {
  static char result[128];
  struct tm* tm;
  time_t t = (time_t)time;
  char* format = nl_langinfo(D_T_FMT);
  tm = localtime(&t);
  strftime(result, 128, format, tm);
  return result;
}

void* i18n_localized_day (int32_t day) {
  char* result;
  switch(day) {
  case 0:
  case 7:
    result = nl_langinfo(DAY_1);
  case 1:
    result = nl_langinfo(DAY_2);
  case 2:
    result = nl_langinfo(DAY_3);
  case 3:
    result = nl_langinfo(DAY_4);
  case 4:
    result = nl_langinfo(DAY_5);
  case 5:
    result = nl_langinfo(DAY_6);
  case 6:
    result = nl_langinfo(DAY_7);
  }
  return result;
}

void* i18n_localized_abbreviated_day (int32_t day) {
  char* result;
  switch(day) {
  case 0:
  case 7:
    result = nl_langinfo(ABDAY_1);
  case 1:
    result = nl_langinfo(ABDAY_2);
  case 2:
    result = nl_langinfo(ABDAY_3);
  case 3:
    result = nl_langinfo(ABDAY_4);
  case 4:
    result = nl_langinfo(ABDAY_5);
  case 5:
    result = nl_langinfo(ABDAY_6);
  case 6:
    result = nl_langinfo(ABDAY_7);
  }
  return result;
}

void* i18n_localized_month (int32_t month) {
  char* result;
  switch(month) {
  case 1:
    result = nl_langinfo(MON_1);
  case 2:
    result = nl_langinfo(MON_2);
  case 3:
    result = nl_langinfo(MON_3);
  case 4:
    result = nl_langinfo(MON_4);
  case 5:
    result = nl_langinfo(MON_5);
  case 6:
    result = nl_langinfo(MON_6);
  case 7:
    result = nl_langinfo(MON_7);
  case 8:
    result = nl_langinfo(MON_8);
  case 9:
    result = nl_langinfo(MON_9);
  case 10:
    result = nl_langinfo(MON_10);
  case 11:
    result = nl_langinfo(MON_11);
  case 12:
    result = nl_langinfo(MON_12);
  }
  return result;
}

void* i18n_localized_abbreviated_month (int32_t month) {
  char* result;
  switch(month) {
  case 1:
    result = nl_langinfo(ABMON_1);
  case 2:
    result = nl_langinfo(ABMON_2);
  case 3:
    result = nl_langinfo(ABMON_3);
  case 4:
    result = nl_langinfo(ABMON_4);
  case 5:
    result = nl_langinfo(ABMON_5);
  case 6:
    result = nl_langinfo(ABMON_6);
  case 7:
    result = nl_langinfo(ABMON_7);
  case 8:
    result = nl_langinfo(ABMON_8);
  case 9:
    result = nl_langinfo(ABMON_9);
  case 10:
    result = nl_langinfo(ABMON_10);
  case 11:
    result = nl_langinfo(ABMON_11);
  case 12:
    result = nl_langinfo(ABMON_12);
  }
  return result;
}

void* i18n_localized_radix_character (void) {
  return nl_langinfo(RADIXCHAR);
}

void* i18n_localized_thousands_separator (void) {
  return nl_langinfo(THOUSEP);
}

void* i18n_localized_yes (void) {
  return nl_langinfo(YESEXPR);
}

void* i18n_localized_no (void) {
  return nl_langinfo(NOEXPR);
}

void* i18n_localized_ante_meridiem (void) {
  return nl_langinfo(AM_STR);
}

void* i18n_localized_post_meridiem (void) {
  return nl_langinfo(PM_STR);
}

void* i18n_localized_text (void* text_id) {
  return gettext((char*)text_id);
}

#else

void i18n_set_system_locale (void* language, void* country, void* encoding) {
  /* not yet implemented */
}

void* i18n_get_environment_language (void) {
  return NULL; /* not yet implemented */
}

void* i18n_localized_time (int64_t time) {
  return NULL; /* not yet implemented */
}

void* i18n_localized_date (int64_t time) {
  return NULL; /* not yet implemented */
}

void* i18n_localized_time_and_date (int64_t time) {
  return NULL; /* not yet implemented */
}

void* i18n_localized_day (int32_t day) {
  return NULL; /* not yet implemented */
}

void* i18n_localized_abbreviated_day (int32_t day) {
  return NULL; /* not yet implemented */
}

void* i18n_localized_month (int32_t month) {
  return NULL; /* not yet implemented */
}

void* i18n_localized_abbreviated_month (int32_t month) {
  return NULL; /* not yet implemented */
}

void* i18n_localized_radix_character (void) {
  return NULL; /* not yet implemented */
}

void* i18n_localized_thousands_separator (void) {
  return NULL; /* not yet implemented */
}

void* i18n_localized_yes (void) {
  return NULL; /* not yet implemented */
}

void* i18n_localized_no (void) {
  return NULL; /* not yet implemented */
}

void* i18n_localized_ante_meridiem (void) {
  return NULL; /* not yet implemented */
}

void* i18n_localized_post_meridiem (void) {
  return NULL; /* not yet implemented */
}

void* i18n_localized_text (void* text_id) {
  return text_id; /* not yet implemented */
}

#endif

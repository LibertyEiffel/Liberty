-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ECURL_ERRORS

insert
   ECURL_PLUGIN

feature {ANY} -- Redefined values because it helps write select clauses (see also invariant)
   Ok: INTEGER                                 0
   Unsupported_protocol: INTEGER               1
   Failed_init: INTEGER                        2
   Url_malformat: INTEGER                      3
   Not_built_in: INTEGER                       4
   Couldnt_resolve_proxy: INTEGER              5
   Couldnt_resolve_host: INTEGER               6
   Couldnt_connect: INTEGER                    7
   Ftp_weird_server_reply: INTEGER             8
   Remote_access_denied: INTEGER               9
   Ftp_accept_failed: INTEGER                 10
   Ftp_weird_pass_reply: INTEGER              11
   Ftp_accept_timeout: INTEGER                12
   Ftp_weird_pasv_reply: INTEGER              13
   Ftp_weird_227_format: INTEGER              14
   Ftp_cant_get_host: INTEGER                 15
   Http2: INTEGER                             16
   Ftp_couldnt_set_type: INTEGER              17
   Partial_file: INTEGER                      18
   Ftp_couldnt_retr_file: INTEGER             19
   Obsolete20: INTEGER                        20
   Quote_error: INTEGER                       21
   Http_returned_error: INTEGER               22
   Write_error: INTEGER                       23
   Obsolete24: INTEGER                        24
   Upload_failed: INTEGER                     25
   Read_error: INTEGER                        26
   Out_of_memory: INTEGER                     27
   Operation_timedout: INTEGER                28
   Obsolete29: INTEGER                        29
   Ftp_port_failed: INTEGER                   30
   Ftp_couldnt_use_rest: INTEGER              31
   Obsolete32: INTEGER                        32
   Range_error: INTEGER                       33
   Http_post_error: INTEGER                   34
   Ssl_connect_error: INTEGER                 35
   Bad_download_resume: INTEGER               36
   File_couldnt_read_file: INTEGER            37
   Ldap_cannot_bind: INTEGER                  38
   Ldap_search_failed: INTEGER                39
   Obsolete40: INTEGER                        40
   Function_not_found: INTEGER                41
   Aborted_by_callback: INTEGER               42
   Bad_function_argument: INTEGER             43
   Obsolete44: INTEGER                        44
   Interface_failed: INTEGER                  45
   Obsolete46: INTEGER                        46
   Too_many_redirects: INTEGER                47
   Unknown_option: INTEGER                    48
   Telnet_option_syntax: INTEGER              49
   Obsolete50: INTEGER                        50
   Peer_failed_verification: INTEGER          51
   Got_nothing: INTEGER                       52
   Ssl_engine_notfound: INTEGER               53
   Ssl_engine_setfailed: INTEGER              54
   Send_error: INTEGER                        55
   Recv_error: INTEGER                        56
   Obsolete57: INTEGER                        57
   Ssl_certproblem: INTEGER                   58
   Ssl_cipher: INTEGER                        59
   Ssl_cacert: INTEGER                        60
   Bad_content_encoding: INTEGER              61
   Ldap_invalid_url: INTEGER                  62
   Filesize_exceeded: INTEGER                 63
   Use_ssl_failed: INTEGER                    64
   Send_fail_rewind: INTEGER                  65
   Ssl_engine_initfailed: INTEGER             66
   Login_denied: INTEGER                      67
   Tftp_notfound: INTEGER                     68
   Tftp_perm: INTEGER                         69
   Remote_disk_full: INTEGER                  70
   Tftp_illegal: INTEGER                      71
   Tftp_unknownid: INTEGER                    72
   Remote_file_exists: INTEGER                73
   Tftp_nosuchuser: INTEGER                   74
   Conv_failed: INTEGER                       75
   Conv_reqd: INTEGER                         76
   Ssl_cacert_badfile: INTEGER                77
   Remote_file_not_found: INTEGER             78
   Ssh: INTEGER                               79
   Ssl_shutdown_failed: INTEGER               80
   Again: INTEGER                             81
   Ssl_crl_badfile: INTEGER                   82
   Ssl_issuer_error: INTEGER                  83
   Ftp_pret_failed: INTEGER                   84
   Rtsp_cseq_error: INTEGER                   85
   Rtsp_session_error: INTEGER                86
   Ftp_bad_file_list: INTEGER                 87
   Chunk_failed: INTEGER                      88
   No_connection_available: INTEGER           89
   Ssl_pinnedpubkeynotmatch: INTEGER          90

   valid_error (code: INTEGER): BOOLEAN
      do
         Result := code.in_range(0, 90)
      end

   error_string (code: INTEGER): STRING
      require
         valid_error(code)
      do
         Result := once ""
         Result.from_external_copy(curl_easy_strerror(code))
      end

invariant
   Curle_ok                                      = Ok
   Curle_unsupported_protocol                    = Unsupported_protocol
   Curle_failed_init                             = Failed_init
   Curle_url_malformat                           = Url_malformat
   Curle_not_built_in                            = Not_built_in
   Curle_couldnt_resolve_proxy                   = Couldnt_resolve_proxy
   Curle_couldnt_resolve_host                    = Couldnt_resolve_host
   Curle_couldnt_connect                         = Couldnt_connect
   Curle_ftp_weird_server_reply                  = Ftp_weird_server_reply
   Curle_remote_access_denied                    = Remote_access_denied
   Curle_ftp_accept_failed                       = Ftp_accept_failed
   Curle_ftp_weird_pass_reply                    = Ftp_weird_pass_reply
   Curle_ftp_accept_timeout                      = Ftp_accept_timeout
   Curle_ftp_weird_pasv_reply                    = Ftp_weird_pasv_reply
   Curle_ftp_weird_227_format                    = Ftp_weird_227_format
   Curle_ftp_cant_get_host                       = Ftp_cant_get_host
   Curle_http2                                   = Http2
   Curle_ftp_couldnt_set_type                    = Ftp_couldnt_set_type
   Curle_partial_file                            = Partial_file
   Curle_ftp_couldnt_retr_file                   = Ftp_couldnt_retr_file
   Curle_obsolete20                              = Obsolete20
   Curle_quote_error                             = Quote_error
   Curle_http_returned_error                     = Http_returned_error
   Curle_write_error                             = Write_error
   Curle_obsolete24                              = Obsolete24
   Curle_upload_failed                           = Upload_failed
   Curle_read_error                              = Read_error
   Curle_out_of_memory                           = Out_of_memory
   Curle_operation_timedout                      = Operation_timedout
   Curle_obsolete29                              = Obsolete29
   Curle_ftp_port_failed                         = Ftp_port_failed
   Curle_ftp_couldnt_use_rest                    = Ftp_couldnt_use_rest
   Curle_obsolete32                              = Obsolete32
   Curle_range_error                             = Range_error
   Curle_http_post_error                         = Http_post_error
   Curle_ssl_connect_error                       = Ssl_connect_error
   Curle_bad_download_resume                     = Bad_download_resume
   Curle_file_couldnt_read_file                  = File_couldnt_read_file
   Curle_ldap_cannot_bind                        = Ldap_cannot_bind
   Curle_ldap_search_failed                      = Ldap_search_failed
   Curle_obsolete40                              = Obsolete40
   Curle_function_not_found                      = Function_not_found
   Curle_aborted_by_callback                     = Aborted_by_callback
   Curle_bad_function_argument                   = Bad_function_argument
   Curle_obsolete44                              = Obsolete44
   Curle_interface_failed                        = Interface_failed
   Curle_obsolete46                              = Obsolete46
   Curle_too_many_redirects                      = Too_many_redirects
   Curle_unknown_option                          = Unknown_option
   Curle_telnet_option_syntax                    = Telnet_option_syntax
   Curle_obsolete50                              = Obsolete50
   Curle_peer_failed_verification                = Peer_failed_verification
   Curle_got_nothing                             = Got_nothing
   Curle_ssl_engine_notfound                     = Ssl_engine_notfound
   Curle_ssl_engine_setfailed                    = Ssl_engine_setfailed
   Curle_send_error                              = Send_error
   Curle_recv_error                              = Recv_error
   Curle_obsolete57                              = Obsolete57
   Curle_ssl_certproblem                         = Ssl_certproblem
   Curle_ssl_cipher                              = Ssl_cipher
   Curle_ssl_cacert                              = Ssl_cacert
   Curle_bad_content_encoding                    = Bad_content_encoding
   Curle_ldap_invalid_url                        = Ldap_invalid_url
   Curle_filesize_exceeded                       = Filesize_exceeded
   Curle_use_ssl_failed                          = Use_ssl_failed
   Curle_send_fail_rewind                        = Send_fail_rewind
   Curle_ssl_engine_initfailed                   = Ssl_engine_initfailed
   Curle_login_denied                            = Login_denied
   Curle_tftp_notfound                           = Tftp_notfound
   Curle_tftp_perm                               = Tftp_perm
   Curle_remote_disk_full                        = Remote_disk_full
   Curle_tftp_illegal                            = Tftp_illegal
   Curle_tftp_unknownid                          = Tftp_unknownid
   Curle_remote_file_exists                      = Remote_file_exists
   Curle_tftp_nosuchuser                         = Tftp_nosuchuser
   Curle_conv_failed                             = Conv_failed
   Curle_conv_reqd                               = Conv_reqd
   Curle_ssl_cacert_badfile                      = Ssl_cacert_badfile
   Curle_remote_file_not_found                   = Remote_file_not_found
   Curle_ssh                                     = Ssh
   Curle_ssl_shutdown_failed                     = Ssl_shutdown_failed
   Curle_again                                   = Again
   Curle_ssl_crl_badfile                         = Ssl_crl_badfile
   Curle_ssl_issuer_error                        = Ssl_issuer_error
   Curle_ftp_pret_failed                         = Ftp_pret_failed
   Curle_rtsp_cseq_error                         = Rtsp_cseq_error
   Curle_rtsp_session_error                      = Rtsp_session_error
   Curle_ftp_bad_file_list                       = Ftp_bad_file_list
   Curle_chunk_failed                            = Chunk_failed
   Curle_no_connection_available                 = No_connection_available
   Curle_ssl_pinnedpubkeynotmatch                = Ssl_pinnedpubkeynotmatch

end -- class ECURL_ERRORS
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.

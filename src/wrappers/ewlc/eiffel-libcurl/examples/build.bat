se c2c https-win.ace
gcc -g -I../library/externals -I/e/spicerack/libcurl-7.15.4/include -c -x c https2.c
gcc -g -I../library/externals -I/e/spicerack/libcurl-7.15.4/include -c -x c https1.c
gcc -g -o https.exe https1.o https2.o ../library/externals/curl_callback.c -L/e/spicerack/libcurl-7.15.4/lib -L/e/Archivos\ de\ programa/MSYS/local/lib/ -lcurl -lssl -lcrypto -lgdi32 -lwinmm -lws2_32 -lz -lws2_32 -x none

note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_BYTE_ORDER_MACROS

-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Byte Order Macros

-- Byte Order Macros %GÅ‚Äî%@ a portable way to convert between different byte orders.
	
-- Synopsis

-- #include <glib.h>


-- #define     G_BYTE_ORDER
-- #define     G_LITTLE_ENDIAN
-- #define     G_BIG_ENDIAN
-- #define     G_PDP_ENDIAN

-- #define     g_htonl                         (val)
-- #define     g_htons                         (val)
-- #define     g_ntohl                         (val)
-- #define     g_ntohs                         (val)

-- #define     GINT_FROM_BE                    (val)
-- #define     GINT_FROM_LE                    (val)
-- #define     GINT_TO_BE                      (val)
-- #define     GINT_TO_LE                      (val)

-- #define     GUINT_FROM_BE                   (val)
-- #define     GUINT_FROM_LE                   (val)
-- #define     GUINT_TO_BE                     (val)
-- #define     GUINT_TO_LE                     (val)

-- #define     GLONG_FROM_BE                   (val)
-- #define     GLONG_FROM_LE                   (val)
-- #define     GLONG_TO_BE                     (val)
-- #define     GLONG_TO_LE                     (val)

-- #define     GULONG_FROM_BE                  (val)
-- #define     GULONG_FROM_LE                  (val)
-- #define     GULONG_TO_BE                    (val)
-- #define     GULONG_TO_LE                    (val)

-- #define     GINT16_FROM_BE                  (val)
-- #define     GINT16_FROM_LE                  (val)
-- #define     GINT16_TO_BE                    (val)
-- #define     GINT16_TO_LE                    (val)

-- #define     GUINT16_FROM_BE                 (val)
-- #define     GUINT16_FROM_LE                 (val)
-- #define     GUINT16_TO_BE                   (val)
-- #define     GUINT16_TO_LE                   (val)

-- #define     GINT32_FROM_BE                  (val)
-- #define     GINT32_FROM_LE                  (val)
-- #define     GINT32_TO_BE                    (val)
-- #define     GINT32_TO_LE                    (val)

-- #define     GUINT32_FROM_BE                 (val)
-- #define     GUINT32_FROM_LE                 (val)
-- #define     GUINT32_TO_BE                   (val)
-- #define     GUINT32_TO_LE                   (val)

-- #define     GINT64_FROM_BE                  (val)
-- #define     GINT64_FROM_LE                  (val)
-- #define     GINT64_TO_BE                    (val)
-- #define     GINT64_TO_LE                    (val)

-- #define     GUINT64_FROM_BE                 (val)
-- #define     GUINT64_FROM_LE                 (val)
-- #define     GUINT64_TO_BE                   (val)
-- #define     GUINT64_TO_LE                   (val)

-- #define     GUINT16_SWAP_BE_PDP             (val)
-- #define     GUINT16_SWAP_LE_BE              (val)
-- #define     GUINT16_SWAP_LE_PDP             (val)

-- #define     GUINT32_SWAP_BE_PDP             (val)
-- #define     GUINT32_SWAP_LE_BE              (val)
-- #define     GUINT32_SWAP_LE_PDP             (val)

-- #define     GUINT64_SWAP_LE_BE              (val)


-- Description

-- These macros provide a portable way to determine the host byte order and to convert values between different byte orders.

-- The byte order is the order in which bytes are stored to create larger data types such as the gint and glong values. The host byte order is the byte order used on the current machine.

-- Some processors store the most significant bytes (i.e. the bytes that hold the largest part of the value) first. These are known as big-endian processors.

-- Other processors (notably the x86 family) store the most significant byte last. These are known as little-endian processors.

-- Finally, to complicate matters, some other processors store the bytes in a rather curious order known as PDP-endian. For a 4-byte word, the 3rd most significant byte is stored first, then the 4th, then the 1st and finally the 2nd.

-- Obviously there is a problem when these different processors communicate with each other, for example over networks or by using binary file formats. This is where these macros come in. They are typically used to convert values into a byte order which has been agreed on for use when communicating between different processors. The Internet uses what is known as 'network byte order' as the standard byte order (which is in fact the big-endian byte order).

-- Note that the byte order conversion macros may evaluate their arguments multiple times, thus you should not use them with arguments which have side-effects.
-- Details
-- G_BYTE_ORDER

-- #define G_BYTE_ORDER G_LITTLE_ENDIAN

-- The host byte order. This can be either G_LITTLE_ENDIAN or G_BIG_ENDIAN (support for G_PDP_ENDIAN may be added in future.)
-- G_LITTLE_ENDIAN

-- #define G_LITTLE_ENDIAN 1234

-- Specifies one of the possible types of byte order. See G_BYTE_ORDER.
-- G_BIG_ENDIAN

-- #define G_BIG_ENDIAN    4321

-- Specifies one of the possible types of byte order. See G_BYTE_ORDER.
-- G_PDP_ENDIAN

-- #define G_PDP_ENDIAN    3412		/* unused, need specific PDP check */	

-- Specifies one of the possible types of byte order (currently unused). See G_BYTE_ORDER.
-- g_htonl()

-- #define     g_htonl(val)

-- Converts a 32-bit integer value from host to network byte order.
-- val : 	a 32-bit integer value in host byte order.
-- Returns : 	val converted to network byte order.
-- g_htons()

-- #define     g_htons(val)

-- Converts a 16-bit integer value from host to network byte order.
-- val : 	a 16-bit integer value in host byte order.
-- Returns : 	val converted to network byte order.
-- g_ntohl()

-- #define     g_ntohl(val)

-- Converts a 32-bit integer value from network to host byte order.
-- val : 	a 32-bit integer value in network byte order.
-- Returns : 	val converted to host byte order.
-- g_ntohs()

-- #define     g_ntohs(val)

-- Converts a 16-bit integer value from network to host byte order.
-- val : 	a 16-bit integer value in network byte order.
-- Returns : 	val converted to host byte order.
-- GINT_FROM_BE()

-- #define GINT_FROM_BE(val)	(GINT_TO_BE (val))

-- Converts a gint value from big-endian to host byte order.
-- val : 	a gint value in big-endian byte order.
-- Returns : 	val converted to host byte order.
-- GINT_FROM_LE()

-- #define GINT_FROM_LE(val)	(GINT_TO_LE (val))

-- Converts a gint value from little-endian to host byte order.
-- val : 	a gint value in little-endian byte order.
-- Returns : 	val converted to host byte order.
-- GINT_TO_BE()

-- #define GINT_TO_BE(val)		((gint) GINT32_TO_BE (val))

-- Converts a gint value from host byte order to big-endian.
-- val : 	a gint value in host byte order.
-- Returns : 	val converted to big-endian byte order.
-- GINT_TO_LE()

-- #define GINT_TO_LE(val)		((gint) GINT32_TO_LE (val))

-- Converts a gint value from host byte order to little-endian.
-- val : 	a gint value in host byte order.
-- Returns : 	val converted to little-endian byte order.
-- GUINT_FROM_BE()

-- #define GUINT_FROM_BE(val)	(GUINT_TO_BE (val))

-- Converts a guint value from big-endian to host byte order.
-- val : 	a guint value in big-endian byte order.
-- Returns : 	val converted to host byte order.
-- GUINT_FROM_LE()

-- #define GUINT_FROM_LE(val)	(GUINT_TO_LE (val))

-- Converts a guint value from little-endian to host byte order.
-- val : 	a guint value in little-endian byte order.
-- Returns : 	val converted to host byte order.
-- GUINT_TO_BE()

-- #define GUINT_TO_BE(val)	((guint) GUINT32_TO_BE (val))

-- Converts a guint value from host byte order to big-endian.
-- val : 	a guint value in host byte order.
-- Returns : 	val converted to big-endian byte order.
-- GUINT_TO_LE()

-- #define GUINT_TO_LE(val)	((guint) GUINT32_TO_LE (val))

-- Converts a guint value from host byte order to little-endian.
-- val : 	a guint value in host byte order.
-- Returns : 	val converted to little-endian byte order.
-- GLONG_FROM_BE()

-- #define GLONG_FROM_BE(val)	(GLONG_TO_BE (val))

-- Converts a glong value from big-endian to the host byte order.
-- val : 	a glong value in big-endian byte order.
-- Returns : 	val converted to host byte order.
-- GLONG_FROM_LE()

-- #define GLONG_FROM_LE(val)	(GLONG_TO_LE (val))

-- Converts a glong value from little-endian to host byte order.
-- val : 	a glong value in little-endian byte order.
-- Returns : 	val converted to host byte order.
-- GLONG_TO_BE()

-- #define GLONG_TO_BE(val)	((glong) GINT32_TO_BE (val))

-- Converts a glong value from host byte order to big-endian.
-- val : 	a glong value in host byte order.
-- Returns : 	val converted to big-endian byte order.
-- GLONG_TO_LE()

-- #define GLONG_TO_LE(val)	((glong) GINT32_TO_LE (val))

-- Converts a glong value from host byte order to little-endian.
-- val : 	a glong value in host byte order.
-- Returns : 	val converted to little-endian.
-- GULONG_FROM_BE()

-- #define GULONG_FROM_BE(val)	(GULONG_TO_BE (val))

-- Converts a gulong value from big-endian to host byte order.
-- val : 	a gulong value in big-endian byte order.
-- Returns : 	val converted to host byte order.
-- GULONG_FROM_LE()

-- #define GULONG_FROM_LE(val)	(GULONG_TO_LE (val))

-- Converts a gulong value from little-endian to host byte order.
-- val : 	a gulong value in little-endian byte order.
-- Returns : 	val converted to host byte order.
-- GULONG_TO_BE()

-- #define GULONG_TO_BE(val)	((gulong) GUINT32_TO_BE (val))

-- Converts a gulong value from host byte order to big-endian.
-- val : 	a gulong value in host byte order.
-- Returns : 	val converted to big-endian.
-- GULONG_TO_LE()

-- #define GULONG_TO_LE(val)	((gulong) GUINT32_TO_LE (val))

-- Converts a gulong value from host byte order to little-endian.
-- val : 	a gulong value in host byte order.
-- Returns : 	val converted to little-endian.
-- GINT16_FROM_BE()

-- #define GINT16_FROM_BE(val)	(GINT16_TO_BE (val))

-- Converts a gint16 value from big-endian to host byte order.
-- val : 	a gint16 value in big-endian byte order.
-- Returns : 	val converted to host byte order.
-- GINT16_FROM_LE()

-- #define GINT16_FROM_LE(val)	(GINT16_TO_LE (val))

-- Converts a gint16 value from little-endian to host byte order.
-- val : 	a gint16 value in little-endian byte order.
-- Returns : 	val converted to host byte order.
-- GINT16_TO_BE()

-- #define GINT16_TO_BE(val)	((gint16) GUINT16_SWAP_LE_BE (val))

-- Converts a gint16 value from host byte order to big-endian.
-- val : 	a gint16 value in host byte order.
-- Returns : 	val converted to big-endian.
-- GINT16_TO_LE()

-- #define GINT16_TO_LE(val)	((gint16) (val))

-- Converts a gint16 value from host byte order to little-endian.
-- val : 	a gint16 value in host byte order.
-- Returns : 	val converted to little-endian.
-- GUINT16_FROM_BE()

-- #define GUINT16_FROM_BE(val)	(GUINT16_TO_BE (val))

-- Converts a guint16 value from big-endian to host byte order.
-- val : 	a guint16 value in big-endian byte order.
-- Returns : 	val converted to host byte order.
-- GUINT16_FROM_LE()

-- #define GUINT16_FROM_LE(val)	(GUINT16_TO_LE (val))

-- Converts a guint16 value from little-endian to host byte order.
-- val : 	a guint16 value in little-endian byte order.
-- Returns : 	val converted to host byte order.
-- GUINT16_TO_BE()

-- #define GUINT16_TO_BE(val)	(GUINT16_SWAP_LE_BE (val))

-- Converts a guint16 value from host byte order to big-endian.
-- val : 	a guint16 value in host byte order.
-- Returns : 	val converted to big-endian.
-- GUINT16_TO_LE()

-- #define GUINT16_TO_LE(val)	((guint16) (val))

-- Converts a guint16 value from host byte order to little-endian.
-- val : 	a guint16 value in host byte order.
-- Returns : 	val converted to little-endian.
-- GINT32_FROM_BE()

-- #define GINT32_FROM_BE(val)	(GINT32_TO_BE (val))

-- Converts a gint32 value from big-endian to host byte order.
-- val : 	a gint32 value in big-endian byte order.
-- Returns : 	val converted to host byte order.
-- GINT32_FROM_LE()

-- #define GINT32_FROM_LE(val)	(GINT32_TO_LE (val))

-- Converts a gint32 value from little-endian to host byte order.
-- val : 	a gint32 value in little-endian byte order.
-- Returns : 	val converted to host byte order.
-- GINT32_TO_BE()

-- #define GINT32_TO_BE(val)	((gint32) GUINT32_SWAP_LE_BE (val))

-- Converts a gint32 value from host byte order to big-endian.
-- val : 	a gint32 value in host byte order.
-- Returns : 	val converted to big-endian.
-- GINT32_TO_LE()

-- #define GINT32_TO_LE(val)	((gint32) (val))

-- Converts a gint32 value from host byte order to little-endian.
-- val : 	a gint32 value in host byte order.
-- Returns : 	val converted to little-endian.
-- GUINT32_FROM_BE()

-- #define GUINT32_FROM_BE(val)	(GUINT32_TO_BE (val))

-- Converts a guint32 value from big-endian to host byte order.
-- val : 	a guint32 value in big-endian byte order.
-- Returns : 	val converted to host byte order.
-- GUINT32_FROM_LE()

-- #define GUINT32_FROM_LE(val)	(GUINT32_TO_LE (val))

-- Converts a guint32 value from little-endian to host byte order.
-- val : 	a guint32 value in little-endian byte order.
-- Returns : 	val converted to host byte order.
-- GUINT32_TO_BE()

-- #define GUINT32_TO_BE(val)	(GUINT32_SWAP_LE_BE (val))

-- Converts a guint32 value from host byte order to big-endian.
-- val : 	a guint32 value in host byte order.
-- Returns : 	val converted to big-endian.
-- GUINT32_TO_LE()

-- #define GUINT32_TO_LE(val)	((guint32) (val))

-- Converts a guint32 value from host byte order to little-endian.
-- val : 	a guint32 value in host byte order.
-- Returns : 	val converted to little-endian.
-- GINT64_FROM_BE()

-- #define GINT64_FROM_BE(val)	(GINT64_TO_BE (val))

-- Converts a gint64 value from big-endian to host byte order.
-- val : 	a gint64 value in big-endian byte order.
-- Returns : 	val converted to host byte order.
-- GINT64_FROM_LE()

-- #define GINT64_FROM_LE(val)	(GINT64_TO_LE (val))

-- Converts a gint64 value from little-endian to host byte order.
-- val : 	a gint64 value in little-endian byte order.
-- Returns : 	val converted to host byte order.
-- GINT64_TO_BE()

-- #define GINT64_TO_BE(val)	((gint64) GUINT64_SWAP_LE_BE (val))

-- Converts a gint64 value from host byte order to big-endian.
-- val : 	a gint64 value in host byte order.
-- Returns : 	val converted to big-endian.
-- GINT64_TO_LE()

-- #define GINT64_TO_LE(val)	((gint64) (val))

-- Converts a gint64 value from host byte order to little-endian.
-- val : 	a gint64 value in host byte order.
-- Returns : 	val converted to little-endian.
-- GUINT64_FROM_BE()

-- #define GUINT64_FROM_BE(val)	(GUINT64_TO_BE (val))

-- Converts a guint64 value from big-endian to host byte order.
-- val : 	a guint64 value in big-endian byte order.
-- Returns : 	val converted to host byte order.
-- GUINT64_FROM_LE()

-- #define GUINT64_FROM_LE(val)	(GUINT64_TO_LE (val))

-- Converts a guint64 value from little-endian to host byte order.
-- val : 	a guint64 value in little-endian byte order.
-- Returns : 	val converted to host byte order.
-- GUINT64_TO_BE()

-- #define GUINT64_TO_BE(val)	(GUINT64_SWAP_LE_BE (val))

-- Converts a guint64 value from host byte order to big-endian.
-- val : 	a guint64 value in host byte order.
-- Returns : 	val converted to big-endian.
-- GUINT64_TO_LE()

-- #define GUINT64_TO_LE(val)	((guint64) (val))

-- Converts a guint64 value from host byte order to little-endian.
-- val : 	a guint64 value in host byte order.
-- Returns : 	val converted to little-endian.
-- GUINT16_SWAP_BE_PDP()

-- #define GUINT16_SWAP_BE_PDP(val)	(GUINT16_SWAP_LE_BE (val))

-- Converts a guint16 value between big-endian and pdp-endian byte order. The conversion is symmetric so it can be used both ways.
-- val : 	a guint16 value in big-endian or pdp-endian byte order.
-- Returns : 	val converted to the opposite byte order.
-- GUINT16_SWAP_LE_BE()

-- #define     GUINT16_SWAP_LE_BE(val)

-- Converts a guint16 value between little-endian and big-endian byte order. The conversion is symmetric so it can be used both ways.
-- val : 	a guint16 value in little-endian or big-endian byte order.
-- Returns : 	val converted to the opposite byte order.
-- GUINT16_SWAP_LE_PDP()

-- #define GUINT16_SWAP_LE_PDP(val)	((guint16) (val))

-- Converts a guint16 value between little-endian and pdp-endian byte order. The conversion is symmetric so it can be used both ways.
-- val : 	a guint16 value in little-endian or pdp-endian byte order.
-- Returns : 	val converted to the opposite byte order.
-- GUINT32_SWAP_BE_PDP()

-- #define     GUINT32_SWAP_BE_PDP(val)

-- Converts a guint32 value between big-endian and pdp-endian byte order. The conversion is symmetric so it can be used both ways.
-- val : 	a guint32 value in big-endian or pdp-endian byte order.
-- Returns : 	val converted to the opposite byte order.
-- GUINT32_SWAP_LE_BE()

-- #define     GUINT32_SWAP_LE_BE(val)

-- Converts a guint32 value between little-endian and big-endian byte order. The conversion is symmetric so it can be used both ways.
-- val : 	a guint32 value in little-endian or big-endian byte order.
-- Returns : 	val converted to the opposite byte order.
-- GUINT32_SWAP_LE_PDP()

-- #define     GUINT32_SWAP_LE_PDP(val)

-- Converts a guint32 value between little-endian and pdp-endian byte order. The conversion is symmetric so it can be used both ways.
-- val : 	a guint32 value in little-endian or pdp-endian byte order.
-- Returns : 	val converted to the opposite byte order.
-- GUINT64_SWAP_LE_BE()

-- #define     GUINT64_SWAP_LE_BE(val)

-- Converts a guint64 value between little-endian and big-endian byte order. The conversion is symmetric so it can be used both ways.
-- val : 	a guint64 value in little-endian or big-endian byte order.
-- Returns : 	val converted to the opposite byte order.
end

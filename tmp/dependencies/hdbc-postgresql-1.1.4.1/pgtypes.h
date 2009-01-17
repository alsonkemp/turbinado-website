/* File:			pgtypes.h
 *
 * Description:		See "pgtypes.c"
 *
 * Comments:		See "notice.txt" for copyright and license information.
 *
 */

#ifndef __PGTYPES_H__
#define __PGTYPES_H__

/* the type numbers are defined by the OID's of the types' rows */
/* in table pg_type */


#if 0
#define PG_TYPE_LO				????	/* waiting for permanent type */
#endif

#define PG_TYPE_BOOL			16
#define PG_TYPE_BYTEA			17
#define PG_TYPE_CHAR			18
#define PG_TYPE_NAME			19
#define PG_TYPE_INT8			20
#define PG_TYPE_INT2			21
#define PG_TYPE_INT2VECTOR		22
#define PG_TYPE_INT4			23
#define PG_TYPE_REGPROC			24
#define PG_TYPE_TEXT			25
#define PG_TYPE_OID				26
#define PG_TYPE_TID				27
#define PG_TYPE_XID				28
#define PG_TYPE_CID				29
#define PG_TYPE_OIDVECTOR		30
#define PG_TYPE_SET				32
#define PG_TYPE_CHAR2			409
#define PG_TYPE_CHAR4			410
#define PG_TYPE_CHAR8			411
#define PG_TYPE_POINT			600
#define PG_TYPE_LSEG			601
#define PG_TYPE_PATH			602
#define PG_TYPE_BOX				603
#define PG_TYPE_POLYGON			604
#define PG_TYPE_FILENAME		605
#define PG_TYPE_FLOAT4			700
#define PG_TYPE_FLOAT8			701
#define PG_TYPE_ABSTIME			702
#define PG_TYPE_RELTIME			703
#define PG_TYPE_TINTERVAL		704
#define PG_TYPE_UNKNOWN			705
#define PG_TYPE_MONEY			790
#define PG_TYPE_OIDINT2			810
#define PG_TYPE_OIDINT4			910
#define PG_TYPE_OIDNAME			911
#define PG_TYPE_BPCHAR			1042
#define PG_TYPE_VARCHAR			1043
#define PG_TYPE_DATE			1082
#define PG_TYPE_TIME			1083
#define PG_TYPE_TIMESTAMP_NO_TMZONE	1114		/* since 7.2 */
#define PG_TYPE_DATETIME		1184
#define PG_TYPE_TIME_WITH_TMZONE	1266		/* since 7.1 */
#define PG_TYPE_TIMESTAMP		1296	/* deprecated since 7.0 */
#define PG_TYPE_NUMERIC			1700
#define INTERNAL_ASIS_TYPE		(-9999)

#endif

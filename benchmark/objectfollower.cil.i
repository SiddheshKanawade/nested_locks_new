# 1 "./objectfollower.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./objectfollower.cil.c"
# 4 "objectfollower/objectfollower.c"
typedef unsigned char U8;
# 5 "objectfollower/objectfollower.c"
typedef signed char S8;
# 7 "objectfollower/objectfollower.c"
typedef unsigned long U32;
# 10 "objectfollower/objectfollower.c"
struct __anonstruct_to_avr_432250394 {
   U8 power ;
   U8 pwm_frequency ;
   S8 output_percent[4] ;
   U8 output_mode ;
   U8 input_power ;
} __attribute__((__packed__)) ;
# 18 "objectfollower/objectfollower.c"
typedef struct __anonstruct_to_avr_432250394 to_avr;
# 35 "objectfollower/objectfollower.c"
typedef unsigned char U8___0;
# 36 "objectfollower/objectfollower.c"
typedef unsigned long U32___0;
# 37 "objectfollower/objectfollower.c"
typedef unsigned char byte;
# 38 "objectfollower/objectfollower.c"
typedef unsigned short TWOBYTES;
# 42 "objectfollower/objectfollower.c"
struct _freeBlock {
   TWOBYTES size : 15 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 47 "objectfollower/objectfollower.c"
struct _objects {
   byte _class ;
   byte padding : 5 ;
   byte mark : 1 ;
   byte isArray : 1 ;
   byte isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 54 "objectfollower/objectfollower.c"
struct _arrays {
   TWOBYTES length : 9 ;
   TWOBYTES type : 4 ;
   TWOBYTES mark : 1 ;
   TWOBYTES isArray : 1 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 61 "objectfollower/objectfollower.c"
union _flags {
   TWOBYTES all ;
   struct _freeBlock freeBlock ;
   struct _objects objects ;
   struct _arrays arrays ;
} __attribute__((__packed__)) ;
# 67 "objectfollower/objectfollower.c"
struct S_Object {
   union _flags flags ;
   byte monitorCount ;
   byte threadId ;
} __attribute__((__packed__)) ;
# 72 "objectfollower/objectfollower.c"
typedef struct S_Object Object;
# 75 "objectfollower/objectfollower.c"
struct __anonstruct_display_array_740464799 {
   Object hdr ;
   U8___0 displayN[9][100] ;
} __attribute__((__packed__)) ;
# 79 "objectfollower/objectfollower.c"
typedef unsigned long U32___1;
# 81 "objectfollower/objectfollower.c"
struct motor_struct {
   int current_count ;
   int target_count ;
   int speed_percent ;
   U32___1 last ;
};
# 87 "objectfollower/objectfollower.c"
typedef unsigned char UINT8;
# 88 "objectfollower/objectfollower.c"
typedef UINT8 StatusType;
# 89 "objectfollower/objectfollower.c"
typedef UINT8 ResourceType;
# 90 "objectfollower/objectfollower.c"
typedef unsigned char U8___1;
# 91 "objectfollower/objectfollower.c"
typedef signed char S8___0;
# 92 "objectfollower/objectfollower.c"
typedef unsigned long U32___2;
# 93 "objectfollower/objectfollower.c"
typedef int data_t;
# 94 "objectfollower/objectfollower.c"
struct __anonstruct_object_data_t_973126069 {
   int position ;
   int size ;
};
# 98 "objectfollower/objectfollower.c"
typedef struct __anonstruct_object_data_t_973126069 object_data_t;
# 137 "objectfollower/objectfollower.c"
int display_tick ;
# 138 "objectfollower/objectfollower.c"
int display_auto_update ;
# 139 "objectfollower/objectfollower.c"
char const avr_brainwash_string[48] =
# 139 "objectfollower/objectfollower.c"
  { (char const )'\314', (char const )'L', (char const )'e', (char const )'t',
        (char const )'\'', (char const )'s', (char const )' ', (char const )'s',
        (char const )'a', (char const )'m', (char const )'b', (char const )'a',
        (char const )' ', (char const )'n', (char const )'x', (char const )'t',
        (char const )' ', (char const )'a', (char const )'r', (char const )'m',
        (char const )' ', (char const )'i', (char const )'n', (char const )' ',
        (char const )'a', (char const )'r', (char const )'m', (char const )',',
        (char const )' ', (char const )'(', (char const )'c', (char const )')',
        (char const )'L', (char const )'E', (char const )'G', (char const )'O',
        (char const )' ', (char const )'S', (char const )'y', (char const )'s',
        (char const )'t', (char const )'e', (char const )'m', (char const )' ',
        (char const )'A', (char const )'/', (char const )'S', (char const )'\000'};
# 153 "objectfollower/objectfollower.c"
static to_avr io_to_avr ;
# 173 "objectfollower/objectfollower.c"
extern void nxt_spi_refresh(void) ;
# 179 "objectfollower/objectfollower.c"
U8___0 const *displayM = (U8___0 const *)((U8___0 *)0);
# 180 "objectfollower/objectfollower.c"
unsigned char volatile dirty = (U8___0 volatile )0;
# 181 "objectfollower/objectfollower.c"
unsigned char volatile page = (U8___0 volatile )0;
# 182 "objectfollower/objectfollower.c"
U8___0 const volatile *dataM = (U8___0 const volatile *)((U8___0 *)0);
# 183 "objectfollower/objectfollower.c"
U8___0 mode = (U8___0 )255;
# 186 "objectfollower/objectfollower.c"
static struct __anonstruct_display_array_740464799 display_array ;
# 187 "objectfollower/objectfollower.c"
static U8___0 (*display_buffer)[100] = display_array.displayN;
# 188 "objectfollower/objectfollower.c"
static U8___0 const font[128][5] =
# 188 "objectfollower/objectfollower.c"
  { { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )85, (U8___0 const )97, (U8___0 const )85,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )107, (U8___0 const )95, (U8___0 const )107,
            (U8___0 const )62},
   { (U8___0 const )12, (U8___0 const )30, (U8___0 const )60, (U8___0 const )30,
            (U8___0 const )12},
   { (U8___0 const )8, (U8___0 const )28, (U8___0 const )62, (U8___0 const )28,
            (U8___0 const )8},
   { (U8___0 const )24, (U8___0 const )94, (U8___0 const )126, (U8___0 const )94,
            (U8___0 const )24},
   { (U8___0 const )24, (U8___0 const )92, (U8___0 const )126, (U8___0 const )92,
            (U8___0 const )24},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62},
   { (U8___0 const )0, (U8___0 const )0, (U8___0 const )0, (U8___0 const )0,
            (U8___0 const )0},
   { (U8___0 const )0, (U8___0 const )0, (U8___0 const )95, (U8___0 const )0,
            (U8___0 const )0},
   { (U8___0 const )0, (U8___0 const )7, (U8___0 const )0, (U8___0 const )7,
            (U8___0 const )0},
   { (U8___0 const )20, (U8___0 const )62, (U8___0 const )20, (U8___0 const )62,
            (U8___0 const )20},
   { (U8___0 const )4, (U8___0 const )42, (U8___0 const )127, (U8___0 const )42,
            (U8___0 const )16},
   { (U8___0 const )38, (U8___0 const )22, (U8___0 const )8, (U8___0 const )52,
            (U8___0 const )50},
   { (U8___0 const )54, (U8___0 const )73, (U8___0 const )89, (U8___0 const )38,
            (U8___0 const )80},
   { (U8___0 const )0, (U8___0 const )0, (U8___0 const )7, (U8___0 const )0,
            (U8___0 const )0},
   { (U8___0 const )0, (U8___0 const )28, (U8___0 const )34, (U8___0 const )65,
            (U8___0 const )0},
   { (U8___0 const )0, (U8___0 const )65, (U8___0 const )34, (U8___0 const )28,
            (U8___0 const )0},
   { (U8___0 const )42, (U8___0 const )28, (U8___0 const )127, (U8___0 const )28,
            (U8___0 const )42},
   { (U8___0 const )8, (U8___0 const )8, (U8___0 const )62, (U8___0 const )8,
            (U8___0 const )8},
   { (U8___0 const )0, (U8___0 const )80, (U8___0 const )48, (U8___0 const )0,
            (U8___0 const )0},
   { (U8___0 const )8, (U8___0 const )8, (U8___0 const )8, (U8___0 const )8,
            (U8___0 const )8},
   { (U8___0 const )0, (U8___0 const )96, (U8___0 const )96, (U8___0 const )0,
            (U8___0 const )0},
   { (U8___0 const )32, (U8___0 const )16, (U8___0 const )8, (U8___0 const )4,
            (U8___0 const )2},
   { (U8___0 const )62, (U8___0 const )81, (U8___0 const )73, (U8___0 const )69,
            (U8___0 const )62},
   { (U8___0 const )0, (U8___0 const )66, (U8___0 const )127, (U8___0 const )64,
            (U8___0 const )0},
   { (U8___0 const )66, (U8___0 const )97, (U8___0 const )81, (U8___0 const )73,
            (U8___0 const )70},
   { (U8___0 const )33, (U8___0 const )65, (U8___0 const )69, (U8___0 const )75,
            (U8___0 const )49},
   { (U8___0 const )24, (U8___0 const )20, (U8___0 const )18, (U8___0 const )127,
            (U8___0 const )16},
   { (U8___0 const )39, (U8___0 const )69, (U8___0 const )69, (U8___0 const )69,
            (U8___0 const )57},
   { (U8___0 const )60, (U8___0 const )74, (U8___0 const )73, (U8___0 const )73,
            (U8___0 const )48},
   { (U8___0 const )1, (U8___0 const )1, (U8___0 const )121, (U8___0 const )5,
            (U8___0 const )3},
   { (U8___0 const )54, (U8___0 const )73, (U8___0 const )73, (U8___0 const )73,
            (U8___0 const )54},
   { (U8___0 const )6, (U8___0 const )73, (U8___0 const )73, (U8___0 const )41,
            (U8___0 const )30},
   { (U8___0 const )0, (U8___0 const )54, (U8___0 const )54, (U8___0 const )0,
            (U8___0 const )0},
   { (U8___0 const )0, (U8___0 const )86, (U8___0 const )54, (U8___0 const )0,
            (U8___0 const )0},
   { (U8___0 const )8, (U8___0 const )20, (U8___0 const )34, (U8___0 const )65,
            (U8___0 const )0},
   { (U8___0 const )20, (U8___0 const )20, (U8___0 const )20, (U8___0 const )20,
            (U8___0 const )20},
   { (U8___0 const )65, (U8___0 const )34, (U8___0 const )20, (U8___0 const )8,
            (U8___0 const )0},
   { (U8___0 const )2, (U8___0 const )1, (U8___0 const )89, (U8___0 const )5,
            (U8___0 const )2},
   { (U8___0 const )28, (U8___0 const )42, (U8___0 const )54, (U8___0 const )62,
            (U8___0 const )12},
   { (U8___0 const )126, (U8___0 const )9, (U8___0 const )9, (U8___0 const )9,
            (U8___0 const )126},
   { (U8___0 const )127, (U8___0 const )73, (U8___0 const )73, (U8___0 const )73,
            (U8___0 const )62},
   { (U8___0 const )62, (U8___0 const )65, (U8___0 const )65, (U8___0 const )65,
            (U8___0 const )34},
   { (U8___0 const )127, (U8___0 const )65, (U8___0 const )65, (U8___0 const )34,
            (U8___0 const )28},
   { (U8___0 const )127, (U8___0 const )73, (U8___0 const )73, (U8___0 const )73,
            (U8___0 const )65},
   { (U8___0 const )127, (U8___0 const )9, (U8___0 const )9, (U8___0 const )9,
            (U8___0 const )1},
   { (U8___0 const )62, (U8___0 const )65, (U8___0 const )65, (U8___0 const )73,
            (U8___0 const )58},
   { (U8___0 const )127, (U8___0 const )8, (U8___0 const )8, (U8___0 const )8,
            (U8___0 const )127},
   { (U8___0 const )0, (U8___0 const )65, (U8___0 const )127, (U8___0 const )65,
            (U8___0 const )0},
   { (U8___0 const )32, (U8___0 const )64, (U8___0 const )65, (U8___0 const )63,
            (U8___0 const )1},
   { (U8___0 const )127, (U8___0 const )8, (U8___0 const )20, (U8___0 const )34,
            (U8___0 const )65},
   { (U8___0 const )127, (U8___0 const )64, (U8___0 const )64, (U8___0 const )64,
            (U8___0 const )64},
   { (U8___0 const )127, (U8___0 const )2, (U8___0 const )4, (U8___0 const )2,
            (U8___0 const )127},
   { (U8___0 const )127, (U8___0 const )4, (U8___0 const )8, (U8___0 const )16,
            (U8___0 const )127},
   { (U8___0 const )62, (U8___0 const )65, (U8___0 const )65, (U8___0 const )65,
            (U8___0 const )62},
   { (U8___0 const )127, (U8___0 const )9, (U8___0 const )9, (U8___0 const )9,
            (U8___0 const )6},
   { (U8___0 const )62, (U8___0 const )65, (U8___0 const )81, (U8___0 const )33,
            (U8___0 const )94},
   { (U8___0 const )127, (U8___0 const )9, (U8___0 const )25, (U8___0 const )41,
            (U8___0 const )70},
   { (U8___0 const )38, (U8___0 const )73, (U8___0 const )73, (U8___0 const )73,
            (U8___0 const )50},
   { (U8___0 const )1, (U8___0 const )1, (U8___0 const )127, (U8___0 const )1,
            (U8___0 const )1},
   { (U8___0 const )63, (U8___0 const )64, (U8___0 const )64, (U8___0 const )64,
            (U8___0 const )63},
   { (U8___0 const )31, (U8___0 const )32, (U8___0 const )64, (U8___0 const )32,
            (U8___0 const )31},
   { (U8___0 const )127, (U8___0 const )32, (U8___0 const )24, (U8___0 const )32,
            (U8___0 const )127},
   { (U8___0 const )99, (U8___0 const )20, (U8___0 const )8, (U8___0 const )20,
            (U8___0 const )99},
   { (U8___0 const )3, (U8___0 const )4, (U8___0 const )120, (U8___0 const )4,
            (U8___0 const )3},
   { (U8___0 const )97, (U8___0 const )81, (U8___0 const )73, (U8___0 const )69,
            (U8___0 const )67},
   { (U8___0 const )0, (U8___0 const )127, (U8___0 const )65, (U8___0 const )65,
            (U8___0 const )0},
   { (U8___0 const )2, (U8___0 const )4, (U8___0 const )8, (U8___0 const )16,
            (U8___0 const )32},
   { (U8___0 const )0, (U8___0 const )65, (U8___0 const )65, (U8___0 const )127,
            (U8___0 const )0},
   { (U8___0 const )4, (U8___0 const )2, (U8___0 const )1, (U8___0 const )2,
            (U8___0 const )4},
   { (U8___0 const )64, (U8___0 const )64, (U8___0 const )64, (U8___0 const )64,
            (U8___0 const )64},
   { (U8___0 const )0, (U8___0 const )0, (U8___0 const )7, (U8___0 const )0,
            (U8___0 const )0},
   { (U8___0 const )32, (U8___0 const )84, (U8___0 const )84, (U8___0 const )84,
            (U8___0 const )120},
   { (U8___0 const )127, (U8___0 const )72, (U8___0 const )68, (U8___0 const )68,
            (U8___0 const )56},
   { (U8___0 const )48, (U8___0 const )72, (U8___0 const )72, (U8___0 const )72,
            (U8___0 const )32},
   { (U8___0 const )56, (U8___0 const )68, (U8___0 const )68, (U8___0 const )72,
            (U8___0 const )127},
   { (U8___0 const )56, (U8___0 const )84, (U8___0 const )84, (U8___0 const )84,
            (U8___0 const )24},
   { (U8___0 const )8, (U8___0 const )126, (U8___0 const )9, (U8___0 const )9,
            (U8___0 const )2},
   { (U8___0 const )12, (U8___0 const )82, (U8___0 const )82, (U8___0 const )82,
            (U8___0 const )62},
   { (U8___0 const )127, (U8___0 const )8, (U8___0 const )4, (U8___0 const )4,
            (U8___0 const )120},
   { (U8___0 const )0, (U8___0 const )68, (U8___0 const )125, (U8___0 const )64,
            (U8___0 const )0},
   { (U8___0 const )32, (U8___0 const )64, (U8___0 const )64, (U8___0 const )61,
            (U8___0 const )0},
   { (U8___0 const )127, (U8___0 const )16, (U8___0 const )40, (U8___0 const )68,
            (U8___0 const )0},
   { (U8___0 const )0, (U8___0 const )65, (U8___0 const )127, (U8___0 const )64,
            (U8___0 const )0},
   { (U8___0 const )124, (U8___0 const )4, (U8___0 const )24, (U8___0 const )4,
            (U8___0 const )120},
   { (U8___0 const )124, (U8___0 const )8, (U8___0 const )4, (U8___0 const )4,
            (U8___0 const )120},
   { (U8___0 const )56, (U8___0 const )68, (U8___0 const )68, (U8___0 const )68,
            (U8___0 const )56},
   { (U8___0 const )252, (U8___0 const )20, (U8___0 const )20, (U8___0 const )20,
            (U8___0 const )8},
   { (U8___0 const )8, (U8___0 const )20, (U8___0 const )20, (U8___0 const )24,
            (U8___0 const )124},
   { (U8___0 const )124, (U8___0 const )8, (U8___0 const )4, (U8___0 const )4,
            (U8___0 const )8},
   { (U8___0 const )72, (U8___0 const )84, (U8___0 const )84, (U8___0 const )84,
            (U8___0 const )32},
   { (U8___0 const )4, (U8___0 const )63, (U8___0 const )68, (U8___0 const )64,
            (U8___0 const )32},
   { (U8___0 const )60, (U8___0 const )64, (U8___0 const )64, (U8___0 const )32,
            (U8___0 const )124},
   { (U8___0 const )28, (U8___0 const )32, (U8___0 const )64, (U8___0 const )32,
            (U8___0 const )28},
   { (U8___0 const )60, (U8___0 const )64, (U8___0 const )56, (U8___0 const )64,
            (U8___0 const )60},
   { (U8___0 const )68, (U8___0 const )40, (U8___0 const )16, (U8___0 const )40,
            (U8___0 const )68},
   { (U8___0 const )12, (U8___0 const )80, (U8___0 const )80, (U8___0 const )80,
            (U8___0 const )60},
   { (U8___0 const )68, (U8___0 const )100, (U8___0 const )84, (U8___0 const )76,
            (U8___0 const )68},
   { (U8___0 const )0, (U8___0 const )8, (U8___0 const )54, (U8___0 const )65,
            (U8___0 const )0},
   { (U8___0 const )0, (U8___0 const )0, (U8___0 const )127, (U8___0 const )0,
            (U8___0 const )0},
   { (U8___0 const )0, (U8___0 const )65, (U8___0 const )54, (U8___0 const )8,
            (U8___0 const )0},
   { (U8___0 const )0, (U8___0 const )7, (U8___0 const )0, (U8___0 const )7,
            (U8___0 const )0},
   { (U8___0 const )62, (U8___0 const )54, (U8___0 const )42, (U8___0 const )54,
            (U8___0 const )62}};
# 445 "objectfollower/objectfollower.c"
int display_tick = 0;
# 446 "objectfollower/objectfollower.c"
int display_auto_update = 1;
# 447 "objectfollower/objectfollower.c"
int display_x ;
# 448 "objectfollower/objectfollower.c"
int display_y ;
# 449 "objectfollower/objectfollower.c"
static struct motor_struct motor[3] ;
# 453 "objectfollower/objectfollower.c"
extern StatusType TerminateTask(void) ;
# 454 "objectfollower/objectfollower.c"
extern StatusType GetResource(ResourceType resid ) ;
# 455 "objectfollower/objectfollower.c"
extern StatusType ReleaseResource(ResourceType resid ) ;
# 456 "objectfollower/objectfollower.c"
extern int send_nxtcam_command(U8___1 port_id , U8___1 command ) ;
# 457 "objectfollower/objectfollower.c"
extern int request(U8___1 port_id ) ;
# 458 "objectfollower/objectfollower.c"
extern int getbiggestrect(U8___1 pcolorid , int minarea ) ;
# 459 "objectfollower/objectfollower.c"
extern int getX(U8___1 rectindex ) ;
# 460 "objectfollower/objectfollower.c"
extern int getArea(U8___1 rectindex ) ;
# 461 "objectfollower/objectfollower.c"
extern data_t median_filter(data_t datum ) ;
# 462 "objectfollower/objectfollower.c"
extern int fisqrt(int val ) ;
# 463 "objectfollower/objectfollower.c"
extern ResourceType dataMutex ;
# 464 "objectfollower/objectfollower.c"
static int sizeLCD ;
# 465 "objectfollower/objectfollower.c"
static int areaLCD ;
# 466 "objectfollower/objectfollower.c"
static int xLCD ;
# 467 "objectfollower/objectfollower.c"
static int speedLCD ;
# 468 "objectfollower/objectfollower.c"
static int devspeedLCD ;
# 469 "objectfollower/objectfollower.c"
static int diradjLCD ;
# 470 "objectfollower/objectfollower.c"
static int lmotLCD ;
# 471 "objectfollower/objectfollower.c"
static int rmotLCD ;
# 472 "objectfollower/objectfollower.c"
object_data_t objData = {0, 0};
# 473 "objectfollower/objectfollower.c"
void TaskMainAcquisitionTask(void) ;
# 474 "objectfollower/objectfollower.c"
static S8___0 tracking_enabled = (S8___0 )-1;
# 475 "objectfollower/objectfollower.c"
void TaskMainAcquisitionTask(void)
{
  int rectindex ;
  int area ;
  int size ;
  int x ;
  int tmp ;

  {
# 483 "objectfollower/objectfollower.c"
  if ((int )tracking_enabled != 0) {
# 484 "objectfollower/objectfollower.c"
    tmp = send_nxtcam_command((U8___1 )1, (U8___1 )69);
# 485 "objectfollower/objectfollower.c"
    tracking_enabled = (S8___0 )tmp;
  } else {
# 487 "objectfollower/objectfollower.c"
    request((U8___1 )1);
# 488 "objectfollower/objectfollower.c"
    rectindex = getbiggestrect((U8___1 )0, -1);
# 489 "objectfollower/objectfollower.c"
    if (rectindex >= 0) {
# 490 "objectfollower/objectfollower.c"
      area = getArea((U8___1 )rectindex);
# 491 "objectfollower/objectfollower.c"
      area = median_filter(area);
# 492 "objectfollower/objectfollower.c"
      size = fisqrt(area);
# 493 "objectfollower/objectfollower.c"
      x = getX((U8___1 )rectindex);
# 494 "objectfollower/objectfollower.c"
      GetResource(dataMutex);
# 495 "objectfollower/objectfollower.c"
      objData.position = x;
# 496 "objectfollower/objectfollower.c"
      objData.size = size;
# 497 "objectfollower/objectfollower.c"
      ReleaseResource(dataMutex);
# 498 "objectfollower/objectfollower.c"
      sizeLCD = size;
# 499 "objectfollower/objectfollower.c"
      areaLCD = area;
# 500 "objectfollower/objectfollower.c"
      xLCD = x;
    }
  }
# 503 "objectfollower/objectfollower.c"
  TerminateTask();
# 504 "objectfollower/objectfollower.c"
  return;
}
}
# 508 "objectfollower/objectfollower.c"
static int integral = 0;
# 509 "objectfollower/objectfollower.c"
static int prevError = 0;
# 510 "objectfollower/objectfollower.c"
static int integral___0 = 0;
# 511 "objectfollower/objectfollower.c"
static int prevError___0 = 0;
# 513 "objectfollower/objectfollower.c"
void TaskMainControlTask(void)
{
  object_data_t data ;
  int position ;
  int size ;
  int new_speed ;
  int direction_adjustment ;
  int leftMotorValue ;
  int rightMotorValue ;
  int speed_deviation ;
  int tmp ;
  int d10 ;
  int error11 ;
  int derivative12 ;
  int out13 ;
  int ret_speedPIDController14 ;
  int d15 ;
  int error16 ;
  int derivative17 ;
  int out18 ;
  int ret_directionPIDController19 ;
  object_data_t temp20 ;
  object_data_t ret_getData21 ;
  U32___1 n22 ;
  int speed_percent23 ;
  int brake24 ;
  U32___1 n25 ;
  int speed_percent26 ;
  int brake27 ;
  U32 n28 ;
  int power_percent29 ;
  int brake30 ;
  U32 n31 ;
  int power_percent32 ;
  int brake33 ;

  {
# 551 "objectfollower/objectfollower.c"
  GetResource(dataMutex);
# 552 "objectfollower/objectfollower.c"
  temp20 = objData;
# 553 "objectfollower/objectfollower.c"
  ReleaseResource(dataMutex);
# 554 "objectfollower/objectfollower.c"
  ret_getData21 = temp20;
# 555 "objectfollower/objectfollower.c"
  goto Lret_getData;
  Lret_getData:
# 557 "objectfollower/objectfollower.c"
  data = ret_getData21;
# 558 "objectfollower/objectfollower.c"
  size = data.size;
# 559 "objectfollower/objectfollower.c"
  position = data.position;
# 560 "objectfollower/objectfollower.c"
  if (size > 0) {
# 561 "objectfollower/objectfollower.c"
    if (position > 0) {
# 562 "objectfollower/objectfollower.c"
      d10 = size;
# 563 "objectfollower/objectfollower.c"
      error11 = 50 - d10;
# 564 "objectfollower/objectfollower.c"
      integral += error11;
# 565 "objectfollower/objectfollower.c"
      derivative12 = error11 - prevError;
# 566 "objectfollower/objectfollower.c"
      out13 = (int )((1.5 * (double )error11 + (double )0) + (double )0);
# 567 "objectfollower/objectfollower.c"
      prevError = error11;
# 568 "objectfollower/objectfollower.c"
      ret_speedPIDController14 = out13;
# 569 "objectfollower/objectfollower.c"
      goto Lret_speedPIDController;
      Lret_speedPIDController:
# 571 "objectfollower/objectfollower.c"
      tmp = ret_speedPIDController14;
# 572 "objectfollower/objectfollower.c"
      speed_deviation = tmp;
# 573 "objectfollower/objectfollower.c"
      devspeedLCD = speed_deviation;
# 574 "objectfollower/objectfollower.c"
      new_speed = 50 + speed_deviation;
# 575 "objectfollower/objectfollower.c"
      if (new_speed > 100) {
# 576 "objectfollower/objectfollower.c"
        new_speed = 100;
      } else {
# 578 "objectfollower/objectfollower.c"
        new_speed = new_speed;
      }
# 580 "objectfollower/objectfollower.c"
      d15 = position;
# 581 "objectfollower/objectfollower.c"
      error16 = 83 - d15;
# 582 "objectfollower/objectfollower.c"
      integral___0 += error16;
# 583 "objectfollower/objectfollower.c"
      derivative17 = error16 - prevError___0;
# 584 "objectfollower/objectfollower.c"
      out18 = (int )((0.2 * (double )error16 + (double )0) + (double )0);
# 585 "objectfollower/objectfollower.c"
      prevError___0 = error16;
# 586 "objectfollower/objectfollower.c"
      ret_directionPIDController19 = out18;
# 587 "objectfollower/objectfollower.c"
      goto Lret_directionPIDController;
      Lret_directionPIDController:
# 589 "objectfollower/objectfollower.c"
      direction_adjustment = ret_directionPIDController19;
# 590 "objectfollower/objectfollower.c"
      speedLCD = new_speed;
# 591 "objectfollower/objectfollower.c"
      diradjLCD = direction_adjustment;
# 592 "objectfollower/objectfollower.c"
      leftMotorValue = new_speed - direction_adjustment;
# 593 "objectfollower/objectfollower.c"
      if (leftMotorValue > 100) {
# 594 "objectfollower/objectfollower.c"
        leftMotorValue = 100;
      } else {
# 596 "objectfollower/objectfollower.c"
        leftMotorValue = leftMotorValue;
      }
# 598 "objectfollower/objectfollower.c"
      rightMotorValue = new_speed + direction_adjustment;
# 599 "objectfollower/objectfollower.c"
      if (rightMotorValue > 100) {
# 600 "objectfollower/objectfollower.c"
        rightMotorValue = 100;
      } else {
# 602 "objectfollower/objectfollower.c"
        rightMotorValue = rightMotorValue;
      }
    } else {
# 605 "objectfollower/objectfollower.c"
      rightMotorValue = 65;
# 606 "objectfollower/objectfollower.c"
      leftMotorValue = -65;
# 607 "objectfollower/objectfollower.c"
      speedLCD = 0;
# 608 "objectfollower/objectfollower.c"
      diradjLCD = 0;
# 609 "objectfollower/objectfollower.c"
      devspeedLCD = 0;
    }
  } else {
# 612 "objectfollower/objectfollower.c"
    rightMotorValue = 65;
# 613 "objectfollower/objectfollower.c"
    leftMotorValue = -65;
# 614 "objectfollower/objectfollower.c"
    speedLCD = 0;
# 615 "objectfollower/objectfollower.c"
    diradjLCD = 0;
# 616 "objectfollower/objectfollower.c"
    devspeedLCD = 0;
  }
# 618 "objectfollower/objectfollower.c"
  lmotLCD = leftMotorValue;
# 619 "objectfollower/objectfollower.c"
  rmotLCD = rightMotorValue;
# 620 "objectfollower/objectfollower.c"
  n22 = (U32___2 )1;
# 621 "objectfollower/objectfollower.c"
  speed_percent23 = leftMotorValue;
# 622 "objectfollower/objectfollower.c"
  brake24 = 0;
# 623 "objectfollower/objectfollower.c"
  if (n22 < 3UL) {
# 624 "objectfollower/objectfollower.c"
    if (speed_percent23 > 100) {
# 625 "objectfollower/objectfollower.c"
      speed_percent23 = 100;
    }
# 627 "objectfollower/objectfollower.c"
    if (speed_percent23 < -100) {
# 628 "objectfollower/objectfollower.c"
      speed_percent23 = -100;
    }
# 631 "objectfollower/objectfollower.c"
    motor[n22].speed_percent = speed_percent23;
# 632 "objectfollower/objectfollower.c"
    n28 = n22;
# 633 "objectfollower/objectfollower.c"
    power_percent29 = speed_percent23;
# 634 "objectfollower/objectfollower.c"
    brake30 = brake24;
# 636 "objectfollower/objectfollower.c"
    if (n28 < 3UL) {
# 637 "objectfollower/objectfollower.c"
      io_to_avr.output_percent[n28] = (S8 )power_percent29;
# 638 "objectfollower/objectfollower.c"
      if (brake30) {
# 639 "objectfollower/objectfollower.c"
        io_to_avr.output_mode = (U8 )((int )io_to_avr.output_mode | (1 << n28));
      } else {
# 641 "objectfollower/objectfollower.c"
        io_to_avr.output_mode = (U8 )((int )io_to_avr.output_mode & ~ (1 << n28));
      }
    }
# 644 "objectfollower/objectfollower.c"
    goto Lret_nxt_avr_set_motor;
    Lret_nxt_avr_set_motor: ;
  }
# 649 "objectfollower/objectfollower.c"
  goto Lret_nxt_motor_set_speed;
  Lret_nxt_motor_set_speed:
# 651 "objectfollower/objectfollower.c"
  n25 = (U32___2 )0;
# 652 "objectfollower/objectfollower.c"
  speed_percent26 = rightMotorValue;
# 653 "objectfollower/objectfollower.c"
  brake27 = 0;
# 654 "objectfollower/objectfollower.c"
  if (n25 < 3UL) {
# 655 "objectfollower/objectfollower.c"
    if (speed_percent26 > 100) {
# 656 "objectfollower/objectfollower.c"
      speed_percent26 = 100;
    }
# 658 "objectfollower/objectfollower.c"
    if (speed_percent26 < -100) {
# 659 "objectfollower/objectfollower.c"
      speed_percent26 = -100;
    }
# 662 "objectfollower/objectfollower.c"
    motor[n25].speed_percent = speed_percent26;
# 663 "objectfollower/objectfollower.c"
    n31 = n25;
# 664 "objectfollower/objectfollower.c"
    power_percent32 = speed_percent26;
# 665 "objectfollower/objectfollower.c"
    brake33 = brake27;
# 667 "objectfollower/objectfollower.c"
    if (n31 < 3UL) {
# 668 "objectfollower/objectfollower.c"
      io_to_avr.output_percent[n31] = (S8 )power_percent32;
# 669 "objectfollower/objectfollower.c"
      if (brake33) {
# 670 "objectfollower/objectfollower.c"
        io_to_avr.output_mode = (U8 )((int )io_to_avr.output_mode | (1 << n31));
      } else {
# 672 "objectfollower/objectfollower.c"
        io_to_avr.output_mode = (U8 )((int )io_to_avr.output_mode & ~ (1 << n31));
      }
    }
# 675 "objectfollower/objectfollower.c"
    goto Lret_nxt_avr_set_motor___0;
    Lret_nxt_avr_set_motor___0: ;
  }
# 680 "objectfollower/objectfollower.c"
  goto Lret_nxt_motor_set_speed___0;
  Lret_nxt_motor_set_speed___0:
# 682 "objectfollower/objectfollower.c"
  TerminateTask();
# 683 "objectfollower/objectfollower.c"
  return;
}
}
# 686 "objectfollower/objectfollower.c"
void TaskMainDisplayTask(void)
{
  char *message1 ;
  U8___1 line2 ;
  U8___1 tmp3 ;
  U8___1 tmp___04 ;
  U8___1 tmp___15 ;
  U8___1 tmp___26 ;
  U8___1 tmp___37 ;
  U8___1 tmp___48 ;
  U8___1 tmp___59 ;
  U8___1 tmp___610 ;
  int x11 ;
  int y12 ;
  int x13 ;
  int y14 ;
  int x15 ;
  int y16 ;
  int x17 ;
  int y18 ;
  int x19 ;
  int y20 ;
  int x21 ;
  int y22 ;
  int x23 ;
  int y24 ;
  int x25 ;
  int y26 ;
  char const *str27 ;
  char const *str28 ;
  char const *str29 ;
  char const *str30 ;
  char const *str31 ;
  char const *str32 ;
  char const *str33 ;
  char const *str34 ;
  int val35 ;
  U32___0 places36 ;
  int tmp37 ;
  int val38 ;
  U32___0 places39 ;
  int tmp40 ;
  int val41 ;
  U32___0 places42 ;
  int tmp43 ;
  int val44 ;
  U32___0 places45 ;
  int tmp46 ;
  int val47 ;
  U32___0 places48 ;
  int tmp49 ;
  int val50 ;
  U32___0 places51 ;
  int tmp52 ;
  int val53 ;
  U32___0 places54 ;
  int tmp55 ;
  int val56 ;
  U32___0 places57 ;
  int tmp58 ;
  U32___0 val59 ;
  U32___0 places60 ;
  U32___0 sign61 ;
  char x62[12] ;
  char *p63 ;
  int p_count64 ;
  char const *str765 ;
  U32___0 val66 ;
  U32___0 places67 ;
  U32___0 sign68 ;
  char x69[12] ;
  char *p70 ;
  int p_count71 ;
  char const *str772 ;
  U32___0 val73 ;
  U32___0 places74 ;
  U32___0 sign75 ;
  char x76[12] ;
  char *p77 ;
  int p_count78 ;
  char const *str779 ;
  U32___0 val80 ;
  U32___0 places81 ;
  U32___0 sign82 ;
  char x83[12] ;
  char *p84 ;
  int p_count85 ;
  char const *str786 ;
  U32___0 val87 ;
  U32___0 places88 ;
  U32___0 sign89 ;
  char x90[12] ;
  char *p91 ;
  int p_count92 ;
  char const *str793 ;
  U32___0 val94 ;
  U32___0 places95 ;
  U32___0 sign96 ;
  char x97[12] ;
  char *p98 ;
  int p_count99 ;
  char const *str7100 ;
  U32___0 val101 ;
  U32___0 places102 ;
  U32___0 sign103 ;
  char x104[12] ;
  char *p105 ;
  int p_count106 ;
  char const *str7107 ;
  U32___0 val108 ;
  U32___0 places109 ;
  U32___0 sign110 ;
  char x111[12] ;
  char *p112 ;
  int p_count113 ;
  char const *str7114 ;
  int c115 ;
  int i116 ;
  U8___0 *b117 ;
  U8___0 const *f118 ;
  int c119 ;
  int i120 ;
  U8___0 *b121 ;
  U8___0 const *f122 ;
  int c123 ;
  int i124 ;
  U8___0 *b125 ;
  U8___0 const *f126 ;
  int c127 ;
  int i128 ;
  U8___0 *b129 ;
  U8___0 const *f130 ;
  int c131 ;
  int i132 ;
  U8___0 *b133 ;
  U8___0 const *f134 ;
  int c135 ;
  int i136 ;
  U8___0 *b137 ;
  U8___0 const *f138 ;
  int c139 ;
  int i140 ;
  U8___0 *b141 ;
  U8___0 const *f142 ;
  int c143 ;
  int i144 ;
  U8___0 *b145 ;
  U8___0 const *f146 ;
  int c147 ;
  int i148 ;
  U8___0 *b149 ;
  U8___0 const *f150 ;
  int c151 ;
  int i152 ;
  U8___0 *b153 ;
  U8___0 const *f154 ;
  int c155 ;
  int i156 ;
  U8___0 *b157 ;
  U8___0 const *f158 ;
  int c159 ;
  int i160 ;
  U8___0 *b161 ;
  U8___0 const *f162 ;
  int c163 ;
  int i164 ;
  U8___0 *b165 ;
  U8___0 const *f166 ;
  int c167 ;
  int i168 ;
  U8___0 *b169 ;
  U8___0 const *f170 ;
  int c171 ;
  int i172 ;
  U8___0 *b173 ;
  U8___0 const *f174 ;
  int c175 ;
  int i176 ;
  U8___0 *b177 ;
  U8___0 const *f178 ;

  {
# 868 "objectfollower/objectfollower.c"
  message1 = (char *)((void *)0);
# 869 "objectfollower/objectfollower.c"
  line2 = (U8___1 )0;
# 870 "objectfollower/objectfollower.c"
  tmp3 = line2;
# 871 "objectfollower/objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 872 "objectfollower/objectfollower.c"
  x11 = 0;
# 873 "objectfollower/objectfollower.c"
  y12 = (int )tmp3;
# 874 "objectfollower/objectfollower.c"
  display_x = x11;
# 875 "objectfollower/objectfollower.c"
  display_y = y12;
# 876 "objectfollower/objectfollower.c"
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
# 878 "objectfollower/objectfollower.c"
  message1 = (char *)"size:";
# 879 "objectfollower/objectfollower.c"
  str27 = (char const *)message1;
# 880 "objectfollower/objectfollower.c"
  while (*str27) {
# 881 "objectfollower/objectfollower.c"
    if ((int const )*str27 != 10) {
# 882 "objectfollower/objectfollower.c"
      c115 = (int )*str27;
# 883 "objectfollower/objectfollower.c"
      if (c115 >= 0) {
# 884 "objectfollower/objectfollower.c"
        if (c115 < 128) {
# 885 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 886 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 887 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 888 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 889 "objectfollower/objectfollower.c"
                  b117 = & (*(display_buffer + display_y))[display_x * 6];
# 890 "objectfollower/objectfollower.c"
                  f118 = font[c115];
# 891 "objectfollower/objectfollower.c"
                  i116 = 0;
# 892 "objectfollower/objectfollower.c"
                  while (i116 < 5) {
# 893 "objectfollower/objectfollower.c"
                    *b117 = (U8___0 )*f118;
# 894 "objectfollower/objectfollower.c"
                    b117 ++;
# 895 "objectfollower/objectfollower.c"
                    f118 ++;
# 896 "objectfollower/objectfollower.c"
                    i116 ++;
                  }
                }
              }
            }
          }
        }
      }
# 904 "objectfollower/objectfollower.c"
      goto Lret_display_char;
      Lret_display_char:
# 906 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 908 "objectfollower/objectfollower.c"
      display_x = 0;
# 909 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 911 "objectfollower/objectfollower.c"
    str27 ++;
  }
# 913 "objectfollower/objectfollower.c"
  goto Lret_display_string;
  Lret_display_string:
# 915 "objectfollower/objectfollower.c"
  val35 = sizeLCD;
# 916 "objectfollower/objectfollower.c"
  places36 = (U32___2 )4;
# 917 "objectfollower/objectfollower.c"
  if (val35 < 0) {
# 918 "objectfollower/objectfollower.c"
    tmp37 = - val35;
  } else {
# 920 "objectfollower/objectfollower.c"
    tmp37 = val35;
  }
# 922 "objectfollower/objectfollower.c"
  val59 = (U32___0 )tmp37;
# 923 "objectfollower/objectfollower.c"
  places60 = places36;
# 924 "objectfollower/objectfollower.c"
  sign61 = (U32___0 )(val35 < 0);
# 925 "objectfollower/objectfollower.c"
  p63 = & x62[11];
# 926 "objectfollower/objectfollower.c"
  p_count64 = 0;
# 927 "objectfollower/objectfollower.c"
  *p63 = (char)0;
# 928 "objectfollower/objectfollower.c"
  if (places60 > 11UL) {
# 929 "objectfollower/objectfollower.c"
    places60 = (U32___0 )11;
  }
# 931 "objectfollower/objectfollower.c"
  while (val59) {
# 932 "objectfollower/objectfollower.c"
    p63 --;
# 933 "objectfollower/objectfollower.c"
    p_count64 ++;
# 934 "objectfollower/objectfollower.c"
    *p63 = (char )(val59 % 10UL + 48UL);
# 935 "objectfollower/objectfollower.c"
    val59 /= 10UL;
  }
# 937 "objectfollower/objectfollower.c"
  if (! p_count64) {
# 938 "objectfollower/objectfollower.c"
    p63 --;
# 939 "objectfollower/objectfollower.c"
    p_count64 ++;
# 940 "objectfollower/objectfollower.c"
    *p63 = (char )'0';
  }
# 942 "objectfollower/objectfollower.c"
  if (sign61) {
# 943 "objectfollower/objectfollower.c"
    p63 --;
# 944 "objectfollower/objectfollower.c"
    p_count64 ++;
# 945 "objectfollower/objectfollower.c"
    *p63 = (char )'-';
  }
# 947 "objectfollower/objectfollower.c"
  while ((U32___0 )p_count64 < places60) {
# 948 "objectfollower/objectfollower.c"
    p63 --;
# 949 "objectfollower/objectfollower.c"
    p_count64 ++;
# 950 "objectfollower/objectfollower.c"
    *p63 = (char )' ';
  }
# 952 "objectfollower/objectfollower.c"
  str765 = (char const *)p63;
# 953 "objectfollower/objectfollower.c"
  while (*str765) {
# 954 "objectfollower/objectfollower.c"
    if ((int const )*str765 != 10) {
# 955 "objectfollower/objectfollower.c"
      c119 = (int )*str765;
# 956 "objectfollower/objectfollower.c"
      if (c119 >= 0) {
# 957 "objectfollower/objectfollower.c"
        if (c119 < 128) {
# 958 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 959 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 960 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 961 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 962 "objectfollower/objectfollower.c"
                  b121 = & (*(display_buffer + display_y))[display_x * 6];
# 963 "objectfollower/objectfollower.c"
                  f122 = font[c119];
# 964 "objectfollower/objectfollower.c"
                  i120 = 0;
# 965 "objectfollower/objectfollower.c"
                  while (i120 < 5) {
# 966 "objectfollower/objectfollower.c"
                    *b121 = (U8___0 )*f122;
# 967 "objectfollower/objectfollower.c"
                    b121 ++;
# 968 "objectfollower/objectfollower.c"
                    f122 ++;
# 969 "objectfollower/objectfollower.c"
                    i120 ++;
                  }
                }
              }
            }
          }
        }
      }
# 977 "objectfollower/objectfollower.c"
      goto Lret_display_char___0;
      Lret_display_char___0:
# 979 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 981 "objectfollower/objectfollower.c"
      display_x = 0;
# 982 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 984 "objectfollower/objectfollower.c"
    str765 ++;
  }
# 986 "objectfollower/objectfollower.c"
  goto Lret_display_string___7;
  Lret_display_string___7: ;
# 988 "objectfollower/objectfollower.c"
  goto Lret_display_unsigned_worker;
  Lret_display_unsigned_worker: ;
# 990 "objectfollower/objectfollower.c"
  goto Lret_display_int;
  Lret_display_int:
# 992 "objectfollower/objectfollower.c"
  tmp___04 = line2;
# 993 "objectfollower/objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 994 "objectfollower/objectfollower.c"
  x13 = 0;
# 995 "objectfollower/objectfollower.c"
  y14 = (int )tmp___04;
# 996 "objectfollower/objectfollower.c"
  display_x = x13;
# 997 "objectfollower/objectfollower.c"
  display_y = y14;
# 998 "objectfollower/objectfollower.c"
  goto Lret_display_goto_xy___0;
  Lret_display_goto_xy___0:
# 1000 "objectfollower/objectfollower.c"
  message1 = (char *)"area:";
# 1001 "objectfollower/objectfollower.c"
  str28 = (char const *)message1;
# 1002 "objectfollower/objectfollower.c"
  while (*str28) {
# 1003 "objectfollower/objectfollower.c"
    if ((int const )*str28 != 10) {
# 1004 "objectfollower/objectfollower.c"
      c123 = (int )*str28;
# 1005 "objectfollower/objectfollower.c"
      if (c123 >= 0) {
# 1006 "objectfollower/objectfollower.c"
        if (c123 < 128) {
# 1007 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 1008 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 1009 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 1010 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 1011 "objectfollower/objectfollower.c"
                  b125 = & (*(display_buffer + display_y))[display_x * 6];
# 1012 "objectfollower/objectfollower.c"
                  f126 = font[c123];
# 1013 "objectfollower/objectfollower.c"
                  i124 = 0;
# 1014 "objectfollower/objectfollower.c"
                  while (i124 < 5) {
# 1015 "objectfollower/objectfollower.c"
                    *b125 = (U8___0 )*f126;
# 1016 "objectfollower/objectfollower.c"
                    b125 ++;
# 1017 "objectfollower/objectfollower.c"
                    f126 ++;
# 1018 "objectfollower/objectfollower.c"
                    i124 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1026 "objectfollower/objectfollower.c"
      goto Lret_display_char___1;
      Lret_display_char___1:
# 1028 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 1030 "objectfollower/objectfollower.c"
      display_x = 0;
# 1031 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 1033 "objectfollower/objectfollower.c"
    str28 ++;
  }
# 1035 "objectfollower/objectfollower.c"
  goto Lret_display_string___0;
  Lret_display_string___0:
# 1037 "objectfollower/objectfollower.c"
  val38 = areaLCD;
# 1038 "objectfollower/objectfollower.c"
  places39 = (U32___2 )5;
# 1039 "objectfollower/objectfollower.c"
  if (val38 < 0) {
# 1040 "objectfollower/objectfollower.c"
    tmp40 = - val38;
  } else {
# 1042 "objectfollower/objectfollower.c"
    tmp40 = val38;
  }
# 1044 "objectfollower/objectfollower.c"
  val66 = (U32___0 )tmp40;
# 1045 "objectfollower/objectfollower.c"
  places67 = places39;
# 1046 "objectfollower/objectfollower.c"
  sign68 = (U32___0 )(val38 < 0);
# 1047 "objectfollower/objectfollower.c"
  p70 = & x69[11];
# 1048 "objectfollower/objectfollower.c"
  p_count71 = 0;
# 1049 "objectfollower/objectfollower.c"
  *p70 = (char)0;
# 1050 "objectfollower/objectfollower.c"
  if (places67 > 11UL) {
# 1051 "objectfollower/objectfollower.c"
    places67 = (U32___0 )11;
  }
# 1053 "objectfollower/objectfollower.c"
  while (val66) {
# 1054 "objectfollower/objectfollower.c"
    p70 --;
# 1055 "objectfollower/objectfollower.c"
    p_count71 ++;
# 1056 "objectfollower/objectfollower.c"
    *p70 = (char )(val66 % 10UL + 48UL);
# 1057 "objectfollower/objectfollower.c"
    val66 /= 10UL;
  }
# 1059 "objectfollower/objectfollower.c"
  if (! p_count71) {
# 1060 "objectfollower/objectfollower.c"
    p70 --;
# 1061 "objectfollower/objectfollower.c"
    p_count71 ++;
# 1062 "objectfollower/objectfollower.c"
    *p70 = (char )'0';
  }
# 1064 "objectfollower/objectfollower.c"
  if (sign68) {
# 1065 "objectfollower/objectfollower.c"
    p70 --;
# 1066 "objectfollower/objectfollower.c"
    p_count71 ++;
# 1067 "objectfollower/objectfollower.c"
    *p70 = (char )'-';
  }
# 1069 "objectfollower/objectfollower.c"
  while ((U32___0 )p_count71 < places67) {
# 1070 "objectfollower/objectfollower.c"
    p70 --;
# 1071 "objectfollower/objectfollower.c"
    p_count71 ++;
# 1072 "objectfollower/objectfollower.c"
    *p70 = (char )' ';
  }
# 1074 "objectfollower/objectfollower.c"
  str772 = (char const *)p70;
# 1075 "objectfollower/objectfollower.c"
  while (*str772) {
# 1076 "objectfollower/objectfollower.c"
    if ((int const )*str772 != 10) {
# 1077 "objectfollower/objectfollower.c"
      c127 = (int )*str772;
# 1078 "objectfollower/objectfollower.c"
      if (c127 >= 0) {
# 1079 "objectfollower/objectfollower.c"
        if (c127 < 128) {
# 1080 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 1081 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 1082 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 1083 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 1084 "objectfollower/objectfollower.c"
                  b129 = & (*(display_buffer + display_y))[display_x * 6];
# 1085 "objectfollower/objectfollower.c"
                  f130 = font[c127];
# 1086 "objectfollower/objectfollower.c"
                  i128 = 0;
# 1087 "objectfollower/objectfollower.c"
                  while (i128 < 5) {
# 1088 "objectfollower/objectfollower.c"
                    *b129 = (U8___0 )*f130;
# 1089 "objectfollower/objectfollower.c"
                    b129 ++;
# 1090 "objectfollower/objectfollower.c"
                    f130 ++;
# 1091 "objectfollower/objectfollower.c"
                    i128 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1099 "objectfollower/objectfollower.c"
      goto Lret_display_char___2;
      Lret_display_char___2:
# 1101 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 1103 "objectfollower/objectfollower.c"
      display_x = 0;
# 1104 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 1106 "objectfollower/objectfollower.c"
    str772 ++;
  }
# 1108 "objectfollower/objectfollower.c"
  goto Lret_display_string___8;
  Lret_display_string___8: ;
# 1110 "objectfollower/objectfollower.c"
  goto Lret_display_unsigned_worker___0;
  Lret_display_unsigned_worker___0: ;
# 1112 "objectfollower/objectfollower.c"
  goto Lret_display_int___0;
  Lret_display_int___0:
# 1114 "objectfollower/objectfollower.c"
  tmp___15 = line2;
# 1115 "objectfollower/objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 1116 "objectfollower/objectfollower.c"
  x15 = 0;
# 1117 "objectfollower/objectfollower.c"
  y16 = (int )tmp___15;
# 1118 "objectfollower/objectfollower.c"
  display_x = x15;
# 1119 "objectfollower/objectfollower.c"
  display_y = y16;
# 1120 "objectfollower/objectfollower.c"
  goto Lret_display_goto_xy___1;
  Lret_display_goto_xy___1:
# 1122 "objectfollower/objectfollower.c"
  message1 = (char *)"pos:";
# 1123 "objectfollower/objectfollower.c"
  str29 = (char const *)message1;
# 1124 "objectfollower/objectfollower.c"
  while (*str29) {
# 1125 "objectfollower/objectfollower.c"
    if ((int const )*str29 != 10) {
# 1126 "objectfollower/objectfollower.c"
      c131 = (int )*str29;
# 1127 "objectfollower/objectfollower.c"
      if (c131 >= 0) {
# 1128 "objectfollower/objectfollower.c"
        if (c131 < 128) {
# 1129 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 1130 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 1131 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 1132 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 1133 "objectfollower/objectfollower.c"
                  b133 = & (*(display_buffer + display_y))[display_x * 6];
# 1134 "objectfollower/objectfollower.c"
                  f134 = font[c131];
# 1135 "objectfollower/objectfollower.c"
                  i132 = 0;
# 1136 "objectfollower/objectfollower.c"
                  while (i132 < 5) {
# 1137 "objectfollower/objectfollower.c"
                    *b133 = (U8___0 )*f134;
# 1138 "objectfollower/objectfollower.c"
                    b133 ++;
# 1139 "objectfollower/objectfollower.c"
                    f134 ++;
# 1140 "objectfollower/objectfollower.c"
                    i132 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1148 "objectfollower/objectfollower.c"
      goto Lret_display_char___3;
      Lret_display_char___3:
# 1150 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 1152 "objectfollower/objectfollower.c"
      display_x = 0;
# 1153 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 1155 "objectfollower/objectfollower.c"
    str29 ++;
  }
# 1157 "objectfollower/objectfollower.c"
  goto Lret_display_string___1;
  Lret_display_string___1:
# 1159 "objectfollower/objectfollower.c"
  val41 = xLCD;
# 1160 "objectfollower/objectfollower.c"
  places42 = (U32___2 )4;
# 1161 "objectfollower/objectfollower.c"
  if (val41 < 0) {
# 1162 "objectfollower/objectfollower.c"
    tmp43 = - val41;
  } else {
# 1164 "objectfollower/objectfollower.c"
    tmp43 = val41;
  }
# 1166 "objectfollower/objectfollower.c"
  val73 = (U32___0 )tmp43;
# 1167 "objectfollower/objectfollower.c"
  places74 = places42;
# 1168 "objectfollower/objectfollower.c"
  sign75 = (U32___0 )(val41 < 0);
# 1169 "objectfollower/objectfollower.c"
  p77 = & x76[11];
# 1170 "objectfollower/objectfollower.c"
  p_count78 = 0;
# 1171 "objectfollower/objectfollower.c"
  *p77 = (char)0;
# 1172 "objectfollower/objectfollower.c"
  if (places74 > 11UL) {
# 1173 "objectfollower/objectfollower.c"
    places74 = (U32___0 )11;
  }
# 1175 "objectfollower/objectfollower.c"
  while (val73) {
# 1176 "objectfollower/objectfollower.c"
    p77 --;
# 1177 "objectfollower/objectfollower.c"
    p_count78 ++;
# 1178 "objectfollower/objectfollower.c"
    *p77 = (char )(val73 % 10UL + 48UL);
# 1179 "objectfollower/objectfollower.c"
    val73 /= 10UL;
  }
# 1181 "objectfollower/objectfollower.c"
  if (! p_count78) {
# 1182 "objectfollower/objectfollower.c"
    p77 --;
# 1183 "objectfollower/objectfollower.c"
    p_count78 ++;
# 1184 "objectfollower/objectfollower.c"
    *p77 = (char )'0';
  }
# 1186 "objectfollower/objectfollower.c"
  if (sign75) {
# 1187 "objectfollower/objectfollower.c"
    p77 --;
# 1188 "objectfollower/objectfollower.c"
    p_count78 ++;
# 1189 "objectfollower/objectfollower.c"
    *p77 = (char )'-';
  }
# 1191 "objectfollower/objectfollower.c"
  while ((U32___0 )p_count78 < places74) {
# 1192 "objectfollower/objectfollower.c"
    p77 --;
# 1193 "objectfollower/objectfollower.c"
    p_count78 ++;
# 1194 "objectfollower/objectfollower.c"
    *p77 = (char )' ';
  }
# 1196 "objectfollower/objectfollower.c"
  str779 = (char const *)p77;
# 1197 "objectfollower/objectfollower.c"
  while (*str779) {
# 1198 "objectfollower/objectfollower.c"
    if ((int const )*str779 != 10) {
# 1199 "objectfollower/objectfollower.c"
      c135 = (int )*str779;
# 1200 "objectfollower/objectfollower.c"
      if (c135 >= 0) {
# 1201 "objectfollower/objectfollower.c"
        if (c135 < 128) {
# 1202 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 1203 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 1204 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 1205 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 1206 "objectfollower/objectfollower.c"
                  b137 = & (*(display_buffer + display_y))[display_x * 6];
# 1207 "objectfollower/objectfollower.c"
                  f138 = font[c135];
# 1208 "objectfollower/objectfollower.c"
                  i136 = 0;
# 1209 "objectfollower/objectfollower.c"
                  while (i136 < 5) {
# 1210 "objectfollower/objectfollower.c"
                    *b137 = (U8___0 )*f138;
# 1211 "objectfollower/objectfollower.c"
                    b137 ++;
# 1212 "objectfollower/objectfollower.c"
                    f138 ++;
# 1213 "objectfollower/objectfollower.c"
                    i136 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1221 "objectfollower/objectfollower.c"
      goto Lret_display_char___4;
      Lret_display_char___4:
# 1223 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 1225 "objectfollower/objectfollower.c"
      display_x = 0;
# 1226 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 1228 "objectfollower/objectfollower.c"
    str779 ++;
  }
# 1230 "objectfollower/objectfollower.c"
  goto Lret_display_string___9;
  Lret_display_string___9: ;
# 1232 "objectfollower/objectfollower.c"
  goto Lret_display_unsigned_worker___1;
  Lret_display_unsigned_worker___1: ;
# 1234 "objectfollower/objectfollower.c"
  goto Lret_display_int___1;
  Lret_display_int___1:
# 1236 "objectfollower/objectfollower.c"
  tmp___26 = line2;
# 1237 "objectfollower/objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 1238 "objectfollower/objectfollower.c"
  x17 = 0;
# 1239 "objectfollower/objectfollower.c"
  y18 = (int )tmp___26;
# 1240 "objectfollower/objectfollower.c"
  display_x = x17;
# 1241 "objectfollower/objectfollower.c"
  display_y = y18;
# 1242 "objectfollower/objectfollower.c"
  goto Lret_display_goto_xy___2;
  Lret_display_goto_xy___2:
# 1244 "objectfollower/objectfollower.c"
  message1 = (char *)"speed:";
# 1245 "objectfollower/objectfollower.c"
  str30 = (char const *)message1;
# 1246 "objectfollower/objectfollower.c"
  while (*str30) {
# 1247 "objectfollower/objectfollower.c"
    if ((int const )*str30 != 10) {
# 1248 "objectfollower/objectfollower.c"
      c139 = (int )*str30;
# 1249 "objectfollower/objectfollower.c"
      if (c139 >= 0) {
# 1250 "objectfollower/objectfollower.c"
        if (c139 < 128) {
# 1251 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 1252 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 1253 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 1254 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 1255 "objectfollower/objectfollower.c"
                  b141 = & (*(display_buffer + display_y))[display_x * 6];
# 1256 "objectfollower/objectfollower.c"
                  f142 = font[c139];
# 1257 "objectfollower/objectfollower.c"
                  i140 = 0;
# 1258 "objectfollower/objectfollower.c"
                  while (i140 < 5) {
# 1259 "objectfollower/objectfollower.c"
                    *b141 = (U8___0 )*f142;
# 1260 "objectfollower/objectfollower.c"
                    b141 ++;
# 1261 "objectfollower/objectfollower.c"
                    f142 ++;
# 1262 "objectfollower/objectfollower.c"
                    i140 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1270 "objectfollower/objectfollower.c"
      goto Lret_display_char___5;
      Lret_display_char___5:
# 1272 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 1274 "objectfollower/objectfollower.c"
      display_x = 0;
# 1275 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 1277 "objectfollower/objectfollower.c"
    str30 ++;
  }
# 1279 "objectfollower/objectfollower.c"
  goto Lret_display_string___2;
  Lret_display_string___2:
# 1281 "objectfollower/objectfollower.c"
  val44 = speedLCD;
# 1282 "objectfollower/objectfollower.c"
  places45 = (U32___2 )4;
# 1283 "objectfollower/objectfollower.c"
  if (val44 < 0) {
# 1284 "objectfollower/objectfollower.c"
    tmp46 = - val44;
  } else {
# 1286 "objectfollower/objectfollower.c"
    tmp46 = val44;
  }
# 1288 "objectfollower/objectfollower.c"
  val80 = (U32___0 )tmp46;
# 1289 "objectfollower/objectfollower.c"
  places81 = places45;
# 1290 "objectfollower/objectfollower.c"
  sign82 = (U32___0 )(val44 < 0);
# 1291 "objectfollower/objectfollower.c"
  p84 = & x83[11];
# 1292 "objectfollower/objectfollower.c"
  p_count85 = 0;
# 1293 "objectfollower/objectfollower.c"
  *p84 = (char)0;
# 1294 "objectfollower/objectfollower.c"
  if (places81 > 11UL) {
# 1295 "objectfollower/objectfollower.c"
    places81 = (U32___0 )11;
  }
# 1297 "objectfollower/objectfollower.c"
  while (val80) {
# 1298 "objectfollower/objectfollower.c"
    p84 --;
# 1299 "objectfollower/objectfollower.c"
    p_count85 ++;
# 1300 "objectfollower/objectfollower.c"
    *p84 = (char )(val80 % 10UL + 48UL);
# 1301 "objectfollower/objectfollower.c"
    val80 /= 10UL;
  }
# 1303 "objectfollower/objectfollower.c"
  if (! p_count85) {
# 1304 "objectfollower/objectfollower.c"
    p84 --;
# 1305 "objectfollower/objectfollower.c"
    p_count85 ++;
# 1306 "objectfollower/objectfollower.c"
    *p84 = (char )'0';
  }
# 1308 "objectfollower/objectfollower.c"
  if (sign82) {
# 1309 "objectfollower/objectfollower.c"
    p84 --;
# 1310 "objectfollower/objectfollower.c"
    p_count85 ++;
# 1311 "objectfollower/objectfollower.c"
    *p84 = (char )'-';
  }
# 1313 "objectfollower/objectfollower.c"
  while ((U32___0 )p_count85 < places81) {
# 1314 "objectfollower/objectfollower.c"
    p84 --;
# 1315 "objectfollower/objectfollower.c"
    p_count85 ++;
# 1316 "objectfollower/objectfollower.c"
    *p84 = (char )' ';
  }
# 1318 "objectfollower/objectfollower.c"
  str786 = (char const *)p84;
# 1319 "objectfollower/objectfollower.c"
  while (*str786) {
# 1320 "objectfollower/objectfollower.c"
    if ((int const )*str786 != 10) {
# 1321 "objectfollower/objectfollower.c"
      c143 = (int )*str786;
# 1322 "objectfollower/objectfollower.c"
      if (c143 >= 0) {
# 1323 "objectfollower/objectfollower.c"
        if (c143 < 128) {
# 1324 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 1325 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 1326 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 1327 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 1328 "objectfollower/objectfollower.c"
                  b145 = & (*(display_buffer + display_y))[display_x * 6];
# 1329 "objectfollower/objectfollower.c"
                  f146 = font[c143];
# 1330 "objectfollower/objectfollower.c"
                  i144 = 0;
# 1331 "objectfollower/objectfollower.c"
                  while (i144 < 5) {
# 1332 "objectfollower/objectfollower.c"
                    *b145 = (U8___0 )*f146;
# 1333 "objectfollower/objectfollower.c"
                    b145 ++;
# 1334 "objectfollower/objectfollower.c"
                    f146 ++;
# 1335 "objectfollower/objectfollower.c"
                    i144 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1343 "objectfollower/objectfollower.c"
      goto Lret_display_char___6;
      Lret_display_char___6:
# 1345 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 1347 "objectfollower/objectfollower.c"
      display_x = 0;
# 1348 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 1350 "objectfollower/objectfollower.c"
    str786 ++;
  }
# 1352 "objectfollower/objectfollower.c"
  goto Lret_display_string___10;
  Lret_display_string___10: ;
# 1354 "objectfollower/objectfollower.c"
  goto Lret_display_unsigned_worker___2;
  Lret_display_unsigned_worker___2: ;
# 1356 "objectfollower/objectfollower.c"
  goto Lret_display_int___2;
  Lret_display_int___2:
# 1358 "objectfollower/objectfollower.c"
  tmp___37 = line2;
# 1359 "objectfollower/objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 1360 "objectfollower/objectfollower.c"
  x19 = 0;
# 1361 "objectfollower/objectfollower.c"
  y20 = (int )tmp___37;
# 1362 "objectfollower/objectfollower.c"
  display_x = x19;
# 1363 "objectfollower/objectfollower.c"
  display_y = y20;
# 1364 "objectfollower/objectfollower.c"
  goto Lret_display_goto_xy___3;
  Lret_display_goto_xy___3:
# 1366 "objectfollower/objectfollower.c"
  message1 = (char *)"dev speed:";
# 1367 "objectfollower/objectfollower.c"
  str31 = (char const *)message1;
# 1368 "objectfollower/objectfollower.c"
  while (*str31) {
# 1369 "objectfollower/objectfollower.c"
    if ((int const )*str31 != 10) {
# 1370 "objectfollower/objectfollower.c"
      c147 = (int )*str31;
# 1371 "objectfollower/objectfollower.c"
      if (c147 >= 0) {
# 1372 "objectfollower/objectfollower.c"
        if (c147 < 128) {
# 1373 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 1374 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 1375 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 1376 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 1377 "objectfollower/objectfollower.c"
                  b149 = & (*(display_buffer + display_y))[display_x * 6];
# 1378 "objectfollower/objectfollower.c"
                  f150 = font[c147];
# 1379 "objectfollower/objectfollower.c"
                  i148 = 0;
# 1380 "objectfollower/objectfollower.c"
                  while (i148 < 5) {
# 1381 "objectfollower/objectfollower.c"
                    *b149 = (U8___0 )*f150;
# 1382 "objectfollower/objectfollower.c"
                    b149 ++;
# 1383 "objectfollower/objectfollower.c"
                    f150 ++;
# 1384 "objectfollower/objectfollower.c"
                    i148 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1392 "objectfollower/objectfollower.c"
      goto Lret_display_char___7;
      Lret_display_char___7:
# 1394 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 1396 "objectfollower/objectfollower.c"
      display_x = 0;
# 1397 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 1399 "objectfollower/objectfollower.c"
    str31 ++;
  }
# 1401 "objectfollower/objectfollower.c"
  goto Lret_display_string___3;
  Lret_display_string___3:
# 1403 "objectfollower/objectfollower.c"
  val47 = devspeedLCD;
# 1404 "objectfollower/objectfollower.c"
  places48 = (U32___2 )4;
# 1405 "objectfollower/objectfollower.c"
  if (val47 < 0) {
# 1406 "objectfollower/objectfollower.c"
    tmp49 = - val47;
  } else {
# 1408 "objectfollower/objectfollower.c"
    tmp49 = val47;
  }
# 1410 "objectfollower/objectfollower.c"
  val87 = (U32___0 )tmp49;
# 1411 "objectfollower/objectfollower.c"
  places88 = places48;
# 1412 "objectfollower/objectfollower.c"
  sign89 = (U32___0 )(val47 < 0);
# 1413 "objectfollower/objectfollower.c"
  p91 = & x90[11];
# 1414 "objectfollower/objectfollower.c"
  p_count92 = 0;
# 1415 "objectfollower/objectfollower.c"
  *p91 = (char)0;
# 1416 "objectfollower/objectfollower.c"
  if (places88 > 11UL) {
# 1417 "objectfollower/objectfollower.c"
    places88 = (U32___0 )11;
  }
# 1419 "objectfollower/objectfollower.c"
  while (val87) {
# 1420 "objectfollower/objectfollower.c"
    p91 --;
# 1421 "objectfollower/objectfollower.c"
    p_count92 ++;
# 1422 "objectfollower/objectfollower.c"
    *p91 = (char )(val87 % 10UL + 48UL);
# 1423 "objectfollower/objectfollower.c"
    val87 /= 10UL;
  }
# 1425 "objectfollower/objectfollower.c"
  if (! p_count92) {
# 1426 "objectfollower/objectfollower.c"
    p91 --;
# 1427 "objectfollower/objectfollower.c"
    p_count92 ++;
# 1428 "objectfollower/objectfollower.c"
    *p91 = (char )'0';
  }
# 1430 "objectfollower/objectfollower.c"
  if (sign89) {
# 1431 "objectfollower/objectfollower.c"
    p91 --;
# 1432 "objectfollower/objectfollower.c"
    p_count92 ++;
# 1433 "objectfollower/objectfollower.c"
    *p91 = (char )'-';
  }
# 1435 "objectfollower/objectfollower.c"
  while ((U32___0 )p_count92 < places88) {
# 1436 "objectfollower/objectfollower.c"
    p91 --;
# 1437 "objectfollower/objectfollower.c"
    p_count92 ++;
# 1438 "objectfollower/objectfollower.c"
    *p91 = (char )' ';
  }
# 1440 "objectfollower/objectfollower.c"
  str793 = (char const *)p91;
# 1441 "objectfollower/objectfollower.c"
  while (*str793) {
# 1442 "objectfollower/objectfollower.c"
    if ((int const )*str793 != 10) {
# 1443 "objectfollower/objectfollower.c"
      c151 = (int )*str793;
# 1444 "objectfollower/objectfollower.c"
      if (c151 >= 0) {
# 1445 "objectfollower/objectfollower.c"
        if (c151 < 128) {
# 1446 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 1447 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 1448 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 1449 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 1450 "objectfollower/objectfollower.c"
                  b153 = & (*(display_buffer + display_y))[display_x * 6];
# 1451 "objectfollower/objectfollower.c"
                  f154 = font[c151];
# 1452 "objectfollower/objectfollower.c"
                  i152 = 0;
# 1453 "objectfollower/objectfollower.c"
                  while (i152 < 5) {
# 1454 "objectfollower/objectfollower.c"
                    *b153 = (U8___0 )*f154;
# 1455 "objectfollower/objectfollower.c"
                    b153 ++;
# 1456 "objectfollower/objectfollower.c"
                    f154 ++;
# 1457 "objectfollower/objectfollower.c"
                    i152 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1465 "objectfollower/objectfollower.c"
      goto Lret_display_char___8;
      Lret_display_char___8:
# 1467 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 1469 "objectfollower/objectfollower.c"
      display_x = 0;
# 1470 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 1472 "objectfollower/objectfollower.c"
    str793 ++;
  }
# 1474 "objectfollower/objectfollower.c"
  goto Lret_display_string___11;
  Lret_display_string___11: ;
# 1476 "objectfollower/objectfollower.c"
  goto Lret_display_unsigned_worker___3;
  Lret_display_unsigned_worker___3: ;
# 1478 "objectfollower/objectfollower.c"
  goto Lret_display_int___3;
  Lret_display_int___3:
# 1480 "objectfollower/objectfollower.c"
  tmp___48 = line2;
# 1481 "objectfollower/objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 1482 "objectfollower/objectfollower.c"
  x21 = 0;
# 1483 "objectfollower/objectfollower.c"
  y22 = (int )tmp___48;
# 1484 "objectfollower/objectfollower.c"
  display_x = x21;
# 1485 "objectfollower/objectfollower.c"
  display_y = y22;
# 1486 "objectfollower/objectfollower.c"
  goto Lret_display_goto_xy___4;
  Lret_display_goto_xy___4:
# 1488 "objectfollower/objectfollower.c"
  message1 = (char *)"dir dev:";
# 1489 "objectfollower/objectfollower.c"
  str32 = (char const *)message1;
# 1490 "objectfollower/objectfollower.c"
  while (*str32) {
# 1491 "objectfollower/objectfollower.c"
    if ((int const )*str32 != 10) {
# 1492 "objectfollower/objectfollower.c"
      c155 = (int )*str32;
# 1493 "objectfollower/objectfollower.c"
      if (c155 >= 0) {
# 1494 "objectfollower/objectfollower.c"
        if (c155 < 128) {
# 1495 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 1496 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 1497 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 1498 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 1499 "objectfollower/objectfollower.c"
                  b157 = & (*(display_buffer + display_y))[display_x * 6];
# 1500 "objectfollower/objectfollower.c"
                  f158 = font[c155];
# 1501 "objectfollower/objectfollower.c"
                  i156 = 0;
# 1502 "objectfollower/objectfollower.c"
                  while (i156 < 5) {
# 1503 "objectfollower/objectfollower.c"
                    *b157 = (U8___0 )*f158;
# 1504 "objectfollower/objectfollower.c"
                    b157 ++;
# 1505 "objectfollower/objectfollower.c"
                    f158 ++;
# 1506 "objectfollower/objectfollower.c"
                    i156 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1514 "objectfollower/objectfollower.c"
      goto Lret_display_char___9;
      Lret_display_char___9:
# 1516 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 1518 "objectfollower/objectfollower.c"
      display_x = 0;
# 1519 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 1521 "objectfollower/objectfollower.c"
    str32 ++;
  }
# 1523 "objectfollower/objectfollower.c"
  goto Lret_display_string___4;
  Lret_display_string___4:
# 1525 "objectfollower/objectfollower.c"
  val50 = diradjLCD;
# 1526 "objectfollower/objectfollower.c"
  places51 = (U32___2 )4;
# 1527 "objectfollower/objectfollower.c"
  if (val50 < 0) {
# 1528 "objectfollower/objectfollower.c"
    tmp52 = - val50;
  } else {
# 1530 "objectfollower/objectfollower.c"
    tmp52 = val50;
  }
# 1532 "objectfollower/objectfollower.c"
  val94 = (U32___0 )tmp52;
# 1533 "objectfollower/objectfollower.c"
  places95 = places51;
# 1534 "objectfollower/objectfollower.c"
  sign96 = (U32___0 )(val50 < 0);
# 1535 "objectfollower/objectfollower.c"
  p98 = & x97[11];
# 1536 "objectfollower/objectfollower.c"
  p_count99 = 0;
# 1537 "objectfollower/objectfollower.c"
  *p98 = (char)0;
# 1538 "objectfollower/objectfollower.c"
  if (places95 > 11UL) {
# 1539 "objectfollower/objectfollower.c"
    places95 = (U32___0 )11;
  }
# 1541 "objectfollower/objectfollower.c"
  while (val94) {
# 1542 "objectfollower/objectfollower.c"
    p98 --;
# 1543 "objectfollower/objectfollower.c"
    p_count99 ++;
# 1544 "objectfollower/objectfollower.c"
    *p98 = (char )(val94 % 10UL + 48UL);
# 1545 "objectfollower/objectfollower.c"
    val94 /= 10UL;
  }
# 1547 "objectfollower/objectfollower.c"
  if (! p_count99) {
# 1548 "objectfollower/objectfollower.c"
    p98 --;
# 1549 "objectfollower/objectfollower.c"
    p_count99 ++;
# 1550 "objectfollower/objectfollower.c"
    *p98 = (char )'0';
  }
# 1552 "objectfollower/objectfollower.c"
  if (sign96) {
# 1553 "objectfollower/objectfollower.c"
    p98 --;
# 1554 "objectfollower/objectfollower.c"
    p_count99 ++;
# 1555 "objectfollower/objectfollower.c"
    *p98 = (char )'-';
  }
# 1557 "objectfollower/objectfollower.c"
  while ((U32___0 )p_count99 < places95) {
# 1558 "objectfollower/objectfollower.c"
    p98 --;
# 1559 "objectfollower/objectfollower.c"
    p_count99 ++;
# 1560 "objectfollower/objectfollower.c"
    *p98 = (char )' ';
  }
# 1562 "objectfollower/objectfollower.c"
  str7100 = (char const *)p98;
# 1563 "objectfollower/objectfollower.c"
  while (*str7100) {
# 1564 "objectfollower/objectfollower.c"
    if ((int const )*str7100 != 10) {
# 1565 "objectfollower/objectfollower.c"
      c159 = (int )*str7100;
# 1566 "objectfollower/objectfollower.c"
      if (c159 >= 0) {
# 1567 "objectfollower/objectfollower.c"
        if (c159 < 128) {
# 1568 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 1569 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 1570 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 1571 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 1572 "objectfollower/objectfollower.c"
                  b161 = & (*(display_buffer + display_y))[display_x * 6];
# 1573 "objectfollower/objectfollower.c"
                  f162 = font[c159];
# 1574 "objectfollower/objectfollower.c"
                  i160 = 0;
# 1575 "objectfollower/objectfollower.c"
                  while (i160 < 5) {
# 1576 "objectfollower/objectfollower.c"
                    *b161 = (U8___0 )*f162;
# 1577 "objectfollower/objectfollower.c"
                    b161 ++;
# 1578 "objectfollower/objectfollower.c"
                    f162 ++;
# 1579 "objectfollower/objectfollower.c"
                    i160 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1587 "objectfollower/objectfollower.c"
      goto Lret_display_char___10;
      Lret_display_char___10:
# 1589 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 1591 "objectfollower/objectfollower.c"
      display_x = 0;
# 1592 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 1594 "objectfollower/objectfollower.c"
    str7100 ++;
  }
# 1596 "objectfollower/objectfollower.c"
  goto Lret_display_string___12;
  Lret_display_string___12: ;
# 1598 "objectfollower/objectfollower.c"
  goto Lret_display_unsigned_worker___4;
  Lret_display_unsigned_worker___4: ;
# 1600 "objectfollower/objectfollower.c"
  goto Lret_display_int___4;
  Lret_display_int___4:
# 1602 "objectfollower/objectfollower.c"
  tmp___59 = line2;
# 1603 "objectfollower/objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 1604 "objectfollower/objectfollower.c"
  x23 = 0;
# 1605 "objectfollower/objectfollower.c"
  y24 = (int )tmp___59;
# 1606 "objectfollower/objectfollower.c"
  display_x = x23;
# 1607 "objectfollower/objectfollower.c"
  display_y = y24;
# 1608 "objectfollower/objectfollower.c"
  goto Lret_display_goto_xy___5;
  Lret_display_goto_xy___5:
# 1610 "objectfollower/objectfollower.c"
  message1 = (char *)"left motor:";
# 1611 "objectfollower/objectfollower.c"
  str33 = (char const *)message1;
# 1612 "objectfollower/objectfollower.c"
  while (*str33) {
# 1613 "objectfollower/objectfollower.c"
    if ((int const )*str33 != 10) {
# 1614 "objectfollower/objectfollower.c"
      c163 = (int )*str33;
# 1615 "objectfollower/objectfollower.c"
      if (c163 >= 0) {
# 1616 "objectfollower/objectfollower.c"
        if (c163 < 128) {
# 1617 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 1618 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 1619 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 1620 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 1621 "objectfollower/objectfollower.c"
                  b165 = & (*(display_buffer + display_y))[display_x * 6];
# 1622 "objectfollower/objectfollower.c"
                  f166 = font[c163];
# 1623 "objectfollower/objectfollower.c"
                  i164 = 0;
# 1624 "objectfollower/objectfollower.c"
                  while (i164 < 5) {
# 1625 "objectfollower/objectfollower.c"
                    *b165 = (U8___0 )*f166;
# 1626 "objectfollower/objectfollower.c"
                    b165 ++;
# 1627 "objectfollower/objectfollower.c"
                    f166 ++;
# 1628 "objectfollower/objectfollower.c"
                    i164 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1636 "objectfollower/objectfollower.c"
      goto Lret_display_char___11;
      Lret_display_char___11:
# 1638 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 1640 "objectfollower/objectfollower.c"
      display_x = 0;
# 1641 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 1643 "objectfollower/objectfollower.c"
    str33 ++;
  }
# 1645 "objectfollower/objectfollower.c"
  goto Lret_display_string___5;
  Lret_display_string___5:
# 1647 "objectfollower/objectfollower.c"
  val53 = lmotLCD;
# 1648 "objectfollower/objectfollower.c"
  places54 = (U32___2 )4;
# 1649 "objectfollower/objectfollower.c"
  if (val53 < 0) {
# 1650 "objectfollower/objectfollower.c"
    tmp55 = - val53;
  } else {
# 1652 "objectfollower/objectfollower.c"
    tmp55 = val53;
  }
# 1654 "objectfollower/objectfollower.c"
  val101 = (U32___0 )tmp55;
# 1655 "objectfollower/objectfollower.c"
  places102 = places54;
# 1656 "objectfollower/objectfollower.c"
  sign103 = (U32___0 )(val53 < 0);
# 1657 "objectfollower/objectfollower.c"
  p105 = & x104[11];
# 1658 "objectfollower/objectfollower.c"
  p_count106 = 0;
# 1659 "objectfollower/objectfollower.c"
  *p105 = (char)0;
# 1660 "objectfollower/objectfollower.c"
  if (places102 > 11UL) {
# 1661 "objectfollower/objectfollower.c"
    places102 = (U32___0 )11;
  }
# 1663 "objectfollower/objectfollower.c"
  while (val101) {
# 1664 "objectfollower/objectfollower.c"
    p105 --;
# 1665 "objectfollower/objectfollower.c"
    p_count106 ++;
# 1666 "objectfollower/objectfollower.c"
    *p105 = (char )(val101 % 10UL + 48UL);
# 1667 "objectfollower/objectfollower.c"
    val101 /= 10UL;
  }
# 1669 "objectfollower/objectfollower.c"
  if (! p_count106) {
# 1670 "objectfollower/objectfollower.c"
    p105 --;
# 1671 "objectfollower/objectfollower.c"
    p_count106 ++;
# 1672 "objectfollower/objectfollower.c"
    *p105 = (char )'0';
  }
# 1674 "objectfollower/objectfollower.c"
  if (sign103) {
# 1675 "objectfollower/objectfollower.c"
    p105 --;
# 1676 "objectfollower/objectfollower.c"
    p_count106 ++;
# 1677 "objectfollower/objectfollower.c"
    *p105 = (char )'-';
  }
# 1679 "objectfollower/objectfollower.c"
  while ((U32___0 )p_count106 < places102) {
# 1680 "objectfollower/objectfollower.c"
    p105 --;
# 1681 "objectfollower/objectfollower.c"
    p_count106 ++;
# 1682 "objectfollower/objectfollower.c"
    *p105 = (char )' ';
  }
# 1684 "objectfollower/objectfollower.c"
  str7107 = (char const *)p105;
# 1685 "objectfollower/objectfollower.c"
  while (*str7107) {
# 1686 "objectfollower/objectfollower.c"
    if ((int const )*str7107 != 10) {
# 1687 "objectfollower/objectfollower.c"
      c167 = (int )*str7107;
# 1688 "objectfollower/objectfollower.c"
      if (c167 >= 0) {
# 1689 "objectfollower/objectfollower.c"
        if (c167 < 128) {
# 1690 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 1691 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 1692 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 1693 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 1694 "objectfollower/objectfollower.c"
                  b169 = & (*(display_buffer + display_y))[display_x * 6];
# 1695 "objectfollower/objectfollower.c"
                  f170 = font[c167];
# 1696 "objectfollower/objectfollower.c"
                  i168 = 0;
# 1697 "objectfollower/objectfollower.c"
                  while (i168 < 5) {
# 1698 "objectfollower/objectfollower.c"
                    *b169 = (U8___0 )*f170;
# 1699 "objectfollower/objectfollower.c"
                    b169 ++;
# 1700 "objectfollower/objectfollower.c"
                    f170 ++;
# 1701 "objectfollower/objectfollower.c"
                    i168 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1709 "objectfollower/objectfollower.c"
      goto Lret_display_char___12;
      Lret_display_char___12:
# 1711 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 1713 "objectfollower/objectfollower.c"
      display_x = 0;
# 1714 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 1716 "objectfollower/objectfollower.c"
    str7107 ++;
  }
# 1718 "objectfollower/objectfollower.c"
  goto Lret_display_string___13;
  Lret_display_string___13: ;
# 1720 "objectfollower/objectfollower.c"
  goto Lret_display_unsigned_worker___5;
  Lret_display_unsigned_worker___5: ;
# 1722 "objectfollower/objectfollower.c"
  goto Lret_display_int___5;
  Lret_display_int___5:
# 1724 "objectfollower/objectfollower.c"
  tmp___610 = line2;
# 1725 "objectfollower/objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 1726 "objectfollower/objectfollower.c"
  x25 = 0;
# 1727 "objectfollower/objectfollower.c"
  y26 = (int )tmp___610;
# 1728 "objectfollower/objectfollower.c"
  display_x = x25;
# 1729 "objectfollower/objectfollower.c"
  display_y = y26;
# 1730 "objectfollower/objectfollower.c"
  goto Lret_display_goto_xy___6;
  Lret_display_goto_xy___6:
# 1732 "objectfollower/objectfollower.c"
  message1 = (char *)"right motor:";
# 1733 "objectfollower/objectfollower.c"
  str34 = (char const *)message1;
# 1734 "objectfollower/objectfollower.c"
  while (*str34) {
# 1735 "objectfollower/objectfollower.c"
    if ((int const )*str34 != 10) {
# 1736 "objectfollower/objectfollower.c"
      c171 = (int )*str34;
# 1737 "objectfollower/objectfollower.c"
      if (c171 >= 0) {
# 1738 "objectfollower/objectfollower.c"
        if (c171 < 128) {
# 1739 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 1740 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 1741 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 1742 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 1743 "objectfollower/objectfollower.c"
                  b173 = & (*(display_buffer + display_y))[display_x * 6];
# 1744 "objectfollower/objectfollower.c"
                  f174 = font[c171];
# 1745 "objectfollower/objectfollower.c"
                  i172 = 0;
# 1746 "objectfollower/objectfollower.c"
                  while (i172 < 5) {
# 1747 "objectfollower/objectfollower.c"
                    *b173 = (U8___0 )*f174;
# 1748 "objectfollower/objectfollower.c"
                    b173 ++;
# 1749 "objectfollower/objectfollower.c"
                    f174 ++;
# 1750 "objectfollower/objectfollower.c"
                    i172 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1758 "objectfollower/objectfollower.c"
      goto Lret_display_char___13;
      Lret_display_char___13:
# 1760 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 1762 "objectfollower/objectfollower.c"
      display_x = 0;
# 1763 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 1765 "objectfollower/objectfollower.c"
    str34 ++;
  }
# 1767 "objectfollower/objectfollower.c"
  goto Lret_display_string___6;
  Lret_display_string___6:
# 1769 "objectfollower/objectfollower.c"
  val56 = rmotLCD;
# 1770 "objectfollower/objectfollower.c"
  places57 = (U32___2 )4;
# 1771 "objectfollower/objectfollower.c"
  if (val56 < 0) {
# 1772 "objectfollower/objectfollower.c"
    tmp58 = - val56;
  } else {
# 1774 "objectfollower/objectfollower.c"
    tmp58 = val56;
  }
# 1776 "objectfollower/objectfollower.c"
  val108 = (U32___0 )tmp58;
# 1777 "objectfollower/objectfollower.c"
  places109 = places57;
# 1778 "objectfollower/objectfollower.c"
  sign110 = (U32___0 )(val56 < 0);
# 1779 "objectfollower/objectfollower.c"
  p112 = & x111[11];
# 1780 "objectfollower/objectfollower.c"
  p_count113 = 0;
# 1781 "objectfollower/objectfollower.c"
  *p112 = (char)0;
# 1782 "objectfollower/objectfollower.c"
  if (places109 > 11UL) {
# 1783 "objectfollower/objectfollower.c"
    places109 = (U32___0 )11;
  }
# 1785 "objectfollower/objectfollower.c"
  while (val108) {
# 1786 "objectfollower/objectfollower.c"
    p112 --;
# 1787 "objectfollower/objectfollower.c"
    p_count113 ++;
# 1788 "objectfollower/objectfollower.c"
    *p112 = (char )(val108 % 10UL + 48UL);
# 1789 "objectfollower/objectfollower.c"
    val108 /= 10UL;
  }
# 1791 "objectfollower/objectfollower.c"
  if (! p_count113) {
# 1792 "objectfollower/objectfollower.c"
    p112 --;
# 1793 "objectfollower/objectfollower.c"
    p_count113 ++;
# 1794 "objectfollower/objectfollower.c"
    *p112 = (char )'0';
  }
# 1796 "objectfollower/objectfollower.c"
  if (sign110) {
# 1797 "objectfollower/objectfollower.c"
    p112 --;
# 1798 "objectfollower/objectfollower.c"
    p_count113 ++;
# 1799 "objectfollower/objectfollower.c"
    *p112 = (char )'-';
  }
# 1801 "objectfollower/objectfollower.c"
  while ((U32___0 )p_count113 < places109) {
# 1802 "objectfollower/objectfollower.c"
    p112 --;
# 1803 "objectfollower/objectfollower.c"
    p_count113 ++;
# 1804 "objectfollower/objectfollower.c"
    *p112 = (char )' ';
  }
# 1806 "objectfollower/objectfollower.c"
  str7114 = (char const *)p112;
# 1807 "objectfollower/objectfollower.c"
  while (*str7114) {
# 1808 "objectfollower/objectfollower.c"
    if ((int const )*str7114 != 10) {
# 1809 "objectfollower/objectfollower.c"
      c175 = (int )*str7114;
# 1810 "objectfollower/objectfollower.c"
      if (c175 >= 0) {
# 1811 "objectfollower/objectfollower.c"
        if (c175 < 128) {
# 1812 "objectfollower/objectfollower.c"
          if (display_x >= 0) {
# 1813 "objectfollower/objectfollower.c"
            if (display_x < 16) {
# 1814 "objectfollower/objectfollower.c"
              if (display_y >= 0) {
# 1815 "objectfollower/objectfollower.c"
                if (display_y < 8) {
# 1816 "objectfollower/objectfollower.c"
                  b177 = & (*(display_buffer + display_y))[display_x * 6];
# 1817 "objectfollower/objectfollower.c"
                  f178 = font[c175];
# 1818 "objectfollower/objectfollower.c"
                  i176 = 0;
# 1819 "objectfollower/objectfollower.c"
                  while (i176 < 5) {
# 1820 "objectfollower/objectfollower.c"
                    *b177 = (U8___0 )*f178;
# 1821 "objectfollower/objectfollower.c"
                    b177 ++;
# 1822 "objectfollower/objectfollower.c"
                    f178 ++;
# 1823 "objectfollower/objectfollower.c"
                    i176 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1831 "objectfollower/objectfollower.c"
      goto Lret_display_char___14;
      Lret_display_char___14:
# 1833 "objectfollower/objectfollower.c"
      display_x ++;
    } else {
# 1835 "objectfollower/objectfollower.c"
      display_x = 0;
# 1836 "objectfollower/objectfollower.c"
      display_y ++;
    }
# 1838 "objectfollower/objectfollower.c"
    str7114 ++;
  }
# 1840 "objectfollower/objectfollower.c"
  goto Lret_display_string___14;
  Lret_display_string___14: ;
# 1842 "objectfollower/objectfollower.c"
  goto Lret_display_unsigned_worker___6;
  Lret_display_unsigned_worker___6: ;
# 1844 "objectfollower/objectfollower.c"
  goto Lret_display_int___6;
  Lret_display_int___6:
# 1846 "objectfollower/objectfollower.c"
  display_tick = 0;
# 1847 "objectfollower/objectfollower.c"
  nxt_spi_refresh();
# 1848 "objectfollower/objectfollower.c"
  goto Lret_nxt_lcd_update;
  Lret_nxt_lcd_update: ;
# 1850 "objectfollower/objectfollower.c"
  goto Lret_display_update;
  Lret_display_update: ;
# 1852 "objectfollower/objectfollower.c"
  goto Lret_display_values;
  Lret_display_values:
# 1854 "objectfollower/objectfollower.c"
  TerminateTask();
# 1855 "objectfollower/objectfollower.c"
  return;
}
}
# 1861 "objectfollower/objectfollower.c"
extern int create_block() ;
# 1863 "objectfollower/objectfollower.c"
extern int create_task() ;
# 1865 "objectfollower/objectfollower.c"
void main(void)
{


  {
# 1869 "objectfollower/objectfollower.c"
  create_task("TaskMainAcquisitionTask", "TaskMainAcquisitionTask", 3, 30, 0.026);
# 1870 "objectfollower/objectfollower.c"
  create_task("TaskMainControlTask", "TaskMainControlTask", 2, 50, 0.13);
# 1871 "objectfollower/objectfollower.c"
  create_task("TaskMainDisplayTask", "TaskMainDisplayTask", 1, 100, 2.164);
# 1872 "objectfollower/objectfollower.c"
  create_block(494, "TaskMainAcquisitionTask", "dataMutex", 1, 3, 0.01);
# 1874 "objectfollower/objectfollower.c"
  create_block(551, "TaskMainControlTask", "dataMutex", 1, 2, 0.009);
# 1876 "objectfollower/objectfollower.c"
  return;
}
}

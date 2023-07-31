# 1 "./objectfollower.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./objectfollower.cil.c"
# 4 "objectfollower.c"
typedef unsigned char U8;
# 5 "objectfollower.c"
typedef signed char S8;
# 7 "objectfollower.c"
typedef unsigned long U32;
# 9 "objectfollower.c"
struct __anonstruct_to_avr_432250394 {
   U8 power ;
   U8 pwm_frequency ;
   S8 output_percent[4] ;
   U8 output_mode ;
   U8 input_power ;
} __attribute__((__packed__)) ;
# 16 "objectfollower.c"
typedef struct __anonstruct_to_avr_432250394 to_avr;
# 31 "objectfollower.c"
typedef unsigned char U8___0;
# 32 "objectfollower.c"
typedef unsigned long U32___0;
# 33 "objectfollower.c"
typedef unsigned char byte;
# 34 "objectfollower.c"
typedef unsigned short TWOBYTES;
# 37 "objectfollower.c"
struct _freeBlock {
   TWOBYTES size : 15 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 41 "objectfollower.c"
struct _objects {
   byte _class ;
   byte padding : 5 ;
   byte mark : 1 ;
   byte isArray : 1 ;
   byte isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 48 "objectfollower.c"
struct _arrays {
   TWOBYTES length : 9 ;
   TWOBYTES type : 4 ;
   TWOBYTES mark : 1 ;
   TWOBYTES isArray : 1 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 55 "objectfollower.c"
union _flags {
   TWOBYTES all ;
   struct _freeBlock freeBlock ;
   struct _objects objects ;
   struct _arrays arrays ;
} __attribute__((__packed__)) ;
# 61 "objectfollower.c"
struct S_Object {
   union _flags flags ;
   byte monitorCount ;
   byte threadId ;
} __attribute__((__packed__)) ;
# 66 "objectfollower.c"
typedef struct S_Object Object;
# 69 "objectfollower.c"
struct __anonstruct_display_array_740464799 {
   Object hdr ;
   U8___0 displayN[9][100] ;
} __attribute__((__packed__)) ;
# 73 "objectfollower.c"
typedef unsigned long U32___1;
# 75 "objectfollower.c"
struct motor_struct {
   int current_count ;
   int target_count ;
   int speed_percent ;
   U32___1 last ;
};
# 81 "objectfollower.c"
typedef unsigned char UINT8;
# 82 "objectfollower.c"
typedef UINT8 StatusType;
# 83 "objectfollower.c"
typedef UINT8 ResourceType;
# 84 "objectfollower.c"
typedef unsigned char U8___1;
# 85 "objectfollower.c"
typedef signed char S8___0;
# 86 "objectfollower.c"
typedef unsigned long U32___2;
# 87 "objectfollower.c"
typedef int data_t;
# 88 "objectfollower.c"
struct __anonstruct_object_data_t_973126069 {
   int position ;
   int size ;
};
# 92 "objectfollower.c"
typedef struct __anonstruct_object_data_t_973126069 object_data_t;
# 131 "objectfollower.c"
int display_tick ;
# 132 "objectfollower.c"
int display_auto_update ;
# 133 "objectfollower.c"
char const avr_brainwash_string[48] =
# 133 "objectfollower.c"
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
# 146 "objectfollower.c"
static to_avr io_to_avr ;
# 166 "objectfollower.c"
extern void nxt_spi_refresh(void) ;
# 172 "objectfollower.c"
U8___0 const *displayM = (U8___0 const *)((U8___0 *)0);
# 173 "objectfollower.c"
unsigned char volatile dirty = (U8___0 volatile )0;
# 174 "objectfollower.c"
unsigned char volatile page = (U8___0 volatile )0;
# 175 "objectfollower.c"
U8___0 const volatile *dataM = (U8___0 const volatile *)((U8___0 *)0);
# 176 "objectfollower.c"
U8___0 mode = (U8___0 )255;
# 179 "objectfollower.c"
static struct __anonstruct_display_array_740464799 display_array ;
# 180 "objectfollower.c"
static U8___0 (*display_buffer)[100] = display_array.displayN;
# 181 "objectfollower.c"
static U8___0 const font[128][5] =
# 181 "objectfollower.c"
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
# 438 "objectfollower.c"
int display_tick = 0;
# 439 "objectfollower.c"
int display_auto_update = 1;
# 440 "objectfollower.c"
int display_x ;
# 441 "objectfollower.c"
int display_y ;
# 442 "objectfollower.c"
static struct motor_struct motor[3] ;
# 446 "objectfollower.c"
extern StatusType TerminateTask(void) ;
# 447 "objectfollower.c"
extern StatusType GetResource(ResourceType resid ) ;
# 448 "objectfollower.c"
extern StatusType ReleaseResource(ResourceType resid ) ;
# 449 "objectfollower.c"
extern int send_nxtcam_command(U8___1 port_id , U8___1 command ) ;
# 450 "objectfollower.c"
extern int request(U8___1 port_id ) ;
# 451 "objectfollower.c"
extern int getbiggestrect(U8___1 pcolorid , int minarea ) ;
# 452 "objectfollower.c"
extern int getX(U8___1 rectindex ) ;
# 453 "objectfollower.c"
extern int getArea(U8___1 rectindex ) ;
# 454 "objectfollower.c"
extern data_t median_filter(data_t datum ) ;
# 455 "objectfollower.c"
extern int fisqrt(int val ) ;
# 456 "objectfollower.c"
extern ResourceType dataMutex ;
# 457 "objectfollower.c"
static int sizeLCD ;
# 458 "objectfollower.c"
static int areaLCD ;
# 459 "objectfollower.c"
static int xLCD ;
# 460 "objectfollower.c"
static int speedLCD ;
# 461 "objectfollower.c"
static int devspeedLCD ;
# 462 "objectfollower.c"
static int diradjLCD ;
# 463 "objectfollower.c"
static int lmotLCD ;
# 464 "objectfollower.c"
static int rmotLCD ;
# 465 "objectfollower.c"
object_data_t objData = {0, 0};
# 466 "objectfollower.c"
void TaskMainAcquisitionTask(void) ;
# 467 "objectfollower.c"
static S8___0 tracking_enabled = (S8___0 )-1;
# 468 "objectfollower.c"
void TaskMainAcquisitionTask(void)
{
  int rectindex ;
  int area ;
  int size ;
  int x ;
  int tmp ;

  {
# 477 "objectfollower.c"
  if ((int )tracking_enabled != 0) {
# 478 "objectfollower.c"
    tmp = send_nxtcam_command((U8___1 )1, (U8___1 )69);
# 479 "objectfollower.c"
    tracking_enabled = (S8___0 )tmp;
  } else {
# 481 "objectfollower.c"
    request((U8___1 )1);
# 482 "objectfollower.c"
    rectindex = getbiggestrect((U8___1 )0, -1);
# 483 "objectfollower.c"
    if (rectindex >= 0) {
# 484 "objectfollower.c"
      area = getArea((U8___1 )rectindex);
# 485 "objectfollower.c"
      area = median_filter(area);
# 486 "objectfollower.c"
      size = fisqrt(area);
# 487 "objectfollower.c"
      x = getX((U8___1 )rectindex);
# 488 "objectfollower.c"
      GetResource(dataMutex);
# 489 "objectfollower.c"
      objData.position = x;
# 490 "objectfollower.c"
      objData.size = size;
# 491 "objectfollower.c"
      ReleaseResource(dataMutex);
# 492 "objectfollower.c"
      sizeLCD = size;
# 493 "objectfollower.c"
      areaLCD = area;
# 494 "objectfollower.c"
      xLCD = x;
    }
  }
# 497 "objectfollower.c"
  TerminateTask();
# 498 "objectfollower.c"
  return;
}
}
# 501 "objectfollower.c"
static int integral = 0;
# 502 "objectfollower.c"
static int prevError = 0;
# 503 "objectfollower.c"
static int integral___0 = 0;
# 504 "objectfollower.c"
static int prevError___0 = 0;
# 505 "objectfollower.c"
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
# 542 "objectfollower.c"
  GetResource(dataMutex);
# 543 "objectfollower.c"
  temp20 = objData;
# 544 "objectfollower.c"
  ReleaseResource(dataMutex);
# 545 "objectfollower.c"
  ret_getData21 = temp20;
# 546 "objectfollower.c"
  goto Lret_getData;
  Lret_getData:
# 548 "objectfollower.c"
  data = ret_getData21;
# 549 "objectfollower.c"
  size = data.size;
# 550 "objectfollower.c"
  position = data.position;
# 551 "objectfollower.c"
  if (size > 0) {
# 552 "objectfollower.c"
    if (position > 0) {
# 553 "objectfollower.c"
      d10 = size;
# 554 "objectfollower.c"
      error11 = 50 - d10;
# 555 "objectfollower.c"
      integral += error11;
# 556 "objectfollower.c"
      derivative12 = error11 - prevError;
# 557 "objectfollower.c"
      out13 = (int )((1.5 * (double )error11 + (double )0) + (double )0);
# 558 "objectfollower.c"
      prevError = error11;
# 559 "objectfollower.c"
      ret_speedPIDController14 = out13;
# 560 "objectfollower.c"
      goto Lret_speedPIDController;
      Lret_speedPIDController:
# 562 "objectfollower.c"
      tmp = ret_speedPIDController14;
# 563 "objectfollower.c"
      speed_deviation = tmp;
# 564 "objectfollower.c"
      devspeedLCD = speed_deviation;
# 565 "objectfollower.c"
      new_speed = 50 + speed_deviation;
# 566 "objectfollower.c"
      if (new_speed > 100) {
# 567 "objectfollower.c"
        new_speed = 100;
      } else {
# 569 "objectfollower.c"
        new_speed = new_speed;
      }
# 571 "objectfollower.c"
      d15 = position;
# 572 "objectfollower.c"
      error16 = 83 - d15;
# 573 "objectfollower.c"
      integral___0 += error16;
# 574 "objectfollower.c"
      derivative17 = error16 - prevError___0;
# 575 "objectfollower.c"
      out18 = (int )((0.2 * (double )error16 + (double )0) + (double )0);
# 576 "objectfollower.c"
      prevError___0 = error16;
# 577 "objectfollower.c"
      ret_directionPIDController19 = out18;
# 578 "objectfollower.c"
      goto Lret_directionPIDController;
      Lret_directionPIDController:
# 580 "objectfollower.c"
      direction_adjustment = ret_directionPIDController19;
# 581 "objectfollower.c"
      speedLCD = new_speed;
# 582 "objectfollower.c"
      diradjLCD = direction_adjustment;
# 583 "objectfollower.c"
      leftMotorValue = new_speed - direction_adjustment;
# 584 "objectfollower.c"
      if (leftMotorValue > 100) {
# 585 "objectfollower.c"
        leftMotorValue = 100;
      } else {
# 587 "objectfollower.c"
        leftMotorValue = leftMotorValue;
      }
# 589 "objectfollower.c"
      rightMotorValue = new_speed + direction_adjustment;
# 590 "objectfollower.c"
      if (rightMotorValue > 100) {
# 591 "objectfollower.c"
        rightMotorValue = 100;
      } else {
# 593 "objectfollower.c"
        rightMotorValue = rightMotorValue;
      }
    } else {
# 596 "objectfollower.c"
      rightMotorValue = 65;
# 597 "objectfollower.c"
      leftMotorValue = -65;
# 598 "objectfollower.c"
      speedLCD = 0;
# 599 "objectfollower.c"
      diradjLCD = 0;
# 600 "objectfollower.c"
      devspeedLCD = 0;
    }
  } else {
# 603 "objectfollower.c"
    rightMotorValue = 65;
# 604 "objectfollower.c"
    leftMotorValue = -65;
# 605 "objectfollower.c"
    speedLCD = 0;
# 606 "objectfollower.c"
    diradjLCD = 0;
# 607 "objectfollower.c"
    devspeedLCD = 0;
  }
# 609 "objectfollower.c"
  lmotLCD = leftMotorValue;
# 610 "objectfollower.c"
  rmotLCD = rightMotorValue;
# 611 "objectfollower.c"
  n22 = (U32___2 )1;
# 612 "objectfollower.c"
  speed_percent23 = leftMotorValue;
# 613 "objectfollower.c"
  brake24 = 0;
# 614 "objectfollower.c"
  if (n22 < 3UL) {
# 615 "objectfollower.c"
    if (speed_percent23 > 100) {
# 616 "objectfollower.c"
      speed_percent23 = 100;
    }
# 618 "objectfollower.c"
    if (speed_percent23 < -100) {
# 619 "objectfollower.c"
      speed_percent23 = -100;
    }
# 622 "objectfollower.c"
    motor[n22].speed_percent = speed_percent23;
# 623 "objectfollower.c"
    n28 = n22;
# 624 "objectfollower.c"
    power_percent29 = speed_percent23;
# 625 "objectfollower.c"
    brake30 = brake24;
# 627 "objectfollower.c"
    if (n28 < 3UL) {
# 628 "objectfollower.c"
      io_to_avr.output_percent[n28] = (S8 )power_percent29;
# 629 "objectfollower.c"
      if (brake30) {
# 630 "objectfollower.c"
        io_to_avr.output_mode = (U8 )((int )io_to_avr.output_mode | (1 << n28));
      } else {
# 632 "objectfollower.c"
        io_to_avr.output_mode = (U8 )((int )io_to_avr.output_mode & ~ (1 << n28));
      }
    }
# 635 "objectfollower.c"
    goto Lret_nxt_avr_set_motor;
    Lret_nxt_avr_set_motor: ;
  }
# 640 "objectfollower.c"
  goto Lret_nxt_motor_set_speed;
  Lret_nxt_motor_set_speed:
# 642 "objectfollower.c"
  n25 = (U32___2 )0;
# 643 "objectfollower.c"
  speed_percent26 = rightMotorValue;
# 644 "objectfollower.c"
  brake27 = 0;
# 645 "objectfollower.c"
  if (n25 < 3UL) {
# 646 "objectfollower.c"
    if (speed_percent26 > 100) {
# 647 "objectfollower.c"
      speed_percent26 = 100;
    }
# 649 "objectfollower.c"
    if (speed_percent26 < -100) {
# 650 "objectfollower.c"
      speed_percent26 = -100;
    }
# 653 "objectfollower.c"
    motor[n25].speed_percent = speed_percent26;
# 654 "objectfollower.c"
    n31 = n25;
# 655 "objectfollower.c"
    power_percent32 = speed_percent26;
# 656 "objectfollower.c"
    brake33 = brake27;
# 658 "objectfollower.c"
    if (n31 < 3UL) {
# 659 "objectfollower.c"
      io_to_avr.output_percent[n31] = (S8 )power_percent32;
# 660 "objectfollower.c"
      if (brake33) {
# 661 "objectfollower.c"
        io_to_avr.output_mode = (U8 )((int )io_to_avr.output_mode | (1 << n31));
      } else {
# 663 "objectfollower.c"
        io_to_avr.output_mode = (U8 )((int )io_to_avr.output_mode & ~ (1 << n31));
      }
    }
# 666 "objectfollower.c"
    goto Lret_nxt_avr_set_motor___0;
    Lret_nxt_avr_set_motor___0: ;
  }
# 671 "objectfollower.c"
  goto Lret_nxt_motor_set_speed___0;
  Lret_nxt_motor_set_speed___0:
# 673 "objectfollower.c"
  TerminateTask();
# 674 "objectfollower.c"
  return;
}
}
# 677 "objectfollower.c"
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
# 859 "objectfollower.c"
  message1 = (char *)((void *)0);
# 860 "objectfollower.c"
  line2 = (U8___1 )0;
# 861 "objectfollower.c"
  tmp3 = line2;
# 862 "objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 863 "objectfollower.c"
  x11 = 0;
# 864 "objectfollower.c"
  y12 = (int )tmp3;
# 865 "objectfollower.c"
  display_x = x11;
# 866 "objectfollower.c"
  display_y = y12;
# 867 "objectfollower.c"
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
# 869 "objectfollower.c"
  message1 = (char *)"size:";
# 870 "objectfollower.c"
  str27 = (char const *)message1;
# 871 "objectfollower.c"
  while (*str27) {
# 872 "objectfollower.c"
    if ((int const )*str27 != 10) {
# 873 "objectfollower.c"
      c115 = (int )*str27;
# 874 "objectfollower.c"
      if (c115 >= 0) {
# 875 "objectfollower.c"
        if (c115 < 128) {
# 876 "objectfollower.c"
          if (display_x >= 0) {
# 877 "objectfollower.c"
            if (display_x < 16) {
# 878 "objectfollower.c"
              if (display_y >= 0) {
# 879 "objectfollower.c"
                if (display_y < 8) {
# 880 "objectfollower.c"
                  b117 = & (*(display_buffer + display_y))[display_x * 6];
# 881 "objectfollower.c"
                  f118 = font[c115];
# 882 "objectfollower.c"
                  i116 = 0;
# 883 "objectfollower.c"
                  while (i116 < 5) {
# 884 "objectfollower.c"
                    *b117 = (U8___0 )*f118;
# 885 "objectfollower.c"
                    b117 ++;
# 886 "objectfollower.c"
                    f118 ++;
# 887 "objectfollower.c"
                    i116 ++;
                  }
                }
              }
            }
          }
        }
      }
# 895 "objectfollower.c"
      goto Lret_display_char;
      Lret_display_char:
# 897 "objectfollower.c"
      display_x ++;
    } else {
# 899 "objectfollower.c"
      display_x = 0;
# 900 "objectfollower.c"
      display_y ++;
    }
# 902 "objectfollower.c"
    str27 ++;
  }
# 904 "objectfollower.c"
  goto Lret_display_string;
  Lret_display_string:
# 906 "objectfollower.c"
  val35 = sizeLCD;
# 907 "objectfollower.c"
  places36 = (U32___2 )4;
# 908 "objectfollower.c"
  if (val35 < 0) {
# 909 "objectfollower.c"
    tmp37 = - val35;
  } else {
# 911 "objectfollower.c"
    tmp37 = val35;
  }
# 913 "objectfollower.c"
  val59 = (U32___0 )tmp37;
# 914 "objectfollower.c"
  places60 = places36;
# 915 "objectfollower.c"
  sign61 = (U32___0 )(val35 < 0);
# 916 "objectfollower.c"
  p63 = & x62[11];
# 917 "objectfollower.c"
  p_count64 = 0;
# 918 "objectfollower.c"
  *p63 = (char)0;
# 919 "objectfollower.c"
  if (places60 > 11UL) {
# 920 "objectfollower.c"
    places60 = (U32___0 )11;
  }
# 922 "objectfollower.c"
  while (val59) {
# 923 "objectfollower.c"
    p63 --;
# 924 "objectfollower.c"
    p_count64 ++;
# 925 "objectfollower.c"
    *p63 = (char )(val59 % 10UL + 48UL);
# 926 "objectfollower.c"
    val59 /= 10UL;
  }
# 928 "objectfollower.c"
  if (! p_count64) {
# 929 "objectfollower.c"
    p63 --;
# 930 "objectfollower.c"
    p_count64 ++;
# 931 "objectfollower.c"
    *p63 = (char )'0';
  }
# 933 "objectfollower.c"
  if (sign61) {
# 934 "objectfollower.c"
    p63 --;
# 935 "objectfollower.c"
    p_count64 ++;
# 936 "objectfollower.c"
    *p63 = (char )'-';
  }
# 938 "objectfollower.c"
  while ((U32___0 )p_count64 < places60) {
# 939 "objectfollower.c"
    p63 --;
# 940 "objectfollower.c"
    p_count64 ++;
# 941 "objectfollower.c"
    *p63 = (char )' ';
  }
# 943 "objectfollower.c"
  str765 = (char const *)p63;
# 944 "objectfollower.c"
  while (*str765) {
# 945 "objectfollower.c"
    if ((int const )*str765 != 10) {
# 946 "objectfollower.c"
      c119 = (int )*str765;
# 947 "objectfollower.c"
      if (c119 >= 0) {
# 948 "objectfollower.c"
        if (c119 < 128) {
# 949 "objectfollower.c"
          if (display_x >= 0) {
# 950 "objectfollower.c"
            if (display_x < 16) {
# 951 "objectfollower.c"
              if (display_y >= 0) {
# 952 "objectfollower.c"
                if (display_y < 8) {
# 953 "objectfollower.c"
                  b121 = & (*(display_buffer + display_y))[display_x * 6];
# 954 "objectfollower.c"
                  f122 = font[c119];
# 955 "objectfollower.c"
                  i120 = 0;
# 956 "objectfollower.c"
                  while (i120 < 5) {
# 957 "objectfollower.c"
                    *b121 = (U8___0 )*f122;
# 958 "objectfollower.c"
                    b121 ++;
# 959 "objectfollower.c"
                    f122 ++;
# 960 "objectfollower.c"
                    i120 ++;
                  }
                }
              }
            }
          }
        }
      }
# 968 "objectfollower.c"
      goto Lret_display_char___0;
      Lret_display_char___0:
# 970 "objectfollower.c"
      display_x ++;
    } else {
# 972 "objectfollower.c"
      display_x = 0;
# 973 "objectfollower.c"
      display_y ++;
    }
# 975 "objectfollower.c"
    str765 ++;
  }
# 977 "objectfollower.c"
  goto Lret_display_string___7;
  Lret_display_string___7: ;
# 979 "objectfollower.c"
  goto Lret_display_unsigned_worker;
  Lret_display_unsigned_worker: ;
# 981 "objectfollower.c"
  goto Lret_display_int;
  Lret_display_int:
# 983 "objectfollower.c"
  tmp___04 = line2;
# 984 "objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 985 "objectfollower.c"
  x13 = 0;
# 986 "objectfollower.c"
  y14 = (int )tmp___04;
# 987 "objectfollower.c"
  display_x = x13;
# 988 "objectfollower.c"
  display_y = y14;
# 989 "objectfollower.c"
  goto Lret_display_goto_xy___0;
  Lret_display_goto_xy___0:
# 991 "objectfollower.c"
  message1 = (char *)"area:";
# 992 "objectfollower.c"
  str28 = (char const *)message1;
# 993 "objectfollower.c"
  while (*str28) {
# 994 "objectfollower.c"
    if ((int const )*str28 != 10) {
# 995 "objectfollower.c"
      c123 = (int )*str28;
# 996 "objectfollower.c"
      if (c123 >= 0) {
# 997 "objectfollower.c"
        if (c123 < 128) {
# 998 "objectfollower.c"
          if (display_x >= 0) {
# 999 "objectfollower.c"
            if (display_x < 16) {
# 1000 "objectfollower.c"
              if (display_y >= 0) {
# 1001 "objectfollower.c"
                if (display_y < 8) {
# 1002 "objectfollower.c"
                  b125 = & (*(display_buffer + display_y))[display_x * 6];
# 1003 "objectfollower.c"
                  f126 = font[c123];
# 1004 "objectfollower.c"
                  i124 = 0;
# 1005 "objectfollower.c"
                  while (i124 < 5) {
# 1006 "objectfollower.c"
                    *b125 = (U8___0 )*f126;
# 1007 "objectfollower.c"
                    b125 ++;
# 1008 "objectfollower.c"
                    f126 ++;
# 1009 "objectfollower.c"
                    i124 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1017 "objectfollower.c"
      goto Lret_display_char___1;
      Lret_display_char___1:
# 1019 "objectfollower.c"
      display_x ++;
    } else {
# 1021 "objectfollower.c"
      display_x = 0;
# 1022 "objectfollower.c"
      display_y ++;
    }
# 1024 "objectfollower.c"
    str28 ++;
  }
# 1026 "objectfollower.c"
  goto Lret_display_string___0;
  Lret_display_string___0:
# 1028 "objectfollower.c"
  val38 = areaLCD;
# 1029 "objectfollower.c"
  places39 = (U32___2 )5;
# 1030 "objectfollower.c"
  if (val38 < 0) {
# 1031 "objectfollower.c"
    tmp40 = - val38;
  } else {
# 1033 "objectfollower.c"
    tmp40 = val38;
  }
# 1035 "objectfollower.c"
  val66 = (U32___0 )tmp40;
# 1036 "objectfollower.c"
  places67 = places39;
# 1037 "objectfollower.c"
  sign68 = (U32___0 )(val38 < 0);
# 1038 "objectfollower.c"
  p70 = & x69[11];
# 1039 "objectfollower.c"
  p_count71 = 0;
# 1040 "objectfollower.c"
  *p70 = (char)0;
# 1041 "objectfollower.c"
  if (places67 > 11UL) {
# 1042 "objectfollower.c"
    places67 = (U32___0 )11;
  }
# 1044 "objectfollower.c"
  while (val66) {
# 1045 "objectfollower.c"
    p70 --;
# 1046 "objectfollower.c"
    p_count71 ++;
# 1047 "objectfollower.c"
    *p70 = (char )(val66 % 10UL + 48UL);
# 1048 "objectfollower.c"
    val66 /= 10UL;
  }
# 1050 "objectfollower.c"
  if (! p_count71) {
# 1051 "objectfollower.c"
    p70 --;
# 1052 "objectfollower.c"
    p_count71 ++;
# 1053 "objectfollower.c"
    *p70 = (char )'0';
  }
# 1055 "objectfollower.c"
  if (sign68) {
# 1056 "objectfollower.c"
    p70 --;
# 1057 "objectfollower.c"
    p_count71 ++;
# 1058 "objectfollower.c"
    *p70 = (char )'-';
  }
# 1060 "objectfollower.c"
  while ((U32___0 )p_count71 < places67) {
# 1061 "objectfollower.c"
    p70 --;
# 1062 "objectfollower.c"
    p_count71 ++;
# 1063 "objectfollower.c"
    *p70 = (char )' ';
  }
# 1065 "objectfollower.c"
  str772 = (char const *)p70;
# 1066 "objectfollower.c"
  while (*str772) {
# 1067 "objectfollower.c"
    if ((int const )*str772 != 10) {
# 1068 "objectfollower.c"
      c127 = (int )*str772;
# 1069 "objectfollower.c"
      if (c127 >= 0) {
# 1070 "objectfollower.c"
        if (c127 < 128) {
# 1071 "objectfollower.c"
          if (display_x >= 0) {
# 1072 "objectfollower.c"
            if (display_x < 16) {
# 1073 "objectfollower.c"
              if (display_y >= 0) {
# 1074 "objectfollower.c"
                if (display_y < 8) {
# 1075 "objectfollower.c"
                  b129 = & (*(display_buffer + display_y))[display_x * 6];
# 1076 "objectfollower.c"
                  f130 = font[c127];
# 1077 "objectfollower.c"
                  i128 = 0;
# 1078 "objectfollower.c"
                  while (i128 < 5) {
# 1079 "objectfollower.c"
                    *b129 = (U8___0 )*f130;
# 1080 "objectfollower.c"
                    b129 ++;
# 1081 "objectfollower.c"
                    f130 ++;
# 1082 "objectfollower.c"
                    i128 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1090 "objectfollower.c"
      goto Lret_display_char___2;
      Lret_display_char___2:
# 1092 "objectfollower.c"
      display_x ++;
    } else {
# 1094 "objectfollower.c"
      display_x = 0;
# 1095 "objectfollower.c"
      display_y ++;
    }
# 1097 "objectfollower.c"
    str772 ++;
  }
# 1099 "objectfollower.c"
  goto Lret_display_string___8;
  Lret_display_string___8: ;
# 1101 "objectfollower.c"
  goto Lret_display_unsigned_worker___0;
  Lret_display_unsigned_worker___0: ;
# 1103 "objectfollower.c"
  goto Lret_display_int___0;
  Lret_display_int___0:
# 1105 "objectfollower.c"
  tmp___15 = line2;
# 1106 "objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 1107 "objectfollower.c"
  x15 = 0;
# 1108 "objectfollower.c"
  y16 = (int )tmp___15;
# 1109 "objectfollower.c"
  display_x = x15;
# 1110 "objectfollower.c"
  display_y = y16;
# 1111 "objectfollower.c"
  goto Lret_display_goto_xy___1;
  Lret_display_goto_xy___1:
# 1113 "objectfollower.c"
  message1 = (char *)"pos:";
# 1114 "objectfollower.c"
  str29 = (char const *)message1;
# 1115 "objectfollower.c"
  while (*str29) {
# 1116 "objectfollower.c"
    if ((int const )*str29 != 10) {
# 1117 "objectfollower.c"
      c131 = (int )*str29;
# 1118 "objectfollower.c"
      if (c131 >= 0) {
# 1119 "objectfollower.c"
        if (c131 < 128) {
# 1120 "objectfollower.c"
          if (display_x >= 0) {
# 1121 "objectfollower.c"
            if (display_x < 16) {
# 1122 "objectfollower.c"
              if (display_y >= 0) {
# 1123 "objectfollower.c"
                if (display_y < 8) {
# 1124 "objectfollower.c"
                  b133 = & (*(display_buffer + display_y))[display_x * 6];
# 1125 "objectfollower.c"
                  f134 = font[c131];
# 1126 "objectfollower.c"
                  i132 = 0;
# 1127 "objectfollower.c"
                  while (i132 < 5) {
# 1128 "objectfollower.c"
                    *b133 = (U8___0 )*f134;
# 1129 "objectfollower.c"
                    b133 ++;
# 1130 "objectfollower.c"
                    f134 ++;
# 1131 "objectfollower.c"
                    i132 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1139 "objectfollower.c"
      goto Lret_display_char___3;
      Lret_display_char___3:
# 1141 "objectfollower.c"
      display_x ++;
    } else {
# 1143 "objectfollower.c"
      display_x = 0;
# 1144 "objectfollower.c"
      display_y ++;
    }
# 1146 "objectfollower.c"
    str29 ++;
  }
# 1148 "objectfollower.c"
  goto Lret_display_string___1;
  Lret_display_string___1:
# 1150 "objectfollower.c"
  val41 = xLCD;
# 1151 "objectfollower.c"
  places42 = (U32___2 )4;
# 1152 "objectfollower.c"
  if (val41 < 0) {
# 1153 "objectfollower.c"
    tmp43 = - val41;
  } else {
# 1155 "objectfollower.c"
    tmp43 = val41;
  }
# 1157 "objectfollower.c"
  val73 = (U32___0 )tmp43;
# 1158 "objectfollower.c"
  places74 = places42;
# 1159 "objectfollower.c"
  sign75 = (U32___0 )(val41 < 0);
# 1160 "objectfollower.c"
  p77 = & x76[11];
# 1161 "objectfollower.c"
  p_count78 = 0;
# 1162 "objectfollower.c"
  *p77 = (char)0;
# 1163 "objectfollower.c"
  if (places74 > 11UL) {
# 1164 "objectfollower.c"
    places74 = (U32___0 )11;
  }
# 1166 "objectfollower.c"
  while (val73) {
# 1167 "objectfollower.c"
    p77 --;
# 1168 "objectfollower.c"
    p_count78 ++;
# 1169 "objectfollower.c"
    *p77 = (char )(val73 % 10UL + 48UL);
# 1170 "objectfollower.c"
    val73 /= 10UL;
  }
# 1172 "objectfollower.c"
  if (! p_count78) {
# 1173 "objectfollower.c"
    p77 --;
# 1174 "objectfollower.c"
    p_count78 ++;
# 1175 "objectfollower.c"
    *p77 = (char )'0';
  }
# 1177 "objectfollower.c"
  if (sign75) {
# 1178 "objectfollower.c"
    p77 --;
# 1179 "objectfollower.c"
    p_count78 ++;
# 1180 "objectfollower.c"
    *p77 = (char )'-';
  }
# 1182 "objectfollower.c"
  while ((U32___0 )p_count78 < places74) {
# 1183 "objectfollower.c"
    p77 --;
# 1184 "objectfollower.c"
    p_count78 ++;
# 1185 "objectfollower.c"
    *p77 = (char )' ';
  }
# 1187 "objectfollower.c"
  str779 = (char const *)p77;
# 1188 "objectfollower.c"
  while (*str779) {
# 1189 "objectfollower.c"
    if ((int const )*str779 != 10) {
# 1190 "objectfollower.c"
      c135 = (int )*str779;
# 1191 "objectfollower.c"
      if (c135 >= 0) {
# 1192 "objectfollower.c"
        if (c135 < 128) {
# 1193 "objectfollower.c"
          if (display_x >= 0) {
# 1194 "objectfollower.c"
            if (display_x < 16) {
# 1195 "objectfollower.c"
              if (display_y >= 0) {
# 1196 "objectfollower.c"
                if (display_y < 8) {
# 1197 "objectfollower.c"
                  b137 = & (*(display_buffer + display_y))[display_x * 6];
# 1198 "objectfollower.c"
                  f138 = font[c135];
# 1199 "objectfollower.c"
                  i136 = 0;
# 1200 "objectfollower.c"
                  while (i136 < 5) {
# 1201 "objectfollower.c"
                    *b137 = (U8___0 )*f138;
# 1202 "objectfollower.c"
                    b137 ++;
# 1203 "objectfollower.c"
                    f138 ++;
# 1204 "objectfollower.c"
                    i136 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1212 "objectfollower.c"
      goto Lret_display_char___4;
      Lret_display_char___4:
# 1214 "objectfollower.c"
      display_x ++;
    } else {
# 1216 "objectfollower.c"
      display_x = 0;
# 1217 "objectfollower.c"
      display_y ++;
    }
# 1219 "objectfollower.c"
    str779 ++;
  }
# 1221 "objectfollower.c"
  goto Lret_display_string___9;
  Lret_display_string___9: ;
# 1223 "objectfollower.c"
  goto Lret_display_unsigned_worker___1;
  Lret_display_unsigned_worker___1: ;
# 1225 "objectfollower.c"
  goto Lret_display_int___1;
  Lret_display_int___1:
# 1227 "objectfollower.c"
  tmp___26 = line2;
# 1228 "objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 1229 "objectfollower.c"
  x17 = 0;
# 1230 "objectfollower.c"
  y18 = (int )tmp___26;
# 1231 "objectfollower.c"
  display_x = x17;
# 1232 "objectfollower.c"
  display_y = y18;
# 1233 "objectfollower.c"
  goto Lret_display_goto_xy___2;
  Lret_display_goto_xy___2:
# 1235 "objectfollower.c"
  message1 = (char *)"speed:";
# 1236 "objectfollower.c"
  str30 = (char const *)message1;
# 1237 "objectfollower.c"
  while (*str30) {
# 1238 "objectfollower.c"
    if ((int const )*str30 != 10) {
# 1239 "objectfollower.c"
      c139 = (int )*str30;
# 1240 "objectfollower.c"
      if (c139 >= 0) {
# 1241 "objectfollower.c"
        if (c139 < 128) {
# 1242 "objectfollower.c"
          if (display_x >= 0) {
# 1243 "objectfollower.c"
            if (display_x < 16) {
# 1244 "objectfollower.c"
              if (display_y >= 0) {
# 1245 "objectfollower.c"
                if (display_y < 8) {
# 1246 "objectfollower.c"
                  b141 = & (*(display_buffer + display_y))[display_x * 6];
# 1247 "objectfollower.c"
                  f142 = font[c139];
# 1248 "objectfollower.c"
                  i140 = 0;
# 1249 "objectfollower.c"
                  while (i140 < 5) {
# 1250 "objectfollower.c"
                    *b141 = (U8___0 )*f142;
# 1251 "objectfollower.c"
                    b141 ++;
# 1252 "objectfollower.c"
                    f142 ++;
# 1253 "objectfollower.c"
                    i140 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1261 "objectfollower.c"
      goto Lret_display_char___5;
      Lret_display_char___5:
# 1263 "objectfollower.c"
      display_x ++;
    } else {
# 1265 "objectfollower.c"
      display_x = 0;
# 1266 "objectfollower.c"
      display_y ++;
    }
# 1268 "objectfollower.c"
    str30 ++;
  }
# 1270 "objectfollower.c"
  goto Lret_display_string___2;
  Lret_display_string___2:
# 1272 "objectfollower.c"
  val44 = speedLCD;
# 1273 "objectfollower.c"
  places45 = (U32___2 )4;
# 1274 "objectfollower.c"
  if (val44 < 0) {
# 1275 "objectfollower.c"
    tmp46 = - val44;
  } else {
# 1277 "objectfollower.c"
    tmp46 = val44;
  }
# 1279 "objectfollower.c"
  val80 = (U32___0 )tmp46;
# 1280 "objectfollower.c"
  places81 = places45;
# 1281 "objectfollower.c"
  sign82 = (U32___0 )(val44 < 0);
# 1282 "objectfollower.c"
  p84 = & x83[11];
# 1283 "objectfollower.c"
  p_count85 = 0;
# 1284 "objectfollower.c"
  *p84 = (char)0;
# 1285 "objectfollower.c"
  if (places81 > 11UL) {
# 1286 "objectfollower.c"
    places81 = (U32___0 )11;
  }
# 1288 "objectfollower.c"
  while (val80) {
# 1289 "objectfollower.c"
    p84 --;
# 1290 "objectfollower.c"
    p_count85 ++;
# 1291 "objectfollower.c"
    *p84 = (char )(val80 % 10UL + 48UL);
# 1292 "objectfollower.c"
    val80 /= 10UL;
  }
# 1294 "objectfollower.c"
  if (! p_count85) {
# 1295 "objectfollower.c"
    p84 --;
# 1296 "objectfollower.c"
    p_count85 ++;
# 1297 "objectfollower.c"
    *p84 = (char )'0';
  }
# 1299 "objectfollower.c"
  if (sign82) {
# 1300 "objectfollower.c"
    p84 --;
# 1301 "objectfollower.c"
    p_count85 ++;
# 1302 "objectfollower.c"
    *p84 = (char )'-';
  }
# 1304 "objectfollower.c"
  while ((U32___0 )p_count85 < places81) {
# 1305 "objectfollower.c"
    p84 --;
# 1306 "objectfollower.c"
    p_count85 ++;
# 1307 "objectfollower.c"
    *p84 = (char )' ';
  }
# 1309 "objectfollower.c"
  str786 = (char const *)p84;
# 1310 "objectfollower.c"
  while (*str786) {
# 1311 "objectfollower.c"
    if ((int const )*str786 != 10) {
# 1312 "objectfollower.c"
      c143 = (int )*str786;
# 1313 "objectfollower.c"
      if (c143 >= 0) {
# 1314 "objectfollower.c"
        if (c143 < 128) {
# 1315 "objectfollower.c"
          if (display_x >= 0) {
# 1316 "objectfollower.c"
            if (display_x < 16) {
# 1317 "objectfollower.c"
              if (display_y >= 0) {
# 1318 "objectfollower.c"
                if (display_y < 8) {
# 1319 "objectfollower.c"
                  b145 = & (*(display_buffer + display_y))[display_x * 6];
# 1320 "objectfollower.c"
                  f146 = font[c143];
# 1321 "objectfollower.c"
                  i144 = 0;
# 1322 "objectfollower.c"
                  while (i144 < 5) {
# 1323 "objectfollower.c"
                    *b145 = (U8___0 )*f146;
# 1324 "objectfollower.c"
                    b145 ++;
# 1325 "objectfollower.c"
                    f146 ++;
# 1326 "objectfollower.c"
                    i144 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1334 "objectfollower.c"
      goto Lret_display_char___6;
      Lret_display_char___6:
# 1336 "objectfollower.c"
      display_x ++;
    } else {
# 1338 "objectfollower.c"
      display_x = 0;
# 1339 "objectfollower.c"
      display_y ++;
    }
# 1341 "objectfollower.c"
    str786 ++;
  }
# 1343 "objectfollower.c"
  goto Lret_display_string___10;
  Lret_display_string___10: ;
# 1345 "objectfollower.c"
  goto Lret_display_unsigned_worker___2;
  Lret_display_unsigned_worker___2: ;
# 1347 "objectfollower.c"
  goto Lret_display_int___2;
  Lret_display_int___2:
# 1349 "objectfollower.c"
  tmp___37 = line2;
# 1350 "objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 1351 "objectfollower.c"
  x19 = 0;
# 1352 "objectfollower.c"
  y20 = (int )tmp___37;
# 1353 "objectfollower.c"
  display_x = x19;
# 1354 "objectfollower.c"
  display_y = y20;
# 1355 "objectfollower.c"
  goto Lret_display_goto_xy___3;
  Lret_display_goto_xy___3:
# 1357 "objectfollower.c"
  message1 = (char *)"dev speed:";
# 1358 "objectfollower.c"
  str31 = (char const *)message1;
# 1359 "objectfollower.c"
  while (*str31) {
# 1360 "objectfollower.c"
    if ((int const )*str31 != 10) {
# 1361 "objectfollower.c"
      c147 = (int )*str31;
# 1362 "objectfollower.c"
      if (c147 >= 0) {
# 1363 "objectfollower.c"
        if (c147 < 128) {
# 1364 "objectfollower.c"
          if (display_x >= 0) {
# 1365 "objectfollower.c"
            if (display_x < 16) {
# 1366 "objectfollower.c"
              if (display_y >= 0) {
# 1367 "objectfollower.c"
                if (display_y < 8) {
# 1368 "objectfollower.c"
                  b149 = & (*(display_buffer + display_y))[display_x * 6];
# 1369 "objectfollower.c"
                  f150 = font[c147];
# 1370 "objectfollower.c"
                  i148 = 0;
# 1371 "objectfollower.c"
                  while (i148 < 5) {
# 1372 "objectfollower.c"
                    *b149 = (U8___0 )*f150;
# 1373 "objectfollower.c"
                    b149 ++;
# 1374 "objectfollower.c"
                    f150 ++;
# 1375 "objectfollower.c"
                    i148 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1383 "objectfollower.c"
      goto Lret_display_char___7;
      Lret_display_char___7:
# 1385 "objectfollower.c"
      display_x ++;
    } else {
# 1387 "objectfollower.c"
      display_x = 0;
# 1388 "objectfollower.c"
      display_y ++;
    }
# 1390 "objectfollower.c"
    str31 ++;
  }
# 1392 "objectfollower.c"
  goto Lret_display_string___3;
  Lret_display_string___3:
# 1394 "objectfollower.c"
  val47 = devspeedLCD;
# 1395 "objectfollower.c"
  places48 = (U32___2 )4;
# 1396 "objectfollower.c"
  if (val47 < 0) {
# 1397 "objectfollower.c"
    tmp49 = - val47;
  } else {
# 1399 "objectfollower.c"
    tmp49 = val47;
  }
# 1401 "objectfollower.c"
  val87 = (U32___0 )tmp49;
# 1402 "objectfollower.c"
  places88 = places48;
# 1403 "objectfollower.c"
  sign89 = (U32___0 )(val47 < 0);
# 1404 "objectfollower.c"
  p91 = & x90[11];
# 1405 "objectfollower.c"
  p_count92 = 0;
# 1406 "objectfollower.c"
  *p91 = (char)0;
# 1407 "objectfollower.c"
  if (places88 > 11UL) {
# 1408 "objectfollower.c"
    places88 = (U32___0 )11;
  }
# 1410 "objectfollower.c"
  while (val87) {
# 1411 "objectfollower.c"
    p91 --;
# 1412 "objectfollower.c"
    p_count92 ++;
# 1413 "objectfollower.c"
    *p91 = (char )(val87 % 10UL + 48UL);
# 1414 "objectfollower.c"
    val87 /= 10UL;
  }
# 1416 "objectfollower.c"
  if (! p_count92) {
# 1417 "objectfollower.c"
    p91 --;
# 1418 "objectfollower.c"
    p_count92 ++;
# 1419 "objectfollower.c"
    *p91 = (char )'0';
  }
# 1421 "objectfollower.c"
  if (sign89) {
# 1422 "objectfollower.c"
    p91 --;
# 1423 "objectfollower.c"
    p_count92 ++;
# 1424 "objectfollower.c"
    *p91 = (char )'-';
  }
# 1426 "objectfollower.c"
  while ((U32___0 )p_count92 < places88) {
# 1427 "objectfollower.c"
    p91 --;
# 1428 "objectfollower.c"
    p_count92 ++;
# 1429 "objectfollower.c"
    *p91 = (char )' ';
  }
# 1431 "objectfollower.c"
  str793 = (char const *)p91;
# 1432 "objectfollower.c"
  while (*str793) {
# 1433 "objectfollower.c"
    if ((int const )*str793 != 10) {
# 1434 "objectfollower.c"
      c151 = (int )*str793;
# 1435 "objectfollower.c"
      if (c151 >= 0) {
# 1436 "objectfollower.c"
        if (c151 < 128) {
# 1437 "objectfollower.c"
          if (display_x >= 0) {
# 1438 "objectfollower.c"
            if (display_x < 16) {
# 1439 "objectfollower.c"
              if (display_y >= 0) {
# 1440 "objectfollower.c"
                if (display_y < 8) {
# 1441 "objectfollower.c"
                  b153 = & (*(display_buffer + display_y))[display_x * 6];
# 1442 "objectfollower.c"
                  f154 = font[c151];
# 1443 "objectfollower.c"
                  i152 = 0;
# 1444 "objectfollower.c"
                  while (i152 < 5) {
# 1445 "objectfollower.c"
                    *b153 = (U8___0 )*f154;
# 1446 "objectfollower.c"
                    b153 ++;
# 1447 "objectfollower.c"
                    f154 ++;
# 1448 "objectfollower.c"
                    i152 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1456 "objectfollower.c"
      goto Lret_display_char___8;
      Lret_display_char___8:
# 1458 "objectfollower.c"
      display_x ++;
    } else {
# 1460 "objectfollower.c"
      display_x = 0;
# 1461 "objectfollower.c"
      display_y ++;
    }
# 1463 "objectfollower.c"
    str793 ++;
  }
# 1465 "objectfollower.c"
  goto Lret_display_string___11;
  Lret_display_string___11: ;
# 1467 "objectfollower.c"
  goto Lret_display_unsigned_worker___3;
  Lret_display_unsigned_worker___3: ;
# 1469 "objectfollower.c"
  goto Lret_display_int___3;
  Lret_display_int___3:
# 1471 "objectfollower.c"
  tmp___48 = line2;
# 1472 "objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 1473 "objectfollower.c"
  x21 = 0;
# 1474 "objectfollower.c"
  y22 = (int )tmp___48;
# 1475 "objectfollower.c"
  display_x = x21;
# 1476 "objectfollower.c"
  display_y = y22;
# 1477 "objectfollower.c"
  goto Lret_display_goto_xy___4;
  Lret_display_goto_xy___4:
# 1479 "objectfollower.c"
  message1 = (char *)"dir dev:";
# 1480 "objectfollower.c"
  str32 = (char const *)message1;
# 1481 "objectfollower.c"
  while (*str32) {
# 1482 "objectfollower.c"
    if ((int const )*str32 != 10) {
# 1483 "objectfollower.c"
      c155 = (int )*str32;
# 1484 "objectfollower.c"
      if (c155 >= 0) {
# 1485 "objectfollower.c"
        if (c155 < 128) {
# 1486 "objectfollower.c"
          if (display_x >= 0) {
# 1487 "objectfollower.c"
            if (display_x < 16) {
# 1488 "objectfollower.c"
              if (display_y >= 0) {
# 1489 "objectfollower.c"
                if (display_y < 8) {
# 1490 "objectfollower.c"
                  b157 = & (*(display_buffer + display_y))[display_x * 6];
# 1491 "objectfollower.c"
                  f158 = font[c155];
# 1492 "objectfollower.c"
                  i156 = 0;
# 1493 "objectfollower.c"
                  while (i156 < 5) {
# 1494 "objectfollower.c"
                    *b157 = (U8___0 )*f158;
# 1495 "objectfollower.c"
                    b157 ++;
# 1496 "objectfollower.c"
                    f158 ++;
# 1497 "objectfollower.c"
                    i156 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1505 "objectfollower.c"
      goto Lret_display_char___9;
      Lret_display_char___9:
# 1507 "objectfollower.c"
      display_x ++;
    } else {
# 1509 "objectfollower.c"
      display_x = 0;
# 1510 "objectfollower.c"
      display_y ++;
    }
# 1512 "objectfollower.c"
    str32 ++;
  }
# 1514 "objectfollower.c"
  goto Lret_display_string___4;
  Lret_display_string___4:
# 1516 "objectfollower.c"
  val50 = diradjLCD;
# 1517 "objectfollower.c"
  places51 = (U32___2 )4;
# 1518 "objectfollower.c"
  if (val50 < 0) {
# 1519 "objectfollower.c"
    tmp52 = - val50;
  } else {
# 1521 "objectfollower.c"
    tmp52 = val50;
  }
# 1523 "objectfollower.c"
  val94 = (U32___0 )tmp52;
# 1524 "objectfollower.c"
  places95 = places51;
# 1525 "objectfollower.c"
  sign96 = (U32___0 )(val50 < 0);
# 1526 "objectfollower.c"
  p98 = & x97[11];
# 1527 "objectfollower.c"
  p_count99 = 0;
# 1528 "objectfollower.c"
  *p98 = (char)0;
# 1529 "objectfollower.c"
  if (places95 > 11UL) {
# 1530 "objectfollower.c"
    places95 = (U32___0 )11;
  }
# 1532 "objectfollower.c"
  while (val94) {
# 1533 "objectfollower.c"
    p98 --;
# 1534 "objectfollower.c"
    p_count99 ++;
# 1535 "objectfollower.c"
    *p98 = (char )(val94 % 10UL + 48UL);
# 1536 "objectfollower.c"
    val94 /= 10UL;
  }
# 1538 "objectfollower.c"
  if (! p_count99) {
# 1539 "objectfollower.c"
    p98 --;
# 1540 "objectfollower.c"
    p_count99 ++;
# 1541 "objectfollower.c"
    *p98 = (char )'0';
  }
# 1543 "objectfollower.c"
  if (sign96) {
# 1544 "objectfollower.c"
    p98 --;
# 1545 "objectfollower.c"
    p_count99 ++;
# 1546 "objectfollower.c"
    *p98 = (char )'-';
  }
# 1548 "objectfollower.c"
  while ((U32___0 )p_count99 < places95) {
# 1549 "objectfollower.c"
    p98 --;
# 1550 "objectfollower.c"
    p_count99 ++;
# 1551 "objectfollower.c"
    *p98 = (char )' ';
  }
# 1553 "objectfollower.c"
  str7100 = (char const *)p98;
# 1554 "objectfollower.c"
  while (*str7100) {
# 1555 "objectfollower.c"
    if ((int const )*str7100 != 10) {
# 1556 "objectfollower.c"
      c159 = (int )*str7100;
# 1557 "objectfollower.c"
      if (c159 >= 0) {
# 1558 "objectfollower.c"
        if (c159 < 128) {
# 1559 "objectfollower.c"
          if (display_x >= 0) {
# 1560 "objectfollower.c"
            if (display_x < 16) {
# 1561 "objectfollower.c"
              if (display_y >= 0) {
# 1562 "objectfollower.c"
                if (display_y < 8) {
# 1563 "objectfollower.c"
                  b161 = & (*(display_buffer + display_y))[display_x * 6];
# 1564 "objectfollower.c"
                  f162 = font[c159];
# 1565 "objectfollower.c"
                  i160 = 0;
# 1566 "objectfollower.c"
                  while (i160 < 5) {
# 1567 "objectfollower.c"
                    *b161 = (U8___0 )*f162;
# 1568 "objectfollower.c"
                    b161 ++;
# 1569 "objectfollower.c"
                    f162 ++;
# 1570 "objectfollower.c"
                    i160 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1578 "objectfollower.c"
      goto Lret_display_char___10;
      Lret_display_char___10:
# 1580 "objectfollower.c"
      display_x ++;
    } else {
# 1582 "objectfollower.c"
      display_x = 0;
# 1583 "objectfollower.c"
      display_y ++;
    }
# 1585 "objectfollower.c"
    str7100 ++;
  }
# 1587 "objectfollower.c"
  goto Lret_display_string___12;
  Lret_display_string___12: ;
# 1589 "objectfollower.c"
  goto Lret_display_unsigned_worker___4;
  Lret_display_unsigned_worker___4: ;
# 1591 "objectfollower.c"
  goto Lret_display_int___4;
  Lret_display_int___4:
# 1593 "objectfollower.c"
  tmp___59 = line2;
# 1594 "objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 1595 "objectfollower.c"
  x23 = 0;
# 1596 "objectfollower.c"
  y24 = (int )tmp___59;
# 1597 "objectfollower.c"
  display_x = x23;
# 1598 "objectfollower.c"
  display_y = y24;
# 1599 "objectfollower.c"
  goto Lret_display_goto_xy___5;
  Lret_display_goto_xy___5:
# 1601 "objectfollower.c"
  message1 = (char *)"left motor:";
# 1602 "objectfollower.c"
  str33 = (char const *)message1;
# 1603 "objectfollower.c"
  while (*str33) {
# 1604 "objectfollower.c"
    if ((int const )*str33 != 10) {
# 1605 "objectfollower.c"
      c163 = (int )*str33;
# 1606 "objectfollower.c"
      if (c163 >= 0) {
# 1607 "objectfollower.c"
        if (c163 < 128) {
# 1608 "objectfollower.c"
          if (display_x >= 0) {
# 1609 "objectfollower.c"
            if (display_x < 16) {
# 1610 "objectfollower.c"
              if (display_y >= 0) {
# 1611 "objectfollower.c"
                if (display_y < 8) {
# 1612 "objectfollower.c"
                  b165 = & (*(display_buffer + display_y))[display_x * 6];
# 1613 "objectfollower.c"
                  f166 = font[c163];
# 1614 "objectfollower.c"
                  i164 = 0;
# 1615 "objectfollower.c"
                  while (i164 < 5) {
# 1616 "objectfollower.c"
                    *b165 = (U8___0 )*f166;
# 1617 "objectfollower.c"
                    b165 ++;
# 1618 "objectfollower.c"
                    f166 ++;
# 1619 "objectfollower.c"
                    i164 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1627 "objectfollower.c"
      goto Lret_display_char___11;
      Lret_display_char___11:
# 1629 "objectfollower.c"
      display_x ++;
    } else {
# 1631 "objectfollower.c"
      display_x = 0;
# 1632 "objectfollower.c"
      display_y ++;
    }
# 1634 "objectfollower.c"
    str33 ++;
  }
# 1636 "objectfollower.c"
  goto Lret_display_string___5;
  Lret_display_string___5:
# 1638 "objectfollower.c"
  val53 = lmotLCD;
# 1639 "objectfollower.c"
  places54 = (U32___2 )4;
# 1640 "objectfollower.c"
  if (val53 < 0) {
# 1641 "objectfollower.c"
    tmp55 = - val53;
  } else {
# 1643 "objectfollower.c"
    tmp55 = val53;
  }
# 1645 "objectfollower.c"
  val101 = (U32___0 )tmp55;
# 1646 "objectfollower.c"
  places102 = places54;
# 1647 "objectfollower.c"
  sign103 = (U32___0 )(val53 < 0);
# 1648 "objectfollower.c"
  p105 = & x104[11];
# 1649 "objectfollower.c"
  p_count106 = 0;
# 1650 "objectfollower.c"
  *p105 = (char)0;
# 1651 "objectfollower.c"
  if (places102 > 11UL) {
# 1652 "objectfollower.c"
    places102 = (U32___0 )11;
  }
# 1654 "objectfollower.c"
  while (val101) {
# 1655 "objectfollower.c"
    p105 --;
# 1656 "objectfollower.c"
    p_count106 ++;
# 1657 "objectfollower.c"
    *p105 = (char )(val101 % 10UL + 48UL);
# 1658 "objectfollower.c"
    val101 /= 10UL;
  }
# 1660 "objectfollower.c"
  if (! p_count106) {
# 1661 "objectfollower.c"
    p105 --;
# 1662 "objectfollower.c"
    p_count106 ++;
# 1663 "objectfollower.c"
    *p105 = (char )'0';
  }
# 1665 "objectfollower.c"
  if (sign103) {
# 1666 "objectfollower.c"
    p105 --;
# 1667 "objectfollower.c"
    p_count106 ++;
# 1668 "objectfollower.c"
    *p105 = (char )'-';
  }
# 1670 "objectfollower.c"
  while ((U32___0 )p_count106 < places102) {
# 1671 "objectfollower.c"
    p105 --;
# 1672 "objectfollower.c"
    p_count106 ++;
# 1673 "objectfollower.c"
    *p105 = (char )' ';
  }
# 1675 "objectfollower.c"
  str7107 = (char const *)p105;
# 1676 "objectfollower.c"
  while (*str7107) {
# 1677 "objectfollower.c"
    if ((int const )*str7107 != 10) {
# 1678 "objectfollower.c"
      c167 = (int )*str7107;
# 1679 "objectfollower.c"
      if (c167 >= 0) {
# 1680 "objectfollower.c"
        if (c167 < 128) {
# 1681 "objectfollower.c"
          if (display_x >= 0) {
# 1682 "objectfollower.c"
            if (display_x < 16) {
# 1683 "objectfollower.c"
              if (display_y >= 0) {
# 1684 "objectfollower.c"
                if (display_y < 8) {
# 1685 "objectfollower.c"
                  b169 = & (*(display_buffer + display_y))[display_x * 6];
# 1686 "objectfollower.c"
                  f170 = font[c167];
# 1687 "objectfollower.c"
                  i168 = 0;
# 1688 "objectfollower.c"
                  while (i168 < 5) {
# 1689 "objectfollower.c"
                    *b169 = (U8___0 )*f170;
# 1690 "objectfollower.c"
                    b169 ++;
# 1691 "objectfollower.c"
                    f170 ++;
# 1692 "objectfollower.c"
                    i168 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1700 "objectfollower.c"
      goto Lret_display_char___12;
      Lret_display_char___12:
# 1702 "objectfollower.c"
      display_x ++;
    } else {
# 1704 "objectfollower.c"
      display_x = 0;
# 1705 "objectfollower.c"
      display_y ++;
    }
# 1707 "objectfollower.c"
    str7107 ++;
  }
# 1709 "objectfollower.c"
  goto Lret_display_string___13;
  Lret_display_string___13: ;
# 1711 "objectfollower.c"
  goto Lret_display_unsigned_worker___5;
  Lret_display_unsigned_worker___5: ;
# 1713 "objectfollower.c"
  goto Lret_display_int___5;
  Lret_display_int___5:
# 1715 "objectfollower.c"
  tmp___610 = line2;
# 1716 "objectfollower.c"
  line2 = (U8___1 )((int )line2 + 1);
# 1717 "objectfollower.c"
  x25 = 0;
# 1718 "objectfollower.c"
  y26 = (int )tmp___610;
# 1719 "objectfollower.c"
  display_x = x25;
# 1720 "objectfollower.c"
  display_y = y26;
# 1721 "objectfollower.c"
  goto Lret_display_goto_xy___6;
  Lret_display_goto_xy___6:
# 1723 "objectfollower.c"
  message1 = (char *)"right motor:";
# 1724 "objectfollower.c"
  str34 = (char const *)message1;
# 1725 "objectfollower.c"
  while (*str34) {
# 1726 "objectfollower.c"
    if ((int const )*str34 != 10) {
# 1727 "objectfollower.c"
      c171 = (int )*str34;
# 1728 "objectfollower.c"
      if (c171 >= 0) {
# 1729 "objectfollower.c"
        if (c171 < 128) {
# 1730 "objectfollower.c"
          if (display_x >= 0) {
# 1731 "objectfollower.c"
            if (display_x < 16) {
# 1732 "objectfollower.c"
              if (display_y >= 0) {
# 1733 "objectfollower.c"
                if (display_y < 8) {
# 1734 "objectfollower.c"
                  b173 = & (*(display_buffer + display_y))[display_x * 6];
# 1735 "objectfollower.c"
                  f174 = font[c171];
# 1736 "objectfollower.c"
                  i172 = 0;
# 1737 "objectfollower.c"
                  while (i172 < 5) {
# 1738 "objectfollower.c"
                    *b173 = (U8___0 )*f174;
# 1739 "objectfollower.c"
                    b173 ++;
# 1740 "objectfollower.c"
                    f174 ++;
# 1741 "objectfollower.c"
                    i172 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1749 "objectfollower.c"
      goto Lret_display_char___13;
      Lret_display_char___13:
# 1751 "objectfollower.c"
      display_x ++;
    } else {
# 1753 "objectfollower.c"
      display_x = 0;
# 1754 "objectfollower.c"
      display_y ++;
    }
# 1756 "objectfollower.c"
    str34 ++;
  }
# 1758 "objectfollower.c"
  goto Lret_display_string___6;
  Lret_display_string___6:
# 1760 "objectfollower.c"
  val56 = rmotLCD;
# 1761 "objectfollower.c"
  places57 = (U32___2 )4;
# 1762 "objectfollower.c"
  if (val56 < 0) {
# 1763 "objectfollower.c"
    tmp58 = - val56;
  } else {
# 1765 "objectfollower.c"
    tmp58 = val56;
  }
# 1767 "objectfollower.c"
  val108 = (U32___0 )tmp58;
# 1768 "objectfollower.c"
  places109 = places57;
# 1769 "objectfollower.c"
  sign110 = (U32___0 )(val56 < 0);
# 1770 "objectfollower.c"
  p112 = & x111[11];
# 1771 "objectfollower.c"
  p_count113 = 0;
# 1772 "objectfollower.c"
  *p112 = (char)0;
# 1773 "objectfollower.c"
  if (places109 > 11UL) {
# 1774 "objectfollower.c"
    places109 = (U32___0 )11;
  }
# 1776 "objectfollower.c"
  while (val108) {
# 1777 "objectfollower.c"
    p112 --;
# 1778 "objectfollower.c"
    p_count113 ++;
# 1779 "objectfollower.c"
    *p112 = (char )(val108 % 10UL + 48UL);
# 1780 "objectfollower.c"
    val108 /= 10UL;
  }
# 1782 "objectfollower.c"
  if (! p_count113) {
# 1783 "objectfollower.c"
    p112 --;
# 1784 "objectfollower.c"
    p_count113 ++;
# 1785 "objectfollower.c"
    *p112 = (char )'0';
  }
# 1787 "objectfollower.c"
  if (sign110) {
# 1788 "objectfollower.c"
    p112 --;
# 1789 "objectfollower.c"
    p_count113 ++;
# 1790 "objectfollower.c"
    *p112 = (char )'-';
  }
# 1792 "objectfollower.c"
  while ((U32___0 )p_count113 < places109) {
# 1793 "objectfollower.c"
    p112 --;
# 1794 "objectfollower.c"
    p_count113 ++;
# 1795 "objectfollower.c"
    *p112 = (char )' ';
  }
# 1797 "objectfollower.c"
  str7114 = (char const *)p112;
# 1798 "objectfollower.c"
  while (*str7114) {
# 1799 "objectfollower.c"
    if ((int const )*str7114 != 10) {
# 1800 "objectfollower.c"
      c175 = (int )*str7114;
# 1801 "objectfollower.c"
      if (c175 >= 0) {
# 1802 "objectfollower.c"
        if (c175 < 128) {
# 1803 "objectfollower.c"
          if (display_x >= 0) {
# 1804 "objectfollower.c"
            if (display_x < 16) {
# 1805 "objectfollower.c"
              if (display_y >= 0) {
# 1806 "objectfollower.c"
                if (display_y < 8) {
# 1807 "objectfollower.c"
                  b177 = & (*(display_buffer + display_y))[display_x * 6];
# 1808 "objectfollower.c"
                  f178 = font[c175];
# 1809 "objectfollower.c"
                  i176 = 0;
# 1810 "objectfollower.c"
                  while (i176 < 5) {
# 1811 "objectfollower.c"
                    *b177 = (U8___0 )*f178;
# 1812 "objectfollower.c"
                    b177 ++;
# 1813 "objectfollower.c"
                    f178 ++;
# 1814 "objectfollower.c"
                    i176 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1822 "objectfollower.c"
      goto Lret_display_char___14;
      Lret_display_char___14:
# 1824 "objectfollower.c"
      display_x ++;
    } else {
# 1826 "objectfollower.c"
      display_x = 0;
# 1827 "objectfollower.c"
      display_y ++;
    }
# 1829 "objectfollower.c"
    str7114 ++;
  }
# 1831 "objectfollower.c"
  goto Lret_display_string___14;
  Lret_display_string___14: ;
# 1833 "objectfollower.c"
  goto Lret_display_unsigned_worker___6;
  Lret_display_unsigned_worker___6: ;
# 1835 "objectfollower.c"
  goto Lret_display_int___6;
  Lret_display_int___6:
# 1837 "objectfollower.c"
  display_tick = 0;
# 1838 "objectfollower.c"
  nxt_spi_refresh();
# 1839 "objectfollower.c"
  goto Lret_nxt_lcd_update;
  Lret_nxt_lcd_update: ;
# 1841 "objectfollower.c"
  goto Lret_display_update;
  Lret_display_update: ;
# 1843 "objectfollower.c"
  goto Lret_display_values;
  Lret_display_values:
# 1845 "objectfollower.c"
  TerminateTask();
# 1846 "objectfollower.c"
  return;
}
}
# 1862 "objectfollower.c"
extern int create_block() ;
# 1863 "objectfollower.c"
extern int create_task() ;
# 1864 "objectfollower.c"
void main(void)
{


  {
# 1869 "objectfollower.c"
  create_task("TaskMainAcquisitionTask", "TaskMainAcquisitionTask", 3, 30, 2.15);
# 1870 "objectfollower.c"
  create_task("TaskMainControlTask", "TaskMainControlTask", 2, 50, 0.14);
# 1871 "objectfollower.c"
  create_task("TaskMainDisplayTask", "TaskMainDisplayTask", 1, 100, 0.14);
# 1872 "objectfollower.c"
  create_block(488, "TaskMainAcquisitionTask", "dataMutex", 1, 3, 0.007);
# 1874 "objectfollower.c"
  create_block(542, "TaskMainControlTask", "dataMutex", 1, 2, 0.006);
# 1876 "objectfollower.c"
  return;
}
}

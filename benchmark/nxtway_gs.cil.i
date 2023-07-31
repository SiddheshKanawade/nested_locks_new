# 1 "./nxtway_gs.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./nxtway_gs.cil.c"
# 3 "nxtway_gs/nxtway_gs.c"
typedef unsigned char U8;
# 5 "nxtway_gs/nxtway_gs.c"
typedef unsigned short U16;
# 6 "nxtway_gs/nxtway_gs.c"
typedef unsigned long U32;
# 16 "nxtway_gs/nxtway_gs.c"
struct __anonstruct_from_avr_708559676 {
   U16 adc_value[4] ;
   U16 buttonsVal ;
   U16 extra ;
   U8 csum ;
} __attribute__((__packed__)) ;
# 22 "nxtway_gs/nxtway_gs.c"
typedef struct __anonstruct_from_avr_708559676 from_avr;
# 30 "nxtway_gs/nxtway_gs.c"
typedef unsigned char U8___0;
# 31 "nxtway_gs/nxtway_gs.c"
typedef unsigned long U32___0;
# 32 "nxtway_gs/nxtway_gs.c"
typedef unsigned char byte;
# 33 "nxtway_gs/nxtway_gs.c"
typedef unsigned short TWOBYTES;
# 36 "nxtway_gs/nxtway_gs.c"
struct _freeBlock {
   TWOBYTES size : 15 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 40 "nxtway_gs/nxtway_gs.c"
struct _objects {
   byte _class ;
   byte padding : 5 ;
   byte mark : 1 ;
   byte isArray : 1 ;
   byte isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 47 "nxtway_gs/nxtway_gs.c"
struct _arrays {
   TWOBYTES length : 9 ;
   TWOBYTES type : 4 ;
   TWOBYTES mark : 1 ;
   TWOBYTES isArray : 1 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 54 "nxtway_gs/nxtway_gs.c"
union _flags {
   TWOBYTES all ;
   struct _freeBlock freeBlock ;
   struct _objects objects ;
   struct _arrays arrays ;
} __attribute__((__packed__)) ;
# 60 "nxtway_gs/nxtway_gs.c"
struct S_Object {
   union _flags flags ;
   byte monitorCount ;
   byte threadId ;
} __attribute__((__packed__)) ;
# 65 "nxtway_gs/nxtway_gs.c"
typedef struct S_Object Object;
# 67 "nxtway_gs/nxtway_gs.c"
typedef unsigned long size_t___0;
# 68 "nxtway_gs/nxtway_gs.c"
struct __anonstruct_display_array_740464799 {
   Object hdr ;
   U8___0 displayN[9][100] ;
} __attribute__((__packed__)) ;
# 72 "nxtway_gs/nxtway_gs.c"
typedef unsigned long U32___1;
# 73 "nxtway_gs/nxtway_gs.c"
struct motor_struct {
   int current_count ;
   int target_count ;
   int speed_percent ;
   U32___1 last ;
};
# 79 "nxtway_gs/nxtway_gs.c"
typedef unsigned char U8___1;
# 80 "nxtway_gs/nxtway_gs.c"
typedef unsigned long U32___2;
# 81 "nxtway_gs/nxtway_gs.c"
typedef int SINT;
# 82 "nxtway_gs/nxtway_gs.c"
typedef unsigned char U8___2;
# 83 "nxtway_gs/nxtway_gs.c"
typedef unsigned short U16___0;
# 84 "nxtway_gs/nxtway_gs.c"
typedef unsigned long U32___3;
# 85 "nxtway_gs/nxtway_gs.c"
typedef long S32___1;
# 86 "nxtway_gs/nxtway_gs.c"
typedef char CHAR___0;
# 87 "nxtway_gs/nxtway_gs.c"
typedef int SINT___0;
# 88 "nxtway_gs/nxtway_gs.c"
struct __anonstruct_nxt_inputs_83380041___0 {
   U32___3 battery_state ;
   U8___2 buttons_state ;
};
# 92 "nxtway_gs/nxtway_gs.c"
typedef struct __anonstruct_nxt_inputs_83380041___0 nxt_inputs___0;
# 93 "nxtway_gs/nxtway_gs.c"
typedef unsigned char UINT8;
# 94 "nxtway_gs/nxtway_gs.c"
typedef UINT8 StatusType;
# 95 "nxtway_gs/nxtway_gs.c"
typedef unsigned char U8___3;
# 96 "nxtway_gs/nxtway_gs.c"
typedef signed char S8___1;
# 97 "nxtway_gs/nxtway_gs.c"
typedef unsigned short U16___1;
# 98 "nxtway_gs/nxtway_gs.c"
typedef unsigned long U32___4;
# 99 "nxtway_gs/nxtway_gs.c"
typedef long S32___2;
# 100 "nxtway_gs/nxtway_gs.c"
typedef int SINT___1;
# 101 "nxtway_gs/nxtway_gs.c"
typedef float F32___0;
# 102 "nxtway_gs/nxtway_gs.c"
enum __anonenum_MODE_ENUM_460405356 {
    INIT_MODE = 0,
    CAL_MODE = 1,
    CONTROL_MODE = 2
} ;
# 107 "nxtway_gs/nxtway_gs.c"
typedef enum __anonenum_MODE_ENUM_460405356 MODE_ENUM;
# 120 "nxtway_gs/nxtway_gs.c"
extern void nxt_motor_set_count(unsigned long n , int count ) ;
# 121 "nxtway_gs/nxtway_gs.c"
extern void nxt_motor_set_speed(unsigned long n , int speed_percent , int brake ) ;
# 122 "nxtway_gs/nxtway_gs.c"
extern unsigned long systick_get_ms(void) ;
# 123 "nxtway_gs/nxtway_gs.c"
extern void systick_wait_ms(unsigned long ms ) ;
# 124 "nxtway_gs/nxtway_gs.c"
extern __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1), __leaf__)) memset)(void *__s ,
                                                                                               int __c ,
                                                                                               unsigned long __n ) ;
# 143 "nxtway_gs/nxtway_gs.c"
int display_tick ;
# 144 "nxtway_gs/nxtway_gs.c"
int display_auto_update ;
# 145 "nxtway_gs/nxtway_gs.c"
char const avr_brainwash_string[48] =
# 145 "nxtway_gs/nxtway_gs.c"
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
# 161 "nxtway_gs/nxtway_gs.c"
static from_avr *io_from_avr ;
# 173 "nxtway_gs/nxtway_gs.c"
extern void nxt_lcd_update(void) ;
# 184 "nxtway_gs/nxtway_gs.c"
U8___0 const *displayM = (U8___0 const *)((U8___0 *)0);
# 185 "nxtway_gs/nxtway_gs.c"
unsigned char dirty = (U8___0 )0;
# 186 "nxtway_gs/nxtway_gs.c"
unsigned char page = (U8___0 )0;
# 187 "nxtway_gs/nxtway_gs.c"
U8___0 const *dataM = (U8___0 const *)((U8___0 *)0);
# 188 "nxtway_gs/nxtway_gs.c"
U8___0 mode = (U8___0 )255;
# 191 "nxtway_gs/nxtway_gs.c"
static struct __anonstruct_display_array_740464799 display_array ;
# 192 "nxtway_gs/nxtway_gs.c"
static U8___0 (*display_buffer)[100] = display_array.displayN;
# 193 "nxtway_gs/nxtway_gs.c"
static U8___0 const font[128][5] =
# 193 "nxtway_gs/nxtway_gs.c"
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
# 450 "nxtway_gs/nxtway_gs.c"
int display_tick = 0;
# 451 "nxtway_gs/nxtway_gs.c"
int display_auto_update = 1;
# 452 "nxtway_gs/nxtway_gs.c"
int display_x ;
# 453 "nxtway_gs/nxtway_gs.c"
int display_y ;
# 456 "nxtway_gs/nxtway_gs.c"
static struct motor_struct motor[3] ;
# 457 "nxtway_gs/nxtway_gs.c"
extern int i2c_busy(int port ) ;
# 458 "nxtway_gs/nxtway_gs.c"
extern int i2c_start_transaction(int port , unsigned long address , int internal_address ,
                                 int n_internal_address_bytes , unsigned char *data ,
                                 unsigned long nbytes , int write ) ;
# 461 "nxtway_gs/nxtway_gs.c"
extern void bt_receive(U8___1 *buf ) ;
# 462 "nxtway_gs/nxtway_gs.c"
extern void sound_freq_vol(unsigned long freq , unsigned long ms , int vol ) ;
# 463 "nxtway_gs/nxtway_gs.c"
extern unsigned short ecrobot_get_gyro_sensor(unsigned char port_id ) ;
# 464 "nxtway_gs/nxtway_gs.c"
extern void ecrobot_bt_data_logger(signed char data1 , signed char data2 ) ;
# 465 "nxtway_gs/nxtway_gs.c"
static unsigned char bt_status = (U8___1 )4;
# 466 "nxtway_gs/nxtway_gs.c"
static U8___1 receiveBuf[128] ;
# 467 "nxtway_gs/nxtway_gs.c"
static S32___1 distance_state[4] = { (S32___1 )-1, (S32___1 )-1, (S32___1 )-1, (S32___1 )-1};
# 468 "nxtway_gs/nxtway_gs.c"
static U8___2 data[4] = { (U8___2 )0};
# 469 "nxtway_gs/nxtway_gs.c"
U8___2 const NXT_COLORSENSOR_PROTOCOLS[7] = { (U8___2 const )176, (U8___2 const )112, (U8___2 const )240, (U8___2 const )8,
        (U8___2 const )176, (U8___2 const )136, (U8___2 const )136};
# 471 "nxtway_gs/nxtway_gs.c"
static nxt_inputs___0 ecrobot_inputs ;
# 472 "nxtway_gs/nxtway_gs.c"
extern StatusType TerminateTask(void) ;
# 473 "nxtway_gs/nxtway_gs.c"
MODE_ENUM nxtway_gs_mode = (MODE_ENUM )0;
# 474 "nxtway_gs/nxtway_gs.c"
U8___3 obstacle_flag ;
# 475 "nxtway_gs/nxtway_gs.c"
static U32___4 gyro_offset ;
# 476 "nxtway_gs/nxtway_gs.c"
static U32___4 avg_cnt ;
# 477 "nxtway_gs/nxtway_gs.c"
static U32___4 cal_start_time ;
# 478 "nxtway_gs/nxtway_gs.c"
static U8___3 bt_receive_buf[32] ;
# 479 "nxtway_gs/nxtway_gs.c"
extern int balance_init() ;
# 480 "nxtway_gs/nxtway_gs.c"
extern int balance_control() ;
# 481 "nxtway_gs/nxtway_gs.c"
void TaskMainOSEK_Task_ts1(void)
{
  SINT___1 i ;
  S8___1 cmd_forward ;
  S8___1 cmd_turn ;
  S8___1 pwm_l ;
  S8___1 pwm_r ;
  U16___1 tmp ;
  U32___4 tmp___0 ;
  U16___1 tmp___1 ;
  int tmp___2 ;
  int tmp___3 ;
  U16___1 tmp___4 ;
  U32___3 tmp12 ;
  unsigned long ret_ecrobot_get_systick_ms13 ;
  U32___3 tmp14 ;
  unsigned long ret_ecrobot_get_systick_ms15 ;
  U32___3 freq16 ;
  U32___3 ms17 ;
  U32___3 vol18 ;
  unsigned short ret_ecrobot_get_battery_voltage19 ;
  U8___1 *buf20 ;
  U32___2 bufLen21 ;
  SINT i22 ;
  U32___2 len23 ;
  U32___1 n24 ;
  int ret_nxt_motor_get_count25 ;
  U32___1 n26 ;
  int ret_nxt_motor_get_count27 ;

  {
# 512 "nxtway_gs/nxtway_gs.c"
  switch ((unsigned int )nxtway_gs_mode) {
  case 0U:
# 514 "nxtway_gs/nxtway_gs.c"
  gyro_offset = (U32___4 )0;
# 515 "nxtway_gs/nxtway_gs.c"
  avg_cnt = (U32___4 )0;
# 516 "nxtway_gs/nxtway_gs.c"
  i = 0;
# 517 "nxtway_gs/nxtway_gs.c"
  while (i < 32) {
# 518 "nxtway_gs/nxtway_gs.c"
    bt_receive_buf[i] = (U8___3 )0;
# 519 "nxtway_gs/nxtway_gs.c"
    i ++;
  }
# 521 "nxtway_gs/nxtway_gs.c"
  balance_init();
# 522 "nxtway_gs/nxtway_gs.c"
  nxt_motor_set_count((U32___4 )2, 0);
# 523 "nxtway_gs/nxtway_gs.c"
  nxt_motor_set_count((U32___4 )1, 0);
# 524 "nxtway_gs/nxtway_gs.c"
  tmp12 = systick_get_ms();
# 525 "nxtway_gs/nxtway_gs.c"
  ret_ecrobot_get_systick_ms13 = tmp12;
# 526 "nxtway_gs/nxtway_gs.c"
  goto Lret_ecrobot_get_systick_ms;
  Lret_ecrobot_get_systick_ms:
# 528 "nxtway_gs/nxtway_gs.c"
  cal_start_time = ret_ecrobot_get_systick_ms13;
# 529 "nxtway_gs/nxtway_gs.c"
  nxtway_gs_mode = (MODE_ENUM )1;
# 530 "nxtway_gs/nxtway_gs.c"
  break;
  case 1U:
# 532 "nxtway_gs/nxtway_gs.c"
  tmp = ecrobot_get_gyro_sensor((U8___3 )3);
# 533 "nxtway_gs/nxtway_gs.c"
  gyro_offset += (U32___4 )tmp;
# 534 "nxtway_gs/nxtway_gs.c"
  avg_cnt ++;
# 535 "nxtway_gs/nxtway_gs.c"
  tmp14 = systick_get_ms();
# 536 "nxtway_gs/nxtway_gs.c"
  ret_ecrobot_get_systick_ms15 = tmp14;
# 537 "nxtway_gs/nxtway_gs.c"
  goto Lret_ecrobot_get_systick_ms___0;
  Lret_ecrobot_get_systick_ms___0:
# 539 "nxtway_gs/nxtway_gs.c"
  tmp___0 = ret_ecrobot_get_systick_ms15;
# 540 "nxtway_gs/nxtway_gs.c"
  if (tmp___0 - cal_start_time >= 1000UL) {
# 541 "nxtway_gs/nxtway_gs.c"
    gyro_offset /= avg_cnt;
# 542 "nxtway_gs/nxtway_gs.c"
    freq16 = (U32___4 )440U;
# 543 "nxtway_gs/nxtway_gs.c"
    ms17 = (U32___4 )500U;
# 544 "nxtway_gs/nxtway_gs.c"
    vol18 = (U32___4 )30U;
# 545 "nxtway_gs/nxtway_gs.c"
    sound_freq_vol(freq16, ms17, (int )vol18);
# 546 "nxtway_gs/nxtway_gs.c"
    goto Lret_ecrobot_sound_tone;
    Lret_ecrobot_sound_tone:
# 548 "nxtway_gs/nxtway_gs.c"
    nxtway_gs_mode = (MODE_ENUM )2;
  }
# 550 "nxtway_gs/nxtway_gs.c"
  break;
  case 2U:
# 552 "nxtway_gs/nxtway_gs.c"
  buf20 = bt_receive_buf;
# 553 "nxtway_gs/nxtway_gs.c"
  bufLen21 = (U32___4 )32;
# 554 "nxtway_gs/nxtway_gs.c"
  if ((int )bt_status == 7) {
# 555 "nxtway_gs/nxtway_gs.c"
    if (bufLen21 <= 126UL) {
# 556 "nxtway_gs/nxtway_gs.c"
      bt_receive(& receiveBuf[0]);
# 557 "nxtway_gs/nxtway_gs.c"
      len23 = (U32___2 )receiveBuf[0];
# 558 "nxtway_gs/nxtway_gs.c"
      if (len23 > 0UL) {
# 559 "nxtway_gs/nxtway_gs.c"
        if (len23 <= bufLen21) {
# 560 "nxtway_gs/nxtway_gs.c"
          i22 = 0;
# 561 "nxtway_gs/nxtway_gs.c"
          while ((U32___2 )i22 < len23) {
# 562 "nxtway_gs/nxtway_gs.c"
            *(buf20 + i22) = receiveBuf[i22 + 2];
# 563 "nxtway_gs/nxtway_gs.c"
            i22 ++;
          }
# 565 "nxtway_gs/nxtway_gs.c"
          goto Lret_ecrobot_read_bt_packet;
        }
      }
    }
  }
# 570 "nxtway_gs/nxtway_gs.c"
  goto Lret_ecrobot_read_bt_packet;
  Lret_ecrobot_read_bt_packet:
# 572 "nxtway_gs/nxtway_gs.c"
  cmd_forward = (S8___1 )(- ((int )((S8___1 )bt_receive_buf[0])));
# 573 "nxtway_gs/nxtway_gs.c"
  cmd_turn = (S8___1 )bt_receive_buf[1];
# 574 "nxtway_gs/nxtway_gs.c"
  if ((int )obstacle_flag == 1) {
# 575 "nxtway_gs/nxtway_gs.c"
    cmd_forward = (S8___1 )-100;
# 576 "nxtway_gs/nxtway_gs.c"
    cmd_turn = (S8___1 )0;
  }
# 578 "nxtway_gs/nxtway_gs.c"
  ret_ecrobot_get_battery_voltage19 = (U16___0 )ecrobot_inputs.battery_state;
# 579 "nxtway_gs/nxtway_gs.c"
  goto Lret_ecrobot_get_battery_voltage;
  Lret_ecrobot_get_battery_voltage:
# 581 "nxtway_gs/nxtway_gs.c"
  tmp___1 = ret_ecrobot_get_battery_voltage19;
# 582 "nxtway_gs/nxtway_gs.c"
  n24 = (U32___4 )1;
# 583 "nxtway_gs/nxtway_gs.c"
  if (n24 < 3UL) {
# 584 "nxtway_gs/nxtway_gs.c"
    ret_nxt_motor_get_count25 = motor[n24].current_count;
# 585 "nxtway_gs/nxtway_gs.c"
    goto Lret_nxt_motor_get_count;
  } else {
# 587 "nxtway_gs/nxtway_gs.c"
    ret_nxt_motor_get_count25 = 0;
# 588 "nxtway_gs/nxtway_gs.c"
    goto Lret_nxt_motor_get_count;
  }
  Lret_nxt_motor_get_count:
# 591 "nxtway_gs/nxtway_gs.c"
  tmp___2 = ret_nxt_motor_get_count25;
# 592 "nxtway_gs/nxtway_gs.c"
  n26 = (U32___4 )2;
# 593 "nxtway_gs/nxtway_gs.c"
  if (n26 < 3UL) {
# 594 "nxtway_gs/nxtway_gs.c"
    ret_nxt_motor_get_count27 = motor[n26].current_count;
# 595 "nxtway_gs/nxtway_gs.c"
    goto Lret_nxt_motor_get_count___0;
  } else {
# 597 "nxtway_gs/nxtway_gs.c"
    ret_nxt_motor_get_count27 = 0;
# 598 "nxtway_gs/nxtway_gs.c"
    goto Lret_nxt_motor_get_count___0;
  }
  Lret_nxt_motor_get_count___0:
# 601 "nxtway_gs/nxtway_gs.c"
  tmp___3 = ret_nxt_motor_get_count27;
# 602 "nxtway_gs/nxtway_gs.c"
  tmp___4 = ecrobot_get_gyro_sensor((U8___3 )3);
# 603 "nxtway_gs/nxtway_gs.c"
  balance_control((double )((F32___0 )cmd_forward), (double )((F32___0 )cmd_turn),
                  (double )((F32___0 )tmp___4), (double )((F32___0 )gyro_offset),
                  (double )((F32___0 )tmp___3), (double )((F32___0 )tmp___2), (double )((F32___0 )tmp___1),
                  & pwm_l, & pwm_r);
# 607 "nxtway_gs/nxtway_gs.c"
  nxt_motor_set_speed((U32___4 )2, (int )pwm_l, 1);
# 608 "nxtway_gs/nxtway_gs.c"
  nxt_motor_set_speed((U32___4 )1, (int )pwm_r, 1);
# 609 "nxtway_gs/nxtway_gs.c"
  ecrobot_bt_data_logger(cmd_forward, cmd_turn);
# 610 "nxtway_gs/nxtway_gs.c"
  break;
  default:
# 612 "nxtway_gs/nxtway_gs.c"
  nxt_motor_set_speed((U32___4 )2, 0, 1);
# 613 "nxtway_gs/nxtway_gs.c"
  nxt_motor_set_speed((U32___4 )1, 0, 1);
# 614 "nxtway_gs/nxtway_gs.c"
  break;
  }
# 616 "nxtway_gs/nxtway_gs.c"
  TerminateTask();
# 617 "nxtway_gs/nxtway_gs.c"
  return;
}
}
# 620 "nxtway_gs/nxtway_gs.c"
void TaskMainOSEK_Task_ts2(void)
{
  S32___2 tmp ;
  U8___2 port_id2 ;
  int tmp3 ;
  long ret_ecrobot_get_sonar_sensor4 ;

  {
# 628 "nxtway_gs/nxtway_gs.c"
  obstacle_flag = (U8___3 )0;
# 629 "nxtway_gs/nxtway_gs.c"
  if ((unsigned int )nxtway_gs_mode == 2U) {
# 630 "nxtway_gs/nxtway_gs.c"
    port_id2 = (U8___3 )1;
# 631 "nxtway_gs/nxtway_gs.c"
    tmp3 = i2c_busy((int )port_id2);
# 632 "nxtway_gs/nxtway_gs.c"
    if (tmp3 == 0) {
# 633 "nxtway_gs/nxtway_gs.c"
      distance_state[port_id2] = (S32___1 )data[port_id2];
# 634 "nxtway_gs/nxtway_gs.c"
      i2c_start_transaction((int )port_id2, (U32___3 )1, 66, 1, & data[port_id2],
                            (U32___3 )1, 0);
    }
# 637 "nxtway_gs/nxtway_gs.c"
    ret_ecrobot_get_sonar_sensor4 = distance_state[port_id2];
# 638 "nxtway_gs/nxtway_gs.c"
    goto Lret_ecrobot_get_sonar_sensor;
    Lret_ecrobot_get_sonar_sensor:
# 640 "nxtway_gs/nxtway_gs.c"
    tmp = ret_ecrobot_get_sonar_sensor4;
# 641 "nxtway_gs/nxtway_gs.c"
    if (tmp <= 25L) {
# 642 "nxtway_gs/nxtway_gs.c"
      obstacle_flag = (U8___3 )1;
    }
  }
# 645 "nxtway_gs/nxtway_gs.c"
  TerminateTask();
# 646 "nxtway_gs/nxtway_gs.c"
  return;
}
}
# 649 "nxtway_gs/nxtway_gs.c"
extern int getDistance() ;
# 650 "nxtway_gs/nxtway_gs.c"
void TaskMainOSEK_Task_Background(void)
{
  CHAR___0 const *target_name1 ;
  U32___3 tmp2 ;
  int tmp___03 ;
  int tmp___14 ;
  int tmp___25 ;
  U32___3 tmp___36 ;
  U32___3 tmp___47 ;
  U32___3 tmp___58 ;
  U32___3 tmp___69 ;
  SINT___0 tmp___710 ;
  S32___1 tmp___811 ;
  int tmp ;
  int ret_ecrobot_get_bt_status13 ;
  U32___1 n14 ;
  int ret_nxt_motor_get_count15 ;
  U32___1 n16 ;
  int ret_nxt_motor_get_count17 ;
  U32___1 n18 ;
  int ret_nxt_motor_get_count19 ;
  U32___0 val20 ;
  U32___0 places21 ;
  U32___0 val22 ;
  U32___0 places23 ;
  U32___0 val24 ;
  U32___0 places25 ;
  U32___0 val26 ;
  U32___0 places27 ;
  U32___0 val28 ;
  U32___0 places29 ;
  U32___0 val30 ;
  U32___0 places31 ;
  U32___0 val32 ;
  U32___0 places33 ;
  U32___0 val34 ;
  U32___0 places35 ;
  U32___0 val36 ;
  U32___0 places37 ;
  U32___0 sign38 ;
  char x39[12] ;
  char *p40 ;
  int p_count41 ;
  U32___0 val42 ;
  U32___0 places43 ;
  U32___0 sign44 ;
  char x45[12] ;
  char *p46 ;
  int p_count47 ;
  U32___0 val48 ;
  U32___0 places49 ;
  U32___0 sign50 ;
  char x51[12] ;
  char *p52 ;
  int p_count53 ;
  U32___0 val54 ;
  U32___0 places55 ;
  U32___0 sign56 ;
  char x57[12] ;
  char *p58 ;
  int p_count59 ;
  U32___0 val60 ;
  U32___0 places61 ;
  U32___0 sign62 ;
  char x63[12] ;
  char *p64 ;
  int p_count65 ;
  U32___0 val66 ;
  U32___0 places67 ;
  U32___0 sign68 ;
  char x69[12] ;
  char *p70 ;
  int p_count71 ;
  U32___0 val72 ;
  U32___0 places73 ;
  U32___0 sign74 ;
  char x75[12] ;
  char *p76 ;
  int p_count77 ;
  U32___0 val78 ;
  U32___0 places79 ;
  U32___0 sign80 ;
  char x81[12] ;
  char *p82 ;
  int p_count83 ;
  int val84 ;
  U32___0 places85 ;
  int tmp86 ;
  U32___0 val487 ;
  U32___0 places588 ;
  U32___0 sign689 ;
  char x790[12] ;
  char *p891 ;
  int p_count992 ;
  int val93 ;
  U32___0 places94 ;
  int tmp95 ;
  U32___0 val496 ;
  U32___0 places597 ;
  U32___0 sign698 ;
  char x799[12] ;
  char *p8100 ;
  int p_count9101 ;
  int val102 ;
  U32___0 places103 ;
  int tmp104 ;
  U32___0 val4105 ;
  U32___0 places5106 ;
  U32___0 sign6107 ;
  char x7108[12] ;
  char *p8109 ;
  int p_count9110 ;
  int val111 ;
  U32___0 places112 ;
  int tmp113 ;
  U32___0 val4114 ;
  U32___0 places5115 ;
  U32___0 sign6116 ;
  char x7117[12] ;
  char *p8118 ;
  int p_count9119 ;
  char const *str120 ;
  char const *str121 ;
  char const *str122 ;
  char const *str123 ;
  char const *str124 ;
  char const *str125 ;
  char const *str126 ;
  char const *str127 ;
  char const *str128 ;
  char const *str129 ;
  char const *str130 ;
  char const *str131 ;
  char const *str132 ;
  char const *str133 ;
  char const *str134 ;
  char const *str135 ;
  char const *str136 ;
  char const *str137 ;
  char const *str138 ;
  char const *str139 ;
  int c140 ;
  int i141 ;
  U8___0 *b142 ;
  U8___0 const *f143 ;
  int c144 ;
  int i145 ;
  U8___0 *b146 ;
  U8___0 const *f147 ;
  int c148 ;
  int i149 ;
  U8___0 *b150 ;
  U8___0 const *f151 ;
  int c152 ;
  int i153 ;
  U8___0 *b154 ;
  U8___0 const *f155 ;
  int c156 ;
  int i157 ;
  U8___0 *b158 ;
  U8___0 const *f159 ;
  int c160 ;
  int i161 ;
  U8___0 *b162 ;
  U8___0 const *f163 ;
  int c164 ;
  int i165 ;
  U8___0 *b166 ;
  U8___0 const *f167 ;
  int c168 ;
  int i169 ;
  U8___0 *b170 ;
  U8___0 const *f171 ;
  int c172 ;
  int i173 ;
  U8___0 *b174 ;
  U8___0 const *f175 ;
  int c176 ;
  int i177 ;
  U8___0 *b178 ;
  U8___0 const *f179 ;
  int c180 ;
  int i181 ;
  U8___0 *b182 ;
  U8___0 const *f183 ;
  int c184 ;
  int i185 ;
  U8___0 *b186 ;
  U8___0 const *f187 ;
  int c188 ;
  int i189 ;
  U8___0 *b190 ;
  U8___0 const *f191 ;
  int c192 ;
  int i193 ;
  U8___0 *b194 ;
  U8___0 const *f195 ;
  int c196 ;
  int i197 ;
  U8___0 *b198 ;
  U8___0 const *f199 ;
  int c200 ;
  int i201 ;
  U8___0 *b202 ;
  U8___0 const *f203 ;
  int c204 ;
  int i205 ;
  U8___0 *b206 ;
  U8___0 const *f207 ;
  int c208 ;
  int i209 ;
  U8___0 *b210 ;
  U8___0 const *f211 ;
  int c212 ;
  int i213 ;
  U8___0 *b214 ;
  U8___0 const *f215 ;
  int c216 ;
  int i217 ;
  U8___0 *b218 ;
  U8___0 const *f219 ;
  int x220 ;
  int y221 ;
  int x222 ;
  int y223 ;
  int x224 ;
  int y225 ;
  int x226 ;
  int y227 ;
  int x228 ;
  int y229 ;
  int x230 ;
  int y231 ;
  int x232 ;
  int y233 ;
  int x234 ;
  int y235 ;
  U32___0 updateToo236 ;
  U32 n237 ;
  unsigned long ret_sensor_adc238 ;
  U32 n239 ;
  unsigned long ret_sensor_adc240 ;
  U32 n241 ;
  unsigned long ret_sensor_adc242 ;
  U32 n243 ;
  unsigned long ret_sensor_adc244 ;

  {
# 898 "nxtway_gs/nxtway_gs.c"
  while (1) {
# 899 "nxtway_gs/nxtway_gs.c"
    target_name1 = "NXTway-GS OSEK";
# 900 "nxtway_gs/nxtway_gs.c"
    updateToo236 = (U32___3 )0;
# 901 "nxtway_gs/nxtway_gs.c"
    memset((void *)display_buffer, 0, (size_t___0 )800);
# 902 "nxtway_gs/nxtway_gs.c"
    if (updateToo236) {
# 903 "nxtway_gs/nxtway_gs.c"
      display_tick = 0;
# 904 "nxtway_gs/nxtway_gs.c"
      nxt_lcd_update();
# 905 "nxtway_gs/nxtway_gs.c"
      goto Lret_display_update___0;
      Lret_display_update___0: ;
    }
# 908 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_clear;
    Lret_display_clear:
# 910 "nxtway_gs/nxtway_gs.c"
    x220 = 0;
# 911 "nxtway_gs/nxtway_gs.c"
    y221 = 0;
# 912 "nxtway_gs/nxtway_gs.c"
    display_x = x220;
# 913 "nxtway_gs/nxtway_gs.c"
    display_y = y221;
# 914 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_goto_xy;
    Lret_display_goto_xy:
# 916 "nxtway_gs/nxtway_gs.c"
    str120 = target_name1;
# 917 "nxtway_gs/nxtway_gs.c"
    while (*str120) {
# 918 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str120 != 10) {
# 919 "nxtway_gs/nxtway_gs.c"
        c140 = (int )*str120;
# 920 "nxtway_gs/nxtway_gs.c"
        if (c140 >= 0) {
# 921 "nxtway_gs/nxtway_gs.c"
          if (c140 < 128) {
# 922 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 923 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 924 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 925 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 926 "nxtway_gs/nxtway_gs.c"
                    b142 = & (*(display_buffer + display_y))[display_x * 6];
# 927 "nxtway_gs/nxtway_gs.c"
                    f143 = font[c140];
# 928 "nxtway_gs/nxtway_gs.c"
                    i141 = 0;
# 929 "nxtway_gs/nxtway_gs.c"
                    while (i141 < 5) {
# 930 "nxtway_gs/nxtway_gs.c"
                      *b142 = (U8___0 )*f143;
# 931 "nxtway_gs/nxtway_gs.c"
                      b142 ++;
# 932 "nxtway_gs/nxtway_gs.c"
                      f143 ++;
# 933 "nxtway_gs/nxtway_gs.c"
                      i141 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 941 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char;
        Lret_display_char:
# 943 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 945 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 946 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 948 "nxtway_gs/nxtway_gs.c"
      str120 ++;
    }
# 950 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string;
    Lret_display_string:
# 952 "nxtway_gs/nxtway_gs.c"
    x222 = 0;
# 953 "nxtway_gs/nxtway_gs.c"
    y223 = 1;
# 954 "nxtway_gs/nxtway_gs.c"
    display_x = x222;
# 955 "nxtway_gs/nxtway_gs.c"
    display_y = y223;
# 956 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_goto_xy___0;
    Lret_display_goto_xy___0:
# 958 "nxtway_gs/nxtway_gs.c"
    str121 = "TIME:";
# 959 "nxtway_gs/nxtway_gs.c"
    while (*str121) {
# 960 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str121 != 10) {
# 961 "nxtway_gs/nxtway_gs.c"
        c144 = (int )*str121;
# 962 "nxtway_gs/nxtway_gs.c"
        if (c144 >= 0) {
# 963 "nxtway_gs/nxtway_gs.c"
          if (c144 < 128) {
# 964 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 965 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 966 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 967 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 968 "nxtway_gs/nxtway_gs.c"
                    b146 = & (*(display_buffer + display_y))[display_x * 6];
# 969 "nxtway_gs/nxtway_gs.c"
                    f147 = font[c144];
# 970 "nxtway_gs/nxtway_gs.c"
                    i145 = 0;
# 971 "nxtway_gs/nxtway_gs.c"
                    while (i145 < 5) {
# 972 "nxtway_gs/nxtway_gs.c"
                      *b146 = (U8___0 )*f147;
# 973 "nxtway_gs/nxtway_gs.c"
                      b146 ++;
# 974 "nxtway_gs/nxtway_gs.c"
                      f147 ++;
# 975 "nxtway_gs/nxtway_gs.c"
                      i145 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 983 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___0;
        Lret_display_char___0:
# 985 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 987 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 988 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 990 "nxtway_gs/nxtway_gs.c"
      str121 ++;
    }
# 992 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___0;
    Lret_display_string___0:
# 994 "nxtway_gs/nxtway_gs.c"
    tmp2 = systick_get_ms();
# 995 "nxtway_gs/nxtway_gs.c"
    val20 = tmp2 / 1000UL;
# 996 "nxtway_gs/nxtway_gs.c"
    places21 = (U32___3 )0;
# 997 "nxtway_gs/nxtway_gs.c"
    val36 = val20;
# 998 "nxtway_gs/nxtway_gs.c"
    places37 = places21;
# 999 "nxtway_gs/nxtway_gs.c"
    sign38 = (U32___0 )0;
# 1000 "nxtway_gs/nxtway_gs.c"
    p40 = & x39[11];
# 1001 "nxtway_gs/nxtway_gs.c"
    p_count41 = 0;
# 1002 "nxtway_gs/nxtway_gs.c"
    *p40 = (char)0;
# 1003 "nxtway_gs/nxtway_gs.c"
    if (places37 > 11UL) {
# 1004 "nxtway_gs/nxtway_gs.c"
      places37 = (U32___0 )11;
    }
# 1006 "nxtway_gs/nxtway_gs.c"
    while (val36) {
# 1007 "nxtway_gs/nxtway_gs.c"
      p40 --;
# 1008 "nxtway_gs/nxtway_gs.c"
      p_count41 ++;
# 1009 "nxtway_gs/nxtway_gs.c"
      *p40 = (char )(val36 % 10UL + 48UL);
# 1010 "nxtway_gs/nxtway_gs.c"
      val36 /= 10UL;
    }
# 1012 "nxtway_gs/nxtway_gs.c"
    if (! p_count41) {
# 1013 "nxtway_gs/nxtway_gs.c"
      p40 --;
# 1014 "nxtway_gs/nxtway_gs.c"
      p_count41 ++;
# 1015 "nxtway_gs/nxtway_gs.c"
      *p40 = (char )'0';
    }
# 1017 "nxtway_gs/nxtway_gs.c"
    if (sign38) {
# 1018 "nxtway_gs/nxtway_gs.c"
      p40 --;
# 1019 "nxtway_gs/nxtway_gs.c"
      p_count41 ++;
# 1020 "nxtway_gs/nxtway_gs.c"
      *p40 = (char )'-';
    }
# 1022 "nxtway_gs/nxtway_gs.c"
    while ((U32___0 )p_count41 < places37) {
# 1023 "nxtway_gs/nxtway_gs.c"
      p40 --;
# 1024 "nxtway_gs/nxtway_gs.c"
      p_count41 ++;
# 1025 "nxtway_gs/nxtway_gs.c"
      *p40 = (char )' ';
    }
# 1027 "nxtway_gs/nxtway_gs.c"
    str122 = (char const *)p40;
# 1028 "nxtway_gs/nxtway_gs.c"
    while (*str122) {
# 1029 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str122 != 10) {
# 1030 "nxtway_gs/nxtway_gs.c"
        c148 = (int )*str122;
# 1031 "nxtway_gs/nxtway_gs.c"
        if (c148 >= 0) {
# 1032 "nxtway_gs/nxtway_gs.c"
          if (c148 < 128) {
# 1033 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1034 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1035 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1036 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1037 "nxtway_gs/nxtway_gs.c"
                    b150 = & (*(display_buffer + display_y))[display_x * 6];
# 1038 "nxtway_gs/nxtway_gs.c"
                    f151 = font[c148];
# 1039 "nxtway_gs/nxtway_gs.c"
                    i149 = 0;
# 1040 "nxtway_gs/nxtway_gs.c"
                    while (i149 < 5) {
# 1041 "nxtway_gs/nxtway_gs.c"
                      *b150 = (U8___0 )*f151;
# 1042 "nxtway_gs/nxtway_gs.c"
                      b150 ++;
# 1043 "nxtway_gs/nxtway_gs.c"
                      f151 ++;
# 1044 "nxtway_gs/nxtway_gs.c"
                      i149 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1052 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___1;
        Lret_display_char___1:
# 1054 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 1056 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 1057 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 1059 "nxtway_gs/nxtway_gs.c"
      str122 ++;
    }
# 1061 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___1;
    Lret_display_string___1: ;
# 1063 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned_worker;
    Lret_display_unsigned_worker: ;
# 1065 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned;
    Lret_display_unsigned:
# 1067 "nxtway_gs/nxtway_gs.c"
    x224 = 0;
# 1068 "nxtway_gs/nxtway_gs.c"
    y225 = 2;
# 1069 "nxtway_gs/nxtway_gs.c"
    display_x = x224;
# 1070 "nxtway_gs/nxtway_gs.c"
    display_y = y225;
# 1071 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_goto_xy___1;
    Lret_display_goto_xy___1:
# 1073 "nxtway_gs/nxtway_gs.c"
    str123 = "BATT:";
# 1074 "nxtway_gs/nxtway_gs.c"
    while (*str123) {
# 1075 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str123 != 10) {
# 1076 "nxtway_gs/nxtway_gs.c"
        c152 = (int )*str123;
# 1077 "nxtway_gs/nxtway_gs.c"
        if (c152 >= 0) {
# 1078 "nxtway_gs/nxtway_gs.c"
          if (c152 < 128) {
# 1079 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1080 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1081 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1082 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1083 "nxtway_gs/nxtway_gs.c"
                    b154 = & (*(display_buffer + display_y))[display_x * 6];
# 1084 "nxtway_gs/nxtway_gs.c"
                    f155 = font[c152];
# 1085 "nxtway_gs/nxtway_gs.c"
                    i153 = 0;
# 1086 "nxtway_gs/nxtway_gs.c"
                    while (i153 < 5) {
# 1087 "nxtway_gs/nxtway_gs.c"
                      *b154 = (U8___0 )*f155;
# 1088 "nxtway_gs/nxtway_gs.c"
                      b154 ++;
# 1089 "nxtway_gs/nxtway_gs.c"
                      f155 ++;
# 1090 "nxtway_gs/nxtway_gs.c"
                      i153 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1098 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___2;
        Lret_display_char___2:
# 1100 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 1102 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 1103 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 1105 "nxtway_gs/nxtway_gs.c"
      str123 ++;
    }
# 1107 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___2;
    Lret_display_string___2:
# 1109 "nxtway_gs/nxtway_gs.c"
    val22 = ecrobot_inputs.battery_state / 100UL;
# 1110 "nxtway_gs/nxtway_gs.c"
    places23 = (U32___3 )0;
# 1111 "nxtway_gs/nxtway_gs.c"
    val42 = val22;
# 1112 "nxtway_gs/nxtway_gs.c"
    places43 = places23;
# 1113 "nxtway_gs/nxtway_gs.c"
    sign44 = (U32___0 )0;
# 1114 "nxtway_gs/nxtway_gs.c"
    p46 = & x45[11];
# 1115 "nxtway_gs/nxtway_gs.c"
    p_count47 = 0;
# 1116 "nxtway_gs/nxtway_gs.c"
    *p46 = (char)0;
# 1117 "nxtway_gs/nxtway_gs.c"
    if (places43 > 11UL) {
# 1118 "nxtway_gs/nxtway_gs.c"
      places43 = (U32___0 )11;
    }
# 1120 "nxtway_gs/nxtway_gs.c"
    while (val42) {
# 1121 "nxtway_gs/nxtway_gs.c"
      p46 --;
# 1122 "nxtway_gs/nxtway_gs.c"
      p_count47 ++;
# 1123 "nxtway_gs/nxtway_gs.c"
      *p46 = (char )(val42 % 10UL + 48UL);
# 1124 "nxtway_gs/nxtway_gs.c"
      val42 /= 10UL;
    }
# 1126 "nxtway_gs/nxtway_gs.c"
    if (! p_count47) {
# 1127 "nxtway_gs/nxtway_gs.c"
      p46 --;
# 1128 "nxtway_gs/nxtway_gs.c"
      p_count47 ++;
# 1129 "nxtway_gs/nxtway_gs.c"
      *p46 = (char )'0';
    }
# 1131 "nxtway_gs/nxtway_gs.c"
    if (sign44) {
# 1132 "nxtway_gs/nxtway_gs.c"
      p46 --;
# 1133 "nxtway_gs/nxtway_gs.c"
      p_count47 ++;
# 1134 "nxtway_gs/nxtway_gs.c"
      *p46 = (char )'-';
    }
# 1136 "nxtway_gs/nxtway_gs.c"
    while ((U32___0 )p_count47 < places43) {
# 1137 "nxtway_gs/nxtway_gs.c"
      p46 --;
# 1138 "nxtway_gs/nxtway_gs.c"
      p_count47 ++;
# 1139 "nxtway_gs/nxtway_gs.c"
      *p46 = (char )' ';
    }
# 1141 "nxtway_gs/nxtway_gs.c"
    str124 = (char const *)p46;
# 1142 "nxtway_gs/nxtway_gs.c"
    while (*str124) {
# 1143 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str124 != 10) {
# 1144 "nxtway_gs/nxtway_gs.c"
        c156 = (int )*str124;
# 1145 "nxtway_gs/nxtway_gs.c"
        if (c156 >= 0) {
# 1146 "nxtway_gs/nxtway_gs.c"
          if (c156 < 128) {
# 1147 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1148 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1149 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1150 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1151 "nxtway_gs/nxtway_gs.c"
                    b158 = & (*(display_buffer + display_y))[display_x * 6];
# 1152 "nxtway_gs/nxtway_gs.c"
                    f159 = font[c156];
# 1153 "nxtway_gs/nxtway_gs.c"
                    i157 = 0;
# 1154 "nxtway_gs/nxtway_gs.c"
                    while (i157 < 5) {
# 1155 "nxtway_gs/nxtway_gs.c"
                      *b158 = (U8___0 )*f159;
# 1156 "nxtway_gs/nxtway_gs.c"
                      b158 ++;
# 1157 "nxtway_gs/nxtway_gs.c"
                      f159 ++;
# 1158 "nxtway_gs/nxtway_gs.c"
                      i157 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1166 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___3;
        Lret_display_char___3:
# 1168 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 1170 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 1171 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 1173 "nxtway_gs/nxtway_gs.c"
      str124 ++;
    }
# 1175 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___3;
    Lret_display_string___3: ;
# 1177 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned_worker___0;
    Lret_display_unsigned_worker___0: ;
# 1179 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned___0;
    Lret_display_unsigned___0:
# 1181 "nxtway_gs/nxtway_gs.c"
    x226 = 0;
# 1182 "nxtway_gs/nxtway_gs.c"
    y227 = 3;
# 1183 "nxtway_gs/nxtway_gs.c"
    display_x = x226;
# 1184 "nxtway_gs/nxtway_gs.c"
    display_y = y227;
# 1185 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_goto_xy___2;
    Lret_display_goto_xy___2:
# 1187 "nxtway_gs/nxtway_gs.c"
    str125 = "REV: ";
# 1188 "nxtway_gs/nxtway_gs.c"
    while (*str125) {
# 1189 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str125 != 10) {
# 1190 "nxtway_gs/nxtway_gs.c"
        c160 = (int )*str125;
# 1191 "nxtway_gs/nxtway_gs.c"
        if (c160 >= 0) {
# 1192 "nxtway_gs/nxtway_gs.c"
          if (c160 < 128) {
# 1193 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1194 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1195 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1196 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1197 "nxtway_gs/nxtway_gs.c"
                    b162 = & (*(display_buffer + display_y))[display_x * 6];
# 1198 "nxtway_gs/nxtway_gs.c"
                    f163 = font[c160];
# 1199 "nxtway_gs/nxtway_gs.c"
                    i161 = 0;
# 1200 "nxtway_gs/nxtway_gs.c"
                    while (i161 < 5) {
# 1201 "nxtway_gs/nxtway_gs.c"
                      *b162 = (U8___0 )*f163;
# 1202 "nxtway_gs/nxtway_gs.c"
                      b162 ++;
# 1203 "nxtway_gs/nxtway_gs.c"
                      f163 ++;
# 1204 "nxtway_gs/nxtway_gs.c"
                      i161 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1212 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___4;
        Lret_display_char___4:
# 1214 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 1216 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 1217 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 1219 "nxtway_gs/nxtway_gs.c"
      str125 ++;
    }
# 1221 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___4;
    Lret_display_string___4:
# 1223 "nxtway_gs/nxtway_gs.c"
    n14 = (U32___3 )0;
# 1224 "nxtway_gs/nxtway_gs.c"
    if (n14 < 3UL) {
# 1225 "nxtway_gs/nxtway_gs.c"
      ret_nxt_motor_get_count15 = motor[n14].current_count;
# 1226 "nxtway_gs/nxtway_gs.c"
      goto Lret_nxt_motor_get_count;
    } else {
# 1228 "nxtway_gs/nxtway_gs.c"
      ret_nxt_motor_get_count15 = 0;
# 1229 "nxtway_gs/nxtway_gs.c"
      goto Lret_nxt_motor_get_count;
    }
    Lret_nxt_motor_get_count:
# 1232 "nxtway_gs/nxtway_gs.c"
    tmp___03 = ret_nxt_motor_get_count15;
# 1233 "nxtway_gs/nxtway_gs.c"
    val84 = tmp___03;
# 1234 "nxtway_gs/nxtway_gs.c"
    places85 = (U32___3 )0;
# 1235 "nxtway_gs/nxtway_gs.c"
    if (val84 < 0) {
# 1236 "nxtway_gs/nxtway_gs.c"
      tmp86 = - val84;
    } else {
# 1238 "nxtway_gs/nxtway_gs.c"
      tmp86 = val84;
    }
# 1240 "nxtway_gs/nxtway_gs.c"
    val487 = (U32___0 )tmp86;
# 1241 "nxtway_gs/nxtway_gs.c"
    places588 = places85;
# 1242 "nxtway_gs/nxtway_gs.c"
    sign689 = (U32___0 )(val84 < 0);
# 1243 "nxtway_gs/nxtway_gs.c"
    p891 = & x790[11];
# 1244 "nxtway_gs/nxtway_gs.c"
    p_count992 = 0;
# 1245 "nxtway_gs/nxtway_gs.c"
    *p891 = (char)0;
# 1246 "nxtway_gs/nxtway_gs.c"
    if (places588 > 11UL) {
# 1247 "nxtway_gs/nxtway_gs.c"
      places588 = (U32___0 )11;
    }
# 1249 "nxtway_gs/nxtway_gs.c"
    while (val487) {
# 1250 "nxtway_gs/nxtway_gs.c"
      p891 --;
# 1251 "nxtway_gs/nxtway_gs.c"
      p_count992 ++;
# 1252 "nxtway_gs/nxtway_gs.c"
      *p891 = (char )(val487 % 10UL + 48UL);
# 1253 "nxtway_gs/nxtway_gs.c"
      val487 /= 10UL;
    }
# 1255 "nxtway_gs/nxtway_gs.c"
    if (! p_count992) {
# 1256 "nxtway_gs/nxtway_gs.c"
      p891 --;
# 1257 "nxtway_gs/nxtway_gs.c"
      p_count992 ++;
# 1258 "nxtway_gs/nxtway_gs.c"
      *p891 = (char )'0';
    }
# 1260 "nxtway_gs/nxtway_gs.c"
    if (sign689) {
# 1261 "nxtway_gs/nxtway_gs.c"
      p891 --;
# 1262 "nxtway_gs/nxtway_gs.c"
      p_count992 ++;
# 1263 "nxtway_gs/nxtway_gs.c"
      *p891 = (char )'-';
    }
# 1265 "nxtway_gs/nxtway_gs.c"
    while ((U32___0 )p_count992 < places588) {
# 1266 "nxtway_gs/nxtway_gs.c"
      p891 --;
# 1267 "nxtway_gs/nxtway_gs.c"
      p_count992 ++;
# 1268 "nxtway_gs/nxtway_gs.c"
      *p891 = (char )' ';
    }
# 1270 "nxtway_gs/nxtway_gs.c"
    str126 = (char const *)p891;
# 1271 "nxtway_gs/nxtway_gs.c"
    while (*str126) {
# 1272 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str126 != 10) {
# 1273 "nxtway_gs/nxtway_gs.c"
        c164 = (int )*str126;
# 1274 "nxtway_gs/nxtway_gs.c"
        if (c164 >= 0) {
# 1275 "nxtway_gs/nxtway_gs.c"
          if (c164 < 128) {
# 1276 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1277 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1278 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1279 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1280 "nxtway_gs/nxtway_gs.c"
                    b166 = & (*(display_buffer + display_y))[display_x * 6];
# 1281 "nxtway_gs/nxtway_gs.c"
                    f167 = font[c164];
# 1282 "nxtway_gs/nxtway_gs.c"
                    i165 = 0;
# 1283 "nxtway_gs/nxtway_gs.c"
                    while (i165 < 5) {
# 1284 "nxtway_gs/nxtway_gs.c"
                      *b166 = (U8___0 )*f167;
# 1285 "nxtway_gs/nxtway_gs.c"
                      b166 ++;
# 1286 "nxtway_gs/nxtway_gs.c"
                      f167 ++;
# 1287 "nxtway_gs/nxtway_gs.c"
                      i165 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1295 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___5;
        Lret_display_char___5:
# 1297 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 1299 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 1300 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 1302 "nxtway_gs/nxtway_gs.c"
      str126 ++;
    }
# 1304 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___5;
    Lret_display_string___5: ;
# 1306 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned_worker___7;
    Lret_display_unsigned_worker___7: ;
# 1308 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_int;
    Lret_display_int:
# 1310 "nxtway_gs/nxtway_gs.c"
    n16 = (U32___3 )1;
# 1311 "nxtway_gs/nxtway_gs.c"
    if (n16 < 3UL) {
# 1312 "nxtway_gs/nxtway_gs.c"
      ret_nxt_motor_get_count17 = motor[n16].current_count;
# 1313 "nxtway_gs/nxtway_gs.c"
      goto Lret_nxt_motor_get_count___0;
    } else {
# 1315 "nxtway_gs/nxtway_gs.c"
      ret_nxt_motor_get_count17 = 0;
# 1316 "nxtway_gs/nxtway_gs.c"
      goto Lret_nxt_motor_get_count___0;
    }
    Lret_nxt_motor_get_count___0:
# 1319 "nxtway_gs/nxtway_gs.c"
    tmp___14 = ret_nxt_motor_get_count17;
# 1320 "nxtway_gs/nxtway_gs.c"
    val93 = tmp___14;
# 1321 "nxtway_gs/nxtway_gs.c"
    places94 = (U32___3 )6;
# 1322 "nxtway_gs/nxtway_gs.c"
    if (val93 < 0) {
# 1323 "nxtway_gs/nxtway_gs.c"
      tmp95 = - val93;
    } else {
# 1325 "nxtway_gs/nxtway_gs.c"
      tmp95 = val93;
    }
# 1327 "nxtway_gs/nxtway_gs.c"
    val496 = (U32___0 )tmp95;
# 1328 "nxtway_gs/nxtway_gs.c"
    places597 = places94;
# 1329 "nxtway_gs/nxtway_gs.c"
    sign698 = (U32___0 )(val93 < 0);
# 1330 "nxtway_gs/nxtway_gs.c"
    p8100 = & x799[11];
# 1331 "nxtway_gs/nxtway_gs.c"
    p_count9101 = 0;
# 1332 "nxtway_gs/nxtway_gs.c"
    *p8100 = (char)0;
# 1333 "nxtway_gs/nxtway_gs.c"
    if (places597 > 11UL) {
# 1334 "nxtway_gs/nxtway_gs.c"
      places597 = (U32___0 )11;
    }
# 1336 "nxtway_gs/nxtway_gs.c"
    while (val496) {
# 1337 "nxtway_gs/nxtway_gs.c"
      p8100 --;
# 1338 "nxtway_gs/nxtway_gs.c"
      p_count9101 ++;
# 1339 "nxtway_gs/nxtway_gs.c"
      *p8100 = (char )(val496 % 10UL + 48UL);
# 1340 "nxtway_gs/nxtway_gs.c"
      val496 /= 10UL;
    }
# 1342 "nxtway_gs/nxtway_gs.c"
    if (! p_count9101) {
# 1343 "nxtway_gs/nxtway_gs.c"
      p8100 --;
# 1344 "nxtway_gs/nxtway_gs.c"
      p_count9101 ++;
# 1345 "nxtway_gs/nxtway_gs.c"
      *p8100 = (char )'0';
    }
# 1347 "nxtway_gs/nxtway_gs.c"
    if (sign698) {
# 1348 "nxtway_gs/nxtway_gs.c"
      p8100 --;
# 1349 "nxtway_gs/nxtway_gs.c"
      p_count9101 ++;
# 1350 "nxtway_gs/nxtway_gs.c"
      *p8100 = (char )'-';
    }
# 1352 "nxtway_gs/nxtway_gs.c"
    while ((U32___0 )p_count9101 < places597) {
# 1353 "nxtway_gs/nxtway_gs.c"
      p8100 --;
# 1354 "nxtway_gs/nxtway_gs.c"
      p_count9101 ++;
# 1355 "nxtway_gs/nxtway_gs.c"
      *p8100 = (char )' ';
    }
# 1357 "nxtway_gs/nxtway_gs.c"
    str127 = (char const *)p8100;
# 1358 "nxtway_gs/nxtway_gs.c"
    while (*str127) {
# 1359 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str127 != 10) {
# 1360 "nxtway_gs/nxtway_gs.c"
        c168 = (int )*str127;
# 1361 "nxtway_gs/nxtway_gs.c"
        if (c168 >= 0) {
# 1362 "nxtway_gs/nxtway_gs.c"
          if (c168 < 128) {
# 1363 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1364 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1365 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1366 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1367 "nxtway_gs/nxtway_gs.c"
                    b170 = & (*(display_buffer + display_y))[display_x * 6];
# 1368 "nxtway_gs/nxtway_gs.c"
                    f171 = font[c168];
# 1369 "nxtway_gs/nxtway_gs.c"
                    i169 = 0;
# 1370 "nxtway_gs/nxtway_gs.c"
                    while (i169 < 5) {
# 1371 "nxtway_gs/nxtway_gs.c"
                      *b170 = (U8___0 )*f171;
# 1372 "nxtway_gs/nxtway_gs.c"
                      b170 ++;
# 1373 "nxtway_gs/nxtway_gs.c"
                      f171 ++;
# 1374 "nxtway_gs/nxtway_gs.c"
                      i169 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1382 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___6;
        Lret_display_char___6:
# 1384 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 1386 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 1387 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 1389 "nxtway_gs/nxtway_gs.c"
      str127 ++;
    }
# 1391 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___6;
    Lret_display_string___6: ;
# 1393 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned_worker___8;
    Lret_display_unsigned_worker___8: ;
# 1395 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_int___0;
    Lret_display_int___0:
# 1397 "nxtway_gs/nxtway_gs.c"
    x228 = 0;
# 1398 "nxtway_gs/nxtway_gs.c"
    y229 = 4;
# 1399 "nxtway_gs/nxtway_gs.c"
    display_x = x228;
# 1400 "nxtway_gs/nxtway_gs.c"
    display_y = y229;
# 1401 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_goto_xy___3;
    Lret_display_goto_xy___3:
# 1403 "nxtway_gs/nxtway_gs.c"
    str128 = "     ";
# 1404 "nxtway_gs/nxtway_gs.c"
    while (*str128) {
# 1405 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str128 != 10) {
# 1406 "nxtway_gs/nxtway_gs.c"
        c172 = (int )*str128;
# 1407 "nxtway_gs/nxtway_gs.c"
        if (c172 >= 0) {
# 1408 "nxtway_gs/nxtway_gs.c"
          if (c172 < 128) {
# 1409 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1410 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1411 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1412 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1413 "nxtway_gs/nxtway_gs.c"
                    b174 = & (*(display_buffer + display_y))[display_x * 6];
# 1414 "nxtway_gs/nxtway_gs.c"
                    f175 = font[c172];
# 1415 "nxtway_gs/nxtway_gs.c"
                    i173 = 0;
# 1416 "nxtway_gs/nxtway_gs.c"
                    while (i173 < 5) {
# 1417 "nxtway_gs/nxtway_gs.c"
                      *b174 = (U8___0 )*f175;
# 1418 "nxtway_gs/nxtway_gs.c"
                      b174 ++;
# 1419 "nxtway_gs/nxtway_gs.c"
                      f175 ++;
# 1420 "nxtway_gs/nxtway_gs.c"
                      i173 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1428 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___7;
        Lret_display_char___7:
# 1430 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 1432 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 1433 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 1435 "nxtway_gs/nxtway_gs.c"
      str128 ++;
    }
# 1437 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___7;
    Lret_display_string___7:
# 1439 "nxtway_gs/nxtway_gs.c"
    n18 = (U32___3 )2;
# 1440 "nxtway_gs/nxtway_gs.c"
    if (n18 < 3UL) {
# 1441 "nxtway_gs/nxtway_gs.c"
      ret_nxt_motor_get_count19 = motor[n18].current_count;
# 1442 "nxtway_gs/nxtway_gs.c"
      goto Lret_nxt_motor_get_count___1;
    } else {
# 1444 "nxtway_gs/nxtway_gs.c"
      ret_nxt_motor_get_count19 = 0;
# 1445 "nxtway_gs/nxtway_gs.c"
      goto Lret_nxt_motor_get_count___1;
    }
    Lret_nxt_motor_get_count___1:
# 1448 "nxtway_gs/nxtway_gs.c"
    tmp___25 = ret_nxt_motor_get_count19;
# 1449 "nxtway_gs/nxtway_gs.c"
    val102 = tmp___25;
# 1450 "nxtway_gs/nxtway_gs.c"
    places103 = (U32___3 )0;
# 1451 "nxtway_gs/nxtway_gs.c"
    if (val102 < 0) {
# 1452 "nxtway_gs/nxtway_gs.c"
      tmp104 = - val102;
    } else {
# 1454 "nxtway_gs/nxtway_gs.c"
      tmp104 = val102;
    }
# 1456 "nxtway_gs/nxtway_gs.c"
    val4105 = (U32___0 )tmp104;
# 1457 "nxtway_gs/nxtway_gs.c"
    places5106 = places103;
# 1458 "nxtway_gs/nxtway_gs.c"
    sign6107 = (U32___0 )(val102 < 0);
# 1459 "nxtway_gs/nxtway_gs.c"
    p8109 = & x7108[11];
# 1460 "nxtway_gs/nxtway_gs.c"
    p_count9110 = 0;
# 1461 "nxtway_gs/nxtway_gs.c"
    *p8109 = (char)0;
# 1462 "nxtway_gs/nxtway_gs.c"
    if (places5106 > 11UL) {
# 1463 "nxtway_gs/nxtway_gs.c"
      places5106 = (U32___0 )11;
    }
# 1465 "nxtway_gs/nxtway_gs.c"
    while (val4105) {
# 1466 "nxtway_gs/nxtway_gs.c"
      p8109 --;
# 1467 "nxtway_gs/nxtway_gs.c"
      p_count9110 ++;
# 1468 "nxtway_gs/nxtway_gs.c"
      *p8109 = (char )(val4105 % 10UL + 48UL);
# 1469 "nxtway_gs/nxtway_gs.c"
      val4105 /= 10UL;
    }
# 1471 "nxtway_gs/nxtway_gs.c"
    if (! p_count9110) {
# 1472 "nxtway_gs/nxtway_gs.c"
      p8109 --;
# 1473 "nxtway_gs/nxtway_gs.c"
      p_count9110 ++;
# 1474 "nxtway_gs/nxtway_gs.c"
      *p8109 = (char )'0';
    }
# 1476 "nxtway_gs/nxtway_gs.c"
    if (sign6107) {
# 1477 "nxtway_gs/nxtway_gs.c"
      p8109 --;
# 1478 "nxtway_gs/nxtway_gs.c"
      p_count9110 ++;
# 1479 "nxtway_gs/nxtway_gs.c"
      *p8109 = (char )'-';
    }
# 1481 "nxtway_gs/nxtway_gs.c"
    while ((U32___0 )p_count9110 < places5106) {
# 1482 "nxtway_gs/nxtway_gs.c"
      p8109 --;
# 1483 "nxtway_gs/nxtway_gs.c"
      p_count9110 ++;
# 1484 "nxtway_gs/nxtway_gs.c"
      *p8109 = (char )' ';
    }
# 1486 "nxtway_gs/nxtway_gs.c"
    str129 = (char const *)p8109;
# 1487 "nxtway_gs/nxtway_gs.c"
    while (*str129) {
# 1488 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str129 != 10) {
# 1489 "nxtway_gs/nxtway_gs.c"
        c176 = (int )*str129;
# 1490 "nxtway_gs/nxtway_gs.c"
        if (c176 >= 0) {
# 1491 "nxtway_gs/nxtway_gs.c"
          if (c176 < 128) {
# 1492 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1493 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1494 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1495 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1496 "nxtway_gs/nxtway_gs.c"
                    b178 = & (*(display_buffer + display_y))[display_x * 6];
# 1497 "nxtway_gs/nxtway_gs.c"
                    f179 = font[c176];
# 1498 "nxtway_gs/nxtway_gs.c"
                    i177 = 0;
# 1499 "nxtway_gs/nxtway_gs.c"
                    while (i177 < 5) {
# 1500 "nxtway_gs/nxtway_gs.c"
                      *b178 = (U8___0 )*f179;
# 1501 "nxtway_gs/nxtway_gs.c"
                      b178 ++;
# 1502 "nxtway_gs/nxtway_gs.c"
                      f179 ++;
# 1503 "nxtway_gs/nxtway_gs.c"
                      i177 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1511 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___8;
        Lret_display_char___8:
# 1513 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 1515 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 1516 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 1518 "nxtway_gs/nxtway_gs.c"
      str129 ++;
    }
# 1520 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___8;
    Lret_display_string___8: ;
# 1522 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned_worker___9;
    Lret_display_unsigned_worker___9: ;
# 1524 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_int___1;
    Lret_display_int___1:
# 1526 "nxtway_gs/nxtway_gs.c"
    x230 = 0;
# 1527 "nxtway_gs/nxtway_gs.c"
    y231 = 5;
# 1528 "nxtway_gs/nxtway_gs.c"
    display_x = x230;
# 1529 "nxtway_gs/nxtway_gs.c"
    display_y = y231;
# 1530 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_goto_xy___4;
    Lret_display_goto_xy___4:
# 1532 "nxtway_gs/nxtway_gs.c"
    str130 = "ADC: ";
# 1533 "nxtway_gs/nxtway_gs.c"
    while (*str130) {
# 1534 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str130 != 10) {
# 1535 "nxtway_gs/nxtway_gs.c"
        c180 = (int )*str130;
# 1536 "nxtway_gs/nxtway_gs.c"
        if (c180 >= 0) {
# 1537 "nxtway_gs/nxtway_gs.c"
          if (c180 < 128) {
# 1538 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1539 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1540 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1541 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1542 "nxtway_gs/nxtway_gs.c"
                    b182 = & (*(display_buffer + display_y))[display_x * 6];
# 1543 "nxtway_gs/nxtway_gs.c"
                    f183 = font[c180];
# 1544 "nxtway_gs/nxtway_gs.c"
                    i181 = 0;
# 1545 "nxtway_gs/nxtway_gs.c"
                    while (i181 < 5) {
# 1546 "nxtway_gs/nxtway_gs.c"
                      *b182 = (U8___0 )*f183;
# 1547 "nxtway_gs/nxtway_gs.c"
                      b182 ++;
# 1548 "nxtway_gs/nxtway_gs.c"
                      f183 ++;
# 1549 "nxtway_gs/nxtway_gs.c"
                      i181 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1557 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___9;
        Lret_display_char___9:
# 1559 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 1561 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 1562 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 1564 "nxtway_gs/nxtway_gs.c"
      str130 ++;
    }
# 1566 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___9;
    Lret_display_string___9:
# 1569 "nxtway_gs/nxtway_gs.c"
    n237 = (U32___3 )0;
# 1571 "nxtway_gs/nxtway_gs.c"
    if (n237 < 4UL) {
# 1573 "nxtway_gs/nxtway_gs.c"
      ret_sensor_adc238 = (U32 )io_from_avr->adc_value[n237];
# 1574 "nxtway_gs/nxtway_gs.c"
      goto Lret_sensor_adc;
    } else {
# 1578 "nxtway_gs/nxtway_gs.c"
      ret_sensor_adc238 = (U32 )0;
# 1579 "nxtway_gs/nxtway_gs.c"
      goto Lret_sensor_adc;
    }
    Lret_sensor_adc:
# 1584 "nxtway_gs/nxtway_gs.c"
    tmp___36 = ret_sensor_adc238;
# 1585 "nxtway_gs/nxtway_gs.c"
    val24 = tmp___36;
# 1586 "nxtway_gs/nxtway_gs.c"
    places25 = (U32___3 )0;
# 1587 "nxtway_gs/nxtway_gs.c"
    val48 = val24;
# 1588 "nxtway_gs/nxtway_gs.c"
    places49 = places25;
# 1589 "nxtway_gs/nxtway_gs.c"
    sign50 = (U32___0 )0;
# 1590 "nxtway_gs/nxtway_gs.c"
    p52 = & x51[11];
# 1591 "nxtway_gs/nxtway_gs.c"
    p_count53 = 0;
# 1592 "nxtway_gs/nxtway_gs.c"
    *p52 = (char)0;
# 1594 "nxtway_gs/nxtway_gs.c"
    if (places49 > 11UL) {
# 1595 "nxtway_gs/nxtway_gs.c"
      places49 = (U32___0 )11;
    }
# 1597 "nxtway_gs/nxtway_gs.c"
    while (val48) {
# 1598 "nxtway_gs/nxtway_gs.c"
      p52 --;
# 1599 "nxtway_gs/nxtway_gs.c"
      p_count53 ++;
# 1600 "nxtway_gs/nxtway_gs.c"
      *p52 = (char )(val48 % 10UL + 48UL);
# 1601 "nxtway_gs/nxtway_gs.c"
      val48 /= 10UL;
    }
# 1603 "nxtway_gs/nxtway_gs.c"
    if (! p_count53) {
# 1604 "nxtway_gs/nxtway_gs.c"
      p52 --;
# 1605 "nxtway_gs/nxtway_gs.c"
      p_count53 ++;
# 1606 "nxtway_gs/nxtway_gs.c"
      *p52 = (char )'0';
    }
# 1608 "nxtway_gs/nxtway_gs.c"
    if (sign50) {
# 1609 "nxtway_gs/nxtway_gs.c"
      p52 --;
# 1610 "nxtway_gs/nxtway_gs.c"
      p_count53 ++;
# 1611 "nxtway_gs/nxtway_gs.c"
      *p52 = (char )'-';
    }
# 1613 "nxtway_gs/nxtway_gs.c"
    while ((U32___0 )p_count53 < places49) {
# 1614 "nxtway_gs/nxtway_gs.c"
      p52 --;
# 1615 "nxtway_gs/nxtway_gs.c"
      p_count53 ++;
# 1616 "nxtway_gs/nxtway_gs.c"
      *p52 = (char )' ';
    }
# 1618 "nxtway_gs/nxtway_gs.c"
    str131 = (char const *)p52;
# 1619 "nxtway_gs/nxtway_gs.c"
    while (*str131) {
# 1620 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str131 != 10) {
# 1621 "nxtway_gs/nxtway_gs.c"
        c184 = (int )*str131;
# 1622 "nxtway_gs/nxtway_gs.c"
        if (c184 >= 0) {
# 1623 "nxtway_gs/nxtway_gs.c"
          if (c184 < 128) {
# 1624 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1625 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1626 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1627 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1628 "nxtway_gs/nxtway_gs.c"
                    b186 = & (*(display_buffer + display_y))[display_x * 6];
# 1629 "nxtway_gs/nxtway_gs.c"
                    f187 = font[c184];
# 1630 "nxtway_gs/nxtway_gs.c"
                    i185 = 0;
# 1631 "nxtway_gs/nxtway_gs.c"
                    while (i185 < 5) {
# 1632 "nxtway_gs/nxtway_gs.c"
                      *b186 = (U8___0 )*f187;
# 1633 "nxtway_gs/nxtway_gs.c"
                      b186 ++;
# 1634 "nxtway_gs/nxtway_gs.c"
                      f187 ++;
# 1635 "nxtway_gs/nxtway_gs.c"
                      i185 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1643 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___10;
        Lret_display_char___10:
# 1645 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 1647 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 1648 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 1650 "nxtway_gs/nxtway_gs.c"
      str131 ++;
    }
# 1652 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___10;
    Lret_display_string___10: ;
# 1654 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned_worker___1;
    Lret_display_unsigned_worker___1: ;
# 1656 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned___1;
    Lret_display_unsigned___1:
# 1659 "nxtway_gs/nxtway_gs.c"
    n239 = (U32___3 )1;
# 1661 "nxtway_gs/nxtway_gs.c"
    if (n239 < 4UL) {
# 1663 "nxtway_gs/nxtway_gs.c"
      ret_sensor_adc240 = (U32 )io_from_avr->adc_value[n239];
# 1664 "nxtway_gs/nxtway_gs.c"
      goto Lret_sensor_adc___0;
    } else {
# 1668 "nxtway_gs/nxtway_gs.c"
      ret_sensor_adc240 = (U32 )0;
# 1669 "nxtway_gs/nxtway_gs.c"
      goto Lret_sensor_adc___0;
    }
    Lret_sensor_adc___0:
# 1674 "nxtway_gs/nxtway_gs.c"
    tmp___47 = ret_sensor_adc240;
# 1675 "nxtway_gs/nxtway_gs.c"
    val26 = tmp___47;
# 1676 "nxtway_gs/nxtway_gs.c"
    places27 = (U32___3 )5;
# 1677 "nxtway_gs/nxtway_gs.c"
    val54 = val26;
# 1678 "nxtway_gs/nxtway_gs.c"
    places55 = places27;
# 1679 "nxtway_gs/nxtway_gs.c"
    sign56 = (U32___0 )0;
# 1680 "nxtway_gs/nxtway_gs.c"
    p58 = & x57[11];
# 1681 "nxtway_gs/nxtway_gs.c"
    p_count59 = 0;
# 1682 "nxtway_gs/nxtway_gs.c"
    *p58 = (char)0;
# 1684 "nxtway_gs/nxtway_gs.c"
    if (places55 > 11UL) {
# 1685 "nxtway_gs/nxtway_gs.c"
      places55 = (U32___0 )11;
    }
# 1687 "nxtway_gs/nxtway_gs.c"
    while (val54) {
# 1688 "nxtway_gs/nxtway_gs.c"
      p58 --;
# 1689 "nxtway_gs/nxtway_gs.c"
      p_count59 ++;
# 1690 "nxtway_gs/nxtway_gs.c"
      *p58 = (char )(val54 % 10UL + 48UL);
# 1691 "nxtway_gs/nxtway_gs.c"
      val54 /= 10UL;
    }
# 1693 "nxtway_gs/nxtway_gs.c"
    if (! p_count59) {
# 1694 "nxtway_gs/nxtway_gs.c"
      p58 --;
# 1695 "nxtway_gs/nxtway_gs.c"
      p_count59 ++;
# 1696 "nxtway_gs/nxtway_gs.c"
      *p58 = (char )'0';
    }
# 1698 "nxtway_gs/nxtway_gs.c"
    if (sign56) {
# 1699 "nxtway_gs/nxtway_gs.c"
      p58 --;
# 1700 "nxtway_gs/nxtway_gs.c"
      p_count59 ++;
# 1701 "nxtway_gs/nxtway_gs.c"
      *p58 = (char )'-';
    }
# 1703 "nxtway_gs/nxtway_gs.c"
    while ((U32___0 )p_count59 < places55) {
# 1704 "nxtway_gs/nxtway_gs.c"
      p58 --;
# 1705 "nxtway_gs/nxtway_gs.c"
      p_count59 ++;
# 1706 "nxtway_gs/nxtway_gs.c"
      *p58 = (char )' ';
    }
# 1708 "nxtway_gs/nxtway_gs.c"
    str132 = (char const *)p58;
# 1709 "nxtway_gs/nxtway_gs.c"
    while (*str132) {
# 1710 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str132 != 10) {
# 1711 "nxtway_gs/nxtway_gs.c"
        c188 = (int )*str132;
# 1712 "nxtway_gs/nxtway_gs.c"
        if (c188 >= 0) {
# 1713 "nxtway_gs/nxtway_gs.c"
          if (c188 < 128) {
# 1714 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1715 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1716 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1717 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1718 "nxtway_gs/nxtway_gs.c"
                    b190 = & (*(display_buffer + display_y))[display_x * 6];
# 1719 "nxtway_gs/nxtway_gs.c"
                    f191 = font[c188];
# 1720 "nxtway_gs/nxtway_gs.c"
                    i189 = 0;
# 1721 "nxtway_gs/nxtway_gs.c"
                    while (i189 < 5) {
# 1722 "nxtway_gs/nxtway_gs.c"
                      *b190 = (U8___0 )*f191;
# 1723 "nxtway_gs/nxtway_gs.c"
                      b190 ++;
# 1724 "nxtway_gs/nxtway_gs.c"
                      f191 ++;
# 1725 "nxtway_gs/nxtway_gs.c"
                      i189 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1733 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___11;
        Lret_display_char___11:
# 1735 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 1737 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 1738 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 1740 "nxtway_gs/nxtway_gs.c"
      str132 ++;
    }
# 1742 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___11;
    Lret_display_string___11: ;
# 1744 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned_worker___2;
    Lret_display_unsigned_worker___2: ;
# 1746 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned___2;
    Lret_display_unsigned___2:
# 1748 "nxtway_gs/nxtway_gs.c"
    x232 = 0;
# 1749 "nxtway_gs/nxtway_gs.c"
    y233 = 6;
# 1750 "nxtway_gs/nxtway_gs.c"
    display_x = x232;
# 1751 "nxtway_gs/nxtway_gs.c"
    display_y = y233;
# 1752 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_goto_xy___5;
    Lret_display_goto_xy___5:
# 1754 "nxtway_gs/nxtway_gs.c"
    str133 = "     ";
# 1755 "nxtway_gs/nxtway_gs.c"
    while (*str133) {
# 1756 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str133 != 10) {
# 1757 "nxtway_gs/nxtway_gs.c"
        c192 = (int )*str133;
# 1758 "nxtway_gs/nxtway_gs.c"
        if (c192 >= 0) {
# 1759 "nxtway_gs/nxtway_gs.c"
          if (c192 < 128) {
# 1760 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1761 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1762 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1763 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1764 "nxtway_gs/nxtway_gs.c"
                    b194 = & (*(display_buffer + display_y))[display_x * 6];
# 1765 "nxtway_gs/nxtway_gs.c"
                    f195 = font[c192];
# 1766 "nxtway_gs/nxtway_gs.c"
                    i193 = 0;
# 1767 "nxtway_gs/nxtway_gs.c"
                    while (i193 < 5) {
# 1768 "nxtway_gs/nxtway_gs.c"
                      *b194 = (U8___0 )*f195;
# 1769 "nxtway_gs/nxtway_gs.c"
                      b194 ++;
# 1770 "nxtway_gs/nxtway_gs.c"
                      f195 ++;
# 1771 "nxtway_gs/nxtway_gs.c"
                      i193 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1779 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___12;
        Lret_display_char___12:
# 1781 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 1783 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 1784 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 1786 "nxtway_gs/nxtway_gs.c"
      str133 ++;
    }
# 1788 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___12;
    Lret_display_string___12:
# 1791 "nxtway_gs/nxtway_gs.c"
    n241 = (U32___3 )2;
# 1793 "nxtway_gs/nxtway_gs.c"
    if (n241 < 4UL) {
# 1795 "nxtway_gs/nxtway_gs.c"
      ret_sensor_adc242 = (U32 )io_from_avr->adc_value[n241];
# 1796 "nxtway_gs/nxtway_gs.c"
      goto Lret_sensor_adc___1;
    } else {
# 1800 "nxtway_gs/nxtway_gs.c"
      ret_sensor_adc242 = (U32 )0;
# 1801 "nxtway_gs/nxtway_gs.c"
      goto Lret_sensor_adc___1;
    }
    Lret_sensor_adc___1:
# 1806 "nxtway_gs/nxtway_gs.c"
    tmp___58 = ret_sensor_adc242;
# 1807 "nxtway_gs/nxtway_gs.c"
    val28 = tmp___58;
# 1808 "nxtway_gs/nxtway_gs.c"
    places29 = (U32___3 )0;
# 1809 "nxtway_gs/nxtway_gs.c"
    val60 = val28;
# 1810 "nxtway_gs/nxtway_gs.c"
    places61 = places29;
# 1811 "nxtway_gs/nxtway_gs.c"
    sign62 = (U32___0 )0;
# 1812 "nxtway_gs/nxtway_gs.c"
    p64 = & x63[11];
# 1813 "nxtway_gs/nxtway_gs.c"
    p_count65 = 0;
# 1814 "nxtway_gs/nxtway_gs.c"
    *p64 = (char)0;
# 1816 "nxtway_gs/nxtway_gs.c"
    if (places61 > 11UL) {
# 1817 "nxtway_gs/nxtway_gs.c"
      places61 = (U32___0 )11;
    }
# 1819 "nxtway_gs/nxtway_gs.c"
    while (val60) {
# 1820 "nxtway_gs/nxtway_gs.c"
      p64 --;
# 1821 "nxtway_gs/nxtway_gs.c"
      p_count65 ++;
# 1822 "nxtway_gs/nxtway_gs.c"
      *p64 = (char )(val60 % 10UL + 48UL);
# 1823 "nxtway_gs/nxtway_gs.c"
      val60 /= 10UL;
    }
# 1825 "nxtway_gs/nxtway_gs.c"
    if (! p_count65) {
# 1826 "nxtway_gs/nxtway_gs.c"
      p64 --;
# 1827 "nxtway_gs/nxtway_gs.c"
      p_count65 ++;
# 1828 "nxtway_gs/nxtway_gs.c"
      *p64 = (char )'0';
    }
# 1830 "nxtway_gs/nxtway_gs.c"
    if (sign62) {
# 1831 "nxtway_gs/nxtway_gs.c"
      p64 --;
# 1832 "nxtway_gs/nxtway_gs.c"
      p_count65 ++;
# 1833 "nxtway_gs/nxtway_gs.c"
      *p64 = (char )'-';
    }
# 1835 "nxtway_gs/nxtway_gs.c"
    while ((U32___0 )p_count65 < places61) {
# 1836 "nxtway_gs/nxtway_gs.c"
      p64 --;
# 1837 "nxtway_gs/nxtway_gs.c"
      p_count65 ++;
# 1838 "nxtway_gs/nxtway_gs.c"
      *p64 = (char )' ';
    }
# 1840 "nxtway_gs/nxtway_gs.c"
    str134 = (char const *)p64;
# 1841 "nxtway_gs/nxtway_gs.c"
    while (*str134) {
# 1842 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str134 != 10) {
# 1843 "nxtway_gs/nxtway_gs.c"
        c196 = (int )*str134;
# 1844 "nxtway_gs/nxtway_gs.c"
        if (c196 >= 0) {
# 1845 "nxtway_gs/nxtway_gs.c"
          if (c196 < 128) {
# 1846 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1847 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1848 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1849 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1850 "nxtway_gs/nxtway_gs.c"
                    b198 = & (*(display_buffer + display_y))[display_x * 6];
# 1851 "nxtway_gs/nxtway_gs.c"
                    f199 = font[c196];
# 1852 "nxtway_gs/nxtway_gs.c"
                    i197 = 0;
# 1853 "nxtway_gs/nxtway_gs.c"
                    while (i197 < 5) {
# 1854 "nxtway_gs/nxtway_gs.c"
                      *b198 = (U8___0 )*f199;
# 1855 "nxtway_gs/nxtway_gs.c"
                      b198 ++;
# 1856 "nxtway_gs/nxtway_gs.c"
                      f199 ++;
# 1857 "nxtway_gs/nxtway_gs.c"
                      i197 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1865 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___13;
        Lret_display_char___13:
# 1867 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 1869 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 1870 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 1872 "nxtway_gs/nxtway_gs.c"
      str134 ++;
    }
# 1874 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___13;
    Lret_display_string___13: ;
# 1876 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned_worker___3;
    Lret_display_unsigned_worker___3: ;
# 1878 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned___3;
    Lret_display_unsigned___3:
# 1881 "nxtway_gs/nxtway_gs.c"
    n243 = (U32___3 )3;
# 1883 "nxtway_gs/nxtway_gs.c"
    if (n243 < 4UL) {
# 1885 "nxtway_gs/nxtway_gs.c"
      ret_sensor_adc244 = (U32 )io_from_avr->adc_value[n243];
# 1886 "nxtway_gs/nxtway_gs.c"
      goto Lret_sensor_adc___2;
    } else {
# 1890 "nxtway_gs/nxtway_gs.c"
      ret_sensor_adc244 = (U32 )0;
# 1891 "nxtway_gs/nxtway_gs.c"
      goto Lret_sensor_adc___2;
    }
    Lret_sensor_adc___2:
# 1896 "nxtway_gs/nxtway_gs.c"
    tmp___69 = ret_sensor_adc244;
# 1897 "nxtway_gs/nxtway_gs.c"
    val30 = tmp___69;
# 1898 "nxtway_gs/nxtway_gs.c"
    places31 = (U32___3 )5;
# 1899 "nxtway_gs/nxtway_gs.c"
    val66 = val30;
# 1900 "nxtway_gs/nxtway_gs.c"
    places67 = places31;
# 1901 "nxtway_gs/nxtway_gs.c"
    sign68 = (U32___0 )0;
# 1902 "nxtway_gs/nxtway_gs.c"
    p70 = & x69[11];
# 1903 "nxtway_gs/nxtway_gs.c"
    p_count71 = 0;
# 1904 "nxtway_gs/nxtway_gs.c"
    *p70 = (char)0;
# 1906 "nxtway_gs/nxtway_gs.c"
    if (places67 > 11UL) {
# 1907 "nxtway_gs/nxtway_gs.c"
      places67 = (U32___0 )11;
    }
# 1909 "nxtway_gs/nxtway_gs.c"
    while (val66) {
# 1910 "nxtway_gs/nxtway_gs.c"
      p70 --;
# 1911 "nxtway_gs/nxtway_gs.c"
      p_count71 ++;
# 1912 "nxtway_gs/nxtway_gs.c"
      *p70 = (char )(val66 % 10UL + 48UL);
# 1913 "nxtway_gs/nxtway_gs.c"
      val66 /= 10UL;
    }
# 1915 "nxtway_gs/nxtway_gs.c"
    if (! p_count71) {
# 1916 "nxtway_gs/nxtway_gs.c"
      p70 --;
# 1917 "nxtway_gs/nxtway_gs.c"
      p_count71 ++;
# 1918 "nxtway_gs/nxtway_gs.c"
      *p70 = (char )'0';
    }
# 1920 "nxtway_gs/nxtway_gs.c"
    if (sign68) {
# 1921 "nxtway_gs/nxtway_gs.c"
      p70 --;
# 1922 "nxtway_gs/nxtway_gs.c"
      p_count71 ++;
# 1923 "nxtway_gs/nxtway_gs.c"
      *p70 = (char )'-';
    }
# 1925 "nxtway_gs/nxtway_gs.c"
    while ((U32___0 )p_count71 < places67) {
# 1926 "nxtway_gs/nxtway_gs.c"
      p70 --;
# 1927 "nxtway_gs/nxtway_gs.c"
      p_count71 ++;
# 1928 "nxtway_gs/nxtway_gs.c"
      *p70 = (char )' ';
    }
# 1930 "nxtway_gs/nxtway_gs.c"
    str135 = (char const *)p70;
# 1931 "nxtway_gs/nxtway_gs.c"
    while (*str135) {
# 1932 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str135 != 10) {
# 1933 "nxtway_gs/nxtway_gs.c"
        c200 = (int )*str135;
# 1934 "nxtway_gs/nxtway_gs.c"
        if (c200 >= 0) {
# 1935 "nxtway_gs/nxtway_gs.c"
          if (c200 < 128) {
# 1936 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1937 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1938 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1939 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1940 "nxtway_gs/nxtway_gs.c"
                    b202 = & (*(display_buffer + display_y))[display_x * 6];
# 1941 "nxtway_gs/nxtway_gs.c"
                    f203 = font[c200];
# 1942 "nxtway_gs/nxtway_gs.c"
                    i201 = 0;
# 1943 "nxtway_gs/nxtway_gs.c"
                    while (i201 < 5) {
# 1944 "nxtway_gs/nxtway_gs.c"
                      *b202 = (U8___0 )*f203;
# 1945 "nxtway_gs/nxtway_gs.c"
                      b202 ++;
# 1946 "nxtway_gs/nxtway_gs.c"
                      f203 ++;
# 1947 "nxtway_gs/nxtway_gs.c"
                      i201 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1955 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___14;
        Lret_display_char___14:
# 1957 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 1959 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 1960 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 1962 "nxtway_gs/nxtway_gs.c"
      str135 ++;
    }
# 1964 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___14;
    Lret_display_string___14: ;
# 1966 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned_worker___4;
    Lret_display_unsigned_worker___4: ;
# 1968 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned___4;
    Lret_display_unsigned___4:
# 1970 "nxtway_gs/nxtway_gs.c"
    x234 = 0;
# 1971 "nxtway_gs/nxtway_gs.c"
    y235 = 7;
# 1972 "nxtway_gs/nxtway_gs.c"
    display_x = x234;
# 1973 "nxtway_gs/nxtway_gs.c"
    display_y = y235;
# 1974 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_goto_xy___6;
    Lret_display_goto_xy___6:
# 1976 "nxtway_gs/nxtway_gs.c"
    str136 = "BT/DST: ";
# 1977 "nxtway_gs/nxtway_gs.c"
    while (*str136) {
# 1978 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str136 != 10) {
# 1979 "nxtway_gs/nxtway_gs.c"
        c204 = (int )*str136;
# 1980 "nxtway_gs/nxtway_gs.c"
        if (c204 >= 0) {
# 1981 "nxtway_gs/nxtway_gs.c"
          if (c204 < 128) {
# 1982 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 1983 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 1984 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 1985 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 1986 "nxtway_gs/nxtway_gs.c"
                    b206 = & (*(display_buffer + display_y))[display_x * 6];
# 1987 "nxtway_gs/nxtway_gs.c"
                    f207 = font[c204];
# 1988 "nxtway_gs/nxtway_gs.c"
                    i205 = 0;
# 1989 "nxtway_gs/nxtway_gs.c"
                    while (i205 < 5) {
# 1990 "nxtway_gs/nxtway_gs.c"
                      *b206 = (U8___0 )*f207;
# 1991 "nxtway_gs/nxtway_gs.c"
                      b206 ++;
# 1992 "nxtway_gs/nxtway_gs.c"
                      f207 ++;
# 1993 "nxtway_gs/nxtway_gs.c"
                      i205 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 2001 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___15;
        Lret_display_char___15:
# 2003 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 2005 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 2006 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 2008 "nxtway_gs/nxtway_gs.c"
      str136 ++;
    }
# 2010 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___15;
    Lret_display_string___15:
# 2012 "nxtway_gs/nxtway_gs.c"
    ret_ecrobot_get_bt_status13 = (SINT )bt_status;
# 2013 "nxtway_gs/nxtway_gs.c"
    goto Lret_ecrobot_get_bt_status;
    Lret_ecrobot_get_bt_status:
# 2015 "nxtway_gs/nxtway_gs.c"
    tmp___710 = ret_ecrobot_get_bt_status13;
# 2016 "nxtway_gs/nxtway_gs.c"
    if (tmp___710 == 7) {
# 2017 "nxtway_gs/nxtway_gs.c"
      val32 = (U32___3 )1;
# 2018 "nxtway_gs/nxtway_gs.c"
      places33 = (U32___3 )0;
# 2019 "nxtway_gs/nxtway_gs.c"
      val72 = val32;
# 2020 "nxtway_gs/nxtway_gs.c"
      places73 = places33;
# 2021 "nxtway_gs/nxtway_gs.c"
      sign74 = (U32___0 )0;
# 2022 "nxtway_gs/nxtway_gs.c"
      p76 = & x75[11];
# 2023 "nxtway_gs/nxtway_gs.c"
      p_count77 = 0;
# 2024 "nxtway_gs/nxtway_gs.c"
      *p76 = (char)0;
# 2025 "nxtway_gs/nxtway_gs.c"
      if (places73 > 11UL) {
# 2026 "nxtway_gs/nxtway_gs.c"
        places73 = (U32___0 )11;
      }
# 2028 "nxtway_gs/nxtway_gs.c"
      while (val72) {
# 2029 "nxtway_gs/nxtway_gs.c"
        p76 --;
# 2030 "nxtway_gs/nxtway_gs.c"
        p_count77 ++;
# 2031 "nxtway_gs/nxtway_gs.c"
        *p76 = (char )(val72 % 10UL + 48UL);
# 2032 "nxtway_gs/nxtway_gs.c"
        val72 /= 10UL;
      }
# 2034 "nxtway_gs/nxtway_gs.c"
      if (! p_count77) {
# 2035 "nxtway_gs/nxtway_gs.c"
        p76 --;
# 2036 "nxtway_gs/nxtway_gs.c"
        p_count77 ++;
# 2037 "nxtway_gs/nxtway_gs.c"
        *p76 = (char )'0';
      }
# 2039 "nxtway_gs/nxtway_gs.c"
      if (sign74) {
# 2040 "nxtway_gs/nxtway_gs.c"
        p76 --;
# 2041 "nxtway_gs/nxtway_gs.c"
        p_count77 ++;
# 2042 "nxtway_gs/nxtway_gs.c"
        *p76 = (char )'-';
      }
# 2044 "nxtway_gs/nxtway_gs.c"
      while ((U32___0 )p_count77 < places73) {
# 2045 "nxtway_gs/nxtway_gs.c"
        p76 --;
# 2046 "nxtway_gs/nxtway_gs.c"
        p_count77 ++;
# 2047 "nxtway_gs/nxtway_gs.c"
        *p76 = (char )' ';
      }
# 2049 "nxtway_gs/nxtway_gs.c"
      str137 = (char const *)p76;
# 2050 "nxtway_gs/nxtway_gs.c"
      while (*str137) {
# 2051 "nxtway_gs/nxtway_gs.c"
        if ((int const )*str137 != 10) {
# 2052 "nxtway_gs/nxtway_gs.c"
          c208 = (int )*str137;
# 2053 "nxtway_gs/nxtway_gs.c"
          if (c208 >= 0) {
# 2054 "nxtway_gs/nxtway_gs.c"
            if (c208 < 128) {
# 2055 "nxtway_gs/nxtway_gs.c"
              if (display_x >= 0) {
# 2056 "nxtway_gs/nxtway_gs.c"
                if (display_x < 16) {
# 2057 "nxtway_gs/nxtway_gs.c"
                  if (display_y >= 0) {
# 2058 "nxtway_gs/nxtway_gs.c"
                    if (display_y < 8) {
# 2059 "nxtway_gs/nxtway_gs.c"
                      b210 = & (*(display_buffer + display_y))[display_x * 6];
# 2060 "nxtway_gs/nxtway_gs.c"
                      f211 = font[c208];
# 2061 "nxtway_gs/nxtway_gs.c"
                      i209 = 0;
# 2062 "nxtway_gs/nxtway_gs.c"
                      while (i209 < 5) {
# 2063 "nxtway_gs/nxtway_gs.c"
                        *b210 = (U8___0 )*f211;
# 2064 "nxtway_gs/nxtway_gs.c"
                        b210 ++;
# 2065 "nxtway_gs/nxtway_gs.c"
                        f211 ++;
# 2066 "nxtway_gs/nxtway_gs.c"
                        i209 ++;
                      }
                    }
                  }
                }
              }
            }
          }
# 2074 "nxtway_gs/nxtway_gs.c"
          goto Lret_display_char___16;
          Lret_display_char___16:
# 2076 "nxtway_gs/nxtway_gs.c"
          display_x ++;
        } else {
# 2078 "nxtway_gs/nxtway_gs.c"
          display_x = 0;
# 2079 "nxtway_gs/nxtway_gs.c"
          display_y ++;
        }
# 2081 "nxtway_gs/nxtway_gs.c"
        str137 ++;
      }
# 2083 "nxtway_gs/nxtway_gs.c"
      goto Lret_display_string___16;
      Lret_display_string___16: ;
# 2085 "nxtway_gs/nxtway_gs.c"
      goto Lret_display_unsigned_worker___5;
      Lret_display_unsigned_worker___5: ;
# 2087 "nxtway_gs/nxtway_gs.c"
      goto Lret_display_unsigned___5;
      Lret_display_unsigned___5: ;
    } else {
# 2090 "nxtway_gs/nxtway_gs.c"
      val34 = (U32___3 )0;
# 2091 "nxtway_gs/nxtway_gs.c"
      places35 = (U32___3 )0;
# 2092 "nxtway_gs/nxtway_gs.c"
      val78 = val34;
# 2093 "nxtway_gs/nxtway_gs.c"
      places79 = places35;
# 2094 "nxtway_gs/nxtway_gs.c"
      sign80 = (U32___0 )0;
# 2095 "nxtway_gs/nxtway_gs.c"
      p82 = & x81[11];
# 2096 "nxtway_gs/nxtway_gs.c"
      p_count83 = 0;
# 2097 "nxtway_gs/nxtway_gs.c"
      *p82 = (char)0;
# 2098 "nxtway_gs/nxtway_gs.c"
      if (places79 > 11UL) {
# 2099 "nxtway_gs/nxtway_gs.c"
        places79 = (U32___0 )11;
      }
# 2101 "nxtway_gs/nxtway_gs.c"
      while (val78) {
# 2102 "nxtway_gs/nxtway_gs.c"
        p82 --;
# 2103 "nxtway_gs/nxtway_gs.c"
        p_count83 ++;
# 2104 "nxtway_gs/nxtway_gs.c"
        *p82 = (char )(val78 % 10UL + 48UL);
# 2105 "nxtway_gs/nxtway_gs.c"
        val78 /= 10UL;
      }
# 2107 "nxtway_gs/nxtway_gs.c"
      if (! p_count83) {
# 2108 "nxtway_gs/nxtway_gs.c"
        p82 --;
# 2109 "nxtway_gs/nxtway_gs.c"
        p_count83 ++;
# 2110 "nxtway_gs/nxtway_gs.c"
        *p82 = (char )'0';
      }
# 2112 "nxtway_gs/nxtway_gs.c"
      if (sign80) {
# 2113 "nxtway_gs/nxtway_gs.c"
        p82 --;
# 2114 "nxtway_gs/nxtway_gs.c"
        p_count83 ++;
# 2115 "nxtway_gs/nxtway_gs.c"
        *p82 = (char )'-';
      }
# 2117 "nxtway_gs/nxtway_gs.c"
      while ((U32___0 )p_count83 < places79) {
# 2118 "nxtway_gs/nxtway_gs.c"
        p82 --;
# 2119 "nxtway_gs/nxtway_gs.c"
        p_count83 ++;
# 2120 "nxtway_gs/nxtway_gs.c"
        *p82 = (char )' ';
      }
# 2122 "nxtway_gs/nxtway_gs.c"
      str138 = (char const *)p82;
# 2123 "nxtway_gs/nxtway_gs.c"
      while (*str138) {
# 2124 "nxtway_gs/nxtway_gs.c"
        if ((int const )*str138 != 10) {
# 2125 "nxtway_gs/nxtway_gs.c"
          c212 = (int )*str138;
# 2126 "nxtway_gs/nxtway_gs.c"
          if (c212 >= 0) {
# 2127 "nxtway_gs/nxtway_gs.c"
            if (c212 < 128) {
# 2128 "nxtway_gs/nxtway_gs.c"
              if (display_x >= 0) {
# 2129 "nxtway_gs/nxtway_gs.c"
                if (display_x < 16) {
# 2130 "nxtway_gs/nxtway_gs.c"
                  if (display_y >= 0) {
# 2131 "nxtway_gs/nxtway_gs.c"
                    if (display_y < 8) {
# 2132 "nxtway_gs/nxtway_gs.c"
                      b214 = & (*(display_buffer + display_y))[display_x * 6];
# 2133 "nxtway_gs/nxtway_gs.c"
                      f215 = font[c212];
# 2134 "nxtway_gs/nxtway_gs.c"
                      i213 = 0;
# 2135 "nxtway_gs/nxtway_gs.c"
                      while (i213 < 5) {
# 2136 "nxtway_gs/nxtway_gs.c"
                        *b214 = (U8___0 )*f215;
# 2137 "nxtway_gs/nxtway_gs.c"
                        b214 ++;
# 2138 "nxtway_gs/nxtway_gs.c"
                        f215 ++;
# 2139 "nxtway_gs/nxtway_gs.c"
                        i213 ++;
                      }
                    }
                  }
                }
              }
            }
          }
# 2147 "nxtway_gs/nxtway_gs.c"
          goto Lret_display_char___17;
          Lret_display_char___17:
# 2149 "nxtway_gs/nxtway_gs.c"
          display_x ++;
        } else {
# 2151 "nxtway_gs/nxtway_gs.c"
          display_x = 0;
# 2152 "nxtway_gs/nxtway_gs.c"
          display_y ++;
        }
# 2154 "nxtway_gs/nxtway_gs.c"
        str138 ++;
      }
# 2156 "nxtway_gs/nxtway_gs.c"
      goto Lret_display_string___17;
      Lret_display_string___17: ;
# 2158 "nxtway_gs/nxtway_gs.c"
      goto Lret_display_unsigned_worker___6;
      Lret_display_unsigned_worker___6: ;
# 2160 "nxtway_gs/nxtway_gs.c"
      goto Lret_display_unsigned___6;
      Lret_display_unsigned___6: ;
    }
# 2163 "nxtway_gs/nxtway_gs.c"
    tmp = getDistance();
# 2164 "nxtway_gs/nxtway_gs.c"
    tmp___811 = (S32___1 )tmp;
# 2165 "nxtway_gs/nxtway_gs.c"
    val111 = (int )tmp___811;
# 2166 "nxtway_gs/nxtway_gs.c"
    places112 = (U32___3 )5;
# 2167 "nxtway_gs/nxtway_gs.c"
    if (val111 < 0) {
# 2168 "nxtway_gs/nxtway_gs.c"
      tmp113 = - val111;
    } else {
# 2170 "nxtway_gs/nxtway_gs.c"
      tmp113 = val111;
    }
# 2172 "nxtway_gs/nxtway_gs.c"
    val4114 = (U32___0 )tmp113;
# 2173 "nxtway_gs/nxtway_gs.c"
    places5115 = places112;
# 2174 "nxtway_gs/nxtway_gs.c"
    sign6116 = (U32___0 )(val111 < 0);
# 2175 "nxtway_gs/nxtway_gs.c"
    p8118 = & x7117[11];
# 2176 "nxtway_gs/nxtway_gs.c"
    p_count9119 = 0;
# 2177 "nxtway_gs/nxtway_gs.c"
    *p8118 = (char)0;
# 2178 "nxtway_gs/nxtway_gs.c"
    if (places5115 > 11UL) {
# 2179 "nxtway_gs/nxtway_gs.c"
      places5115 = (U32___0 )11;
    }
# 2181 "nxtway_gs/nxtway_gs.c"
    while (val4114) {
# 2182 "nxtway_gs/nxtway_gs.c"
      p8118 --;
# 2183 "nxtway_gs/nxtway_gs.c"
      p_count9119 ++;
# 2184 "nxtway_gs/nxtway_gs.c"
      *p8118 = (char )(val4114 % 10UL + 48UL);
# 2185 "nxtway_gs/nxtway_gs.c"
      val4114 /= 10UL;
    }
# 2187 "nxtway_gs/nxtway_gs.c"
    if (! p_count9119) {
# 2188 "nxtway_gs/nxtway_gs.c"
      p8118 --;
# 2189 "nxtway_gs/nxtway_gs.c"
      p_count9119 ++;
# 2190 "nxtway_gs/nxtway_gs.c"
      *p8118 = (char )'0';
    }
# 2192 "nxtway_gs/nxtway_gs.c"
    if (sign6116) {
# 2193 "nxtway_gs/nxtway_gs.c"
      p8118 --;
# 2194 "nxtway_gs/nxtway_gs.c"
      p_count9119 ++;
# 2195 "nxtway_gs/nxtway_gs.c"
      *p8118 = (char )'-';
    }
# 2197 "nxtway_gs/nxtway_gs.c"
    while ((U32___0 )p_count9119 < places5115) {
# 2198 "nxtway_gs/nxtway_gs.c"
      p8118 --;
# 2199 "nxtway_gs/nxtway_gs.c"
      p_count9119 ++;
# 2200 "nxtway_gs/nxtway_gs.c"
      *p8118 = (char )' ';
    }
# 2202 "nxtway_gs/nxtway_gs.c"
    str139 = (char const *)p8118;
# 2203 "nxtway_gs/nxtway_gs.c"
    while (*str139) {
# 2204 "nxtway_gs/nxtway_gs.c"
      if ((int const )*str139 != 10) {
# 2205 "nxtway_gs/nxtway_gs.c"
        c216 = (int )*str139;
# 2206 "nxtway_gs/nxtway_gs.c"
        if (c216 >= 0) {
# 2207 "nxtway_gs/nxtway_gs.c"
          if (c216 < 128) {
# 2208 "nxtway_gs/nxtway_gs.c"
            if (display_x >= 0) {
# 2209 "nxtway_gs/nxtway_gs.c"
              if (display_x < 16) {
# 2210 "nxtway_gs/nxtway_gs.c"
                if (display_y >= 0) {
# 2211 "nxtway_gs/nxtway_gs.c"
                  if (display_y < 8) {
# 2212 "nxtway_gs/nxtway_gs.c"
                    b218 = & (*(display_buffer + display_y))[display_x * 6];
# 2213 "nxtway_gs/nxtway_gs.c"
                    f219 = font[c216];
# 2214 "nxtway_gs/nxtway_gs.c"
                    i217 = 0;
# 2215 "nxtway_gs/nxtway_gs.c"
                    while (i217 < 5) {
# 2216 "nxtway_gs/nxtway_gs.c"
                      *b218 = (U8___0 )*f219;
# 2217 "nxtway_gs/nxtway_gs.c"
                      b218 ++;
# 2218 "nxtway_gs/nxtway_gs.c"
                      f219 ++;
# 2219 "nxtway_gs/nxtway_gs.c"
                      i217 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 2227 "nxtway_gs/nxtway_gs.c"
        goto Lret_display_char___18;
        Lret_display_char___18:
# 2229 "nxtway_gs/nxtway_gs.c"
        display_x ++;
      } else {
# 2231 "nxtway_gs/nxtway_gs.c"
        display_x = 0;
# 2232 "nxtway_gs/nxtway_gs.c"
        display_y ++;
      }
# 2234 "nxtway_gs/nxtway_gs.c"
      str139 ++;
    }
# 2236 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_string___18;
    Lret_display_string___18: ;
# 2238 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_unsigned_worker___10;
    Lret_display_unsigned_worker___10: ;
# 2240 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_int___2;
    Lret_display_int___2:
# 2242 "nxtway_gs/nxtway_gs.c"
    display_tick = 0;
# 2243 "nxtway_gs/nxtway_gs.c"
    nxt_lcd_update();
# 2244 "nxtway_gs/nxtway_gs.c"
    goto Lret_display_update;
    Lret_display_update: ;
# 2246 "nxtway_gs/nxtway_gs.c"
    goto Lret_ecrobot_status_monitor;
    Lret_ecrobot_status_monitor:
# 2248 "nxtway_gs/nxtway_gs.c"
    systick_wait_ms((U32___4 )500U);
  }
}
}
# 2252 "nxtway_gs/nxtway_gs.c"
extern int create_task() ;
# 2253 "nxtway_gs/nxtway_gs.c"
void main(void)
{


  {
# 2258 "nxtway_gs/nxtway_gs.c"
  create_task("TaskMainOSEK_Task_ts1", "TaskMainOSEK_Task_ts1", 3, 4, 0.147);
# 2259 "nxtway_gs/nxtway_gs.c"
  create_task("TaskMainOSEK_Task_ts2", "TaskMainOSEK_Task_ts2", 2, 40, 0.029);
# 2260 "nxtway_gs/nxtway_gs.c"
  create_task("TaskMainOSEK_Task_Background", "TaskMainOSEK_Task_Background", 1, 100,
              54.259);
# 2261 "nxtway_gs/nxtway_gs.c"
  return;
}
}

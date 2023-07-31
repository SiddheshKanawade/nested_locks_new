# 1 "./carR.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./carR.cil.c"
# 4 "car/carR.c"
typedef unsigned char U8;
# 5 "car/carR.c"
typedef unsigned long U32;
# 6 "car/carR.c"
typedef unsigned char byte;
# 7 "car/carR.c"
typedef unsigned short TWOBYTES;
# 11 "car/carR.c"
struct _freeBlock {
   TWOBYTES size : 15 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 15 "car/carR.c"
struct _objects {
   byte _class ;
   byte padding : 5 ;
   byte mark : 1 ;
   byte isArray : 1 ;
   byte isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 22 "car/carR.c"
struct _arrays {
   TWOBYTES length : 9 ;
   TWOBYTES type : 4 ;
   TWOBYTES mark : 1 ;
   TWOBYTES isArray : 1 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 29 "car/carR.c"
union _flags {
   TWOBYTES all ;
   struct _freeBlock freeBlock ;
   struct _objects objects ;
   struct _arrays arrays ;
} __attribute__((__packed__)) ;
# 35 "car/carR.c"
struct S_Object {
   union _flags flags ;
   byte monitorCount ;
   byte threadId ;
} __attribute__((__packed__)) ;
# 40 "car/carR.c"
typedef struct S_Object Object;
# 42 "car/carR.c"
typedef unsigned long size_t;
# 43 "car/carR.c"
struct __anonstruct_display_array_740464799 {
   Object hdr ;
   U8 displayN[9][100] ;
} __attribute__((__packed__)) ;
# 47 "car/carR.c"
typedef unsigned char U8___0;
# 48 "car/carR.c"
typedef signed char S8___0;
# 50 "car/carR.c"
typedef unsigned long U32___0;
# 52 "car/carR.c"
struct __anonstruct_to_avr_432250394 {
   U8___0 power ;
   U8___0 pwm_frequency ;
   S8___0 output_percent[4] ;
   U8___0 output_mode ;
   U8___0 input_power ;
} __attribute__((__packed__)) ;
# 59 "car/carR.c"
typedef struct __anonstruct_to_avr_432250394 to_avr;
# 74 "car/carR.c"
typedef unsigned long U32___1;
# 76 "car/carR.c"
struct motor_struct {
   int current_count ;
   int target_count ;
   int speed_percent ;
   U32___1 last ;
};
# 82 "car/carR.c"
typedef unsigned char UINT8;
# 83 "car/carR.c"
typedef UINT8 StatusType;
# 84 "car/carR.c"
typedef UINT8 ResourceType;
# 85 "car/carR.c"
typedef unsigned char U8___1;
# 89 "car/carR.c"
typedef unsigned long U32___2;
# 90 "car/carR.c"
typedef long S32___0;
# 91 "car/carR.c"
typedef char CHAR;
# 93 "car/carR.c"
typedef int SINT;
# 250 "car/carR.c"
struct sMotorResource_t {
   S32___0 sTurnDistance ;
   S32___0 sSonarDistance ;
   S32___0 sRightMotor ;
   S32___0 sLeftMotor ;
   S32___0 sCalibratedDistance ;
};
# 264 "car/carR.c"
extern void display_int(int val , U32 places ) ;
# 271 "car/carR.c"
int display_tick ;
# 272 "car/carR.c"
int display_auto_update ;
# 276 "car/carR.c"
extern void nxt_lcd_update(void) ;
# 279 "car/carR.c"
extern void systick_wait_ms(unsigned long ms ) ;
# 289 "car/carR.c"
U8 const *displayM = (U8 const *)((U8 *)0);
# 290 "car/carR.c"
unsigned char dirty = (U8 )0;
# 291 "car/carR.c"
unsigned char page = (U8 )0;
# 292 "car/carR.c"
U8 const *dataM = (U8 const *)((U8 *)0);
# 293 "car/carR.c"
U8 mode = (U8 )255;
# 309 "car/carR.c"
extern __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1), __leaf__)) memset)(void *__s ,
                                                                                               int __c ,
                                                                                               unsigned long __n ) ;
# 315 "car/carR.c"
static struct __anonstruct_display_array_740464799 display_array ;
# 316 "car/carR.c"
static U8 (*display_buffer)[100] = display_array.displayN;
# 317 "car/carR.c"
static U8 const font[128][5] =
# 317 "car/carR.c"
  { { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )85, (U8 const )97, (U8 const )85,
            (U8 const )62},
   { (U8 const )62, (U8 const )107, (U8 const )95, (U8 const )107,
            (U8 const )62},
   { (U8 const )12, (U8 const )30, (U8 const )60, (U8 const )30,
            (U8 const )12},
   { (U8 const )8, (U8 const )28, (U8 const )62, (U8 const )28,
            (U8 const )8},
   { (U8 const )24, (U8 const )94, (U8 const )126, (U8 const )94,
            (U8 const )24},
   { (U8 const )24, (U8 const )92, (U8 const )126, (U8 const )92,
            (U8 const )24},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62},
   { (U8 const )0, (U8 const )0, (U8 const )0, (U8 const )0,
            (U8 const )0},
   { (U8 const )0, (U8 const )0, (U8 const )95, (U8 const )0,
            (U8 const )0},
   { (U8 const )0, (U8 const )7, (U8 const )0, (U8 const )7,
            (U8 const )0},
   { (U8 const )20, (U8 const )62, (U8 const )20, (U8 const )62,
            (U8 const )20},
   { (U8 const )4, (U8 const )42, (U8 const )127, (U8 const )42,
            (U8 const )16},
   { (U8 const )38, (U8 const )22, (U8 const )8, (U8 const )52,
            (U8 const )50},
   { (U8 const )54, (U8 const )73, (U8 const )89, (U8 const )38,
            (U8 const )80},
   { (U8 const )0, (U8 const )0, (U8 const )7, (U8 const )0,
            (U8 const )0},
   { (U8 const )0, (U8 const )28, (U8 const )34, (U8 const )65,
            (U8 const )0},
   { (U8 const )0, (U8 const )65, (U8 const )34, (U8 const )28,
            (U8 const )0},
   { (U8 const )42, (U8 const )28, (U8 const )127, (U8 const )28,
            (U8 const )42},
   { (U8 const )8, (U8 const )8, (U8 const )62, (U8 const )8,
            (U8 const )8},
   { (U8 const )0, (U8 const )80, (U8 const )48, (U8 const )0,
            (U8 const )0},
   { (U8 const )8, (U8 const )8, (U8 const )8, (U8 const )8,
            (U8 const )8},
   { (U8 const )0, (U8 const )96, (U8 const )96, (U8 const )0,
            (U8 const )0},
   { (U8 const )32, (U8 const )16, (U8 const )8, (U8 const )4,
            (U8 const )2},
   { (U8 const )62, (U8 const )81, (U8 const )73, (U8 const )69,
            (U8 const )62},
   { (U8 const )0, (U8 const )66, (U8 const )127, (U8 const )64,
            (U8 const )0},
   { (U8 const )66, (U8 const )97, (U8 const )81, (U8 const )73,
            (U8 const )70},
   { (U8 const )33, (U8 const )65, (U8 const )69, (U8 const )75,
            (U8 const )49},
   { (U8 const )24, (U8 const )20, (U8 const )18, (U8 const )127,
            (U8 const )16},
   { (U8 const )39, (U8 const )69, (U8 const )69, (U8 const )69,
            (U8 const )57},
   { (U8 const )60, (U8 const )74, (U8 const )73, (U8 const )73,
            (U8 const )48},
   { (U8 const )1, (U8 const )1, (U8 const )121, (U8 const )5,
            (U8 const )3},
   { (U8 const )54, (U8 const )73, (U8 const )73, (U8 const )73,
            (U8 const )54},
   { (U8 const )6, (U8 const )73, (U8 const )73, (U8 const )41,
            (U8 const )30},
   { (U8 const )0, (U8 const )54, (U8 const )54, (U8 const )0,
            (U8 const )0},
   { (U8 const )0, (U8 const )86, (U8 const )54, (U8 const )0,
            (U8 const )0},
   { (U8 const )8, (U8 const )20, (U8 const )34, (U8 const )65,
            (U8 const )0},
   { (U8 const )20, (U8 const )20, (U8 const )20, (U8 const )20,
            (U8 const )20},
   { (U8 const )65, (U8 const )34, (U8 const )20, (U8 const )8,
            (U8 const )0},
   { (U8 const )2, (U8 const )1, (U8 const )89, (U8 const )5,
            (U8 const )2},
   { (U8 const )28, (U8 const )42, (U8 const )54, (U8 const )62,
            (U8 const )12},
   { (U8 const )126, (U8 const )9, (U8 const )9, (U8 const )9,
            (U8 const )126},
   { (U8 const )127, (U8 const )73, (U8 const )73, (U8 const )73,
            (U8 const )62},
   { (U8 const )62, (U8 const )65, (U8 const )65, (U8 const )65,
            (U8 const )34},
   { (U8 const )127, (U8 const )65, (U8 const )65, (U8 const )34,
            (U8 const )28},
   { (U8 const )127, (U8 const )73, (U8 const )73, (U8 const )73,
            (U8 const )65},
   { (U8 const )127, (U8 const )9, (U8 const )9, (U8 const )9,
            (U8 const )1},
   { (U8 const )62, (U8 const )65, (U8 const )65, (U8 const )73,
            (U8 const )58},
   { (U8 const )127, (U8 const )8, (U8 const )8, (U8 const )8,
            (U8 const )127},
   { (U8 const )0, (U8 const )65, (U8 const )127, (U8 const )65,
            (U8 const )0},
   { (U8 const )32, (U8 const )64, (U8 const )65, (U8 const )63,
            (U8 const )1},
   { (U8 const )127, (U8 const )8, (U8 const )20, (U8 const )34,
            (U8 const )65},
   { (U8 const )127, (U8 const )64, (U8 const )64, (U8 const )64,
            (U8 const )64},
   { (U8 const )127, (U8 const )2, (U8 const )4, (U8 const )2,
            (U8 const )127},
   { (U8 const )127, (U8 const )4, (U8 const )8, (U8 const )16,
            (U8 const )127},
   { (U8 const )62, (U8 const )65, (U8 const )65, (U8 const )65,
            (U8 const )62},
   { (U8 const )127, (U8 const )9, (U8 const )9, (U8 const )9,
            (U8 const )6},
   { (U8 const )62, (U8 const )65, (U8 const )81, (U8 const )33,
            (U8 const )94},
   { (U8 const )127, (U8 const )9, (U8 const )25, (U8 const )41,
            (U8 const )70},
   { (U8 const )38, (U8 const )73, (U8 const )73, (U8 const )73,
            (U8 const )50},
   { (U8 const )1, (U8 const )1, (U8 const )127, (U8 const )1,
            (U8 const )1},
   { (U8 const )63, (U8 const )64, (U8 const )64, (U8 const )64,
            (U8 const )63},
   { (U8 const )31, (U8 const )32, (U8 const )64, (U8 const )32,
            (U8 const )31},
   { (U8 const )127, (U8 const )32, (U8 const )24, (U8 const )32,
            (U8 const )127},
   { (U8 const )99, (U8 const )20, (U8 const )8, (U8 const )20,
            (U8 const )99},
   { (U8 const )3, (U8 const )4, (U8 const )120, (U8 const )4,
            (U8 const )3},
   { (U8 const )97, (U8 const )81, (U8 const )73, (U8 const )69,
            (U8 const )67},
   { (U8 const )0, (U8 const )127, (U8 const )65, (U8 const )65,
            (U8 const )0},
   { (U8 const )2, (U8 const )4, (U8 const )8, (U8 const )16,
            (U8 const )32},
   { (U8 const )0, (U8 const )65, (U8 const )65, (U8 const )127,
            (U8 const )0},
   { (U8 const )4, (U8 const )2, (U8 const )1, (U8 const )2,
            (U8 const )4},
   { (U8 const )64, (U8 const )64, (U8 const )64, (U8 const )64,
            (U8 const )64},
   { (U8 const )0, (U8 const )0, (U8 const )7, (U8 const )0,
            (U8 const )0},
   { (U8 const )32, (U8 const )84, (U8 const )84, (U8 const )84,
            (U8 const )120},
   { (U8 const )127, (U8 const )72, (U8 const )68, (U8 const )68,
            (U8 const )56},
   { (U8 const )48, (U8 const )72, (U8 const )72, (U8 const )72,
            (U8 const )32},
   { (U8 const )56, (U8 const )68, (U8 const )68, (U8 const )72,
            (U8 const )127},
   { (U8 const )56, (U8 const )84, (U8 const )84, (U8 const )84,
            (U8 const )24},
   { (U8 const )8, (U8 const )126, (U8 const )9, (U8 const )9,
            (U8 const )2},
   { (U8 const )12, (U8 const )82, (U8 const )82, (U8 const )82,
            (U8 const )62},
   { (U8 const )127, (U8 const )8, (U8 const )4, (U8 const )4,
            (U8 const )120},
   { (U8 const )0, (U8 const )68, (U8 const )125, (U8 const )64,
            (U8 const )0},
   { (U8 const )32, (U8 const )64, (U8 const )64, (U8 const )61,
            (U8 const )0},
   { (U8 const )127, (U8 const )16, (U8 const )40, (U8 const )68,
            (U8 const )0},
   { (U8 const )0, (U8 const )65, (U8 const )127, (U8 const )64,
            (U8 const )0},
   { (U8 const )124, (U8 const )4, (U8 const )24, (U8 const )4,
            (U8 const )120},
   { (U8 const )124, (U8 const )8, (U8 const )4, (U8 const )4,
            (U8 const )120},
   { (U8 const )56, (U8 const )68, (U8 const )68, (U8 const )68,
            (U8 const )56},
   { (U8 const )252, (U8 const )20, (U8 const )20, (U8 const )20,
            (U8 const )8},
   { (U8 const )8, (U8 const )20, (U8 const )20, (U8 const )24,
            (U8 const )124},
   { (U8 const )124, (U8 const )8, (U8 const )4, (U8 const )4,
            (U8 const )8},
   { (U8 const )72, (U8 const )84, (U8 const )84, (U8 const )84,
            (U8 const )32},
   { (U8 const )4, (U8 const )63, (U8 const )68, (U8 const )64,
            (U8 const )32},
   { (U8 const )60, (U8 const )64, (U8 const )64, (U8 const )32,
            (U8 const )124},
   { (U8 const )28, (U8 const )32, (U8 const )64, (U8 const )32,
            (U8 const )28},
   { (U8 const )60, (U8 const )64, (U8 const )56, (U8 const )64,
            (U8 const )60},
   { (U8 const )68, (U8 const )40, (U8 const )16, (U8 const )40,
            (U8 const )68},
   { (U8 const )12, (U8 const )80, (U8 const )80, (U8 const )80,
            (U8 const )60},
   { (U8 const )68, (U8 const )100, (U8 const )84, (U8 const )76,
            (U8 const )68},
   { (U8 const )0, (U8 const )8, (U8 const )54, (U8 const )65,
            (U8 const )0},
   { (U8 const )0, (U8 const )0, (U8 const )127, (U8 const )0,
            (U8 const )0},
   { (U8 const )0, (U8 const )65, (U8 const )54, (U8 const )8,
            (U8 const )0},
   { (U8 const )0, (U8 const )7, (U8 const )0, (U8 const )7,
            (U8 const )0},
   { (U8 const )62, (U8 const )54, (U8 const )42, (U8 const )54,
            (U8 const )62}};
# 574 "car/carR.c"
int display_tick = 0;
# 575 "car/carR.c"
int display_auto_update = 1;
# 576 "car/carR.c"
int display_x ;
# 577 "car/carR.c"
int display_y ;
# 582 "car/carR.c"
char const avr_brainwash_string[48] =
# 582 "car/carR.c"
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
# 595 "car/carR.c"
static to_avr io_to_avr ;
# 607 "car/carR.c"
static struct motor_struct motor[3] ;
# 611 "car/carR.c"
extern __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) rand)(void) ;
# 612 "car/carR.c"
extern StatusType TerminateTask(void) ;
# 613 "car/carR.c"
extern StatusType GetResource(ResourceType resid ) ;
# 614 "car/carR.c"
extern StatusType ReleaseResource(ResourceType resid ) ;
# 631 "car/carR.c"
extern void ecrobot_init_bt_slave(CHAR const *pin ) ;
# 632 "car/carR.c"
extern SINT ecrobot_get_bt_status(void) ;
# 633 "car/carR.c"
extern U32___2 ecrobot_send_bt_packet(U8___1 *buf , U32___2 bufLen ) ;
# 634 "car/carR.c"
extern U32___2 ecrobot_read_bt_packet(U8___1 *buf , U32___2 bufLen ) ;
# 651 "car/carR.c"
extern S32___0 ecrobot_get_sonar_sensor(U8___1 port_id ) ;
# 690 "car/carR.c"
U8___1 const NXT_COLORSENSOR_PROTOCOLS[7] = { (U8___1 const )176, (U8___1 const )112, (U8___1 const )240, (U8___1 const )8,
        (U8___1 const )176, (U8___1 const )136, (U8___1 const )136};
# 700 "car/carR.c"
extern ResourceType SonarSensor ;
# 701 "car/carR.c"
int generate_random_number(void)
{
  int iRandom ;
  int tmp ;

  {
# 707 "car/carR.c"
  tmp = rand();
# 708 "car/carR.c"
  iRandom = tmp % 10;
# 709 "car/carR.c"
  return (iRandom);
}
}
# 712 "car/carR.c"
int iSonarDistance = 0;
# 713 "car/carR.c"
struct sMotorResource_t sMotorResource ;
# 714 "car/carR.c"
static U8___1 bt_receive_buf[32] ;
# 715 "car/carR.c"
void TaskMainBluetooth_Receive(void)
{
  int iRandom ;
  int iRandom2 ;
  int tmp3 ;
  int ret_generate_random_number4 ;
  char const *str5 ;
  char const *str6 ;
  int c7 ;
  int i8 ;
  U8 *b9 ;
  U8 const *f10 ;
  int c11 ;
  int i12 ;
  U8 *b13 ;
  U8 const *f14 ;
  U32 updateToo15 ;
  U32 updateToo16 ;
  int x17 ;
  int y18 ;
  int x19 ;
  int y20 ;
  int x21 ;
  int y22 ;
  int x23 ;
  int y24 ;

  {
# 743 "car/carR.c"
  GetResource(SonarSensor);
# 744 "car/carR.c"
  updateToo15 = (U32___2 )0;
# 745 "car/carR.c"
  memset((void *)display_buffer, 0, (size_t )800);
# 746 "car/carR.c"
  if (updateToo15) {
# 747 "car/carR.c"
    display_tick = 0;
# 748 "car/carR.c"
    nxt_lcd_update();
# 749 "car/carR.c"
    goto Lret_display_update___3;
    Lret_display_update___3: ;
  }
# 752 "car/carR.c"
  goto Lret_display_clear;
  Lret_display_clear:
# 755 "car/carR.c"
  x17 = 0;
# 756 "car/carR.c"
  y18 = 1;
# 758 "car/carR.c"
  display_x = x17;
# 759 "car/carR.c"
  display_y = y18;
# 760 "car/carR.c"
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
# 763 "car/carR.c"
  str5 = "BT_receive";
# 765 "car/carR.c"
  while (*str5) {
# 766 "car/carR.c"
    if ((int const )*str5 != 10) {
# 767 "car/carR.c"
      c7 = (int )*str5;
# 768 "car/carR.c"
      if (c7 >= 0) {
# 769 "car/carR.c"
        if (c7 < 128) {
# 770 "car/carR.c"
          if (display_x >= 0) {
# 771 "car/carR.c"
            if (display_x < 16) {
# 772 "car/carR.c"
              if (display_y >= 0) {
# 773 "car/carR.c"
                if (display_y < 8) {
# 774 "car/carR.c"
                  b9 = & (*(display_buffer + display_y))[display_x * 6];
# 775 "car/carR.c"
                  f10 = font[c7];
# 776 "car/carR.c"
                  i8 = 0;
# 777 "car/carR.c"
                  while (i8 < 5) {
# 778 "car/carR.c"
                    *b9 = (U8 )*f10;
# 779 "car/carR.c"
                    b9 ++;
# 780 "car/carR.c"
                    f10 ++;
# 781 "car/carR.c"
                    i8 ++;
                  }
                }
              }
            }
          }
        }
      }
# 789 "car/carR.c"
      goto Lret_display_char;
      Lret_display_char:
# 791 "car/carR.c"
      display_x ++;
    } else {
# 793 "car/carR.c"
      display_x = 0;
# 794 "car/carR.c"
      display_y ++;
    }
# 796 "car/carR.c"
    str5 ++;
  }
# 798 "car/carR.c"
  goto Lret_display_string;
  Lret_display_string:
# 800 "car/carR.c"
  display_tick = 0;
# 801 "car/carR.c"
  nxt_lcd_update();
# 802 "car/carR.c"
  goto Lret_display_update;
  Lret_display_update:
# 804 "car/carR.c"
  tmp3 = rand();
# 805 "car/carR.c"
  iRandom2 = tmp3 % 10;
# 806 "car/carR.c"
  ret_generate_random_number4 = iRandom2;
# 807 "car/carR.c"
  goto Lret_generate_random_number;
  Lret_generate_random_number:
# 809 "car/carR.c"
  iRandom = ret_generate_random_number4;
# 810 "car/carR.c"
  if (iRandom % 2 == 0) {
# 811 "car/carR.c"
    ecrobot_read_bt_packet(bt_receive_buf, (U32___2 )32);
# 812 "car/carR.c"
    if ((int )bt_receive_buf[0] == 1) {
# 813 "car/carR.c"
      updateToo16 = (U32___2 )0;
# 814 "car/carR.c"
      memset((void *)display_buffer, 0, (size_t )800);
# 815 "car/carR.c"
      if (updateToo16) {
# 816 "car/carR.c"
        display_tick = 0;
# 817 "car/carR.c"
        nxt_lcd_update();
# 818 "car/carR.c"
        goto Lret_display_update___4;
        Lret_display_update___4: ;
      }
# 821 "car/carR.c"
      goto Lret_display_clear___0;
      Lret_display_clear___0:
# 824 "car/carR.c"
      x19 = 0;
# 825 "car/carR.c"
      y20 = 1;
# 827 "car/carR.c"
      display_x = x19;
# 828 "car/carR.c"
      display_y = y20;
# 829 "car/carR.c"
      goto Lret_display_goto_xy___0;
      Lret_display_goto_xy___0:
# 832 "car/carR.c"
      str6 = "msg received";
# 834 "car/carR.c"
      while (*str6) {
# 835 "car/carR.c"
        if ((int const )*str6 != 10) {
# 836 "car/carR.c"
          c11 = (int )*str6;
# 837 "car/carR.c"
          if (c11 >= 0) {
# 838 "car/carR.c"
            if (c11 < 128) {
# 839 "car/carR.c"
              if (display_x >= 0) {
# 840 "car/carR.c"
                if (display_x < 16) {
# 841 "car/carR.c"
                  if (display_y >= 0) {
# 842 "car/carR.c"
                    if (display_y < 8) {
# 843 "car/carR.c"
                      b13 = & (*(display_buffer + display_y))[display_x * 6];
# 844 "car/carR.c"
                      f14 = font[c11];
# 845 "car/carR.c"
                      i12 = 0;
# 846 "car/carR.c"
                      while (i12 < 5) {
# 847 "car/carR.c"
                        *b13 = (U8 )*f14;
# 848 "car/carR.c"
                        b13 ++;
# 849 "car/carR.c"
                        f14 ++;
# 850 "car/carR.c"
                        i12 ++;
                      }
                    }
                  }
                }
              }
            }
          }
# 858 "car/carR.c"
          goto Lret_display_char___0;
          Lret_display_char___0:
# 860 "car/carR.c"
          display_x ++;
        } else {
# 862 "car/carR.c"
          display_x = 0;
# 863 "car/carR.c"
          display_y ++;
        }
# 865 "car/carR.c"
        str6 ++;
      }
# 867 "car/carR.c"
      goto Lret_display_string___0;
      Lret_display_string___0:
# 869 "car/carR.c"
      display_tick = 0;
# 870 "car/carR.c"
      nxt_lcd_update();
# 871 "car/carR.c"
      goto Lret_display_update___0;
      Lret_display_update___0:
# 873 "car/carR.c"
      sMotorResource.sSonarDistance = ecrobot_get_sonar_sensor((U8___1 )1);
# 874 "car/carR.c"
      if (sMotorResource.sTurnDistance == 0L) {
# 875 "car/carR.c"
        sMotorResource.sTurnDistance = ecrobot_get_sonar_sensor((U8___1 )1);
      }
# 877 "car/carR.c"
      if ((int )bt_receive_buf[1] != 50) {
# 879 "car/carR.c"
        sMotorResource.sLeftMotor = (S32___0 )bt_receive_buf[1];
# 880 "car/carR.c"
        x21 = 0;
# 881 "car/carR.c"
        y22 = 2;
# 883 "car/carR.c"
        display_x = x21;
# 884 "car/carR.c"
        display_y = y22;
# 885 "car/carR.c"
        goto Lret_display_goto_xy___1;
        Lret_display_goto_xy___1:
# 888 "car/carR.c"
        display_int((int )bt_receive_buf[1], (U32___2 )50);
# 889 "car/carR.c"
        display_tick = 0;
# 890 "car/carR.c"
        nxt_lcd_update();
# 892 "car/carR.c"
        goto Lret_display_update___1;
        Lret_display_update___1: ;
      }
# 895 "car/carR.c"
      if ((int )bt_receive_buf[2] != 50) {
# 897 "car/carR.c"
        sMotorResource.sRightMotor = (S32___0 )bt_receive_buf[2];
# 898 "car/carR.c"
        x23 = 0;
# 899 "car/carR.c"
        y24 = 3;
# 901 "car/carR.c"
        display_x = x23;
# 902 "car/carR.c"
        display_y = y24;
# 903 "car/carR.c"
        goto Lret_display_goto_xy___2;
        Lret_display_goto_xy___2:
# 906 "car/carR.c"
        display_int((int )bt_receive_buf[2], (U32___2 )50);
# 907 "car/carR.c"
        display_tick = 0;
# 908 "car/carR.c"
        nxt_lcd_update();
# 910 "car/carR.c"
        goto Lret_display_update___2;
        Lret_display_update___2: ;
      }
    }
  }
# 915 "car/carR.c"
  ReleaseResource(SonarSensor);
# 916 "car/carR.c"
  TerminateTask();
# 917 "car/carR.c"
  return;
}
}
# 920 "car/carR.c"
void TaskMainGetCurrentSonarSensor(void)
{
  int iRandom ;
  int tmp ;
  int iRandom3 ;
  int tmp4 ;
  int ret_generate_random_number5 ;
  char const *str6 ;
  int c7 ;
  int i8 ;
  U8 *b9 ;
  U8 const *f10 ;
  int x11 ;
  int y12 ;

  {
# 936 "car/carR.c"
  tmp4 = rand();
# 937 "car/carR.c"
  iRandom3 = tmp4 % 10;
# 938 "car/carR.c"
  ret_generate_random_number5 = iRandom3;
# 939 "car/carR.c"
  goto Lret_generate_random_number;
  Lret_generate_random_number:
# 942 "car/carR.c"
  tmp = ret_generate_random_number5;
# 943 "car/carR.c"
  iRandom = tmp;
# 944 "car/carR.c"
  x11 = 0;
# 945 "car/carR.c"
  y12 = 3;
# 947 "car/carR.c"
  display_x = x11;
# 948 "car/carR.c"
  display_y = y12;
# 949 "car/carR.c"
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
# 952 "car/carR.c"
  str6 = "Sonar";
# 954 "car/carR.c"
  while (*str6) {
# 955 "car/carR.c"
    if ((int const )*str6 != 10) {
# 956 "car/carR.c"
      c7 = (int )*str6;
# 957 "car/carR.c"
      if (c7 >= 0) {
# 958 "car/carR.c"
        if (c7 < 128) {
# 959 "car/carR.c"
          if (display_x >= 0) {
# 960 "car/carR.c"
            if (display_x < 16) {
# 961 "car/carR.c"
              if (display_y >= 0) {
# 962 "car/carR.c"
                if (display_y < 8) {
# 963 "car/carR.c"
                  b9 = & (*(display_buffer + display_y))[display_x * 6];
# 964 "car/carR.c"
                  f10 = font[c7];
# 965 "car/carR.c"
                  i8 = 0;
# 966 "car/carR.c"
                  while (i8 < 5) {
# 967 "car/carR.c"
                    *b9 = (U8 )*f10;
# 968 "car/carR.c"
                    b9 ++;
# 969 "car/carR.c"
                    f10 ++;
# 970 "car/carR.c"
                    i8 ++;
                  }
                }
              }
            }
          }
        }
      }
# 978 "car/carR.c"
      goto Lret_display_char;
      Lret_display_char:
# 980 "car/carR.c"
      display_x ++;
    } else {
# 982 "car/carR.c"
      display_x = 0;
# 983 "car/carR.c"
      display_y ++;
    }
# 985 "car/carR.c"
    str6 ++;
  }
# 987 "car/carR.c"
  goto Lret_display_string;
  Lret_display_string:
# 989 "car/carR.c"
  display_tick = 0;
# 990 "car/carR.c"
  nxt_lcd_update();
# 991 "car/carR.c"
  goto Lret_display_update;
  Lret_display_update:
# 993 "car/carR.c"
  GetResource(SonarSensor);
# 994 "car/carR.c"
  if (iRandom % 2 == 0) {
# 995 "car/carR.c"
    sMotorResource.sSonarDistance = ecrobot_get_sonar_sensor((U8___1 )1);
  }
# 997 "car/carR.c"
  ReleaseResource(SonarSensor);
# 998 "car/carR.c"
  TerminateTask();
# 999 "car/carR.c"
  return;
}
}
# 1002 "car/carR.c"
void TaskMainMotorControlTask(void)
{
  S32___0 sLeftMotor ;
  S32___0 sRightMotor ;
  U8___1 bt_send_buf[32] ;
  int iRandom ;
  int iRandom5 ;
  int tmp6 ;
  int ret_generate_random_number7 ;
  U32___1 n8 ;
  int speed_percent9 ;
  int brake10 ;
  U32___1 n11 ;
  int speed_percent12 ;
  int brake13 ;
  U32___0 n14 ;
  int power_percent15 ;
  int brake16 ;
  U32___0 n17 ;
  int power_percent18 ;
  int brake19 ;
  int x20 ;
  int y21 ;
  int x22 ;
  int y23 ;
  int x24 ;
  int y25 ;

  {
# 1032 "car/carR.c"
  GetResource(SonarSensor);
# 1033 "car/carR.c"
  iRandom = 0;
# 1034 "car/carR.c"
  bt_send_buf[0] = (U8___1 )1;
# 1035 "car/carR.c"
  x20 = 0;
# 1036 "car/carR.c"
  y21 = 1;
# 1038 "car/carR.c"
  display_x = x20;
# 1039 "car/carR.c"
  display_y = y21;
# 1040 "car/carR.c"
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
# 1043 "car/carR.c"
  display_int((int )sMotorResource.sSonarDistance, (U32___2 )0);
# 1044 "car/carR.c"
  x22 = 0;
# 1045 "car/carR.c"
  y23 = 2;
# 1047 "car/carR.c"
  display_x = x22;
# 1048 "car/carR.c"
  display_y = y23;
# 1049 "car/carR.c"
  goto Lret_display_goto_xy___0;
  Lret_display_goto_xy___0:
# 1052 "car/carR.c"
  display_int((int )sMotorResource.sTurnDistance, (U32___2 )0);
# 1053 "car/carR.c"
  display_tick = 0;
# 1054 "car/carR.c"
  nxt_lcd_update();
# 1056 "car/carR.c"
  goto Lret_display_update;
  Lret_display_update:
# 1058 "car/carR.c"
  tmp6 = rand();
# 1059 "car/carR.c"
  iRandom5 = tmp6 % 10;
# 1060 "car/carR.c"
  ret_generate_random_number7 = iRandom5;
# 1061 "car/carR.c"
  goto Lret_generate_random_number;
  Lret_generate_random_number:
# 1064 "car/carR.c"
  iRandom = ret_generate_random_number7;
# 1065 "car/carR.c"
  x24 = 0;
# 1066 "car/carR.c"
  y25 = 4;
# 1068 "car/carR.c"
  display_x = x24;
# 1069 "car/carR.c"
  display_y = y25;
# 1070 "car/carR.c"
  goto Lret_display_goto_xy___1;
  Lret_display_goto_xy___1:
# 1073 "car/carR.c"
  display_int(iRandom, (U32___2 )50);
# 1074 "car/carR.c"
  display_tick = 0;
# 1075 "car/carR.c"
  nxt_lcd_update();
# 1077 "car/carR.c"
  goto Lret_display_update___0;
  Lret_display_update___0: ;
# 1079 "car/carR.c"
  if (iRandom % 2 == 0) {
# 1080 "car/carR.c"
    if (sMotorResource.sSonarDistance <= 225L) {
# 1081 "car/carR.c"
      sLeftMotor = (S32___0 )0;
# 1082 "car/carR.c"
      sRightMotor = (S32___0 )0;
    } else
# 1084 "car/carR.c"
    if (sMotorResource.sTurnDistance - sMotorResource.sSonarDistance == 0L) {
# 1085 "car/carR.c"
      sLeftMotor = (S32___0 )0;
# 1086 "car/carR.c"
      sRightMotor = (S32___0 )0;
    } else
# 1088 "car/carR.c"
    if (sMotorResource.sSonarDistance >= 255L) {
# 1089 "car/carR.c"
      bt_send_buf[0] = (U8___1 )0;
# 1090 "car/carR.c"
      ecrobot_send_bt_packet(bt_send_buf, (U32___2 )32);
# 1091 "car/carR.c"
      sLeftMotor = sMotorResource.sLeftMotor;
# 1092 "car/carR.c"
      sRightMotor = sMotorResource.sRightMotor;
    } else {
# 1094 "car/carR.c"
      sLeftMotor = sMotorResource.sLeftMotor;
# 1095 "car/carR.c"
      sRightMotor = sMotorResource.sRightMotor;
    }
  }
# 1098 "car/carR.c"
  n8 = (U32___2 )0;
# 1099 "car/carR.c"
  speed_percent9 = (int )sLeftMotor;
# 1100 "car/carR.c"
  brake10 = 1;
# 1101 "car/carR.c"
  if (n8 < 3UL) {
# 1102 "car/carR.c"
    if (speed_percent9 > 100) {
# 1103 "car/carR.c"
      speed_percent9 = 100;
    }
# 1105 "car/carR.c"
    if (speed_percent9 < -100) {
# 1106 "car/carR.c"
      speed_percent9 = -100;
    }
# 1108 "car/carR.c"
    motor[n8].speed_percent = speed_percent9;
# 1109 "car/carR.c"
    n14 = n8;
# 1110 "car/carR.c"
    power_percent15 = speed_percent9;
# 1111 "car/carR.c"
    brake16 = brake10;
# 1112 "car/carR.c"
    if (n14 < 3UL) {
# 1113 "car/carR.c"
      io_to_avr.output_percent[n14] = (S8___0 )power_percent15;
# 1114 "car/carR.c"
      if (brake16) {
# 1115 "car/carR.c"
        io_to_avr.output_mode = (U8___0 )((int )io_to_avr.output_mode | (1 << n14));
      } else {
# 1117 "car/carR.c"
        io_to_avr.output_mode = (U8___0 )((int )io_to_avr.output_mode & ~ (1 << n14));
      }
    }
# 1120 "car/carR.c"
    goto Lret_nxt_avr_set_motor;
    Lret_nxt_avr_set_motor: ;
  }
# 1123 "car/carR.c"
  goto Lret_nxt_motor_set_speed;
  Lret_nxt_motor_set_speed:
# 1125 "car/carR.c"
  n11 = (U32___2 )1;
# 1126 "car/carR.c"
  speed_percent12 = (int )sRightMotor;
# 1127 "car/carR.c"
  brake13 = 1;
# 1128 "car/carR.c"
  if (n11 < 3UL) {
# 1129 "car/carR.c"
    if (speed_percent12 > 100) {
# 1130 "car/carR.c"
      speed_percent12 = 100;
    }
# 1132 "car/carR.c"
    if (speed_percent12 < -100) {
# 1133 "car/carR.c"
      speed_percent12 = -100;
    }
# 1135 "car/carR.c"
    motor[n11].speed_percent = speed_percent12;
# 1136 "car/carR.c"
    n17 = n11;
# 1137 "car/carR.c"
    power_percent18 = speed_percent12;
# 1138 "car/carR.c"
    brake19 = brake13;
# 1139 "car/carR.c"
    if (n17 < 3UL) {
# 1140 "car/carR.c"
      io_to_avr.output_percent[n17] = (S8___0 )power_percent18;
# 1141 "car/carR.c"
      if (brake19) {
# 1142 "car/carR.c"
        io_to_avr.output_mode = (U8___0 )((int )io_to_avr.output_mode | (1 << n17));
      } else {
# 1144 "car/carR.c"
        io_to_avr.output_mode = (U8___0 )((int )io_to_avr.output_mode & ~ (1 << n17));
      }
    }
# 1147 "car/carR.c"
    goto Lret_nxt_avr_set_motor___0;
    Lret_nxt_avr_set_motor___0: ;
  }
# 1150 "car/carR.c"
  goto Lret_nxt_motor_set_speed___0;
  Lret_nxt_motor_set_speed___0:
# 1152 "car/carR.c"
  systick_wait_ms((U32___2 )100);
# 1153 "car/carR.c"
  ReleaseResource(SonarSensor);
# 1154 "car/carR.c"
  TerminateTask();
# 1155 "car/carR.c"
  return;
}
}
# 1158 "car/carR.c"
void TaskMainIdleTask(void) ;
# 1159 "car/carR.c"
static SINT bt_status = 4;
# 1160 "car/carR.c"
void TaskMainIdleTask(void)
{
  SINT tmp ;
  SINT tmp___0 ;
  char const *str3 ;
  char const *str4 ;
  int c5 ;
  int i6 ;
  U8 *b7 ;
  U8 const *f8 ;
  int c9 ;
  int i10 ;
  U8 *b11 ;
  U8 const *f12 ;
  U32 updateToo13 ;
  U32 updateToo14 ;
  int x15 ;
  int y16 ;
  int x17 ;
  int y18 ;

  {
# 1182 "car/carR.c"
  while (1) {
# 1183 "car/carR.c"
    ecrobot_init_bt_slave("1234");
# 1184 "car/carR.c"
    tmp = ecrobot_get_bt_status();
# 1185 "car/carR.c"
    if (tmp == 4) {
# 1186 "car/carR.c"
      updateToo13 = (U32___2 )0;
# 1187 "car/carR.c"
      memset((void *)display_buffer, 0, (size_t )800);
# 1188 "car/carR.c"
      if (updateToo13) {
# 1189 "car/carR.c"
        display_tick = 0;
# 1190 "car/carR.c"
        nxt_lcd_update();
# 1191 "car/carR.c"
        goto Lret_display_update___1;
        Lret_display_update___1: ;
      }
# 1194 "car/carR.c"
      goto Lret_display_clear;
      Lret_display_clear:
# 1197 "car/carR.c"
      x15 = 0;
# 1198 "car/carR.c"
      y16 = 0;
# 1200 "car/carR.c"
      display_x = x15;
# 1201 "car/carR.c"
      display_y = y16;
# 1202 "car/carR.c"
      goto Lret_display_goto_xy;
      Lret_display_goto_xy:
# 1205 "car/carR.c"
      str3 = "Not initialized";
# 1207 "car/carR.c"
      while (*str3) {
# 1208 "car/carR.c"
        if ((int const )*str3 != 10) {
# 1209 "car/carR.c"
          c5 = (int )*str3;
# 1210 "car/carR.c"
          if (c5 >= 0) {
# 1211 "car/carR.c"
            if (c5 < 128) {
# 1212 "car/carR.c"
              if (display_x >= 0) {
# 1213 "car/carR.c"
                if (display_x < 16) {
# 1214 "car/carR.c"
                  if (display_y >= 0) {
# 1215 "car/carR.c"
                    if (display_y < 8) {
# 1216 "car/carR.c"
                      b7 = & (*(display_buffer + display_y))[display_x * 6];
# 1217 "car/carR.c"
                      f8 = font[c5];
# 1218 "car/carR.c"
                      i6 = 0;
# 1219 "car/carR.c"
                      while (i6 < 5) {
# 1220 "car/carR.c"
                        *b7 = (U8 )*f8;
# 1221 "car/carR.c"
                        b7 ++;
# 1222 "car/carR.c"
                        f8 ++;
# 1223 "car/carR.c"
                        i6 ++;
                      }
                    }
                  }
                }
              }
            }
          }
# 1231 "car/carR.c"
          goto Lret_display_char;
          Lret_display_char:
# 1233 "car/carR.c"
          display_x ++;
        } else {
# 1235 "car/carR.c"
          display_x = 0;
# 1236 "car/carR.c"
          display_y ++;
        }
# 1238 "car/carR.c"
        str3 ++;
      }
# 1240 "car/carR.c"
      goto Lret_display_string;
      Lret_display_string:
# 1242 "car/carR.c"
      display_tick = 0;
# 1243 "car/carR.c"
      nxt_lcd_update();
# 1244 "car/carR.c"
      goto Lret_display_update;
      Lret_display_update: ;
    }
# 1247 "car/carR.c"
    tmp___0 = ecrobot_get_bt_status();
# 1248 "car/carR.c"
    if (tmp___0 == 7) {
# 1249 "car/carR.c"
      if (bt_status != 7) {
# 1250 "car/carR.c"
        updateToo14 = (U32___2 )0;
# 1251 "car/carR.c"
        memset((void *)display_buffer, 0, (size_t )800);
# 1252 "car/carR.c"
        if (updateToo14) {
# 1253 "car/carR.c"
          display_tick = 0;
# 1254 "car/carR.c"
          nxt_lcd_update();
# 1255 "car/carR.c"
          goto Lret_display_update___2;
          Lret_display_update___2: ;
        }
# 1258 "car/carR.c"
        goto Lret_display_clear___0;
        Lret_display_clear___0:
# 1261 "car/carR.c"
        x17 = 0;
# 1262 "car/carR.c"
        y18 = 0;
# 1264 "car/carR.c"
        display_x = x17;
# 1265 "car/carR.c"
        display_y = y18;
# 1266 "car/carR.c"
        goto Lret_display_goto_xy___0;
        Lret_display_goto_xy___0:
# 1269 "car/carR.c"
        str4 = "[BT]";
# 1271 "car/carR.c"
        while (*str4) {
# 1272 "car/carR.c"
          if ((int const )*str4 != 10) {
# 1273 "car/carR.c"
            c9 = (int )*str4;
# 1274 "car/carR.c"
            if (c9 >= 0) {
# 1275 "car/carR.c"
              if (c9 < 128) {
# 1276 "car/carR.c"
                if (display_x >= 0) {
# 1277 "car/carR.c"
                  if (display_x < 16) {
# 1278 "car/carR.c"
                    if (display_y >= 0) {
# 1279 "car/carR.c"
                      if (display_y < 8) {
# 1280 "car/carR.c"
                        b11 = & (*(display_buffer + display_y))[display_x * 6];
# 1281 "car/carR.c"
                        f12 = font[c9];
# 1282 "car/carR.c"
                        i10 = 0;
# 1283 "car/carR.c"
                        while (i10 < 5) {
# 1284 "car/carR.c"
                          *b11 = (U8 )*f12;
# 1285 "car/carR.c"
                          b11 ++;
# 1286 "car/carR.c"
                          f12 ++;
# 1287 "car/carR.c"
                          i10 ++;
                        }
                      }
                    }
                  }
                }
              }
            }
# 1295 "car/carR.c"
            goto Lret_display_char___0;
            Lret_display_char___0:
# 1297 "car/carR.c"
            display_x ++;
          } else {
# 1299 "car/carR.c"
            display_x = 0;
# 1300 "car/carR.c"
            display_y ++;
          }
# 1302 "car/carR.c"
          str4 ++;
        }
# 1304 "car/carR.c"
        goto Lret_display_string___0;
        Lret_display_string___0:
# 1306 "car/carR.c"
        display_tick = 0;
# 1307 "car/carR.c"
        nxt_lcd_update();
# 1308 "car/carR.c"
        goto Lret_display_update___0;
        Lret_display_update___0: ;
      }
    }
# 1312 "car/carR.c"
    bt_status = ecrobot_get_bt_status();
  }
}
}
# 1316 "car/carR.c"
extern int create_task() ;
# 1325 "car/carR.c"
extern int ( create_block)() ;
# 1317 "car/carR.c"
void main(void)
{


  {
# 1320 "car/carR.c"
  create_task("TaskMainIdleTask", "TaskMainIdleTask", 1, 25, 1.965);
# 1321 "car/carR.c"
  create_task("TaskMainMotorControlTask", "TaskMainMotorControlTask", 3, 50, 2.108);
# 1322 "car/carR.c"
  create_task("TaskMainBluetooth_Receive", "TaskMainBluetooth_Receive", 2, 35, 0.372);
# 1323 "car/carR.c"
  create_task("TaskMainGetCurrentSonarSensor", "TaskMainGetCurrentSonarSensor", 4,
              26, 0.107);
# 1325 "car/carR.c"
  create_block(1032, "TaskMainMotorControlTask", "SonarSensor", 1, 3, 0.378);
# 1326 "car/carR.c"
  create_block(743, "TaskMainBluetooth_Receive", "SonarSensor", 1, 2, 0.108);
# 1327 "car/carR.c"
  create_block(993, "TaskMainGetCurrentSonarSensor", "SonarSensor", 1, 4, 0.009);
# 1328 "car/carR.c"
  return;
}
}

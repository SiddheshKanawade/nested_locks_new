# 1 "./car.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./car.cil.c"
# 4 "car/car.c"
typedef unsigned char U8;
# 5 "car/car.c"
typedef unsigned long U32;
# 6 "car/car.c"
typedef unsigned char byte;
# 7 "car/car.c"
typedef unsigned short TWOBYTES;
# 11 "car/car.c"
struct _freeBlock {
   TWOBYTES size : 15 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 15 "car/car.c"
struct _objects {
   byte _class ;
   byte padding : 5 ;
   byte mark : 1 ;
   byte isArray : 1 ;
   byte isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 22 "car/car.c"
struct _arrays {
   TWOBYTES length : 9 ;
   TWOBYTES type : 4 ;
   TWOBYTES mark : 1 ;
   TWOBYTES isArray : 1 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 29 "car/car.c"
union _flags {
   TWOBYTES all ;
   struct _freeBlock freeBlock ;
   struct _objects objects ;
   struct _arrays arrays ;
} __attribute__((__packed__)) ;
# 35 "car/car.c"
struct S_Object {
   union _flags flags ;
   byte monitorCount ;
   byte threadId ;
} __attribute__((__packed__)) ;
# 40 "car/car.c"
typedef struct S_Object Object;
# 42 "car/car.c"
typedef unsigned long size_t;
# 43 "car/car.c"
struct __anonstruct_display_array_740464799 {
   Object hdr ;
   U8 displayN[9][100] ;
} __attribute__((__packed__)) ;
# 47 "car/car.c"
typedef unsigned char U8___0;
# 48 "car/car.c"
typedef signed char S8___0;
# 50 "car/car.c"
typedef unsigned long U32___0;
# 52 "car/car.c"
struct __anonstruct_to_avr_432250394 {
   U8___0 power ;
   U8___0 pwm_frequency ;
   S8___0 output_percent[4] ;
   U8___0 output_mode ;
   U8___0 input_power ;
} __attribute__((__packed__)) ;
# 59 "car/car.c"
typedef struct __anonstruct_to_avr_432250394 to_avr;
# 74 "car/car.c"
typedef unsigned long U32___1;
# 76 "car/car.c"
struct motor_struct {
   int current_count ;
   int target_count ;
   int speed_percent ;
   U32___1 last ;
};
# 82 "car/car.c"
typedef unsigned char UINT8;
# 83 "car/car.c"
typedef UINT8 StatusType;
# 84 "car/car.c"
typedef UINT8 ResourceType;
# 85 "car/car.c"
typedef unsigned char U8___1;
# 89 "car/car.c"
typedef unsigned long U32___2;
# 90 "car/car.c"
typedef long S32___0;
# 91 "car/car.c"
typedef char CHAR;
# 93 "car/car.c"
typedef int SINT;
# 250 "car/car.c"
struct sMotorResource_t {
   S32___0 sTurnDistance ;
   S32___0 sSonarDistance ;
   S32___0 sRightMotor ;
   S32___0 sLeftMotor ;
   S32___0 sCalibratedDistance ;
};
# 264 "car/car.c"
extern void display_int(int val , U32 places ) ;
# 271 "car/car.c"
int display_tick ;
# 272 "car/car.c"
int display_auto_update ;
# 276 "car/car.c"
extern void nxt_lcd_update(void) ;
# 279 "car/car.c"
extern void systick_wait_ms(unsigned long ms ) ;
# 289 "car/car.c"
U8 const *displayM = (U8 const *)((U8 *)0);
# 290 "car/car.c"
unsigned char dirty = (U8 )0;
# 291 "car/car.c"
unsigned char page = (U8 )0;
# 292 "car/car.c"
U8 const *dataM = (U8 const *)((U8 *)0);
# 293 "car/car.c"
U8 mode = (U8 )255;
# 309 "car/car.c"
extern __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1), __leaf__)) memset)(void *__s ,
                                                                                               int __c ,
                                                                                               unsigned long __n ) ;
# 315 "car/car.c"
static struct __anonstruct_display_array_740464799 display_array ;
# 316 "car/car.c"
static U8 (*display_buffer)[100] = display_array.displayN;
# 317 "car/car.c"
static U8 const font[128][5] =
# 317 "car/car.c"
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
# 574 "car/car.c"
int display_tick = 0;
# 575 "car/car.c"
int display_auto_update = 1;
# 576 "car/car.c"
int display_x ;
# 577 "car/car.c"
int display_y ;
# 582 "car/car.c"
char const avr_brainwash_string[48] =
# 582 "car/car.c"
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
# 595 "car/car.c"
static to_avr io_to_avr ;
# 607 "car/car.c"
static struct motor_struct motor[3] ;
# 611 "car/car.c"
extern __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) rand)(void) ;
# 612 "car/car.c"
extern StatusType TerminateTask(void) ;
# 613 "car/car.c"
extern StatusType GetResource(ResourceType resid ) ;
# 614 "car/car.c"
extern StatusType ReleaseResource(ResourceType resid ) ;
# 631 "car/car.c"
extern void ecrobot_init_bt_slave(CHAR const *pin ) ;
# 632 "car/car.c"
extern SINT ecrobot_get_bt_status(void) ;
# 633 "car/car.c"
extern U32___2 ecrobot_send_bt_packet(U8___1 *buf , U32___2 bufLen ) ;
# 634 "car/car.c"
extern U32___2 ecrobot_read_bt_packet(U8___1 *buf , U32___2 bufLen ) ;
# 651 "car/car.c"
extern S32___0 ecrobot_get_sonar_sensor(U8___1 port_id ) ;
# 690 "car/car.c"
U8___1 const NXT_COLORSENSOR_PROTOCOLS[7] = { (U8___1 const )176, (U8___1 const )112, (U8___1 const )240, (U8___1 const )8,
        (U8___1 const )176, (U8___1 const )136, (U8___1 const )136};
# 700 "car/car.c"
extern ResourceType SonarSensor ;
# 701 "car/car.c"
int generate_random_number(void)
{
  int iRandom ;
  int tmp ;

  {
# 707 "car/car.c"
  tmp = rand();
# 708 "car/car.c"
  iRandom = tmp % 10;
# 709 "car/car.c"
  return (iRandom);
}
}
# 712 "car/car.c"
int iSonarDistance = 0;
# 713 "car/car.c"
struct sMotorResource_t sMotorResource ;
# 714 "car/car.c"
static U8___1 bt_receive_buf[32] ;
# 715 "car/car.c"
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
# 743 "car/car.c"
  GetResource(SonarSensor);
# 744 "car/car.c"
  updateToo15 = (U32___2 )0;
# 745 "car/car.c"
  memset((void *)display_buffer, 0, (size_t )800);
# 746 "car/car.c"
  if (updateToo15) {
# 747 "car/car.c"
    display_tick = 0;
# 748 "car/car.c"
    nxt_lcd_update();
# 749 "car/car.c"
    goto Lret_display_update___3;
    Lret_display_update___3: ;
  }
# 752 "car/car.c"
  goto Lret_display_clear;
  Lret_display_clear:
# 755 "car/car.c"
  x17 = 0;
# 756 "car/car.c"
  y18 = 1;
# 758 "car/car.c"
  display_x = x17;
# 759 "car/car.c"
  display_y = y18;
# 760 "car/car.c"
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
# 763 "car/car.c"
  str5 = "BT_receive";
# 765 "car/car.c"
  while (*str5) {
# 766 "car/car.c"
    if ((int const )*str5 != 10) {
# 767 "car/car.c"
      c7 = (int )*str5;
# 768 "car/car.c"
      if (c7 >= 0) {
# 769 "car/car.c"
        if (c7 < 128) {
# 770 "car/car.c"
          if (display_x >= 0) {
# 771 "car/car.c"
            if (display_x < 16) {
# 772 "car/car.c"
              if (display_y >= 0) {
# 773 "car/car.c"
                if (display_y < 8) {
# 774 "car/car.c"
                  b9 = & (*(display_buffer + display_y))[display_x * 6];
# 775 "car/car.c"
                  f10 = font[c7];
# 776 "car/car.c"
                  i8 = 0;
# 777 "car/car.c"
                  while (i8 < 5) {
# 778 "car/car.c"
                    *b9 = (U8 )*f10;
# 779 "car/car.c"
                    b9 ++;
# 780 "car/car.c"
                    f10 ++;
# 781 "car/car.c"
                    i8 ++;
                  }
                }
              }
            }
          }
        }
      }
# 789 "car/car.c"
      goto Lret_display_char;
      Lret_display_char:
# 791 "car/car.c"
      display_x ++;
    } else {
# 793 "car/car.c"
      display_x = 0;
# 794 "car/car.c"
      display_y ++;
    }
# 796 "car/car.c"
    str5 ++;
  }
# 798 "car/car.c"
  goto Lret_display_string;
  Lret_display_string:
# 800 "car/car.c"
  display_tick = 0;
# 801 "car/car.c"
  nxt_lcd_update();
# 802 "car/car.c"
  goto Lret_display_update;
  Lret_display_update:
# 804 "car/car.c"
  tmp3 = rand();
# 805 "car/car.c"
  iRandom2 = tmp3 % 10;
# 806 "car/car.c"
  ret_generate_random_number4 = iRandom2;
# 807 "car/car.c"
  goto Lret_generate_random_number;
  Lret_generate_random_number:
# 809 "car/car.c"
  iRandom = ret_generate_random_number4;
# 810 "car/car.c"
  if (iRandom % 2 == 0) {
# 811 "car/car.c"
    ecrobot_read_bt_packet(bt_receive_buf, (U32___2 )32);
# 812 "car/car.c"
    if ((int )bt_receive_buf[0] == 1) {
# 813 "car/car.c"
      updateToo16 = (U32___2 )0;
# 814 "car/car.c"
      memset((void *)display_buffer, 0, (size_t )800);
# 815 "car/car.c"
      if (updateToo16) {
# 816 "car/car.c"
        display_tick = 0;
# 817 "car/car.c"
        nxt_lcd_update();
# 818 "car/car.c"
        goto Lret_display_update___4;
        Lret_display_update___4: ;
      }
# 821 "car/car.c"
      goto Lret_display_clear___0;
      Lret_display_clear___0:
# 824 "car/car.c"
      x19 = 0;
# 825 "car/car.c"
      y20 = 1;
# 827 "car/car.c"
      display_x = x19;
# 828 "car/car.c"
      display_y = y20;
# 829 "car/car.c"
      goto Lret_display_goto_xy___0;
      Lret_display_goto_xy___0:
# 832 "car/car.c"
      str6 = "msg received";
# 834 "car/car.c"
      while (*str6) {
# 835 "car/car.c"
        if ((int const )*str6 != 10) {
# 836 "car/car.c"
          c11 = (int )*str6;
# 837 "car/car.c"
          if (c11 >= 0) {
# 838 "car/car.c"
            if (c11 < 128) {
# 839 "car/car.c"
              if (display_x >= 0) {
# 840 "car/car.c"
                if (display_x < 16) {
# 841 "car/car.c"
                  if (display_y >= 0) {
# 842 "car/car.c"
                    if (display_y < 8) {
# 843 "car/car.c"
                      b13 = & (*(display_buffer + display_y))[display_x * 6];
# 844 "car/car.c"
                      f14 = font[c11];
# 845 "car/car.c"
                      i12 = 0;
# 846 "car/car.c"
                      while (i12 < 5) {
# 847 "car/car.c"
                        *b13 = (U8 )*f14;
# 848 "car/car.c"
                        b13 ++;
# 849 "car/car.c"
                        f14 ++;
# 850 "car/car.c"
                        i12 ++;
                      }
                    }
                  }
                }
              }
            }
          }
# 858 "car/car.c"
          goto Lret_display_char___0;
          Lret_display_char___0:
# 860 "car/car.c"
          display_x ++;
        } else {
# 862 "car/car.c"
          display_x = 0;
# 863 "car/car.c"
          display_y ++;
        }
# 865 "car/car.c"
        str6 ++;
      }
# 867 "car/car.c"
      goto Lret_display_string___0;
      Lret_display_string___0:
# 869 "car/car.c"
      display_tick = 0;
# 870 "car/car.c"
      nxt_lcd_update();
# 871 "car/car.c"
      goto Lret_display_update___0;
      Lret_display_update___0:
# 873 "car/car.c"
      sMotorResource.sSonarDistance = ecrobot_get_sonar_sensor((U8___1 )1);
# 874 "car/car.c"
      if (sMotorResource.sTurnDistance == 0L) {
# 875 "car/car.c"
        sMotorResource.sTurnDistance = ecrobot_get_sonar_sensor((U8___1 )1);
      }
# 877 "car/car.c"
      if ((int )bt_receive_buf[1] != 50) {
# 879 "car/car.c"
        sMotorResource.sLeftMotor = (S32___0 )bt_receive_buf[1];
# 880 "car/car.c"
        x21 = 0;
# 881 "car/car.c"
        y22 = 2;
# 883 "car/car.c"
        display_x = x21;
# 884 "car/car.c"
        display_y = y22;
# 885 "car/car.c"
        goto Lret_display_goto_xy___1;
        Lret_display_goto_xy___1:
# 888 "car/car.c"
        display_int((int )bt_receive_buf[1], (U32___2 )50);
# 889 "car/car.c"
        display_tick = 0;
# 890 "car/car.c"
        nxt_lcd_update();
# 892 "car/car.c"
        goto Lret_display_update___1;
        Lret_display_update___1: ;
      }
# 895 "car/car.c"
      if ((int )bt_receive_buf[2] != 50) {
# 897 "car/car.c"
        sMotorResource.sRightMotor = (S32___0 )bt_receive_buf[2];
# 898 "car/car.c"
        x23 = 0;
# 899 "car/car.c"
        y24 = 3;
# 901 "car/car.c"
        display_x = x23;
# 902 "car/car.c"
        display_y = y24;
# 903 "car/car.c"
        goto Lret_display_goto_xy___2;
        Lret_display_goto_xy___2:
# 906 "car/car.c"
        display_int((int )bt_receive_buf[2], (U32___2 )50);
# 907 "car/car.c"
        display_tick = 0;
# 908 "car/car.c"
        nxt_lcd_update();
# 910 "car/car.c"
        goto Lret_display_update___2;
        Lret_display_update___2: ;
      }
    }
  }
# 915 "car/car.c"
  ReleaseResource(SonarSensor);
# 916 "car/car.c"
  TerminateTask();
# 917 "car/car.c"
  return;
}
}
# 920 "car/car.c"
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
# 936 "car/car.c"
  tmp4 = rand();
# 937 "car/car.c"
  iRandom3 = tmp4 % 10;
# 938 "car/car.c"
  ret_generate_random_number5 = iRandom3;
# 939 "car/car.c"
  goto Lret_generate_random_number;
  Lret_generate_random_number:
# 942 "car/car.c"
  tmp = ret_generate_random_number5;
# 943 "car/car.c"
  iRandom = tmp;
# 944 "car/car.c"
  x11 = 0;
# 945 "car/car.c"
  y12 = 3;
# 947 "car/car.c"
  display_x = x11;
# 948 "car/car.c"
  display_y = y12;
# 949 "car/car.c"
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
# 952 "car/car.c"
  str6 = "Sonar";
# 954 "car/car.c"
  while (*str6) {
# 955 "car/car.c"
    if ((int const )*str6 != 10) {
# 956 "car/car.c"
      c7 = (int )*str6;
# 957 "car/car.c"
      if (c7 >= 0) {
# 958 "car/car.c"
        if (c7 < 128) {
# 959 "car/car.c"
          if (display_x >= 0) {
# 960 "car/car.c"
            if (display_x < 16) {
# 961 "car/car.c"
              if (display_y >= 0) {
# 962 "car/car.c"
                if (display_y < 8) {
# 963 "car/car.c"
                  b9 = & (*(display_buffer + display_y))[display_x * 6];
# 964 "car/car.c"
                  f10 = font[c7];
# 965 "car/car.c"
                  i8 = 0;
# 966 "car/car.c"
                  while (i8 < 5) {
# 967 "car/car.c"
                    *b9 = (U8 )*f10;
# 968 "car/car.c"
                    b9 ++;
# 969 "car/car.c"
                    f10 ++;
# 970 "car/car.c"
                    i8 ++;
                  }
                }
              }
            }
          }
        }
      }
# 978 "car/car.c"
      goto Lret_display_char;
      Lret_display_char:
# 980 "car/car.c"
      display_x ++;
    } else {
# 982 "car/car.c"
      display_x = 0;
# 983 "car/car.c"
      display_y ++;
    }
# 985 "car/car.c"
    str6 ++;
  }
# 987 "car/car.c"
  goto Lret_display_string;
  Lret_display_string:
# 989 "car/car.c"
  display_tick = 0;
# 990 "car/car.c"
  nxt_lcd_update();
# 991 "car/car.c"
  goto Lret_display_update;
  Lret_display_update:
# 993 "car/car.c"
  GetResource(SonarSensor);
# 994 "car/car.c"
  if (iRandom % 2 == 0) {
# 995 "car/car.c"
    sMotorResource.sSonarDistance = ecrobot_get_sonar_sensor((U8___1 )1);
  }
# 997 "car/car.c"
  ReleaseResource(SonarSensor);
# 998 "car/car.c"
  TerminateTask();
# 999 "car/car.c"
  return;
}
}
# 1002 "car/car.c"
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
# 1032 "car/car.c"
  GetResource(SonarSensor);
# 1033 "car/car.c"
  iRandom = 0;
# 1034 "car/car.c"
  bt_send_buf[0] = (U8___1 )1;
# 1035 "car/car.c"
  x20 = 0;
# 1036 "car/car.c"
  y21 = 1;
# 1038 "car/car.c"
  display_x = x20;
# 1039 "car/car.c"
  display_y = y21;
# 1040 "car/car.c"
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
# 1043 "car/car.c"
  display_int((int )sMotorResource.sSonarDistance, (U32___2 )0);
# 1044 "car/car.c"
  x22 = 0;
# 1045 "car/car.c"
  y23 = 2;
# 1047 "car/car.c"
  display_x = x22;
# 1048 "car/car.c"
  display_y = y23;
# 1049 "car/car.c"
  goto Lret_display_goto_xy___0;
  Lret_display_goto_xy___0:
# 1052 "car/car.c"
  display_int((int )sMotorResource.sTurnDistance, (U32___2 )0);
# 1053 "car/car.c"
  display_tick = 0;
# 1054 "car/car.c"
  nxt_lcd_update();
# 1056 "car/car.c"
  goto Lret_display_update;
  Lret_display_update:
# 1058 "car/car.c"
  tmp6 = rand();
# 1059 "car/car.c"
  iRandom5 = tmp6 % 10;
# 1060 "car/car.c"
  ret_generate_random_number7 = iRandom5;
# 1061 "car/car.c"
  goto Lret_generate_random_number;
  Lret_generate_random_number:
# 1064 "car/car.c"
  iRandom = ret_generate_random_number7;
# 1065 "car/car.c"
  x24 = 0;
# 1066 "car/car.c"
  y25 = 4;
# 1068 "car/car.c"
  display_x = x24;
# 1069 "car/car.c"
  display_y = y25;
# 1070 "car/car.c"
  goto Lret_display_goto_xy___1;
  Lret_display_goto_xy___1:
# 1073 "car/car.c"
  display_int(iRandom, (U32___2 )50);
# 1074 "car/car.c"
  display_tick = 0;
# 1075 "car/car.c"
  nxt_lcd_update();
# 1077 "car/car.c"
  goto Lret_display_update___0;
  Lret_display_update___0: ;
# 1079 "car/car.c"
  if (iRandom % 2 == 0) {
# 1080 "car/car.c"
    if (sMotorResource.sSonarDistance <= 225L) {
# 1081 "car/car.c"
      sLeftMotor = (S32___0 )0;
# 1082 "car/car.c"
      sRightMotor = (S32___0 )0;
    } else
# 1084 "car/car.c"
    if (sMotorResource.sTurnDistance - sMotorResource.sSonarDistance == 0L) {
# 1085 "car/car.c"
      sLeftMotor = (S32___0 )0;
# 1086 "car/car.c"
      sRightMotor = (S32___0 )0;
    } else
# 1088 "car/car.c"
    if (sMotorResource.sSonarDistance >= 255L) {
# 1089 "car/car.c"
      bt_send_buf[0] = (U8___1 )0;
# 1090 "car/car.c"
      ecrobot_send_bt_packet(bt_send_buf, (U32___2 )32);
# 1091 "car/car.c"
      sLeftMotor = sMotorResource.sLeftMotor;
# 1092 "car/car.c"
      sRightMotor = sMotorResource.sRightMotor;
    } else {
# 1094 "car/car.c"
      sLeftMotor = sMotorResource.sLeftMotor;
# 1095 "car/car.c"
      sRightMotor = sMotorResource.sRightMotor;
    }
  }
# 1098 "car/car.c"
  n8 = (U32___2 )0;
# 1099 "car/car.c"
  speed_percent9 = (int )sLeftMotor;
# 1100 "car/car.c"
  brake10 = 1;
# 1101 "car/car.c"
  if (n8 < 3UL) {
# 1102 "car/car.c"
    if (speed_percent9 > 100) {
# 1103 "car/car.c"
      speed_percent9 = 100;
    }
# 1105 "car/car.c"
    if (speed_percent9 < -100) {
# 1106 "car/car.c"
      speed_percent9 = -100;
    }
# 1108 "car/car.c"
    motor[n8].speed_percent = speed_percent9;
# 1109 "car/car.c"
    n14 = n8;
# 1110 "car/car.c"
    power_percent15 = speed_percent9;
# 1111 "car/car.c"
    brake16 = brake10;
# 1112 "car/car.c"
    if (n14 < 3UL) {
# 1113 "car/car.c"
      io_to_avr.output_percent[n14] = (S8___0 )power_percent15;
# 1114 "car/car.c"
      if (brake16) {
# 1115 "car/car.c"
        io_to_avr.output_mode = (U8___0 )((int )io_to_avr.output_mode | (1 << n14));
      } else {
# 1117 "car/car.c"
        io_to_avr.output_mode = (U8___0 )((int )io_to_avr.output_mode & ~ (1 << n14));
      }
    }
# 1120 "car/car.c"
    goto Lret_nxt_avr_set_motor;
    Lret_nxt_avr_set_motor: ;
  }
# 1123 "car/car.c"
  goto Lret_nxt_motor_set_speed;
  Lret_nxt_motor_set_speed:
# 1125 "car/car.c"
  n11 = (U32___2 )1;
# 1126 "car/car.c"
  speed_percent12 = (int )sRightMotor;
# 1127 "car/car.c"
  brake13 = 1;
# 1128 "car/car.c"
  if (n11 < 3UL) {
# 1129 "car/car.c"
    if (speed_percent12 > 100) {
# 1130 "car/car.c"
      speed_percent12 = 100;
    }
# 1132 "car/car.c"
    if (speed_percent12 < -100) {
# 1133 "car/car.c"
      speed_percent12 = -100;
    }
# 1135 "car/car.c"
    motor[n11].speed_percent = speed_percent12;
# 1136 "car/car.c"
    n17 = n11;
# 1137 "car/car.c"
    power_percent18 = speed_percent12;
# 1138 "car/car.c"
    brake19 = brake13;
# 1139 "car/car.c"
    if (n17 < 3UL) {
# 1140 "car/car.c"
      io_to_avr.output_percent[n17] = (S8___0 )power_percent18;
# 1141 "car/car.c"
      if (brake19) {
# 1142 "car/car.c"
        io_to_avr.output_mode = (U8___0 )((int )io_to_avr.output_mode | (1 << n17));
      } else {
# 1144 "car/car.c"
        io_to_avr.output_mode = (U8___0 )((int )io_to_avr.output_mode & ~ (1 << n17));
      }
    }
# 1147 "car/car.c"
    goto Lret_nxt_avr_set_motor___0;
    Lret_nxt_avr_set_motor___0: ;
  }
# 1150 "car/car.c"
  goto Lret_nxt_motor_set_speed___0;
  Lret_nxt_motor_set_speed___0:
# 1152 "car/car.c"
  systick_wait_ms((U32___2 )100);
# 1153 "car/car.c"
  ReleaseResource(SonarSensor);
# 1154 "car/car.c"
  TerminateTask();
# 1155 "car/car.c"
  return;
}
}
# 1158 "car/car.c"
void TaskMainIdleTask(void) ;
# 1159 "car/car.c"
static SINT bt_status = 4;
# 1160 "car/car.c"
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
# 1182 "car/car.c"
  while (1) {
# 1183 "car/car.c"
    ecrobot_init_bt_slave("1234");
# 1184 "car/car.c"
    tmp = ecrobot_get_bt_status();
# 1185 "car/car.c"
    if (tmp == 4) {
# 1186 "car/car.c"
      updateToo13 = (U32___2 )0;
# 1187 "car/car.c"
      memset((void *)display_buffer, 0, (size_t )800);
# 1188 "car/car.c"
      if (updateToo13) {
# 1189 "car/car.c"
        display_tick = 0;
# 1190 "car/car.c"
        nxt_lcd_update();
# 1191 "car/car.c"
        goto Lret_display_update___1;
        Lret_display_update___1: ;
      }
# 1194 "car/car.c"
      goto Lret_display_clear;
      Lret_display_clear:
# 1197 "car/car.c"
      x15 = 0;
# 1198 "car/car.c"
      y16 = 0;
# 1200 "car/car.c"
      display_x = x15;
# 1201 "car/car.c"
      display_y = y16;
# 1202 "car/car.c"
      goto Lret_display_goto_xy;
      Lret_display_goto_xy:
# 1205 "car/car.c"
      str3 = "Not initialized";
# 1207 "car/car.c"
      while (*str3) {
# 1208 "car/car.c"
        if ((int const )*str3 != 10) {
# 1209 "car/car.c"
          c5 = (int )*str3;
# 1210 "car/car.c"
          if (c5 >= 0) {
# 1211 "car/car.c"
            if (c5 < 128) {
# 1212 "car/car.c"
              if (display_x >= 0) {
# 1213 "car/car.c"
                if (display_x < 16) {
# 1214 "car/car.c"
                  if (display_y >= 0) {
# 1215 "car/car.c"
                    if (display_y < 8) {
# 1216 "car/car.c"
                      b7 = & (*(display_buffer + display_y))[display_x * 6];
# 1217 "car/car.c"
                      f8 = font[c5];
# 1218 "car/car.c"
                      i6 = 0;
# 1219 "car/car.c"
                      while (i6 < 5) {
# 1220 "car/car.c"
                        *b7 = (U8 )*f8;
# 1221 "car/car.c"
                        b7 ++;
# 1222 "car/car.c"
                        f8 ++;
# 1223 "car/car.c"
                        i6 ++;
                      }
                    }
                  }
                }
              }
            }
          }
# 1231 "car/car.c"
          goto Lret_display_char;
          Lret_display_char:
# 1233 "car/car.c"
          display_x ++;
        } else {
# 1235 "car/car.c"
          display_x = 0;
# 1236 "car/car.c"
          display_y ++;
        }
# 1238 "car/car.c"
        str3 ++;
      }
# 1240 "car/car.c"
      goto Lret_display_string;
      Lret_display_string:
# 1242 "car/car.c"
      display_tick = 0;
# 1243 "car/car.c"
      nxt_lcd_update();
# 1244 "car/car.c"
      goto Lret_display_update;
      Lret_display_update: ;
    }
# 1247 "car/car.c"
    tmp___0 = ecrobot_get_bt_status();
# 1248 "car/car.c"
    if (tmp___0 == 7) {
# 1249 "car/car.c"
      if (bt_status != 7) {
# 1250 "car/car.c"
        updateToo14 = (U32___2 )0;
# 1251 "car/car.c"
        memset((void *)display_buffer, 0, (size_t )800);
# 1252 "car/car.c"
        if (updateToo14) {
# 1253 "car/car.c"
          display_tick = 0;
# 1254 "car/car.c"
          nxt_lcd_update();
# 1255 "car/car.c"
          goto Lret_display_update___2;
          Lret_display_update___2: ;
        }
# 1258 "car/car.c"
        goto Lret_display_clear___0;
        Lret_display_clear___0:
# 1261 "car/car.c"
        x17 = 0;
# 1262 "car/car.c"
        y18 = 0;
# 1264 "car/car.c"
        display_x = x17;
# 1265 "car/car.c"
        display_y = y18;
# 1266 "car/car.c"
        goto Lret_display_goto_xy___0;
        Lret_display_goto_xy___0:
# 1269 "car/car.c"
        str4 = "[BT]";
# 1271 "car/car.c"
        while (*str4) {
# 1272 "car/car.c"
          if ((int const )*str4 != 10) {
# 1273 "car/car.c"
            c9 = (int )*str4;
# 1274 "car/car.c"
            if (c9 >= 0) {
# 1275 "car/car.c"
              if (c9 < 128) {
# 1276 "car/car.c"
                if (display_x >= 0) {
# 1277 "car/car.c"
                  if (display_x < 16) {
# 1278 "car/car.c"
                    if (display_y >= 0) {
# 1279 "car/car.c"
                      if (display_y < 8) {
# 1280 "car/car.c"
                        b11 = & (*(display_buffer + display_y))[display_x * 6];
# 1281 "car/car.c"
                        f12 = font[c9];
# 1282 "car/car.c"
                        i10 = 0;
# 1283 "car/car.c"
                        while (i10 < 5) {
# 1284 "car/car.c"
                          *b11 = (U8 )*f12;
# 1285 "car/car.c"
                          b11 ++;
# 1286 "car/car.c"
                          f12 ++;
# 1287 "car/car.c"
                          i10 ++;
                        }
                      }
                    }
                  }
                }
              }
            }
# 1295 "car/car.c"
            goto Lret_display_char___0;
            Lret_display_char___0:
# 1297 "car/car.c"
            display_x ++;
          } else {
# 1299 "car/car.c"
            display_x = 0;
# 1300 "car/car.c"
            display_y ++;
          }
# 1302 "car/car.c"
          str4 ++;
        }
# 1304 "car/car.c"
        goto Lret_display_string___0;
        Lret_display_string___0:
# 1306 "car/car.c"
        display_tick = 0;
# 1307 "car/car.c"
        nxt_lcd_update();
# 1308 "car/car.c"
        goto Lret_display_update___0;
        Lret_display_update___0: ;
      }
    }
# 1312 "car/car.c"
    bt_status = ecrobot_get_bt_status();
  }
}
}
# 1316 "car/car.c"
extern int create_task() ;
# 1326 "car/car.c"
extern int ( create_block)() ;
# 1317 "car/car.c"
void main(void)
{


  {
# 1321 "car/car.c"
  create_task("TaskMainIdleTask", "TaskMainIdleTask", 1, 25, 0.965);
# 1322 "car/car.c"
  create_task("TaskMainMotorControlTask", "TaskMainMotorControlTask", 3, 50, 0.108);
# 1323 "car/car.c"
  create_task("TaskMainBluetooth_Receive", "TaskMainBluetooth_Receive", 2, 35, 0.372);
# 1324 "car/car.c"
  create_task("TaskMainGetCurrentSonarSensor", "TaskMainGetCurrentSonarSensor", 4,
              25, 0.107);
# 1326 "car/car.c"
  create_block(1032, "TaskMainMotorControlTask", "SonarSensor", 1, 3, 0.378);
# 1327 "car/car.c"
  create_block(743, "TaskMainBluetooth_Receive", "SonarSensor", 1, 2, 0.108);
# 1328 "car/car.c"
  create_block(993, "TaskMainGetCurrentSonarSensor", "SonarSensor", 1, 4, 0.009);
# 1329 "car/car.c"
  return;
}
}

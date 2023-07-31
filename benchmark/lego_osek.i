# 1 "lego_osek/lego_osek.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "lego_osek/lego_osek.c"



typedef int _boolean;
typedef unsigned char UINT8;
typedef unsigned char U8;
typedef UINT8 ResourceType;
typedef UINT8 StatusType;
typedef unsigned char U8___1;
typedef signed char S8___0;
typedef unsigned short U16___1;
typedef unsigned long U32___1;
struct __anonstruct_to_avr_432250394 {
   U8___1 power ;
   U8___1 pwm_frequency ;
   S8___0 output_percent[4] ;
   U8___1 output_mode ;
   U8___1 input_power ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_to_avr_432250394 to_avr;
struct __anonstruct_from_avr_708559676 {
   U16___1 adc_value[4] ;
   U16___1 buttonsVal ;
   U16___1 extra ;
   U8___1 csum ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_from_avr_708559676 from_avr;
struct motor_struct ;
typedef unsigned char byte;
typedef unsigned short TWOBYTES;
struct _freeBlock {
   TWOBYTES size : 15 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
struct _objects {
   byte _class ;
   byte padding : 5 ;
   byte mark : 1 ;
   byte isArray : 1 ;
   byte isAllocated : 1 ;
} __attribute__((__packed__)) ;
struct _arrays {
   TWOBYTES length : 9 ;
   TWOBYTES type : 4 ;
   TWOBYTES mark : 1 ;
   TWOBYTES isArray : 1 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
union _flags {
   TWOBYTES all ;
   struct _freeBlock freeBlock ;
   struct _objects objects ;
   struct _arrays arrays ;
} __attribute__((__packed__)) ;
struct S_Object {
   union _flags flags ;
   byte monitorCount ;
   byte threadId ;
} __attribute__((__packed__)) ;
typedef struct S_Object Object;
struct __anonstruct_display_array_740464799 {
   Object hdr ;
   U8 display[9][100] ;
} __attribute__((__packed__)) ;
typedef double _real;
struct __anonstruct_motor_control_ctx_982217023 {
   _real _Cg ;
   _real _Cd ;
   _real _u_d ;
   _real _u_g ;
   _real M22 ;
   _boolean M22_nil ;
   _boolean M19 ;
};
typedef struct __anonstruct_motor_control_ctx_982217023 motor_control_ctx;
typedef int _boolean___0;
typedef double _real___0;
struct __anonstruct_obst_detector_ctx_475692995 {
   _real___0 _Co ;
   _real___0 _Cg ;
   _boolean___0 _obstacle ;
   _boolean___0 M13 ;
   _boolean___0 M13_nil ;
   _boolean___0 M32 ;
   _boolean___0 M32_nil ;
   _boolean___0 M27 ;
   _boolean___0 M27_nil ;
   _boolean___0 M20 ;
   _boolean___0 M20_nil ;
   _boolean___0 M10 ;
   _boolean___0 M10_nil ;
   _boolean___0 M7 ;
};
typedef struct __anonstruct_obst_detector_ctx_475692995 obst_detector_ctx;
typedef unsigned char U8___2;
typedef unsigned long U32;
typedef unsigned int AT91_REG;
typedef unsigned char U8___0;
typedef unsigned short U16___0;
typedef unsigned long U32___0;
struct i2c_partial_transaction {
   U8___0 start : 1 ;
   U8___0 restart : 1 ;
   U8___0 stop : 1 ;
   U8___0 tx : 1 ;
   U8___0 last_pt : 1 ;
   U16___0 nbytes ;
   U8___0 *data ;
};
enum __anonenum_i2c_port_state_506411302 {
    I2C_UNINITIALISED = 0,
    I2C_IDLE = 1,
    I2C_BEGIN = 2,
    I2C_RESTART1 = 3,
    I2C_START1 = 4,
    I2C_START2 = 5,
    I2C_START3 = 6,
    I2C_START_RECLOCK1 = 7,
    I2C_LOW0 = 8,
    I2C_LOW1 = 9,
    I2C_HIGH0 = 10,
    I2C_HIGH1 = 11,
    I2C_STOP0 = 12,
    I2C_STOP1 = 13,
    I2C_STOP2 = 14,
    I2C_STOP3 = 15
} ;
typedef enum __anonenum_i2c_port_state_506411302 i2c_port_state;
struct i2c_port_struct {
   U32___0 scl_pin ;
   U32___0 sda_pin ;
   U8___0 addr_int[2] ;
   U8___0 addr ;
   struct i2c_partial_transaction partial_transaction[3] ;
   struct i2c_partial_transaction *current_pt ;
   i2c_port_state state ;
   U32___0 nbits ;
   U32___0 ack_slot ;
   U32___0 ack_slot_pending ;
   U8___0 *data ;
   U32___0 transmitting ;
   U32___0 fault ;
   U32___0 n_fault ;
   U32___0 n_good ;
   U32___0 ack_fail ;
   U32___0 ack_good ;
   U32___0 pt_num ;
   U32___0 pt_begun ;
};
typedef unsigned long U32___2;
struct motor_struct {
   int current_count ;
   int target_count ;
   int speed_percent ;
   U32___2 last ;
};
typedef unsigned char U8___3;
typedef signed char S8___1;
typedef unsigned short U16___2;
typedef unsigned long U32___3;
typedef long S32___0;
typedef unsigned long size_t___1;
typedef double _real___1;
typedef unsigned short U16___3;
typedef unsigned long U32___4;
typedef double _real___2;
typedef float _float___0;
static _boolean multi_task_obst ;
extern ResourceType lcd ;
extern StatusType GetResource(ResourceType resid ) ;
extern StatusType ReleaseResource(ResourceType resid ) ;
static to_avr io_to_avr ;
static int display_x ;
static int display_y ;
int display_tick ;
U8 const *display = (U8 const *)((U8 *)0);
unsigned char volatile dirty = (U8 volatile )0;
static struct motor_struct motor[3] ;
static struct __anonstruct_display_array_740464799 display_array ;
static U8 (*display_buffer)[100] = display_array.display;
static U8 const font[128][5] =
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
static motor_control_ctx ctx ;
extern void motor_control_O_u_d(double ud ) ;
extern void motor_control_O_u_g(double ug ) ;
static obst_detector_ctx ctx_obst ;
int display_auto_update ;
unsigned char volatile page = (U8___2 volatile )0;
U8___2 const *data = (U8___2 const *)((U8___2 *)0);
U8___2 mode = (U8___2 )255;
extern __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1), __leaf__)) memset)(void *__s ,
                                                                                               int __c ,
                                                                                               unsigned long __n ) ;
extern __attribute__((__nothrow__)) unsigned long ( __attribute__((__nonnull__(1),
__leaf__)) strlen)(char const *__s ) __attribute__((__pure__)) ;
int display_tick = 0;
int display_auto_update = 1;
static struct i2c_port_struct i2c_port[4] ;
char const avr_brainwash_string[48] =
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
static from_avr *io_from_avr ;
extern StatusType TerminateTask(void) ;
static S32___0 distance_state[4] = { (S32___0 )-1, (S32___0 )-1, (S32___0 )-1, (S32___0 )-1};
U8___3 const NXT_COLORSENSOR_PROTOCOLS[7] = { (U8___3 const )176, (U8___3 const )112, (U8___3 const )240, (U8___3 const )8,
        (U8___3 const )176, (U8___3 const )136, (U8___3 const )136};
static int sens_white_cal_right ;
static int sens_white_cal_left ;
static int sens_black_cal_right ;
static int sens_black_cal_left ;
void TaskMainHighTask(void)
{
  U16___3 raw_sensor_right ;
  U16___3 raw_sensor_left ;
  U8___3 port_id3 ;
  U32___3 tmp4 ;
  U16___2 ret_ecrobot_get_light_sensor5 ;
  U8___3 port_id6 ;
  U32___3 tmp7 ;
  U16___2 ret_ecrobot_get_light_sensor8 ;
  U32___1 n9 ;
  unsigned long ret_sensor_adc10 ;
  U32___1 n11 ;
  unsigned long ret_sensor_adc12 ;
  char *varname13 ;
  int line14 ;
  int value15 ;
  int l16 ;
  size_t___1 tmp17 ;
  int val618 ;
  U32 places719 ;
  int tmp820 ;
  int x921 ;
  int y1022 ;
  int x1123 ;
  int y1224 ;
  int x1325 ;
  int y1426 ;
  char const *str1527 ;
  int c1628 ;
  int i1729 ;
  U8___2 *b1830 ;
  U8___2 const *f1931 ;
  U32 val2032 ;
  U32 places2133 ;
  U32 sign2234 ;
  char x2335[12] ;
  char *p2436 ;
  int p_count2537 ;
  char const *str72638 ;
  int c82739 ;
  int i92840 ;
  U8___2 *b102941 ;
  U8___2 const *f113042 ;
  char *varname43 ;
  int line44 ;
  int value45 ;
  int l46 ;
  size_t___1 tmp47 ;
  int val648 ;
  U32 places749 ;
  int tmp850 ;
  int x951 ;
  int y1052 ;
  int x1153 ;
  int y1254 ;
  int x1355 ;
  int y1456 ;
  char const *str1557 ;
  int c1658 ;
  int i1759 ;
  U8___2 *b1860 ;
  U8___2 const *f1961 ;
  U32 val2062 ;
  U32 places2163 ;
  U32 sign2264 ;
  char x2365[12] ;
  char *p2466 ;
  int p_count2567 ;
  char const *str72668 ;
  int c82769 ;
  int i92870 ;
  U8___2 *b102971 ;
  U8___2 const *f113072 ;
  _real V73 ;
  _real V74 ;
  _real L375 ;
  _real L1476 ;
  _real L1777 ;
  _real L1378 ;
  _real L1179 ;
  _real L1880 ;
  _real L1081 ;
  _real L882 ;
  _real L2383 ;
  _real L784 ;
  _real L3085 ;
  _boolean L2986 ;
  _real L3187 ;
  _real L2888 ;
  _real L2789 ;
  _real L3490 ;
  _real L3291 ;
  _real L2692 ;
  _real L2593 ;
  _real L694 ;
  _real L295 ;
  _real L3896 ;
  _real L3797 ;
  _real L3698 ;
  _real T2299 ;
  int tmp100 ;

  {
  port_id3 = (U8___3 )0;
  n9 = (U32___3 )port_id3;
  if (n9 < 4UL) {
    ret_sensor_adc10 = (U32___1 )io_from_avr->adc_value[n9];
    goto Lret_sensor_adc;
  } else {
    ret_sensor_adc10 = (U32___1 )0;
    goto Lret_sensor_adc;
  }
  Lret_sensor_adc:
  tmp4 = ret_sensor_adc10;
  ret_ecrobot_get_light_sensor5 = (U16___2 )tmp4;
  goto Lret_ecrobot_get_light_sensor;
  Lret_ecrobot_get_light_sensor:
  raw_sensor_right = ret_ecrobot_get_light_sensor5;
  port_id6 = (U8___3 )3;
  n11 = (U32___3 )port_id6;
  if (n11 < 4UL) {
    ret_sensor_adc12 = (U32___1 )io_from_avr->adc_value[n11];
    goto Lret_sensor_adc___0;
  } else {
    ret_sensor_adc12 = (U32___1 )0;
    goto Lret_sensor_adc___0;
  }
  Lret_sensor_adc___0:
  tmp7 = ret_sensor_adc12;
  ret_ecrobot_get_light_sensor8 = (U16___2 )tmp7;
  goto Lret_ecrobot_get_light_sensor___0;
  Lret_ecrobot_get_light_sensor___0:
  raw_sensor_left = ret_ecrobot_get_light_sensor8;
  if ((int )raw_sensor_right < sens_white_cal_right) {
    raw_sensor_right = (U16___3 )sens_white_cal_right;
  } else
  if ((int )raw_sensor_right > sens_black_cal_right) {
    raw_sensor_right = (U16___3 )sens_black_cal_right;
  }
  if ((int )raw_sensor_left < sens_white_cal_left) {
    raw_sensor_left = (U16___3 )sens_white_cal_left;
  } else
  if ((int )raw_sensor_left > sens_black_cal_left) {
    raw_sensor_left = (U16___3 )sens_black_cal_left;
  }
  raw_sensor_right = (U16___3 )((((int )raw_sensor_right - sens_white_cal_right) * 100) / (sens_black_cal_right - sens_white_cal_right));
  raw_sensor_left = (U16___3 )((((int )raw_sensor_left - sens_white_cal_left) * 100) / (sens_black_cal_left - sens_white_cal_left));
  raw_sensor_right = (U16___3 )(100 - (int )raw_sensor_right);
  raw_sensor_left = (U16___3 )(100 - (int )raw_sensor_left);
  varname13 = (char *)"raw_right";
  line14 = 0;
  value15 = (int )raw_sensor_right;
  GetResource(lcd);
  x921 = 0;
  y1022 = line14;
  display_x = x921;
  display_y = y1022;
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
  str1527 = (char const *)varname13;
  while (*str1527) {
    if ((int const )*str1527 != 10) {
      c1628 = (int )*str1527;
      if (c1628 >= 0) {
        if (c1628 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b1830 = & (*(display_buffer + display_y))[display_x * 6];
                  f1931 = font[c1628];
                  i1729 = 0;
                  while (i1729 < 5) {
                    *b1830 = (U8___2 )*f1931;
                    b1830 ++;
                    f1931 ++;
                    i1729 ++;
                  }
                }
              }
            }
          }
        }
      }
      goto Lret_display_char;
      Lret_display_char:
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str1527 ++;
  }
  goto Lret_display_string;
  Lret_display_string:
  tmp17 = strlen((char const *)varname13);
  l16 = (int )tmp17;
  x1123 = l16;
  y1224 = line14;
  display_x = x1123;
  display_y = y1224;
  goto Lret_display_goto_xy___0;
  Lret_display_goto_xy___0:
  val618 = value15;
  places719 = (U32___3 )4;
  if (val618 < 0) {
    tmp820 = - val618;
  } else {
    tmp820 = val618;
  }
  val2032 = (U32 )tmp820;
  places2133 = places719;
  sign2234 = (U32 )(val618 < 0);
  p2436 = & x2335[11];
  p_count2537 = 0;
  *p2436 = (char)0;
  if (places2133 > 11UL) {
    places2133 = (U32 )11;
  }
  while (val2032) {
    p2436 --;
    p_count2537 ++;
    *p2436 = (char )(val2032 % 10UL + 48UL);
    val2032 /= 10UL;
  }
  if (! p_count2537) {
    p2436 --;
    p_count2537 ++;
    *p2436 = (char )'0';
  }
  if (sign2234) {
    p2436 --;
    p_count2537 ++;
    *p2436 = (char )'-';
  }
  while ((U32 )p_count2537 < places2133) {
    p2436 --;
    p_count2537 ++;
    *p2436 = (char )' ';
  }
  str72638 = (char const *)p2436;
  while (*str72638) {
    if ((int const )*str72638 != 10) {
      c82739 = (int )*str72638;
      if (c82739 >= 0) {
        if (c82739 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b102941 = & (*(display_buffer + display_y))[display_x * 6];
                  f113042 = font[c82739];
                  i92840 = 0;
                  while (i92840 < 5) {
                    *b102941 = (U8___2 )*f113042;
                    b102941 ++;
                    f113042 ++;
                    i92840 ++;
                  }
                }
              }
            }
          }
        }
      }
      goto Lret_display_char___0;
      Lret_display_char___0:
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str72638 ++;
  }
  goto Lret_display_string___0;
  Lret_display_string___0: ;
  goto Lret_display_unsigned_worker;
  Lret_display_unsigned_worker: ;
  goto Lret_display_int;
  Lret_display_int:
  x1325 = 0;
  y1426 = line14 + 1;
  display_x = x1325;
  display_y = y1426;
  goto Lret_display_goto_xy___1;
  Lret_display_goto_xy___1:
  display_tick = 0;
  if (! display) {
    goto Lret_nxt_spi_refresh;
  }
  dirty = (unsigned char volatile )1;

  goto Lret_nxt_spi_refresh;
  Lret_nxt_spi_refresh: ;
  goto Lret_nxt_lcd_update;
  Lret_nxt_lcd_update: ;
  goto Lret_display_update;
  Lret_display_update:
  ReleaseResource(lcd);
  goto Lret_show_var;
  Lret_show_var:
  varname43 = (char *)"raw_left";
  line44 = 1;
  value45 = (int )raw_sensor_left;
  GetResource(lcd);
  x951 = 0;
  y1052 = line44;
  display_x = x951;
  display_y = y1052;
  goto Lret_display_goto_xy___2;
  Lret_display_goto_xy___2:
  str1557 = (char const *)varname43;
  while (*str1557) {
    if ((int const )*str1557 != 10) {
      c1658 = (int )*str1557;
      if (c1658 >= 0) {
        if (c1658 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b1860 = & (*(display_buffer + display_y))[display_x * 6];
                  f1961 = font[c1658];
                  i1759 = 0;
                  while (i1759 < 5) {
                    *b1860 = (U8___2 )*f1961;
                    b1860 ++;
                    f1961 ++;
                    i1759 ++;
                  }
                }
              }
            }
          }
        }
      }
      goto Lret_display_char___1;
      Lret_display_char___1:
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str1557 ++;
  }
  goto Lret_display_string___1;
  Lret_display_string___1:
  tmp47 = strlen((char const *)varname43);
  l46 = (int )tmp47;
  x1153 = l46;
  y1254 = line44;
  display_x = x1153;
  display_y = y1254;
  goto Lret_display_goto_xy___3;
  Lret_display_goto_xy___3:
  val648 = value45;
  places749 = (U32___3 )4;
  if (val648 < 0) {
    tmp850 = - val648;
  } else {
    tmp850 = val648;
  }
  val2062 = (U32 )tmp850;
  places2163 = places749;
  sign2264 = (U32 )(val648 < 0);
  p2466 = & x2365[11];
  p_count2567 = 0;
  *p2466 = (char)0;
  if (places2163 > 11UL) {
    places2163 = (U32 )11;
  }
  while (val2062) {
    p2466 --;
    p_count2567 ++;
    *p2466 = (char )(val2062 % 10UL + 48UL);
    val2062 /= 10UL;
  }
  if (! p_count2567) {
    p2466 --;
    p_count2567 ++;
    *p2466 = (char )'0';
  }
  if (sign2264) {
    p2466 --;
    p_count2567 ++;
    *p2466 = (char )'-';
  }
  while ((U32 )p_count2567 < places2163) {
    p2466 --;
    p_count2567 ++;
    *p2466 = (char )' ';
  }
  str72668 = (char const *)p2466;
  while (*str72668) {
    if ((int const )*str72668 != 10) {
      c82769 = (int )*str72668;
      if (c82769 >= 0) {
        if (c82769 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b102971 = & (*(display_buffer + display_y))[display_x * 6];
                  f113072 = font[c82769];
                  i92870 = 0;
                  while (i92870 < 5) {
                    *b102971 = (U8___2 )*f113072;
                    b102971 ++;
                    f113072 ++;
                    i92870 ++;
                  }
                }
              }
            }
          }
        }
      }
      goto Lret_display_char___2;
      Lret_display_char___2:
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str72668 ++;
  }
  goto Lret_display_string___2;
  Lret_display_string___2: ;
  goto Lret_display_unsigned_worker___0;
  Lret_display_unsigned_worker___0: ;
  goto Lret_display_int___0;
  Lret_display_int___0:
  x1355 = 0;
  y1456 = line44 + 1;
  display_x = x1355;
  display_y = y1456;
  goto Lret_display_goto_xy___4;
  Lret_display_goto_xy___4:
  display_tick = 0;
  if (! display) {
    goto Lret_nxt_spi_refresh___0;
  }
  dirty = (unsigned char volatile )1;
  *((AT91_REG *)4294836244U) = 1U << 5;
  goto Lret_nxt_spi_refresh___0;
  Lret_nxt_spi_refresh___0: ;
  goto Lret_nxt_lcd_update___0;
  Lret_nxt_lcd_update___0: ;
  goto Lret_display_update___0;
  Lret_display_update___0:
  ReleaseResource(lcd);
  goto Lret_show_var___0;
  Lret_show_var___0:
  V73 = (_real___1 )raw_sensor_right;
  ctx._Cd = V73;
  goto Lret_motor_control_I_Cd;
  Lret_motor_control_I_Cd:
  V74 = (_real___1 )raw_sensor_left;
  ctx._Cg = V74;
  goto Lret_motor_control_I_Cg;
  Lret_motor_control_I_Cg:
  L375 = 1.000000 / 2.000000;
  L1476 = 3.14159265359 / 200.000000;
  L1777 = ctx._Cd - ctx._Cg;
  L1378 = L1476 * L1777;
  L1179 = 0.002000 * L1378;
  if (ctx.M19) {
    L1880 = 0.000000;
  } else {
    L1880 = ctx.M22;
  }
  L1081 = L1179 + L1880;
  L882 = 0.43625 * L1081;
  L2383 = 2.5 * L1378;
  L784 = L882 + L2383;
  L3085 = 2.000000 * L784;
  L2986 = L3085 < 0.000000;
  L3187 = - L3085;
  if (L2986) {
    L2888 = L3187;
  } else {
    L2888 = L3085;
  }
  L2789 = - L2888;
  L3490 = ctx._Cd + ctx._Cg;
  L3291 = 0.005000 * L3490;
  L2692 = L2789 + L3291;
  L2593 = 2.000000 * L2692;
  L694 = L784 + L2593;
  L295 = L375 * L694;
  motor_control_O_u_d(L295);
  L3896 = - L784;
  L3797 = L3896 + L2593;
  L3698 = L375 * L3797;
  motor_control_O_u_g(L3698);
  T2299 = L1081;
  ctx.M22 = T2299;
  ctx.M22_nil = 0;
  if (ctx.M19) {
    tmp100 = 0;
  } else {
    tmp100 = 0;
  }
  ctx.M19 = tmp100;
  goto Lret_motor_control_step;
  Lret_motor_control_step:
  TerminateTask();
  return;
}
}
void TaskMainLowTask(void) ;
static U32___4 previous_raw_sonar_value = (U32___4 )255;
void TaskMainLowTask(void)
{
  U16___3 raw_sensor_left ;
  U32___4 raw_sonar_value ;
  S32___0 tmp ;
  _float___0 sonar_value ;
  U8___3 port_id5 ;
  U32___3 tmp6 ;
  U16___2 ret_ecrobot_get_light_sensor7 ;
  U8___3 port_id8 ;
  int tmp9 ;
  S32___0 ret_ecrobot_get_sonar_sensor10 ;
  int port11 ;
  int ret_i2c_busy12 ;
  int port13 ;
  U32___0 address14 ;
  int internal_address15 ;
  int n_internal_address_bytes16 ;
  U8___0 *data17 ;
  U32___0 nbytes18 ;
  int write19 ;
  struct i2c_port_struct *p20 ;
  struct i2c_partial_transaction *pt21 ;
  int tmp22 ;
  int tmp___023 ;
  int port1224 ;
  int ret_i2c_busy1325 ;
  U32___1 n26 ;
  unsigned long ret_sensor_adc27 ;
  char *varname28 ;
  int line29 ;
  int value30 ;
  int l31 ;
  size_t___1 tmp32 ;
  int val633 ;
  U32 places734 ;
  int tmp835 ;
  int x936 ;
  int y1037 ;
  int x1138 ;
  int y1239 ;
  int x1340 ;
  int y1441 ;
  char const *str1542 ;
  int c1643 ;
  int i1744 ;
  U8___2 *b1845 ;
  U8___2 const *f1946 ;
  U32 val2047 ;
  U32 places2148 ;
  U32 sign2249 ;
  char x2350[12] ;
  char *p2451 ;
  int p_count2552 ;
  char const *str72653 ;
  int c82754 ;
  int i92855 ;
  U8___2 *b102956 ;
  U8___2 const *f113057 ;
  _real___0 V58 ;
  _real___0 V59 ;
  _boolean___0 L460 ;
  _boolean___0 L661 ;
  _boolean___0 L362 ;
  _boolean___0 L1263 ;
  _boolean___0 L1164 ;
  _boolean___0 L265 ;
  _boolean___0 L1766 ;
  _boolean___0 L1967 ;
  _boolean___0 L1668 ;
  _boolean___0 L1569 ;
  _boolean___0 L2470 ;
  _boolean___0 L2671 ;
  _boolean___0 L2372 ;
  _boolean___0 L2273 ;
  _boolean___0 L3074 ;
  _boolean___0 L3175 ;
  _boolean___0 L2976 ;
  _boolean___0 L2877 ;
  _boolean___0 L2178 ;
  _boolean___0 L1479 ;
  _boolean___0 T1380 ;
  _boolean___0 T3281 ;
  _boolean___0 T2782 ;
  _boolean___0 T2083 ;
  _boolean___0 T1084 ;
  int tmp85 ;
  int tmp___086 ;
  int tmp___187 ;
  int tmp___288 ;
  int tmp___389 ;
  int tmp___490 ;
  int tmp___591 ;
  int tmp___692 ;
  int tmp___793 ;
  int tmp___894 ;
  int tmp___995 ;
  int obst96 ;
  _real___2 Pg97 ;
  _real___2 Pd98 ;
  char *varname499 ;
  int line5100 ;
  int value6101 ;
  int l7102 ;
  size_t___1 tmp8103 ;
  int val69104 ;
  U32 places710105 ;
  int tmp811106 ;
  int x912107 ;
  int y1013108 ;
  int x1114109 ;
  int y1215110 ;
  int x1316111 ;
  int y1417112 ;
  char const *str1518113 ;
  int c1619114 ;
  int i1720115 ;
  U8___2 *b1821116 ;
  U8___2 const *f1922117 ;
  U32 val2023118 ;
  U32 places2124119 ;
  U32 sign2225120 ;
  char x2326121[12] ;
  char *p2427122 ;
  int p_count2528123 ;
  char const *str72629124 ;
  int c82730125 ;
  int i92831126 ;
  U8___2 *b102932127 ;
  U8___2 const *f113033128 ;
  char *varname34129 ;
  int line35130 ;
  int value36131 ;
  int l37132 ;
  size_t___1 tmp38133 ;
  int val639134 ;
  U32 places740135 ;
  int tmp841136 ;
  int x942137 ;
  int y1043138 ;
  int x1144139 ;
  int y1245140 ;
  int x1346141 ;
  int y1447142 ;
  char const *str1548143 ;
  int c1649144 ;
  int i1750145 ;
  U8___2 *b1851146 ;
  U8___2 const *f1952147 ;
  U32 val2053148 ;
  U32 places2154149 ;
  U32 sign2255150 ;
  char x2356151[12] ;
  char *p2457152 ;
  int p_count2558153 ;
  char const *str72659154 ;
  int c82760155 ;
  int i92861156 ;
  U8___2 *b102962157 ;
  U8___2 const *f113063158 ;
  U32___4 port64159 ;
  _real___2 speed65160 ;
  int speed_percent66161 ;
  U8___3 port_id467162 ;
  S8___1 speed568163 ;
  U32___2 n669164 ;
  int speed_percent770165 ;
  int brake871166 ;
  U32___1 n972167 ;
  int power_percent1073168 ;
  int brake1174169 ;
  U32___4 port75170 ;
  _real___2 speed76171 ;
  int speed_percent77172 ;
  U8___3 port_id478173 ;
  S8___1 speed579174 ;
  U32___2 n680175 ;
  int speed_percent781176 ;
  int brake882177 ;
  U32___1 n983178 ;
  int power_percent1084179 ;
  int brake1185180 ;

  {
  port_id5 = (U8___3 )3;
  n26 = (U32___3 )port_id5;
  if (n26 < 4UL) {
    ret_sensor_adc27 = (U32___1 )io_from_avr->adc_value[n26];
    goto Lret_sensor_adc;
  } else {
    ret_sensor_adc27 = (U32___1 )0;
    goto Lret_sensor_adc;
  }
  Lret_sensor_adc:
  tmp6 = ret_sensor_adc27;
  ret_ecrobot_get_light_sensor7 = (U16___2 )tmp6;
  goto Lret_ecrobot_get_light_sensor;
  Lret_ecrobot_get_light_sensor:
  raw_sensor_left = ret_ecrobot_get_light_sensor7;
  if ((int )raw_sensor_left < sens_white_cal_left) {
    raw_sensor_left = (U16___3 )sens_white_cal_left;
  } else
  if ((int )raw_sensor_left > sens_black_cal_left) {
    raw_sensor_left = (U16___3 )sens_black_cal_left;
  }
  raw_sensor_left = (U16___3 )((((int )raw_sensor_left - sens_white_cal_left) * 100) / (sens_black_cal_left - sens_white_cal_left));
  raw_sensor_left = (U16___3 )(100 - (int )raw_sensor_left);
  port_id8 = (U8___3 )1;
  port11 = (int )port_id8;
  if (port11 >= 0) {
    if (port11 < 4) {
      ret_i2c_busy12 = (unsigned int )i2c_port[port11].state > 1U;
      goto Lret_i2c_busy;
    }
  }
  ret_i2c_busy12 = 0;
  goto Lret_i2c_busy;
  Lret_i2c_busy:
  tmp9 = ret_i2c_busy12;
  if (tmp9 == 0) {
    distance_state[port_id8] = (S32___0 )*(data + (int )port_id8);
    port13 = (int )port_id8;
    address14 = (U32___3 )1;
    internal_address15 = 66;
    n_internal_address_bytes16 = 1;
    data17 = (U8___0 *)(data + (int )port_id8);
    nbytes18 = (U32___3 )1;
    write19 = 0;
    if (port13 < 0) {
      goto Lret_i2c_start_transaction;
    } else
    if (port13 >= 4) {
      goto Lret_i2c_start_transaction;
    }
    port1224 = port13;
    if (port1224 >= 0) {
      if (port1224 < 4) {
        ret_i2c_busy1325 = (unsigned int )i2c_port[port1224].state > 1U;
        goto Lret_i2c_busy___0;
      }
    }
    ret_i2c_busy1325 = 0;
    goto Lret_i2c_busy___0;
    Lret_i2c_busy___0:
    tmp22 = ret_i2c_busy1325;
    if (tmp22) {
      goto Lret_i2c_start_transaction;
    }
    p20 = & i2c_port[port13];
    p20->pt_num = (U32___0 )0;
    p20->pt_begun = (U32___0 )0;
    pt21 = p20->partial_transaction;
    p20->current_pt = pt21;
    memset((void *)pt21, 0, sizeof(p20->partial_transaction));
    if (n_internal_address_bytes16 > 0) {
      p20->addr_int[0] = (U8___0 )(address14 << 1);
      p20->addr_int[1] = (U8___0 )internal_address15;
      pt21->start = (U8___0 )1;
      if (write19) {
        pt21->stop = (U8___0 )0;
      } else {
        pt21->stop = (U8___0 )1;
      }
      pt21->tx = (U8___0 )1;
      pt21->data = p20->addr_int;
      pt21->nbytes = (U16___0 )2;
      pt21 ++;
    }
    if (n_internal_address_bytes16 == 0) {
      goto _L;
    } else
    if (! write19) {
      _L:
      if (n_internal_address_bytes16 > 0) {
        pt21->start = (U8___0 )0;
      } else {
        pt21->start = (U8___0 )1;
      }
      pt21->restart = (U8___0 )(! pt21->start);
      pt21->stop = (U8___0 )0;
      pt21->tx = (U8___0 )1;
      if (write19) {
        tmp___023 = 0;
      } else {
        tmp___023 = 1;
      }
      p20->addr = (U8___0 )((address14 << 1) | (unsigned long )tmp___023);
      pt21->data = & p20->addr;
      pt21->nbytes = (U16___0 )1;
      pt21 ++;
    }
    pt21->start = (U8___0 )0;
    pt21->stop = (U8___0 )1;
    if (write19) {
      pt21->tx = (U8___0 )1;
    } else {
      pt21->tx = (U8___0 )0;
    }
    pt21->data = data17;
    pt21->nbytes = (U16___0 )nbytes18;
    pt21->last_pt = (U8___0 )1;
    p20->state = (i2c_port_state )2;
    goto Lret_i2c_start_transaction;
    Lret_i2c_start_transaction: ;
  }
  ret_ecrobot_get_sonar_sensor10 = distance_state[port_id8];
  goto Lret_ecrobot_get_sonar_sensor;
  Lret_ecrobot_get_sonar_sensor:
  tmp = ret_ecrobot_get_sonar_sensor10;
  raw_sonar_value = (U32___4 )tmp;
  if (raw_sonar_value < 0UL) {
    raw_sonar_value = previous_raw_sonar_value;
  } else {
    previous_raw_sonar_value = raw_sonar_value;
  }
  sonar_value = (_float___0 )((double )raw_sonar_value / 2.56);
  varname28 = (char *)"sonar";
  line29 = 2;
  value30 = (int )sonar_value;
  GetResource(lcd);
  x936 = 0;
  y1037 = line29;
  display_x = x936;
  display_y = y1037;
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
  str1542 = (char const *)varname28;
  while (*str1542) {
    if ((int const )*str1542 != 10) {
      c1643 = (int )*str1542;
      if (c1643 >= 0) {
        if (c1643 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b1845 = & (*(display_buffer + display_y))[display_x * 6];
                  f1946 = font[c1643];
                  i1744 = 0;
                  while (i1744 < 5) {
                    *b1845 = (U8___2 )*f1946;
                    b1845 ++;
                    f1946 ++;
                    i1744 ++;
                  }
                }
              }
            }
          }
        }
      }
      goto Lret_display_char;
      Lret_display_char:
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str1542 ++;
  }
  goto Lret_display_string;
  Lret_display_string:
  tmp32 = strlen((char const *)varname28);
  l31 = (int )tmp32;
  x1138 = l31;
  y1239 = line29;
  display_x = x1138;
  display_y = y1239;
  goto Lret_display_goto_xy___0;
  Lret_display_goto_xy___0:
  val633 = value30;
  places734 = (U32___3 )4;
  if (val633 < 0) {
    tmp835 = - val633;
  } else {
    tmp835 = val633;
  }
  val2047 = (U32 )tmp835;
  places2148 = places734;
  sign2249 = (U32 )(val633 < 0);
  p2451 = & x2350[11];
  p_count2552 = 0;
  *p2451 = (char)0;
  if (places2148 > 11UL) {
    places2148 = (U32 )11;
  }
  while (val2047) {
    p2451 --;
    p_count2552 ++;
    *p2451 = (char )(val2047 % 10UL + 48UL);
    val2047 /= 10UL;
  }
  if (! p_count2552) {
    p2451 --;
    p_count2552 ++;
    *p2451 = (char )'0';
  }
  if (sign2249) {
    p2451 --;
    p_count2552 ++;
    *p2451 = (char )'-';
  }
  while ((U32 )p_count2552 < places2148) {
    p2451 --;
    p_count2552 ++;
    *p2451 = (char )' ';
  }
  str72653 = (char const *)p2451;
  while (*str72653) {
    if ((int const )*str72653 != 10) {
      c82754 = (int )*str72653;
      if (c82754 >= 0) {
        if (c82754 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b102956 = & (*(display_buffer + display_y))[display_x * 6];
                  f113057 = font[c82754];
                  i92855 = 0;
                  while (i92855 < 5) {
                    *b102956 = (U8___2 )*f113057;
                    b102956 ++;
                    f113057 ++;
                    i92855 ++;
                  }
                }
              }
            }
          }
        }
      }
      goto Lret_display_char___0;
      Lret_display_char___0:
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str72653 ++;
  }
  goto Lret_display_string___0;
  Lret_display_string___0: ;
  goto Lret_display_unsigned_worker;
  Lret_display_unsigned_worker: ;
  goto Lret_display_int;
  Lret_display_int:
  x1340 = 0;
  y1441 = line29 + 1;
  display_x = x1340;
  display_y = y1441;
  goto Lret_display_goto_xy___1;
  Lret_display_goto_xy___1:
  display_tick = 0;
  if (! display) {
    goto Lret_nxt_spi_refresh;
  }
  dirty = (unsigned char volatile )1;
  *((AT91_REG *)4294836244U) = 1U << 5;
  goto Lret_nxt_spi_refresh;
  Lret_nxt_spi_refresh: ;
  goto Lret_nxt_lcd_update;
  Lret_nxt_lcd_update: ;
  goto Lret_display_update;
  Lret_display_update:
  ReleaseResource(lcd);
  goto Lret_show_var;
  Lret_show_var:
  V58 = (_real___1 )sonar_value;
  ctx_obst._Co = V58;
  goto Lret_obst_detector_I_Co;
  Lret_obst_detector_I_Co:
  V59 = (_real___1 )raw_sensor_left;
  ctx_obst._Cg = V59;
  goto Lret_obst_detector_I_Cg;
  Lret_obst_detector_I_Cg:
  L460 = ctx_obst._Co < (_real___0 )8;
  if (ctx_obst.M7) {
    L661 = 0;
  } else {
    L661 = ctx_obst.M10;
  }
  if (L460) {
    tmp85 = 1;
  } else
  if (L661) {
    tmp85 = 1;
  } else {
    tmp85 = 0;
  }
  L362 = tmp85;
  if (ctx_obst.M7) {
    L1263 = 0;
  } else {
    L1263 = ctx_obst.M13;
  }
  L1164 = ! L1263;
  if (L362) {
    if (L1164) {
      tmp___086 = 1;
    } else {
      tmp___086 = 0;
    }
  } else {
    tmp___086 = 0;
  }
  L265 = tmp___086;
  obst96 = L265;
  Pg97 = (_real___2 )-32;
  Pd98 = (_real___2 )25;
  multi_task_obst = obst96;
  if (multi_task_obst) {
    varname499 = (char *)"Pd";
    line5100 = 3;
    value6101 = (int )Pg97;
    GetResource(lcd);
    x912107 = 0;
    y1013108 = line5100;
    display_x = x912107;
    display_y = y1013108;
    goto Lret_display_goto_xy___2;
    Lret_display_goto_xy___2:
    str1518113 = (char const *)varname499;
    while (*str1518113) {
      if ((int const )*str1518113 != 10) {
        c1619114 = (int )*str1518113;
        if (c1619114 >= 0) {
          if (c1619114 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b1821116 = & (*(display_buffer + display_y))[display_x * 6];
                    f1922117 = font[c1619114];
                    i1720115 = 0;
                    while (i1720115 < 5) {
                      *b1821116 = (U8___2 )*f1922117;
                      b1821116 ++;
                      f1922117 ++;
                      i1720115 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___1;
        Lret_display_char___1:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str1518113 ++;
    }
    goto Lret_display_string___1;
    Lret_display_string___1:
    tmp8103 = strlen((char const *)varname499);
    l7102 = (int )tmp8103;
    x1114109 = l7102;
    y1215110 = line5100;
    display_x = x1114109;
    display_y = y1215110;
    goto Lret_display_goto_xy___3;
    Lret_display_goto_xy___3:
    val69104 = value6101;
    places710105 = (U32___3 )4;
    if (val69104 < 0) {
      tmp811106 = - val69104;
    } else {
      tmp811106 = val69104;
    }
    val2023118 = (U32 )tmp811106;
    places2124119 = places710105;
    sign2225120 = (U32 )(val69104 < 0);
    p2427122 = & x2326121[11];
    p_count2528123 = 0;
    *p2427122 = (char)0;
    if (places2124119 > 11UL) {
      places2124119 = (U32 )11;
    }
    while (val2023118) {
      p2427122 --;
      p_count2528123 ++;
      *p2427122 = (char )(val2023118 % 10UL + 48UL);
      val2023118 /= 10UL;
    }
    if (! p_count2528123) {
      p2427122 --;
      p_count2528123 ++;
      *p2427122 = (char )'0';
    }
    if (sign2225120) {
      p2427122 --;
      p_count2528123 ++;
      *p2427122 = (char )'-';
    }
    while ((U32 )p_count2528123 < places2124119) {
      p2427122 --;
      p_count2528123 ++;
      *p2427122 = (char )' ';
    }
    str72629124 = (char const *)p2427122;
    while (*str72629124) {
      if ((int const )*str72629124 != 10) {
        c82730125 = (int )*str72629124;
        if (c82730125 >= 0) {
          if (c82730125 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b102932127 = & (*(display_buffer + display_y))[display_x * 6];
                    f113033128 = font[c82730125];
                    i92831126 = 0;
                    while (i92831126 < 5) {
                      *b102932127 = (U8___2 )*f113033128;
                      b102932127 ++;
                      f113033128 ++;
                      i92831126 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___2;
        Lret_display_char___2:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str72629124 ++;
    }
    goto Lret_display_string___2;
    Lret_display_string___2: ;
    goto Lret_display_unsigned_worker___0;
    Lret_display_unsigned_worker___0: ;
    goto Lret_display_int___0;
    Lret_display_int___0:
    x1316111 = 0;
    y1417112 = line5100 + 1;
    display_x = x1316111;
    display_y = y1417112;
    goto Lret_display_goto_xy___4;
    Lret_display_goto_xy___4:
    display_tick = 0;
    if (! display) {
      goto Lret_nxt_spi_refresh___0;
    }
    dirty = (unsigned char volatile )1;
    *((AT91_REG *)4294836244U) = 1U << 5;
    goto Lret_nxt_spi_refresh___0;
    Lret_nxt_spi_refresh___0: ;
    goto Lret_nxt_lcd_update___0;
    Lret_nxt_lcd_update___0: ;
    goto Lret_display_update___0;
    Lret_display_update___0:
    ReleaseResource(lcd);
    goto Lret_show_var___0;
    Lret_show_var___0:
    varname34129 = (char *)"Pg";
    line35130 = 4;
    value36131 = (int )Pd98;
    GetResource(lcd);
    x942137 = 0;
    y1043138 = line35130;
    display_x = x942137;
    display_y = y1043138;
    goto Lret_display_goto_xy___5;
    Lret_display_goto_xy___5:
    str1548143 = (char const *)varname34129;
    while (*str1548143) {
      if ((int const )*str1548143 != 10) {
        c1649144 = (int )*str1548143;
        if (c1649144 >= 0) {
          if (c1649144 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b1851146 = & (*(display_buffer + display_y))[display_x * 6];
                    f1952147 = font[c1649144];
                    i1750145 = 0;
                    while (i1750145 < 5) {
                      *b1851146 = (U8___2 )*f1952147;
                      b1851146 ++;
                      f1952147 ++;
                      i1750145 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___3;
        Lret_display_char___3:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str1548143 ++;
    }
    goto Lret_display_string___3;
    Lret_display_string___3:
    tmp38133 = strlen((char const *)varname34129);
    l37132 = (int )tmp38133;
    x1144139 = l37132;
    y1245140 = line35130;
    display_x = x1144139;
    display_y = y1245140;
    goto Lret_display_goto_xy___6;
    Lret_display_goto_xy___6:
    val639134 = value36131;
    places740135 = (U32___3 )4;
    if (val639134 < 0) {
      tmp841136 = - val639134;
    } else {
      tmp841136 = val639134;
    }
    val2053148 = (U32 )tmp841136;
    places2154149 = places740135;
    sign2255150 = (U32 )(val639134 < 0);
    p2457152 = & x2356151[11];
    p_count2558153 = 0;
    *p2457152 = (char)0;
    if (places2154149 > 11UL) {
      places2154149 = (U32 )11;
    }
    while (val2053148) {
      p2457152 --;
      p_count2558153 ++;
      *p2457152 = (char )(val2053148 % 10UL + 48UL);
      val2053148 /= 10UL;
    }
    if (! p_count2558153) {
      p2457152 --;
      p_count2558153 ++;
      *p2457152 = (char )'0';
    }
    if (sign2255150) {
      p2457152 --;
      p_count2558153 ++;
      *p2457152 = (char )'-';
    }
    while ((U32 )p_count2558153 < places2154149) {
      p2457152 --;
      p_count2558153 ++;
      *p2457152 = (char )' ';
    }
    str72659154 = (char const *)p2457152;
    while (*str72659154) {
      if ((int const )*str72659154 != 10) {
        c82760155 = (int )*str72659154;
        if (c82760155 >= 0) {
          if (c82760155 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b102962157 = & (*(display_buffer + display_y))[display_x * 6];
                    f113063158 = font[c82760155];
                    i92861156 = 0;
                    while (i92861156 < 5) {
                      *b102962157 = (U8___2 )*f113063158;
                      b102962157 ++;
                      f113063158 ++;
                      i92861156 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___4;
        Lret_display_char___4:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str72659154 ++;
    }
    goto Lret_display_string___4;
    Lret_display_string___4: ;
    goto Lret_display_unsigned_worker___1;
    Lret_display_unsigned_worker___1: ;
    goto Lret_display_int___1;
    Lret_display_int___1:
    x1346141 = 0;
    y1447142 = line35130 + 1;
    display_x = x1346141;
    display_y = y1447142;
    goto Lret_display_goto_xy___7;
    Lret_display_goto_xy___7:
    display_tick = 0;
    if (! display) {
      goto Lret_nxt_spi_refresh___1;
    }
    dirty = (unsigned char volatile )1;
    *((AT91_REG *)4294836244U) = 1U << 5;
    goto Lret_nxt_spi_refresh___1;
    Lret_nxt_spi_refresh___1: ;
    goto Lret_nxt_lcd_update___1;
    Lret_nxt_lcd_update___1: ;
    goto Lret_display_update___1;
    Lret_display_update___1:
    ReleaseResource(lcd);
    goto Lret_show_var___1;
    Lret_show_var___1:
    port64159 = (U32___4 )1;
    speed65160 = Pg97;
    if (speed65160 > 100.0) {
      speed_percent66161 = 100;
    } else
    if (speed65160 < - 100.0) {
      speed_percent66161 = -100;
    } else {
      speed_percent66161 = (int )speed65160;
    }
    port_id467162 = (U8___3 )port64159;
    speed568163 = (S8___1 )speed_percent66161;
    n669164 = (U32___3 )port_id467162;
    speed_percent770165 = (int )speed568163;
    brake871166 = 1;
    if (n669164 < 3UL) {
      if (speed_percent770165 > 100) {
        speed_percent770165 = 100;
      }
      if (speed_percent770165 < -100) {
        speed_percent770165 = -100;
      }
      motor[n669164].speed_percent = speed_percent770165;
      n972167 = n669164;
      power_percent1073168 = speed_percent770165;
      brake1174169 = brake871166;
      if (n972167 < 3UL) {
        io_to_avr.output_percent[n972167] = (S8___0 )power_percent1073168;
        if (brake1174169) {
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n972167));
        } else {
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n972167));
        }
      }
      goto Lret_nxt_avr_set_motor;
      Lret_nxt_avr_set_motor: ;
    }
    goto Lret_nxt_motor_set_speed;
    Lret_nxt_motor_set_speed: ;
    goto Lret_ecrobot_set_motor_speed;
    Lret_ecrobot_set_motor_speed: ;
    goto Lret_output_motor;
    Lret_output_motor:
    port75170 = (U32___4 )0;
    speed76171 = Pd98;
    if (speed76171 > 100.0) {
      speed_percent77172 = 100;
    } else
    if (speed76171 < - 100.0) {
      speed_percent77172 = -100;
    } else {
      speed_percent77172 = (int )speed76171;
    }
    port_id478173 = (U8___3 )port75170;
    speed579174 = (S8___1 )speed_percent77172;
    n680175 = (U32___3 )port_id478173;
    speed_percent781176 = (int )speed579174;
    brake882177 = 1;
    if (n680175 < 3UL) {
      if (speed_percent781176 > 100) {
        speed_percent781176 = 100;
      }
      if (speed_percent781176 < -100) {
        speed_percent781176 = -100;
      }
      motor[n680175].speed_percent = speed_percent781176;
      n983178 = n680175;
      power_percent1084179 = speed_percent781176;
      brake1185180 = brake882177;
      if (n983178 < 3UL) {
        io_to_avr.output_percent[n983178] = (S8___0 )power_percent1084179;
        if (brake1185180) {
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n983178));
        } else {
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n983178));
        }
      }
      goto Lret_nxt_avr_set_motor___0;
      Lret_nxt_avr_set_motor___0: ;
    }
    goto Lret_nxt_motor_set_speed___0;
    Lret_nxt_motor_set_speed___0: ;
    goto Lret_ecrobot_set_motor_speed___0;
    Lret_ecrobot_set_motor_speed___0: ;
    goto Lret_output_motor___0;
    Lret_output_motor___0: ;
  }
  goto Lret_obst_detector_O_obstacle;
  Lret_obst_detector_O_obstacle:
  L1766 = ctx_obst._Cg >= (_real___0 )90;
  if (ctx_obst.M7) {
    L1967 = 0;
  } else {
    L1967 = ctx_obst.M20;
  }
  if (L1766) {
    tmp___187 = 1;
  } else
  if (L1967) {
    tmp___187 = 1;
  } else {
    tmp___187 = 0;
  }
  L1668 = tmp___187;
  if (L1668) {
    if (L1164) {
      tmp___288 = 1;
    } else {
      tmp___288 = 0;
    }
  } else {
    tmp___288 = 0;
  }
  L1569 = tmp___288;
  L2470 = ctx_obst._Cg <= (_real___0 )35;
  if (ctx_obst.M7) {
    L2671 = 0;
  } else {
    L2671 = ctx_obst.M27;
  }
  if (L2470) {
    tmp___389 = 1;
  } else
  if (L2671) {
    tmp___389 = 1;
  } else {
    tmp___389 = 0;
  }
  L2372 = tmp___389;
  if (L2372) {
    if (L1164) {
      tmp___490 = 1;
    } else {
      tmp___490 = 0;
    }
  } else {
    tmp___490 = 0;
  }
  L2273 = tmp___490;
  L3074 = ctx_obst._Cg <= (_real___0 )90;
  if (ctx_obst.M7) {
    L3175 = 0;
  } else {
    L3175 = ctx_obst.M32;
  }
  if (L3074) {
    tmp___591 = 1;
  } else
  if (L3175) {
    tmp___591 = 1;
  } else {
    tmp___591 = 0;
  }
  L2976 = tmp___591;
  if (L2976) {
    if (L1164) {
      tmp___692 = 1;
    } else {
      tmp___692 = 0;
    }
  } else {
    tmp___692 = 0;
  }
  L2877 = tmp___692;
  if (L2273) {
    if (L2877) {
      tmp___793 = 1;
    } else {
      tmp___793 = 0;
    }
  } else {
    tmp___793 = 0;
  }
  L2178 = tmp___793;
  if (L1569) {
    if (L2178) {
      tmp___894 = 1;
    } else {
      tmp___894 = 0;
    }
  } else {
    tmp___894 = 0;
  }
  L1479 = tmp___894;
  T1380 = L1479;
  T3281 = L2877;
  T2782 = L2273;
  T2083 = L1569;
  T1084 = L265;
  ctx_obst.M13 = T1380;
  ctx_obst.M13_nil = 0;
  ctx_obst.M32 = T3281;
  ctx_obst.M32_nil = 0;
  ctx_obst.M27 = T2782;
  ctx_obst.M27_nil = 0;
  ctx_obst.M20 = T2083;
  ctx_obst.M20_nil = 0;
  ctx_obst.M10 = T1084;
  ctx_obst.M10_nil = 0;
  if (ctx_obst.M7) {
    tmp___995 = 0;
  } else {
    tmp___995 = 0;
  }
  ctx_obst.M7 = tmp___995;
  goto Lret_obst_detector_step;
  Lret_obst_detector_step:
  TerminateTask();
  return;
}
}



extern int ( create_task)() ;
extern int ( create_block)() ;
void main(void)
{


  {
  create_task("TaskMainHighTask", "TaskMainHighTask", 2, 10, 1.611);
  create_task("TaskMainLowTask", "TaskMainLowTask", 1, 30, 0.618);
  create_block(629, "TaskMainHighTask", "lcd", 2, 2, 0.242);
  create_block(781, "TaskMainHighTask", "lcd", 2, 2, 0.242);
  create_block(1308, "TaskMainLowTask", "lcd", 3, 1, 0.242);
  create_block(1504, "TaskMainLowTask", "lcd", 3, 1, 0.242);
  create_block(1656, "TaskMainLowTask", "lcd", 3, 1, 0.242);
  return;
}
}

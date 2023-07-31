# 1 "./lego_osek.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./lego_osek.cil.c"
# 4 "lego_osek/lego_osek.c"
typedef int _boolean;
# 5 "lego_osek/lego_osek.c"
typedef unsigned char UINT8;
# 6 "lego_osek/lego_osek.c"
typedef unsigned char U8;
# 7 "lego_osek/lego_osek.c"
typedef UINT8 ResourceType;
# 8 "lego_osek/lego_osek.c"
typedef UINT8 StatusType;
# 9 "lego_osek/lego_osek.c"
typedef unsigned char U8___1;
# 10 "lego_osek/lego_osek.c"
typedef signed char S8___0;
# 11 "lego_osek/lego_osek.c"
typedef unsigned short U16___1;
# 12 "lego_osek/lego_osek.c"
typedef unsigned long U32___1;
# 13 "lego_osek/lego_osek.c"
struct __anonstruct_to_avr_432250394 {
   U8___1 power ;
   U8___1 pwm_frequency ;
   S8___0 output_percent[4] ;
   U8___1 output_mode ;
   U8___1 input_power ;
} __attribute__((__packed__)) ;
# 20 "lego_osek/lego_osek.c"
typedef struct __anonstruct_to_avr_432250394 to_avr;
# 21 "lego_osek/lego_osek.c"
struct __anonstruct_from_avr_708559676 {
   U16___1 adc_value[4] ;
   U16___1 buttonsVal ;
   U16___1 extra ;
   U8___1 csum ;
} __attribute__((__packed__)) ;
# 27 "lego_osek/lego_osek.c"
typedef struct __anonstruct_from_avr_708559676 from_avr;
# 28 "lego_osek/lego_osek.c"
struct motor_struct ;
# 29 "lego_osek/lego_osek.c"
typedef unsigned char byte;
# 30 "lego_osek/lego_osek.c"
typedef unsigned short TWOBYTES;
# 31 "lego_osek/lego_osek.c"
struct _freeBlock {
   TWOBYTES size : 15 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 35 "lego_osek/lego_osek.c"
struct _objects {
   byte _class ;
   byte padding : 5 ;
   byte mark : 1 ;
   byte isArray : 1 ;
   byte isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 42 "lego_osek/lego_osek.c"
struct _arrays {
   TWOBYTES length : 9 ;
   TWOBYTES type : 4 ;
   TWOBYTES mark : 1 ;
   TWOBYTES isArray : 1 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 49 "lego_osek/lego_osek.c"
union _flags {
   TWOBYTES all ;
   struct _freeBlock freeBlock ;
   struct _objects objects ;
   struct _arrays arrays ;
} __attribute__((__packed__)) ;
# 55 "lego_osek/lego_osek.c"
struct S_Object {
   union _flags flags ;
   byte monitorCount ;
   byte threadId ;
} __attribute__((__packed__)) ;
# 60 "lego_osek/lego_osek.c"
typedef struct S_Object Object;
# 61 "lego_osek/lego_osek.c"
struct __anonstruct_display_array_740464799 {
   Object hdr ;
   U8 display[9][100] ;
} __attribute__((__packed__)) ;
# 65 "lego_osek/lego_osek.c"
typedef double _real;
# 66 "lego_osek/lego_osek.c"
struct __anonstruct_motor_control_ctx_982217023 {
   _real _Cg ;
   _real _Cd ;
   _real _u_d ;
   _real _u_g ;
   _real M22 ;
   _boolean M22_nil ;
   _boolean M19 ;
};
# 75 "lego_osek/lego_osek.c"
typedef struct __anonstruct_motor_control_ctx_982217023 motor_control_ctx;
# 76 "lego_osek/lego_osek.c"
typedef int _boolean___0;
# 77 "lego_osek/lego_osek.c"
typedef double _real___0;
# 78 "lego_osek/lego_osek.c"
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
# 94 "lego_osek/lego_osek.c"
typedef struct __anonstruct_obst_detector_ctx_475692995 obst_detector_ctx;
# 95 "lego_osek/lego_osek.c"
typedef unsigned char U8___2;
# 96 "lego_osek/lego_osek.c"
typedef unsigned long U32;
# 97 "lego_osek/lego_osek.c"
typedef unsigned int AT91_REG;
# 98 "lego_osek/lego_osek.c"
typedef unsigned char U8___0;
# 99 "lego_osek/lego_osek.c"
typedef unsigned short U16___0;
# 100 "lego_osek/lego_osek.c"
typedef unsigned long U32___0;
# 101 "lego_osek/lego_osek.c"
struct i2c_partial_transaction {
   U8___0 start : 1 ;
   U8___0 restart : 1 ;
   U8___0 stop : 1 ;
   U8___0 tx : 1 ;
   U8___0 last_pt : 1 ;
   U16___0 nbytes ;
   U8___0 *data ;
};
# 110 "lego_osek/lego_osek.c"
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
# 128 "lego_osek/lego_osek.c"
typedef enum __anonenum_i2c_port_state_506411302 i2c_port_state;
# 129 "lego_osek/lego_osek.c"
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
# 150 "lego_osek/lego_osek.c"
typedef unsigned long U32___2;
# 151 "lego_osek/lego_osek.c"
struct motor_struct {
   int current_count ;
   int target_count ;
   int speed_percent ;
   U32___2 last ;
};
# 157 "lego_osek/lego_osek.c"
typedef unsigned char U8___3;
# 158 "lego_osek/lego_osek.c"
typedef signed char S8___1;
# 159 "lego_osek/lego_osek.c"
typedef unsigned short U16___2;
# 160 "lego_osek/lego_osek.c"
typedef unsigned long U32___3;
# 161 "lego_osek/lego_osek.c"
typedef long S32___0;
# 162 "lego_osek/lego_osek.c"
typedef unsigned long size_t___1;
# 163 "lego_osek/lego_osek.c"
typedef double _real___1;
# 164 "lego_osek/lego_osek.c"
typedef unsigned short U16___3;
# 165 "lego_osek/lego_osek.c"
typedef unsigned long U32___4;
# 166 "lego_osek/lego_osek.c"
typedef double _real___2;
# 167 "lego_osek/lego_osek.c"
typedef float _float___0;
# 168 "lego_osek/lego_osek.c"
static _boolean multi_task_obst ;
# 169 "lego_osek/lego_osek.c"
extern ResourceType lcd ;
# 170 "lego_osek/lego_osek.c"
extern StatusType GetResource(ResourceType resid ) ;
# 171 "lego_osek/lego_osek.c"
extern StatusType ReleaseResource(ResourceType resid ) ;
# 172 "lego_osek/lego_osek.c"
static to_avr io_to_avr ;
# 173 "lego_osek/lego_osek.c"
static int display_x ;
# 174 "lego_osek/lego_osek.c"
static int display_y ;
# 175 "lego_osek/lego_osek.c"
int display_tick ;
# 176 "lego_osek/lego_osek.c"
U8 const *display = (U8 const *)((U8 *)0);
# 177 "lego_osek/lego_osek.c"
unsigned char volatile dirty = (U8 volatile )0;
# 178 "lego_osek/lego_osek.c"
static struct motor_struct motor[3] ;
# 179 "lego_osek/lego_osek.c"
static struct __anonstruct_display_array_740464799 display_array ;
# 180 "lego_osek/lego_osek.c"
static U8 (*display_buffer)[100] = display_array.display;
# 181 "lego_osek/lego_osek.c"
static U8 const font[128][5] =
# 181 "lego_osek/lego_osek.c"
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
# 438 "lego_osek/lego_osek.c"
static motor_control_ctx ctx ;
# 439 "lego_osek/lego_osek.c"
extern void motor_control_O_u_d(double ud ) ;
# 440 "lego_osek/lego_osek.c"
extern void motor_control_O_u_g(double ug ) ;
# 441 "lego_osek/lego_osek.c"
static obst_detector_ctx ctx_obst ;
# 442 "lego_osek/lego_osek.c"
int display_auto_update ;
# 443 "lego_osek/lego_osek.c"
unsigned char volatile page = (U8___2 volatile )0;
# 444 "lego_osek/lego_osek.c"
U8___2 const *data = (U8___2 const *)((U8___2 *)0);
# 445 "lego_osek/lego_osek.c"
U8___2 mode = (U8___2 )255;
# 446 "lego_osek/lego_osek.c"
extern __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1), __leaf__)) memset)(void *__s ,
                                                                                               int __c ,
                                                                                               unsigned long __n ) ;
# 449 "lego_osek/lego_osek.c"
extern __attribute__((__nothrow__)) unsigned long ( __attribute__((__nonnull__(1),
__leaf__)) strlen)(char const *__s ) __attribute__((__pure__)) ;
# 451 "lego_osek/lego_osek.c"
int display_tick = 0;
# 452 "lego_osek/lego_osek.c"
int display_auto_update = 1;
# 453 "lego_osek/lego_osek.c"
static struct i2c_port_struct i2c_port[4] ;
# 454 "lego_osek/lego_osek.c"
char const avr_brainwash_string[48] =
# 454 "lego_osek/lego_osek.c"
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
# 467 "lego_osek/lego_osek.c"
static from_avr *io_from_avr ;
# 468 "lego_osek/lego_osek.c"
extern StatusType TerminateTask(void) ;
# 469 "lego_osek/lego_osek.c"
static S32___0 distance_state[4] = { (S32___0 )-1, (S32___0 )-1, (S32___0 )-1, (S32___0 )-1};
# 470 "lego_osek/lego_osek.c"
U8___3 const NXT_COLORSENSOR_PROTOCOLS[7] = { (U8___3 const )176, (U8___3 const )112, (U8___3 const )240, (U8___3 const )8,
        (U8___3 const )176, (U8___3 const )136, (U8___3 const )136};
# 472 "lego_osek/lego_osek.c"
static int sens_white_cal_right ;
# 473 "lego_osek/lego_osek.c"
static int sens_white_cal_left ;
# 474 "lego_osek/lego_osek.c"
static int sens_black_cal_right ;
# 475 "lego_osek/lego_osek.c"
static int sens_black_cal_left ;
# 476 "lego_osek/lego_osek.c"
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
# 580 "lego_osek/lego_osek.c"
  port_id3 = (U8___3 )0;
# 581 "lego_osek/lego_osek.c"
  n9 = (U32___3 )port_id3;
# 582 "lego_osek/lego_osek.c"
  if (n9 < 4UL) {
# 583 "lego_osek/lego_osek.c"
    ret_sensor_adc10 = (U32___1 )io_from_avr->adc_value[n9];
# 584 "lego_osek/lego_osek.c"
    goto Lret_sensor_adc;
  } else {
# 586 "lego_osek/lego_osek.c"
    ret_sensor_adc10 = (U32___1 )0;
# 587 "lego_osek/lego_osek.c"
    goto Lret_sensor_adc;
  }
  Lret_sensor_adc:
# 590 "lego_osek/lego_osek.c"
  tmp4 = ret_sensor_adc10;
# 591 "lego_osek/lego_osek.c"
  ret_ecrobot_get_light_sensor5 = (U16___2 )tmp4;
# 592 "lego_osek/lego_osek.c"
  goto Lret_ecrobot_get_light_sensor;
  Lret_ecrobot_get_light_sensor:
# 594 "lego_osek/lego_osek.c"
  raw_sensor_right = ret_ecrobot_get_light_sensor5;
# 595 "lego_osek/lego_osek.c"
  port_id6 = (U8___3 )3;
# 596 "lego_osek/lego_osek.c"
  n11 = (U32___3 )port_id6;
# 597 "lego_osek/lego_osek.c"
  if (n11 < 4UL) {
# 598 "lego_osek/lego_osek.c"
    ret_sensor_adc12 = (U32___1 )io_from_avr->adc_value[n11];
# 599 "lego_osek/lego_osek.c"
    goto Lret_sensor_adc___0;
  } else {
# 601 "lego_osek/lego_osek.c"
    ret_sensor_adc12 = (U32___1 )0;
# 602 "lego_osek/lego_osek.c"
    goto Lret_sensor_adc___0;
  }
  Lret_sensor_adc___0:
# 605 "lego_osek/lego_osek.c"
  tmp7 = ret_sensor_adc12;
# 606 "lego_osek/lego_osek.c"
  ret_ecrobot_get_light_sensor8 = (U16___2 )tmp7;
# 607 "lego_osek/lego_osek.c"
  goto Lret_ecrobot_get_light_sensor___0;
  Lret_ecrobot_get_light_sensor___0:
# 609 "lego_osek/lego_osek.c"
  raw_sensor_left = ret_ecrobot_get_light_sensor8;
# 610 "lego_osek/lego_osek.c"
  if ((int )raw_sensor_right < sens_white_cal_right) {
# 611 "lego_osek/lego_osek.c"
    raw_sensor_right = (U16___3 )sens_white_cal_right;
  } else
# 613 "lego_osek/lego_osek.c"
  if ((int )raw_sensor_right > sens_black_cal_right) {
# 614 "lego_osek/lego_osek.c"
    raw_sensor_right = (U16___3 )sens_black_cal_right;
  }
# 616 "lego_osek/lego_osek.c"
  if ((int )raw_sensor_left < sens_white_cal_left) {
# 617 "lego_osek/lego_osek.c"
    raw_sensor_left = (U16___3 )sens_white_cal_left;
  } else
# 619 "lego_osek/lego_osek.c"
  if ((int )raw_sensor_left > sens_black_cal_left) {
# 620 "lego_osek/lego_osek.c"
    raw_sensor_left = (U16___3 )sens_black_cal_left;
  }
# 622 "lego_osek/lego_osek.c"
  raw_sensor_right = (U16___3 )((((int )raw_sensor_right - sens_white_cal_right) * 100) / (sens_black_cal_right - sens_white_cal_right));
# 623 "lego_osek/lego_osek.c"
  raw_sensor_left = (U16___3 )((((int )raw_sensor_left - sens_white_cal_left) * 100) / (sens_black_cal_left - sens_white_cal_left));
# 624 "lego_osek/lego_osek.c"
  raw_sensor_right = (U16___3 )(100 - (int )raw_sensor_right);
# 625 "lego_osek/lego_osek.c"
  raw_sensor_left = (U16___3 )(100 - (int )raw_sensor_left);
# 626 "lego_osek/lego_osek.c"
  varname13 = (char *)"raw_right";
# 627 "lego_osek/lego_osek.c"
  line14 = 0;
# 628 "lego_osek/lego_osek.c"
  value15 = (int )raw_sensor_right;
# 629 "lego_osek/lego_osek.c"
  GetResource(lcd);
# 630 "lego_osek/lego_osek.c"
  x921 = 0;
# 631 "lego_osek/lego_osek.c"
  y1022 = line14;
# 632 "lego_osek/lego_osek.c"
  display_x = x921;
# 633 "lego_osek/lego_osek.c"
  display_y = y1022;
# 634 "lego_osek/lego_osek.c"
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
# 636 "lego_osek/lego_osek.c"
  str1527 = (char const *)varname13;
# 637 "lego_osek/lego_osek.c"
  while (*str1527) {
# 638 "lego_osek/lego_osek.c"
    if ((int const )*str1527 != 10) {
# 639 "lego_osek/lego_osek.c"
      c1628 = (int )*str1527;
# 640 "lego_osek/lego_osek.c"
      if (c1628 >= 0) {
# 641 "lego_osek/lego_osek.c"
        if (c1628 < 128) {
# 642 "lego_osek/lego_osek.c"
          if (display_x >= 0) {
# 643 "lego_osek/lego_osek.c"
            if (display_x < 16) {
# 644 "lego_osek/lego_osek.c"
              if (display_y >= 0) {
# 645 "lego_osek/lego_osek.c"
                if (display_y < 8) {
# 646 "lego_osek/lego_osek.c"
                  b1830 = & (*(display_buffer + display_y))[display_x * 6];
# 647 "lego_osek/lego_osek.c"
                  f1931 = font[c1628];
# 648 "lego_osek/lego_osek.c"
                  i1729 = 0;
# 649 "lego_osek/lego_osek.c"
                  while (i1729 < 5) {
# 650 "lego_osek/lego_osek.c"
                    *b1830 = (U8___2 )*f1931;
# 651 "lego_osek/lego_osek.c"
                    b1830 ++;
# 652 "lego_osek/lego_osek.c"
                    f1931 ++;
# 653 "lego_osek/lego_osek.c"
                    i1729 ++;
                  }
                }
              }
            }
          }
        }
      }
# 661 "lego_osek/lego_osek.c"
      goto Lret_display_char;
      Lret_display_char:
# 663 "lego_osek/lego_osek.c"
      display_x ++;
    } else {
# 665 "lego_osek/lego_osek.c"
      display_x = 0;
# 666 "lego_osek/lego_osek.c"
      display_y ++;
    }
# 668 "lego_osek/lego_osek.c"
    str1527 ++;
  }
# 670 "lego_osek/lego_osek.c"
  goto Lret_display_string;
  Lret_display_string:
# 672 "lego_osek/lego_osek.c"
  tmp17 = strlen((char const *)varname13);
# 673 "lego_osek/lego_osek.c"
  l16 = (int )tmp17;
# 674 "lego_osek/lego_osek.c"
  x1123 = l16;
# 675 "lego_osek/lego_osek.c"
  y1224 = line14;
# 676 "lego_osek/lego_osek.c"
  display_x = x1123;
# 677 "lego_osek/lego_osek.c"
  display_y = y1224;
# 678 "lego_osek/lego_osek.c"
  goto Lret_display_goto_xy___0;
  Lret_display_goto_xy___0:
# 680 "lego_osek/lego_osek.c"
  val618 = value15;
# 681 "lego_osek/lego_osek.c"
  places719 = (U32___3 )4;
# 682 "lego_osek/lego_osek.c"
  if (val618 < 0) {
# 683 "lego_osek/lego_osek.c"
    tmp820 = - val618;
  } else {
# 685 "lego_osek/lego_osek.c"
    tmp820 = val618;
  }
# 687 "lego_osek/lego_osek.c"
  val2032 = (U32 )tmp820;
# 688 "lego_osek/lego_osek.c"
  places2133 = places719;
# 689 "lego_osek/lego_osek.c"
  sign2234 = (U32 )(val618 < 0);
# 690 "lego_osek/lego_osek.c"
  p2436 = & x2335[11];
# 691 "lego_osek/lego_osek.c"
  p_count2537 = 0;
# 692 "lego_osek/lego_osek.c"
  *p2436 = (char)0;
# 693 "lego_osek/lego_osek.c"
  if (places2133 > 11UL) {
# 694 "lego_osek/lego_osek.c"
    places2133 = (U32 )11;
  }
# 696 "lego_osek/lego_osek.c"
  while (val2032) {
# 697 "lego_osek/lego_osek.c"
    p2436 --;
# 698 "lego_osek/lego_osek.c"
    p_count2537 ++;
# 699 "lego_osek/lego_osek.c"
    *p2436 = (char )(val2032 % 10UL + 48UL);
# 700 "lego_osek/lego_osek.c"
    val2032 /= 10UL;
  }
# 702 "lego_osek/lego_osek.c"
  if (! p_count2537) {
# 703 "lego_osek/lego_osek.c"
    p2436 --;
# 704 "lego_osek/lego_osek.c"
    p_count2537 ++;
# 705 "lego_osek/lego_osek.c"
    *p2436 = (char )'0';
  }
# 707 "lego_osek/lego_osek.c"
  if (sign2234) {
# 708 "lego_osek/lego_osek.c"
    p2436 --;
# 709 "lego_osek/lego_osek.c"
    p_count2537 ++;
# 710 "lego_osek/lego_osek.c"
    *p2436 = (char )'-';
  }
# 712 "lego_osek/lego_osek.c"
  while ((U32 )p_count2537 < places2133) {
# 713 "lego_osek/lego_osek.c"
    p2436 --;
# 714 "lego_osek/lego_osek.c"
    p_count2537 ++;
# 715 "lego_osek/lego_osek.c"
    *p2436 = (char )' ';
  }
# 717 "lego_osek/lego_osek.c"
  str72638 = (char const *)p2436;
# 718 "lego_osek/lego_osek.c"
  while (*str72638) {
# 719 "lego_osek/lego_osek.c"
    if ((int const )*str72638 != 10) {
# 720 "lego_osek/lego_osek.c"
      c82739 = (int )*str72638;
# 721 "lego_osek/lego_osek.c"
      if (c82739 >= 0) {
# 722 "lego_osek/lego_osek.c"
        if (c82739 < 128) {
# 723 "lego_osek/lego_osek.c"
          if (display_x >= 0) {
# 724 "lego_osek/lego_osek.c"
            if (display_x < 16) {
# 725 "lego_osek/lego_osek.c"
              if (display_y >= 0) {
# 726 "lego_osek/lego_osek.c"
                if (display_y < 8) {
# 727 "lego_osek/lego_osek.c"
                  b102941 = & (*(display_buffer + display_y))[display_x * 6];
# 728 "lego_osek/lego_osek.c"
                  f113042 = font[c82739];
# 729 "lego_osek/lego_osek.c"
                  i92840 = 0;
# 730 "lego_osek/lego_osek.c"
                  while (i92840 < 5) {
# 731 "lego_osek/lego_osek.c"
                    *b102941 = (U8___2 )*f113042;
# 732 "lego_osek/lego_osek.c"
                    b102941 ++;
# 733 "lego_osek/lego_osek.c"
                    f113042 ++;
# 734 "lego_osek/lego_osek.c"
                    i92840 ++;
                  }
                }
              }
            }
          }
        }
      }
# 742 "lego_osek/lego_osek.c"
      goto Lret_display_char___0;
      Lret_display_char___0:
# 744 "lego_osek/lego_osek.c"
      display_x ++;
    } else {
# 746 "lego_osek/lego_osek.c"
      display_x = 0;
# 747 "lego_osek/lego_osek.c"
      display_y ++;
    }
# 749 "lego_osek/lego_osek.c"
    str72638 ++;
  }
# 751 "lego_osek/lego_osek.c"
  goto Lret_display_string___0;
  Lret_display_string___0: ;
# 753 "lego_osek/lego_osek.c"
  goto Lret_display_unsigned_worker;
  Lret_display_unsigned_worker: ;
# 755 "lego_osek/lego_osek.c"
  goto Lret_display_int;
  Lret_display_int:
# 757 "lego_osek/lego_osek.c"
  x1325 = 0;
# 758 "lego_osek/lego_osek.c"
  y1426 = line14 + 1;
# 759 "lego_osek/lego_osek.c"
  display_x = x1325;
# 760 "lego_osek/lego_osek.c"
  display_y = y1426;
# 761 "lego_osek/lego_osek.c"
  goto Lret_display_goto_xy___1;
  Lret_display_goto_xy___1:
# 763 "lego_osek/lego_osek.c"
  display_tick = 0;
# 764 "lego_osek/lego_osek.c"
  if (! display) {
# 765 "lego_osek/lego_osek.c"
    goto Lret_nxt_spi_refresh;
  }
# 767 "lego_osek/lego_osek.c"
  dirty = (unsigned char volatile )1;
# 769 "lego_osek/lego_osek.c"
  goto Lret_nxt_spi_refresh;
  Lret_nxt_spi_refresh: ;
# 771 "lego_osek/lego_osek.c"
  goto Lret_nxt_lcd_update;
  Lret_nxt_lcd_update: ;
# 773 "lego_osek/lego_osek.c"
  goto Lret_display_update;
  Lret_display_update:
# 775 "lego_osek/lego_osek.c"
  ReleaseResource(lcd);
# 776 "lego_osek/lego_osek.c"
  goto Lret_show_var;
  Lret_show_var:
# 778 "lego_osek/lego_osek.c"
  varname43 = (char *)"raw_left";
# 779 "lego_osek/lego_osek.c"
  line44 = 1;
# 780 "lego_osek/lego_osek.c"
  value45 = (int )raw_sensor_left;
# 781 "lego_osek/lego_osek.c"
  GetResource(lcd);
# 782 "lego_osek/lego_osek.c"
  x951 = 0;
# 783 "lego_osek/lego_osek.c"
  y1052 = line44;
# 784 "lego_osek/lego_osek.c"
  display_x = x951;
# 785 "lego_osek/lego_osek.c"
  display_y = y1052;
# 786 "lego_osek/lego_osek.c"
  goto Lret_display_goto_xy___2;
  Lret_display_goto_xy___2:
# 788 "lego_osek/lego_osek.c"
  str1557 = (char const *)varname43;
# 789 "lego_osek/lego_osek.c"
  while (*str1557) {
# 790 "lego_osek/lego_osek.c"
    if ((int const )*str1557 != 10) {
# 791 "lego_osek/lego_osek.c"
      c1658 = (int )*str1557;
# 792 "lego_osek/lego_osek.c"
      if (c1658 >= 0) {
# 793 "lego_osek/lego_osek.c"
        if (c1658 < 128) {
# 794 "lego_osek/lego_osek.c"
          if (display_x >= 0) {
# 795 "lego_osek/lego_osek.c"
            if (display_x < 16) {
# 796 "lego_osek/lego_osek.c"
              if (display_y >= 0) {
# 797 "lego_osek/lego_osek.c"
                if (display_y < 8) {
# 798 "lego_osek/lego_osek.c"
                  b1860 = & (*(display_buffer + display_y))[display_x * 6];
# 799 "lego_osek/lego_osek.c"
                  f1961 = font[c1658];
# 800 "lego_osek/lego_osek.c"
                  i1759 = 0;
# 801 "lego_osek/lego_osek.c"
                  while (i1759 < 5) {
# 802 "lego_osek/lego_osek.c"
                    *b1860 = (U8___2 )*f1961;
# 803 "lego_osek/lego_osek.c"
                    b1860 ++;
# 804 "lego_osek/lego_osek.c"
                    f1961 ++;
# 805 "lego_osek/lego_osek.c"
                    i1759 ++;
                  }
                }
              }
            }
          }
        }
      }
# 813 "lego_osek/lego_osek.c"
      goto Lret_display_char___1;
      Lret_display_char___1:
# 815 "lego_osek/lego_osek.c"
      display_x ++;
    } else {
# 817 "lego_osek/lego_osek.c"
      display_x = 0;
# 818 "lego_osek/lego_osek.c"
      display_y ++;
    }
# 820 "lego_osek/lego_osek.c"
    str1557 ++;
  }
# 822 "lego_osek/lego_osek.c"
  goto Lret_display_string___1;
  Lret_display_string___1:
# 824 "lego_osek/lego_osek.c"
  tmp47 = strlen((char const *)varname43);
# 825 "lego_osek/lego_osek.c"
  l46 = (int )tmp47;
# 826 "lego_osek/lego_osek.c"
  x1153 = l46;
# 827 "lego_osek/lego_osek.c"
  y1254 = line44;
# 828 "lego_osek/lego_osek.c"
  display_x = x1153;
# 829 "lego_osek/lego_osek.c"
  display_y = y1254;
# 830 "lego_osek/lego_osek.c"
  goto Lret_display_goto_xy___3;
  Lret_display_goto_xy___3:
# 832 "lego_osek/lego_osek.c"
  val648 = value45;
# 833 "lego_osek/lego_osek.c"
  places749 = (U32___3 )4;
# 834 "lego_osek/lego_osek.c"
  if (val648 < 0) {
# 835 "lego_osek/lego_osek.c"
    tmp850 = - val648;
  } else {
# 837 "lego_osek/lego_osek.c"
    tmp850 = val648;
  }
# 839 "lego_osek/lego_osek.c"
  val2062 = (U32 )tmp850;
# 840 "lego_osek/lego_osek.c"
  places2163 = places749;
# 841 "lego_osek/lego_osek.c"
  sign2264 = (U32 )(val648 < 0);
# 842 "lego_osek/lego_osek.c"
  p2466 = & x2365[11];
# 843 "lego_osek/lego_osek.c"
  p_count2567 = 0;
# 844 "lego_osek/lego_osek.c"
  *p2466 = (char)0;
# 845 "lego_osek/lego_osek.c"
  if (places2163 > 11UL) {
# 846 "lego_osek/lego_osek.c"
    places2163 = (U32 )11;
  }
# 848 "lego_osek/lego_osek.c"
  while (val2062) {
# 849 "lego_osek/lego_osek.c"
    p2466 --;
# 850 "lego_osek/lego_osek.c"
    p_count2567 ++;
# 851 "lego_osek/lego_osek.c"
    *p2466 = (char )(val2062 % 10UL + 48UL);
# 852 "lego_osek/lego_osek.c"
    val2062 /= 10UL;
  }
# 854 "lego_osek/lego_osek.c"
  if (! p_count2567) {
# 855 "lego_osek/lego_osek.c"
    p2466 --;
# 856 "lego_osek/lego_osek.c"
    p_count2567 ++;
# 857 "lego_osek/lego_osek.c"
    *p2466 = (char )'0';
  }
# 859 "lego_osek/lego_osek.c"
  if (sign2264) {
# 860 "lego_osek/lego_osek.c"
    p2466 --;
# 861 "lego_osek/lego_osek.c"
    p_count2567 ++;
# 862 "lego_osek/lego_osek.c"
    *p2466 = (char )'-';
  }
# 864 "lego_osek/lego_osek.c"
  while ((U32 )p_count2567 < places2163) {
# 865 "lego_osek/lego_osek.c"
    p2466 --;
# 866 "lego_osek/lego_osek.c"
    p_count2567 ++;
# 867 "lego_osek/lego_osek.c"
    *p2466 = (char )' ';
  }
# 869 "lego_osek/lego_osek.c"
  str72668 = (char const *)p2466;
# 870 "lego_osek/lego_osek.c"
  while (*str72668) {
# 871 "lego_osek/lego_osek.c"
    if ((int const )*str72668 != 10) {
# 872 "lego_osek/lego_osek.c"
      c82769 = (int )*str72668;
# 873 "lego_osek/lego_osek.c"
      if (c82769 >= 0) {
# 874 "lego_osek/lego_osek.c"
        if (c82769 < 128) {
# 875 "lego_osek/lego_osek.c"
          if (display_x >= 0) {
# 876 "lego_osek/lego_osek.c"
            if (display_x < 16) {
# 877 "lego_osek/lego_osek.c"
              if (display_y >= 0) {
# 878 "lego_osek/lego_osek.c"
                if (display_y < 8) {
# 879 "lego_osek/lego_osek.c"
                  b102971 = & (*(display_buffer + display_y))[display_x * 6];
# 880 "lego_osek/lego_osek.c"
                  f113072 = font[c82769];
# 881 "lego_osek/lego_osek.c"
                  i92870 = 0;
# 882 "lego_osek/lego_osek.c"
                  while (i92870 < 5) {
# 883 "lego_osek/lego_osek.c"
                    *b102971 = (U8___2 )*f113072;
# 884 "lego_osek/lego_osek.c"
                    b102971 ++;
# 885 "lego_osek/lego_osek.c"
                    f113072 ++;
# 886 "lego_osek/lego_osek.c"
                    i92870 ++;
                  }
                }
              }
            }
          }
        }
      }
# 894 "lego_osek/lego_osek.c"
      goto Lret_display_char___2;
      Lret_display_char___2:
# 896 "lego_osek/lego_osek.c"
      display_x ++;
    } else {
# 898 "lego_osek/lego_osek.c"
      display_x = 0;
# 899 "lego_osek/lego_osek.c"
      display_y ++;
    }
# 901 "lego_osek/lego_osek.c"
    str72668 ++;
  }
# 903 "lego_osek/lego_osek.c"
  goto Lret_display_string___2;
  Lret_display_string___2: ;
# 905 "lego_osek/lego_osek.c"
  goto Lret_display_unsigned_worker___0;
  Lret_display_unsigned_worker___0: ;
# 907 "lego_osek/lego_osek.c"
  goto Lret_display_int___0;
  Lret_display_int___0:
# 909 "lego_osek/lego_osek.c"
  x1355 = 0;
# 910 "lego_osek/lego_osek.c"
  y1456 = line44 + 1;
# 911 "lego_osek/lego_osek.c"
  display_x = x1355;
# 912 "lego_osek/lego_osek.c"
  display_y = y1456;
# 913 "lego_osek/lego_osek.c"
  goto Lret_display_goto_xy___4;
  Lret_display_goto_xy___4:
# 915 "lego_osek/lego_osek.c"
  display_tick = 0;
# 916 "lego_osek/lego_osek.c"
  if (! display) {
# 917 "lego_osek/lego_osek.c"
    goto Lret_nxt_spi_refresh___0;
  }
# 919 "lego_osek/lego_osek.c"
  dirty = (unsigned char volatile )1;
# 920 "lego_osek/lego_osek.c"
  *((AT91_REG *)4294836244U) = 1U << 5;
# 921 "lego_osek/lego_osek.c"
  goto Lret_nxt_spi_refresh___0;
  Lret_nxt_spi_refresh___0: ;
# 923 "lego_osek/lego_osek.c"
  goto Lret_nxt_lcd_update___0;
  Lret_nxt_lcd_update___0: ;
# 925 "lego_osek/lego_osek.c"
  goto Lret_display_update___0;
  Lret_display_update___0:
# 927 "lego_osek/lego_osek.c"
  ReleaseResource(lcd);
# 928 "lego_osek/lego_osek.c"
  goto Lret_show_var___0;
  Lret_show_var___0:
# 930 "lego_osek/lego_osek.c"
  V73 = (_real___1 )raw_sensor_right;
# 931 "lego_osek/lego_osek.c"
  ctx._Cd = V73;
# 932 "lego_osek/lego_osek.c"
  goto Lret_motor_control_I_Cd;
  Lret_motor_control_I_Cd:
# 934 "lego_osek/lego_osek.c"
  V74 = (_real___1 )raw_sensor_left;
# 935 "lego_osek/lego_osek.c"
  ctx._Cg = V74;
# 936 "lego_osek/lego_osek.c"
  goto Lret_motor_control_I_Cg;
  Lret_motor_control_I_Cg:
# 938 "lego_osek/lego_osek.c"
  L375 = 1.000000 / 2.000000;
# 939 "lego_osek/lego_osek.c"
  L1476 = 3.14159265359 / 200.000000;
# 940 "lego_osek/lego_osek.c"
  L1777 = ctx._Cd - ctx._Cg;
# 941 "lego_osek/lego_osek.c"
  L1378 = L1476 * L1777;
# 942 "lego_osek/lego_osek.c"
  L1179 = 0.002000 * L1378;
# 943 "lego_osek/lego_osek.c"
  if (ctx.M19) {
# 944 "lego_osek/lego_osek.c"
    L1880 = 0.000000;
  } else {
# 946 "lego_osek/lego_osek.c"
    L1880 = ctx.M22;
  }
# 948 "lego_osek/lego_osek.c"
  L1081 = L1179 + L1880;
# 949 "lego_osek/lego_osek.c"
  L882 = 0.43625 * L1081;
# 950 "lego_osek/lego_osek.c"
  L2383 = 2.5 * L1378;
# 951 "lego_osek/lego_osek.c"
  L784 = L882 + L2383;
# 952 "lego_osek/lego_osek.c"
  L3085 = 2.000000 * L784;
# 953 "lego_osek/lego_osek.c"
  L2986 = L3085 < 0.000000;
# 954 "lego_osek/lego_osek.c"
  L3187 = - L3085;
# 955 "lego_osek/lego_osek.c"
  if (L2986) {
# 956 "lego_osek/lego_osek.c"
    L2888 = L3187;
  } else {
# 958 "lego_osek/lego_osek.c"
    L2888 = L3085;
  }
# 960 "lego_osek/lego_osek.c"
  L2789 = - L2888;
# 961 "lego_osek/lego_osek.c"
  L3490 = ctx._Cd + ctx._Cg;
# 962 "lego_osek/lego_osek.c"
  L3291 = 0.005000 * L3490;
# 963 "lego_osek/lego_osek.c"
  L2692 = L2789 + L3291;
# 964 "lego_osek/lego_osek.c"
  L2593 = 2.000000 * L2692;
# 965 "lego_osek/lego_osek.c"
  L694 = L784 + L2593;
# 966 "lego_osek/lego_osek.c"
  L295 = L375 * L694;
# 967 "lego_osek/lego_osek.c"
  motor_control_O_u_d(L295);
# 968 "lego_osek/lego_osek.c"
  L3896 = - L784;
# 969 "lego_osek/lego_osek.c"
  L3797 = L3896 + L2593;
# 970 "lego_osek/lego_osek.c"
  L3698 = L375 * L3797;
# 971 "lego_osek/lego_osek.c"
  motor_control_O_u_g(L3698);
# 972 "lego_osek/lego_osek.c"
  T2299 = L1081;
# 973 "lego_osek/lego_osek.c"
  ctx.M22 = T2299;
# 974 "lego_osek/lego_osek.c"
  ctx.M22_nil = 0;
# 975 "lego_osek/lego_osek.c"
  if (ctx.M19) {
# 976 "lego_osek/lego_osek.c"
    tmp100 = 0;
  } else {
# 978 "lego_osek/lego_osek.c"
    tmp100 = 0;
  }
# 980 "lego_osek/lego_osek.c"
  ctx.M19 = tmp100;
# 981 "lego_osek/lego_osek.c"
  goto Lret_motor_control_step;
  Lret_motor_control_step:
# 983 "lego_osek/lego_osek.c"
  TerminateTask();
# 984 "lego_osek/lego_osek.c"
  return;
}
}
# 987 "lego_osek/lego_osek.c"
void TaskMainLowTask(void) ;
# 988 "lego_osek/lego_osek.c"
static U32___4 previous_raw_sonar_value = (U32___4 )255;
# 989 "lego_osek/lego_osek.c"
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
# 1173 "lego_osek/lego_osek.c"
  port_id5 = (U8___3 )3;
# 1174 "lego_osek/lego_osek.c"
  n26 = (U32___3 )port_id5;
# 1175 "lego_osek/lego_osek.c"
  if (n26 < 4UL) {
# 1176 "lego_osek/lego_osek.c"
    ret_sensor_adc27 = (U32___1 )io_from_avr->adc_value[n26];
# 1177 "lego_osek/lego_osek.c"
    goto Lret_sensor_adc;
  } else {
# 1179 "lego_osek/lego_osek.c"
    ret_sensor_adc27 = (U32___1 )0;
# 1180 "lego_osek/lego_osek.c"
    goto Lret_sensor_adc;
  }
  Lret_sensor_adc:
# 1183 "lego_osek/lego_osek.c"
  tmp6 = ret_sensor_adc27;
# 1184 "lego_osek/lego_osek.c"
  ret_ecrobot_get_light_sensor7 = (U16___2 )tmp6;
# 1185 "lego_osek/lego_osek.c"
  goto Lret_ecrobot_get_light_sensor;
  Lret_ecrobot_get_light_sensor:
# 1187 "lego_osek/lego_osek.c"
  raw_sensor_left = ret_ecrobot_get_light_sensor7;
# 1188 "lego_osek/lego_osek.c"
  if ((int )raw_sensor_left < sens_white_cal_left) {
# 1189 "lego_osek/lego_osek.c"
    raw_sensor_left = (U16___3 )sens_white_cal_left;
  } else
# 1191 "lego_osek/lego_osek.c"
  if ((int )raw_sensor_left > sens_black_cal_left) {
# 1192 "lego_osek/lego_osek.c"
    raw_sensor_left = (U16___3 )sens_black_cal_left;
  }
# 1194 "lego_osek/lego_osek.c"
  raw_sensor_left = (U16___3 )((((int )raw_sensor_left - sens_white_cal_left) * 100) / (sens_black_cal_left - sens_white_cal_left));
# 1195 "lego_osek/lego_osek.c"
  raw_sensor_left = (U16___3 )(100 - (int )raw_sensor_left);
# 1196 "lego_osek/lego_osek.c"
  port_id8 = (U8___3 )1;
# 1197 "lego_osek/lego_osek.c"
  port11 = (int )port_id8;
# 1198 "lego_osek/lego_osek.c"
  if (port11 >= 0) {
# 1199 "lego_osek/lego_osek.c"
    if (port11 < 4) {
# 1200 "lego_osek/lego_osek.c"
      ret_i2c_busy12 = (unsigned int )i2c_port[port11].state > 1U;
# 1201 "lego_osek/lego_osek.c"
      goto Lret_i2c_busy;
    }
  }
# 1204 "lego_osek/lego_osek.c"
  ret_i2c_busy12 = 0;
# 1205 "lego_osek/lego_osek.c"
  goto Lret_i2c_busy;
  Lret_i2c_busy:
# 1207 "lego_osek/lego_osek.c"
  tmp9 = ret_i2c_busy12;
# 1208 "lego_osek/lego_osek.c"
  if (tmp9 == 0) {
# 1209 "lego_osek/lego_osek.c"
    distance_state[port_id8] = (S32___0 )*(data + (int )port_id8);
# 1210 "lego_osek/lego_osek.c"
    port13 = (int )port_id8;
# 1211 "lego_osek/lego_osek.c"
    address14 = (U32___3 )1;
# 1212 "lego_osek/lego_osek.c"
    internal_address15 = 66;
# 1213 "lego_osek/lego_osek.c"
    n_internal_address_bytes16 = 1;
# 1214 "lego_osek/lego_osek.c"
    data17 = (U8___0 *)(data + (int )port_id8);
# 1215 "lego_osek/lego_osek.c"
    nbytes18 = (U32___3 )1;
# 1216 "lego_osek/lego_osek.c"
    write19 = 0;
# 1217 "lego_osek/lego_osek.c"
    if (port13 < 0) {
# 1218 "lego_osek/lego_osek.c"
      goto Lret_i2c_start_transaction;
    } else
# 1220 "lego_osek/lego_osek.c"
    if (port13 >= 4) {
# 1221 "lego_osek/lego_osek.c"
      goto Lret_i2c_start_transaction;
    }
# 1223 "lego_osek/lego_osek.c"
    port1224 = port13;
# 1224 "lego_osek/lego_osek.c"
    if (port1224 >= 0) {
# 1225 "lego_osek/lego_osek.c"
      if (port1224 < 4) {
# 1226 "lego_osek/lego_osek.c"
        ret_i2c_busy1325 = (unsigned int )i2c_port[port1224].state > 1U;
# 1227 "lego_osek/lego_osek.c"
        goto Lret_i2c_busy___0;
      }
    }
# 1230 "lego_osek/lego_osek.c"
    ret_i2c_busy1325 = 0;
# 1231 "lego_osek/lego_osek.c"
    goto Lret_i2c_busy___0;
    Lret_i2c_busy___0:
# 1233 "lego_osek/lego_osek.c"
    tmp22 = ret_i2c_busy1325;
# 1234 "lego_osek/lego_osek.c"
    if (tmp22) {
# 1235 "lego_osek/lego_osek.c"
      goto Lret_i2c_start_transaction;
    }
# 1237 "lego_osek/lego_osek.c"
    p20 = & i2c_port[port13];
# 1238 "lego_osek/lego_osek.c"
    p20->pt_num = (U32___0 )0;
# 1239 "lego_osek/lego_osek.c"
    p20->pt_begun = (U32___0 )0;
# 1240 "lego_osek/lego_osek.c"
    pt21 = p20->partial_transaction;
# 1241 "lego_osek/lego_osek.c"
    p20->current_pt = pt21;
# 1242 "lego_osek/lego_osek.c"
    memset((void *)pt21, 0, sizeof(p20->partial_transaction));
# 1243 "lego_osek/lego_osek.c"
    if (n_internal_address_bytes16 > 0) {
# 1244 "lego_osek/lego_osek.c"
      p20->addr_int[0] = (U8___0 )(address14 << 1);
# 1245 "lego_osek/lego_osek.c"
      p20->addr_int[1] = (U8___0 )internal_address15;
# 1246 "lego_osek/lego_osek.c"
      pt21->start = (U8___0 )1;
# 1247 "lego_osek/lego_osek.c"
      if (write19) {
# 1248 "lego_osek/lego_osek.c"
        pt21->stop = (U8___0 )0;
      } else {
# 1250 "lego_osek/lego_osek.c"
        pt21->stop = (U8___0 )1;
      }
# 1252 "lego_osek/lego_osek.c"
      pt21->tx = (U8___0 )1;
# 1253 "lego_osek/lego_osek.c"
      pt21->data = p20->addr_int;
# 1254 "lego_osek/lego_osek.c"
      pt21->nbytes = (U16___0 )2;
# 1255 "lego_osek/lego_osek.c"
      pt21 ++;
    }
# 1257 "lego_osek/lego_osek.c"
    if (n_internal_address_bytes16 == 0) {
# 1258 "lego_osek/lego_osek.c"
      goto _L;
    } else
# 1260 "lego_osek/lego_osek.c"
    if (! write19) {
      _L:
# 1262 "lego_osek/lego_osek.c"
      if (n_internal_address_bytes16 > 0) {
# 1263 "lego_osek/lego_osek.c"
        pt21->start = (U8___0 )0;
      } else {
# 1265 "lego_osek/lego_osek.c"
        pt21->start = (U8___0 )1;
      }
# 1267 "lego_osek/lego_osek.c"
      pt21->restart = (U8___0 )(! pt21->start);
# 1268 "lego_osek/lego_osek.c"
      pt21->stop = (U8___0 )0;
# 1269 "lego_osek/lego_osek.c"
      pt21->tx = (U8___0 )1;
# 1270 "lego_osek/lego_osek.c"
      if (write19) {
# 1271 "lego_osek/lego_osek.c"
        tmp___023 = 0;
      } else {
# 1273 "lego_osek/lego_osek.c"
        tmp___023 = 1;
      }
# 1275 "lego_osek/lego_osek.c"
      p20->addr = (U8___0 )((address14 << 1) | (unsigned long )tmp___023);
# 1276 "lego_osek/lego_osek.c"
      pt21->data = & p20->addr;
# 1277 "lego_osek/lego_osek.c"
      pt21->nbytes = (U16___0 )1;
# 1278 "lego_osek/lego_osek.c"
      pt21 ++;
    }
# 1280 "lego_osek/lego_osek.c"
    pt21->start = (U8___0 )0;
# 1281 "lego_osek/lego_osek.c"
    pt21->stop = (U8___0 )1;
# 1282 "lego_osek/lego_osek.c"
    if (write19) {
# 1283 "lego_osek/lego_osek.c"
      pt21->tx = (U8___0 )1;
    } else {
# 1285 "lego_osek/lego_osek.c"
      pt21->tx = (U8___0 )0;
    }
# 1287 "lego_osek/lego_osek.c"
    pt21->data = data17;
# 1288 "lego_osek/lego_osek.c"
    pt21->nbytes = (U16___0 )nbytes18;
# 1289 "lego_osek/lego_osek.c"
    pt21->last_pt = (U8___0 )1;
# 1290 "lego_osek/lego_osek.c"
    p20->state = (i2c_port_state )2;
# 1291 "lego_osek/lego_osek.c"
    goto Lret_i2c_start_transaction;
    Lret_i2c_start_transaction: ;
  }
# 1294 "lego_osek/lego_osek.c"
  ret_ecrobot_get_sonar_sensor10 = distance_state[port_id8];
# 1295 "lego_osek/lego_osek.c"
  goto Lret_ecrobot_get_sonar_sensor;
  Lret_ecrobot_get_sonar_sensor:
# 1297 "lego_osek/lego_osek.c"
  tmp = ret_ecrobot_get_sonar_sensor10;
# 1298 "lego_osek/lego_osek.c"
  raw_sonar_value = (U32___4 )tmp;
# 1299 "lego_osek/lego_osek.c"
  if (raw_sonar_value < 0UL) {
# 1300 "lego_osek/lego_osek.c"
    raw_sonar_value = previous_raw_sonar_value;
  } else {
# 1302 "lego_osek/lego_osek.c"
    previous_raw_sonar_value = raw_sonar_value;
  }
# 1304 "lego_osek/lego_osek.c"
  sonar_value = (_float___0 )((double )raw_sonar_value / 2.56);
# 1305 "lego_osek/lego_osek.c"
  varname28 = (char *)"sonar";
# 1306 "lego_osek/lego_osek.c"
  line29 = 2;
# 1307 "lego_osek/lego_osek.c"
  value30 = (int )sonar_value;
# 1308 "lego_osek/lego_osek.c"
  GetResource(lcd);
# 1309 "lego_osek/lego_osek.c"
  x936 = 0;
# 1310 "lego_osek/lego_osek.c"
  y1037 = line29;
# 1311 "lego_osek/lego_osek.c"
  display_x = x936;
# 1312 "lego_osek/lego_osek.c"
  display_y = y1037;
# 1313 "lego_osek/lego_osek.c"
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
# 1315 "lego_osek/lego_osek.c"
  str1542 = (char const *)varname28;
# 1316 "lego_osek/lego_osek.c"
  while (*str1542) {
# 1317 "lego_osek/lego_osek.c"
    if ((int const )*str1542 != 10) {
# 1318 "lego_osek/lego_osek.c"
      c1643 = (int )*str1542;
# 1319 "lego_osek/lego_osek.c"
      if (c1643 >= 0) {
# 1320 "lego_osek/lego_osek.c"
        if (c1643 < 128) {
# 1321 "lego_osek/lego_osek.c"
          if (display_x >= 0) {
# 1322 "lego_osek/lego_osek.c"
            if (display_x < 16) {
# 1323 "lego_osek/lego_osek.c"
              if (display_y >= 0) {
# 1324 "lego_osek/lego_osek.c"
                if (display_y < 8) {
# 1325 "lego_osek/lego_osek.c"
                  b1845 = & (*(display_buffer + display_y))[display_x * 6];
# 1326 "lego_osek/lego_osek.c"
                  f1946 = font[c1643];
# 1327 "lego_osek/lego_osek.c"
                  i1744 = 0;
# 1328 "lego_osek/lego_osek.c"
                  while (i1744 < 5) {
# 1329 "lego_osek/lego_osek.c"
                    *b1845 = (U8___2 )*f1946;
# 1330 "lego_osek/lego_osek.c"
                    b1845 ++;
# 1331 "lego_osek/lego_osek.c"
                    f1946 ++;
# 1332 "lego_osek/lego_osek.c"
                    i1744 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1340 "lego_osek/lego_osek.c"
      goto Lret_display_char;
      Lret_display_char:
# 1342 "lego_osek/lego_osek.c"
      display_x ++;
    } else {
# 1344 "lego_osek/lego_osek.c"
      display_x = 0;
# 1345 "lego_osek/lego_osek.c"
      display_y ++;
    }
# 1347 "lego_osek/lego_osek.c"
    str1542 ++;
  }
# 1349 "lego_osek/lego_osek.c"
  goto Lret_display_string;
  Lret_display_string:
# 1351 "lego_osek/lego_osek.c"
  tmp32 = strlen((char const *)varname28);
# 1352 "lego_osek/lego_osek.c"
  l31 = (int )tmp32;
# 1353 "lego_osek/lego_osek.c"
  x1138 = l31;
# 1354 "lego_osek/lego_osek.c"
  y1239 = line29;
# 1355 "lego_osek/lego_osek.c"
  display_x = x1138;
# 1356 "lego_osek/lego_osek.c"
  display_y = y1239;
# 1357 "lego_osek/lego_osek.c"
  goto Lret_display_goto_xy___0;
  Lret_display_goto_xy___0:
# 1359 "lego_osek/lego_osek.c"
  val633 = value30;
# 1360 "lego_osek/lego_osek.c"
  places734 = (U32___3 )4;
# 1361 "lego_osek/lego_osek.c"
  if (val633 < 0) {
# 1362 "lego_osek/lego_osek.c"
    tmp835 = - val633;
  } else {
# 1364 "lego_osek/lego_osek.c"
    tmp835 = val633;
  }
# 1366 "lego_osek/lego_osek.c"
  val2047 = (U32 )tmp835;
# 1367 "lego_osek/lego_osek.c"
  places2148 = places734;
# 1368 "lego_osek/lego_osek.c"
  sign2249 = (U32 )(val633 < 0);
# 1369 "lego_osek/lego_osek.c"
  p2451 = & x2350[11];
# 1370 "lego_osek/lego_osek.c"
  p_count2552 = 0;
# 1371 "lego_osek/lego_osek.c"
  *p2451 = (char)0;
# 1372 "lego_osek/lego_osek.c"
  if (places2148 > 11UL) {
# 1373 "lego_osek/lego_osek.c"
    places2148 = (U32 )11;
  }
# 1375 "lego_osek/lego_osek.c"
  while (val2047) {
# 1376 "lego_osek/lego_osek.c"
    p2451 --;
# 1377 "lego_osek/lego_osek.c"
    p_count2552 ++;
# 1378 "lego_osek/lego_osek.c"
    *p2451 = (char )(val2047 % 10UL + 48UL);
# 1379 "lego_osek/lego_osek.c"
    val2047 /= 10UL;
  }
# 1381 "lego_osek/lego_osek.c"
  if (! p_count2552) {
# 1382 "lego_osek/lego_osek.c"
    p2451 --;
# 1383 "lego_osek/lego_osek.c"
    p_count2552 ++;
# 1384 "lego_osek/lego_osek.c"
    *p2451 = (char )'0';
  }
# 1386 "lego_osek/lego_osek.c"
  if (sign2249) {
# 1387 "lego_osek/lego_osek.c"
    p2451 --;
# 1388 "lego_osek/lego_osek.c"
    p_count2552 ++;
# 1389 "lego_osek/lego_osek.c"
    *p2451 = (char )'-';
  }
# 1391 "lego_osek/lego_osek.c"
  while ((U32 )p_count2552 < places2148) {
# 1392 "lego_osek/lego_osek.c"
    p2451 --;
# 1393 "lego_osek/lego_osek.c"
    p_count2552 ++;
# 1394 "lego_osek/lego_osek.c"
    *p2451 = (char )' ';
  }
# 1396 "lego_osek/lego_osek.c"
  str72653 = (char const *)p2451;
# 1397 "lego_osek/lego_osek.c"
  while (*str72653) {
# 1398 "lego_osek/lego_osek.c"
    if ((int const )*str72653 != 10) {
# 1399 "lego_osek/lego_osek.c"
      c82754 = (int )*str72653;
# 1400 "lego_osek/lego_osek.c"
      if (c82754 >= 0) {
# 1401 "lego_osek/lego_osek.c"
        if (c82754 < 128) {
# 1402 "lego_osek/lego_osek.c"
          if (display_x >= 0) {
# 1403 "lego_osek/lego_osek.c"
            if (display_x < 16) {
# 1404 "lego_osek/lego_osek.c"
              if (display_y >= 0) {
# 1405 "lego_osek/lego_osek.c"
                if (display_y < 8) {
# 1406 "lego_osek/lego_osek.c"
                  b102956 = & (*(display_buffer + display_y))[display_x * 6];
# 1407 "lego_osek/lego_osek.c"
                  f113057 = font[c82754];
# 1408 "lego_osek/lego_osek.c"
                  i92855 = 0;
# 1409 "lego_osek/lego_osek.c"
                  while (i92855 < 5) {
# 1410 "lego_osek/lego_osek.c"
                    *b102956 = (U8___2 )*f113057;
# 1411 "lego_osek/lego_osek.c"
                    b102956 ++;
# 1412 "lego_osek/lego_osek.c"
                    f113057 ++;
# 1413 "lego_osek/lego_osek.c"
                    i92855 ++;
                  }
                }
              }
            }
          }
        }
      }
# 1421 "lego_osek/lego_osek.c"
      goto Lret_display_char___0;
      Lret_display_char___0:
# 1423 "lego_osek/lego_osek.c"
      display_x ++;
    } else {
# 1425 "lego_osek/lego_osek.c"
      display_x = 0;
# 1426 "lego_osek/lego_osek.c"
      display_y ++;
    }
# 1428 "lego_osek/lego_osek.c"
    str72653 ++;
  }
# 1430 "lego_osek/lego_osek.c"
  goto Lret_display_string___0;
  Lret_display_string___0: ;
# 1432 "lego_osek/lego_osek.c"
  goto Lret_display_unsigned_worker;
  Lret_display_unsigned_worker: ;
# 1434 "lego_osek/lego_osek.c"
  goto Lret_display_int;
  Lret_display_int:
# 1436 "lego_osek/lego_osek.c"
  x1340 = 0;
# 1437 "lego_osek/lego_osek.c"
  y1441 = line29 + 1;
# 1438 "lego_osek/lego_osek.c"
  display_x = x1340;
# 1439 "lego_osek/lego_osek.c"
  display_y = y1441;
# 1440 "lego_osek/lego_osek.c"
  goto Lret_display_goto_xy___1;
  Lret_display_goto_xy___1:
# 1442 "lego_osek/lego_osek.c"
  display_tick = 0;
# 1443 "lego_osek/lego_osek.c"
  if (! display) {
# 1444 "lego_osek/lego_osek.c"
    goto Lret_nxt_spi_refresh;
  }
# 1446 "lego_osek/lego_osek.c"
  dirty = (unsigned char volatile )1;
# 1447 "lego_osek/lego_osek.c"
  *((AT91_REG *)4294836244U) = 1U << 5;
# 1448 "lego_osek/lego_osek.c"
  goto Lret_nxt_spi_refresh;
  Lret_nxt_spi_refresh: ;
# 1450 "lego_osek/lego_osek.c"
  goto Lret_nxt_lcd_update;
  Lret_nxt_lcd_update: ;
# 1452 "lego_osek/lego_osek.c"
  goto Lret_display_update;
  Lret_display_update:
# 1454 "lego_osek/lego_osek.c"
  ReleaseResource(lcd);
# 1455 "lego_osek/lego_osek.c"
  goto Lret_show_var;
  Lret_show_var:
# 1457 "lego_osek/lego_osek.c"
  V58 = (_real___1 )sonar_value;
# 1458 "lego_osek/lego_osek.c"
  ctx_obst._Co = V58;
# 1459 "lego_osek/lego_osek.c"
  goto Lret_obst_detector_I_Co;
  Lret_obst_detector_I_Co:
# 1461 "lego_osek/lego_osek.c"
  V59 = (_real___1 )raw_sensor_left;
# 1462 "lego_osek/lego_osek.c"
  ctx_obst._Cg = V59;
# 1463 "lego_osek/lego_osek.c"
  goto Lret_obst_detector_I_Cg;
  Lret_obst_detector_I_Cg:
# 1465 "lego_osek/lego_osek.c"
  L460 = ctx_obst._Co < (_real___0 )8;
# 1466 "lego_osek/lego_osek.c"
  if (ctx_obst.M7) {
# 1467 "lego_osek/lego_osek.c"
    L661 = 0;
  } else {
# 1469 "lego_osek/lego_osek.c"
    L661 = ctx_obst.M10;
  }
# 1471 "lego_osek/lego_osek.c"
  if (L460) {
# 1472 "lego_osek/lego_osek.c"
    tmp85 = 1;
  } else
# 1474 "lego_osek/lego_osek.c"
  if (L661) {
# 1475 "lego_osek/lego_osek.c"
    tmp85 = 1;
  } else {
# 1477 "lego_osek/lego_osek.c"
    tmp85 = 0;
  }
# 1479 "lego_osek/lego_osek.c"
  L362 = tmp85;
# 1480 "lego_osek/lego_osek.c"
  if (ctx_obst.M7) {
# 1481 "lego_osek/lego_osek.c"
    L1263 = 0;
  } else {
# 1483 "lego_osek/lego_osek.c"
    L1263 = ctx_obst.M13;
  }
# 1485 "lego_osek/lego_osek.c"
  L1164 = ! L1263;
# 1486 "lego_osek/lego_osek.c"
  if (L362) {
# 1487 "lego_osek/lego_osek.c"
    if (L1164) {
# 1488 "lego_osek/lego_osek.c"
      tmp___086 = 1;
    } else {
# 1490 "lego_osek/lego_osek.c"
      tmp___086 = 0;
    }
  } else {
# 1493 "lego_osek/lego_osek.c"
    tmp___086 = 0;
  }
# 1495 "lego_osek/lego_osek.c"
  L265 = tmp___086;
# 1496 "lego_osek/lego_osek.c"
  obst96 = L265;
# 1497 "lego_osek/lego_osek.c"
  Pg97 = (_real___2 )-32;
# 1498 "lego_osek/lego_osek.c"
  Pd98 = (_real___2 )25;
# 1499 "lego_osek/lego_osek.c"
  multi_task_obst = obst96;
# 1500 "lego_osek/lego_osek.c"
  if (multi_task_obst) {
# 1501 "lego_osek/lego_osek.c"
    varname499 = (char *)"Pd";
# 1502 "lego_osek/lego_osek.c"
    line5100 = 3;
# 1503 "lego_osek/lego_osek.c"
    value6101 = (int )Pg97;
# 1504 "lego_osek/lego_osek.c"
    GetResource(lcd);
# 1505 "lego_osek/lego_osek.c"
    x912107 = 0;
# 1506 "lego_osek/lego_osek.c"
    y1013108 = line5100;
# 1507 "lego_osek/lego_osek.c"
    display_x = x912107;
# 1508 "lego_osek/lego_osek.c"
    display_y = y1013108;
# 1509 "lego_osek/lego_osek.c"
    goto Lret_display_goto_xy___2;
    Lret_display_goto_xy___2:
# 1511 "lego_osek/lego_osek.c"
    str1518113 = (char const *)varname499;
# 1512 "lego_osek/lego_osek.c"
    while (*str1518113) {
# 1513 "lego_osek/lego_osek.c"
      if ((int const )*str1518113 != 10) {
# 1514 "lego_osek/lego_osek.c"
        c1619114 = (int )*str1518113;
# 1515 "lego_osek/lego_osek.c"
        if (c1619114 >= 0) {
# 1516 "lego_osek/lego_osek.c"
          if (c1619114 < 128) {
# 1517 "lego_osek/lego_osek.c"
            if (display_x >= 0) {
# 1518 "lego_osek/lego_osek.c"
              if (display_x < 16) {
# 1519 "lego_osek/lego_osek.c"
                if (display_y >= 0) {
# 1520 "lego_osek/lego_osek.c"
                  if (display_y < 8) {
# 1521 "lego_osek/lego_osek.c"
                    b1821116 = & (*(display_buffer + display_y))[display_x * 6];
# 1522 "lego_osek/lego_osek.c"
                    f1922117 = font[c1619114];
# 1523 "lego_osek/lego_osek.c"
                    i1720115 = 0;
# 1524 "lego_osek/lego_osek.c"
                    while (i1720115 < 5) {
# 1525 "lego_osek/lego_osek.c"
                      *b1821116 = (U8___2 )*f1922117;
# 1526 "lego_osek/lego_osek.c"
                      b1821116 ++;
# 1527 "lego_osek/lego_osek.c"
                      f1922117 ++;
# 1528 "lego_osek/lego_osek.c"
                      i1720115 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1536 "lego_osek/lego_osek.c"
        goto Lret_display_char___1;
        Lret_display_char___1:
# 1538 "lego_osek/lego_osek.c"
        display_x ++;
      } else {
# 1540 "lego_osek/lego_osek.c"
        display_x = 0;
# 1541 "lego_osek/lego_osek.c"
        display_y ++;
      }
# 1543 "lego_osek/lego_osek.c"
      str1518113 ++;
    }
# 1545 "lego_osek/lego_osek.c"
    goto Lret_display_string___1;
    Lret_display_string___1:
# 1547 "lego_osek/lego_osek.c"
    tmp8103 = strlen((char const *)varname499);
# 1548 "lego_osek/lego_osek.c"
    l7102 = (int )tmp8103;
# 1549 "lego_osek/lego_osek.c"
    x1114109 = l7102;
# 1550 "lego_osek/lego_osek.c"
    y1215110 = line5100;
# 1551 "lego_osek/lego_osek.c"
    display_x = x1114109;
# 1552 "lego_osek/lego_osek.c"
    display_y = y1215110;
# 1553 "lego_osek/lego_osek.c"
    goto Lret_display_goto_xy___3;
    Lret_display_goto_xy___3:
# 1555 "lego_osek/lego_osek.c"
    val69104 = value6101;
# 1556 "lego_osek/lego_osek.c"
    places710105 = (U32___3 )4;
# 1557 "lego_osek/lego_osek.c"
    if (val69104 < 0) {
# 1558 "lego_osek/lego_osek.c"
      tmp811106 = - val69104;
    } else {
# 1560 "lego_osek/lego_osek.c"
      tmp811106 = val69104;
    }
# 1562 "lego_osek/lego_osek.c"
    val2023118 = (U32 )tmp811106;
# 1563 "lego_osek/lego_osek.c"
    places2124119 = places710105;
# 1564 "lego_osek/lego_osek.c"
    sign2225120 = (U32 )(val69104 < 0);
# 1565 "lego_osek/lego_osek.c"
    p2427122 = & x2326121[11];
# 1566 "lego_osek/lego_osek.c"
    p_count2528123 = 0;
# 1567 "lego_osek/lego_osek.c"
    *p2427122 = (char)0;
# 1568 "lego_osek/lego_osek.c"
    if (places2124119 > 11UL) {
# 1569 "lego_osek/lego_osek.c"
      places2124119 = (U32 )11;
    }
# 1571 "lego_osek/lego_osek.c"
    while (val2023118) {
# 1572 "lego_osek/lego_osek.c"
      p2427122 --;
# 1573 "lego_osek/lego_osek.c"
      p_count2528123 ++;
# 1574 "lego_osek/lego_osek.c"
      *p2427122 = (char )(val2023118 % 10UL + 48UL);
# 1575 "lego_osek/lego_osek.c"
      val2023118 /= 10UL;
    }
# 1577 "lego_osek/lego_osek.c"
    if (! p_count2528123) {
# 1578 "lego_osek/lego_osek.c"
      p2427122 --;
# 1579 "lego_osek/lego_osek.c"
      p_count2528123 ++;
# 1580 "lego_osek/lego_osek.c"
      *p2427122 = (char )'0';
    }
# 1582 "lego_osek/lego_osek.c"
    if (sign2225120) {
# 1583 "lego_osek/lego_osek.c"
      p2427122 --;
# 1584 "lego_osek/lego_osek.c"
      p_count2528123 ++;
# 1585 "lego_osek/lego_osek.c"
      *p2427122 = (char )'-';
    }
# 1587 "lego_osek/lego_osek.c"
    while ((U32 )p_count2528123 < places2124119) {
# 1588 "lego_osek/lego_osek.c"
      p2427122 --;
# 1589 "lego_osek/lego_osek.c"
      p_count2528123 ++;
# 1590 "lego_osek/lego_osek.c"
      *p2427122 = (char )' ';
    }
# 1592 "lego_osek/lego_osek.c"
    str72629124 = (char const *)p2427122;
# 1593 "lego_osek/lego_osek.c"
    while (*str72629124) {
# 1594 "lego_osek/lego_osek.c"
      if ((int const )*str72629124 != 10) {
# 1595 "lego_osek/lego_osek.c"
        c82730125 = (int )*str72629124;
# 1596 "lego_osek/lego_osek.c"
        if (c82730125 >= 0) {
# 1597 "lego_osek/lego_osek.c"
          if (c82730125 < 128) {
# 1598 "lego_osek/lego_osek.c"
            if (display_x >= 0) {
# 1599 "lego_osek/lego_osek.c"
              if (display_x < 16) {
# 1600 "lego_osek/lego_osek.c"
                if (display_y >= 0) {
# 1601 "lego_osek/lego_osek.c"
                  if (display_y < 8) {
# 1602 "lego_osek/lego_osek.c"
                    b102932127 = & (*(display_buffer + display_y))[display_x * 6];
# 1603 "lego_osek/lego_osek.c"
                    f113033128 = font[c82730125];
# 1604 "lego_osek/lego_osek.c"
                    i92831126 = 0;
# 1605 "lego_osek/lego_osek.c"
                    while (i92831126 < 5) {
# 1606 "lego_osek/lego_osek.c"
                      *b102932127 = (U8___2 )*f113033128;
# 1607 "lego_osek/lego_osek.c"
                      b102932127 ++;
# 1608 "lego_osek/lego_osek.c"
                      f113033128 ++;
# 1609 "lego_osek/lego_osek.c"
                      i92831126 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1617 "lego_osek/lego_osek.c"
        goto Lret_display_char___2;
        Lret_display_char___2:
# 1619 "lego_osek/lego_osek.c"
        display_x ++;
      } else {
# 1621 "lego_osek/lego_osek.c"
        display_x = 0;
# 1622 "lego_osek/lego_osek.c"
        display_y ++;
      }
# 1624 "lego_osek/lego_osek.c"
      str72629124 ++;
    }
# 1626 "lego_osek/lego_osek.c"
    goto Lret_display_string___2;
    Lret_display_string___2: ;
# 1628 "lego_osek/lego_osek.c"
    goto Lret_display_unsigned_worker___0;
    Lret_display_unsigned_worker___0: ;
# 1630 "lego_osek/lego_osek.c"
    goto Lret_display_int___0;
    Lret_display_int___0:
# 1632 "lego_osek/lego_osek.c"
    x1316111 = 0;
# 1633 "lego_osek/lego_osek.c"
    y1417112 = line5100 + 1;
# 1634 "lego_osek/lego_osek.c"
    display_x = x1316111;
# 1635 "lego_osek/lego_osek.c"
    display_y = y1417112;
# 1636 "lego_osek/lego_osek.c"
    goto Lret_display_goto_xy___4;
    Lret_display_goto_xy___4:
# 1638 "lego_osek/lego_osek.c"
    display_tick = 0;
# 1639 "lego_osek/lego_osek.c"
    if (! display) {
# 1640 "lego_osek/lego_osek.c"
      goto Lret_nxt_spi_refresh___0;
    }
# 1642 "lego_osek/lego_osek.c"
    dirty = (unsigned char volatile )1;
# 1643 "lego_osek/lego_osek.c"
    *((AT91_REG *)4294836244U) = 1U << 5;
# 1644 "lego_osek/lego_osek.c"
    goto Lret_nxt_spi_refresh___0;
    Lret_nxt_spi_refresh___0: ;
# 1646 "lego_osek/lego_osek.c"
    goto Lret_nxt_lcd_update___0;
    Lret_nxt_lcd_update___0: ;
# 1648 "lego_osek/lego_osek.c"
    goto Lret_display_update___0;
    Lret_display_update___0:
# 1650 "lego_osek/lego_osek.c"
    ReleaseResource(lcd);
# 1651 "lego_osek/lego_osek.c"
    goto Lret_show_var___0;
    Lret_show_var___0:
# 1653 "lego_osek/lego_osek.c"
    varname34129 = (char *)"Pg";
# 1654 "lego_osek/lego_osek.c"
    line35130 = 4;
# 1655 "lego_osek/lego_osek.c"
    value36131 = (int )Pd98;
# 1656 "lego_osek/lego_osek.c"
    GetResource(lcd);
# 1657 "lego_osek/lego_osek.c"
    x942137 = 0;
# 1658 "lego_osek/lego_osek.c"
    y1043138 = line35130;
# 1659 "lego_osek/lego_osek.c"
    display_x = x942137;
# 1660 "lego_osek/lego_osek.c"
    display_y = y1043138;
# 1661 "lego_osek/lego_osek.c"
    goto Lret_display_goto_xy___5;
    Lret_display_goto_xy___5:
# 1663 "lego_osek/lego_osek.c"
    str1548143 = (char const *)varname34129;
# 1664 "lego_osek/lego_osek.c"
    while (*str1548143) {
# 1665 "lego_osek/lego_osek.c"
      if ((int const )*str1548143 != 10) {
# 1666 "lego_osek/lego_osek.c"
        c1649144 = (int )*str1548143;
# 1667 "lego_osek/lego_osek.c"
        if (c1649144 >= 0) {
# 1668 "lego_osek/lego_osek.c"
          if (c1649144 < 128) {
# 1669 "lego_osek/lego_osek.c"
            if (display_x >= 0) {
# 1670 "lego_osek/lego_osek.c"
              if (display_x < 16) {
# 1671 "lego_osek/lego_osek.c"
                if (display_y >= 0) {
# 1672 "lego_osek/lego_osek.c"
                  if (display_y < 8) {
# 1673 "lego_osek/lego_osek.c"
                    b1851146 = & (*(display_buffer + display_y))[display_x * 6];
# 1674 "lego_osek/lego_osek.c"
                    f1952147 = font[c1649144];
# 1675 "lego_osek/lego_osek.c"
                    i1750145 = 0;
# 1676 "lego_osek/lego_osek.c"
                    while (i1750145 < 5) {
# 1677 "lego_osek/lego_osek.c"
                      *b1851146 = (U8___2 )*f1952147;
# 1678 "lego_osek/lego_osek.c"
                      b1851146 ++;
# 1679 "lego_osek/lego_osek.c"
                      f1952147 ++;
# 1680 "lego_osek/lego_osek.c"
                      i1750145 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1688 "lego_osek/lego_osek.c"
        goto Lret_display_char___3;
        Lret_display_char___3:
# 1690 "lego_osek/lego_osek.c"
        display_x ++;
      } else {
# 1692 "lego_osek/lego_osek.c"
        display_x = 0;
# 1693 "lego_osek/lego_osek.c"
        display_y ++;
      }
# 1695 "lego_osek/lego_osek.c"
      str1548143 ++;
    }
# 1697 "lego_osek/lego_osek.c"
    goto Lret_display_string___3;
    Lret_display_string___3:
# 1699 "lego_osek/lego_osek.c"
    tmp38133 = strlen((char const *)varname34129);
# 1700 "lego_osek/lego_osek.c"
    l37132 = (int )tmp38133;
# 1701 "lego_osek/lego_osek.c"
    x1144139 = l37132;
# 1702 "lego_osek/lego_osek.c"
    y1245140 = line35130;
# 1703 "lego_osek/lego_osek.c"
    display_x = x1144139;
# 1704 "lego_osek/lego_osek.c"
    display_y = y1245140;
# 1705 "lego_osek/lego_osek.c"
    goto Lret_display_goto_xy___6;
    Lret_display_goto_xy___6:
# 1707 "lego_osek/lego_osek.c"
    val639134 = value36131;
# 1708 "lego_osek/lego_osek.c"
    places740135 = (U32___3 )4;
# 1709 "lego_osek/lego_osek.c"
    if (val639134 < 0) {
# 1710 "lego_osek/lego_osek.c"
      tmp841136 = - val639134;
    } else {
# 1712 "lego_osek/lego_osek.c"
      tmp841136 = val639134;
    }
# 1714 "lego_osek/lego_osek.c"
    val2053148 = (U32 )tmp841136;
# 1715 "lego_osek/lego_osek.c"
    places2154149 = places740135;
# 1716 "lego_osek/lego_osek.c"
    sign2255150 = (U32 )(val639134 < 0);
# 1717 "lego_osek/lego_osek.c"
    p2457152 = & x2356151[11];
# 1718 "lego_osek/lego_osek.c"
    p_count2558153 = 0;
# 1719 "lego_osek/lego_osek.c"
    *p2457152 = (char)0;
# 1720 "lego_osek/lego_osek.c"
    if (places2154149 > 11UL) {
# 1721 "lego_osek/lego_osek.c"
      places2154149 = (U32 )11;
    }
# 1723 "lego_osek/lego_osek.c"
    while (val2053148) {
# 1724 "lego_osek/lego_osek.c"
      p2457152 --;
# 1725 "lego_osek/lego_osek.c"
      p_count2558153 ++;
# 1726 "lego_osek/lego_osek.c"
      *p2457152 = (char )(val2053148 % 10UL + 48UL);
# 1727 "lego_osek/lego_osek.c"
      val2053148 /= 10UL;
    }
# 1729 "lego_osek/lego_osek.c"
    if (! p_count2558153) {
# 1730 "lego_osek/lego_osek.c"
      p2457152 --;
# 1731 "lego_osek/lego_osek.c"
      p_count2558153 ++;
# 1732 "lego_osek/lego_osek.c"
      *p2457152 = (char )'0';
    }
# 1734 "lego_osek/lego_osek.c"
    if (sign2255150) {
# 1735 "lego_osek/lego_osek.c"
      p2457152 --;
# 1736 "lego_osek/lego_osek.c"
      p_count2558153 ++;
# 1737 "lego_osek/lego_osek.c"
      *p2457152 = (char )'-';
    }
# 1739 "lego_osek/lego_osek.c"
    while ((U32 )p_count2558153 < places2154149) {
# 1740 "lego_osek/lego_osek.c"
      p2457152 --;
# 1741 "lego_osek/lego_osek.c"
      p_count2558153 ++;
# 1742 "lego_osek/lego_osek.c"
      *p2457152 = (char )' ';
    }
# 1744 "lego_osek/lego_osek.c"
    str72659154 = (char const *)p2457152;
# 1745 "lego_osek/lego_osek.c"
    while (*str72659154) {
# 1746 "lego_osek/lego_osek.c"
      if ((int const )*str72659154 != 10) {
# 1747 "lego_osek/lego_osek.c"
        c82760155 = (int )*str72659154;
# 1748 "lego_osek/lego_osek.c"
        if (c82760155 >= 0) {
# 1749 "lego_osek/lego_osek.c"
          if (c82760155 < 128) {
# 1750 "lego_osek/lego_osek.c"
            if (display_x >= 0) {
# 1751 "lego_osek/lego_osek.c"
              if (display_x < 16) {
# 1752 "lego_osek/lego_osek.c"
                if (display_y >= 0) {
# 1753 "lego_osek/lego_osek.c"
                  if (display_y < 8) {
# 1754 "lego_osek/lego_osek.c"
                    b102962157 = & (*(display_buffer + display_y))[display_x * 6];
# 1755 "lego_osek/lego_osek.c"
                    f113063158 = font[c82760155];
# 1756 "lego_osek/lego_osek.c"
                    i92861156 = 0;
# 1757 "lego_osek/lego_osek.c"
                    while (i92861156 < 5) {
# 1758 "lego_osek/lego_osek.c"
                      *b102962157 = (U8___2 )*f113063158;
# 1759 "lego_osek/lego_osek.c"
                      b102962157 ++;
# 1760 "lego_osek/lego_osek.c"
                      f113063158 ++;
# 1761 "lego_osek/lego_osek.c"
                      i92861156 ++;
                    }
                  }
                }
              }
            }
          }
        }
# 1769 "lego_osek/lego_osek.c"
        goto Lret_display_char___4;
        Lret_display_char___4:
# 1771 "lego_osek/lego_osek.c"
        display_x ++;
      } else {
# 1773 "lego_osek/lego_osek.c"
        display_x = 0;
# 1774 "lego_osek/lego_osek.c"
        display_y ++;
      }
# 1776 "lego_osek/lego_osek.c"
      str72659154 ++;
    }
# 1778 "lego_osek/lego_osek.c"
    goto Lret_display_string___4;
    Lret_display_string___4: ;
# 1780 "lego_osek/lego_osek.c"
    goto Lret_display_unsigned_worker___1;
    Lret_display_unsigned_worker___1: ;
# 1782 "lego_osek/lego_osek.c"
    goto Lret_display_int___1;
    Lret_display_int___1:
# 1784 "lego_osek/lego_osek.c"
    x1346141 = 0;
# 1785 "lego_osek/lego_osek.c"
    y1447142 = line35130 + 1;
# 1786 "lego_osek/lego_osek.c"
    display_x = x1346141;
# 1787 "lego_osek/lego_osek.c"
    display_y = y1447142;
# 1788 "lego_osek/lego_osek.c"
    goto Lret_display_goto_xy___7;
    Lret_display_goto_xy___7:
# 1790 "lego_osek/lego_osek.c"
    display_tick = 0;
# 1791 "lego_osek/lego_osek.c"
    if (! display) {
# 1792 "lego_osek/lego_osek.c"
      goto Lret_nxt_spi_refresh___1;
    }
# 1794 "lego_osek/lego_osek.c"
    dirty = (unsigned char volatile )1;
# 1795 "lego_osek/lego_osek.c"
    *((AT91_REG *)4294836244U) = 1U << 5;
# 1796 "lego_osek/lego_osek.c"
    goto Lret_nxt_spi_refresh___1;
    Lret_nxt_spi_refresh___1: ;
# 1798 "lego_osek/lego_osek.c"
    goto Lret_nxt_lcd_update___1;
    Lret_nxt_lcd_update___1: ;
# 1800 "lego_osek/lego_osek.c"
    goto Lret_display_update___1;
    Lret_display_update___1:
# 1802 "lego_osek/lego_osek.c"
    ReleaseResource(lcd);
# 1803 "lego_osek/lego_osek.c"
    goto Lret_show_var___1;
    Lret_show_var___1:
# 1805 "lego_osek/lego_osek.c"
    port64159 = (U32___4 )1;
# 1806 "lego_osek/lego_osek.c"
    speed65160 = Pg97;
# 1807 "lego_osek/lego_osek.c"
    if (speed65160 > 100.0) {
# 1808 "lego_osek/lego_osek.c"
      speed_percent66161 = 100;
    } else
# 1810 "lego_osek/lego_osek.c"
    if (speed65160 < - 100.0) {
# 1811 "lego_osek/lego_osek.c"
      speed_percent66161 = -100;
    } else {
# 1813 "lego_osek/lego_osek.c"
      speed_percent66161 = (int )speed65160;
    }
# 1815 "lego_osek/lego_osek.c"
    port_id467162 = (U8___3 )port64159;
# 1816 "lego_osek/lego_osek.c"
    speed568163 = (S8___1 )speed_percent66161;
# 1817 "lego_osek/lego_osek.c"
    n669164 = (U32___3 )port_id467162;
# 1818 "lego_osek/lego_osek.c"
    speed_percent770165 = (int )speed568163;
# 1819 "lego_osek/lego_osek.c"
    brake871166 = 1;
# 1820 "lego_osek/lego_osek.c"
    if (n669164 < 3UL) {
# 1821 "lego_osek/lego_osek.c"
      if (speed_percent770165 > 100) {
# 1822 "lego_osek/lego_osek.c"
        speed_percent770165 = 100;
      }
# 1824 "lego_osek/lego_osek.c"
      if (speed_percent770165 < -100) {
# 1825 "lego_osek/lego_osek.c"
        speed_percent770165 = -100;
      }
# 1827 "lego_osek/lego_osek.c"
      motor[n669164].speed_percent = speed_percent770165;
# 1828 "lego_osek/lego_osek.c"
      n972167 = n669164;
# 1829 "lego_osek/lego_osek.c"
      power_percent1073168 = speed_percent770165;
# 1830 "lego_osek/lego_osek.c"
      brake1174169 = brake871166;
# 1831 "lego_osek/lego_osek.c"
      if (n972167 < 3UL) {
# 1832 "lego_osek/lego_osek.c"
        io_to_avr.output_percent[n972167] = (S8___0 )power_percent1073168;
# 1833 "lego_osek/lego_osek.c"
        if (brake1174169) {
# 1834 "lego_osek/lego_osek.c"
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n972167));
        } else {
# 1836 "lego_osek/lego_osek.c"
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n972167));
        }
      }
# 1839 "lego_osek/lego_osek.c"
      goto Lret_nxt_avr_set_motor;
      Lret_nxt_avr_set_motor: ;
    }
# 1842 "lego_osek/lego_osek.c"
    goto Lret_nxt_motor_set_speed;
    Lret_nxt_motor_set_speed: ;
# 1844 "lego_osek/lego_osek.c"
    goto Lret_ecrobot_set_motor_speed;
    Lret_ecrobot_set_motor_speed: ;
# 1846 "lego_osek/lego_osek.c"
    goto Lret_output_motor;
    Lret_output_motor:
# 1848 "lego_osek/lego_osek.c"
    port75170 = (U32___4 )0;
# 1849 "lego_osek/lego_osek.c"
    speed76171 = Pd98;
# 1850 "lego_osek/lego_osek.c"
    if (speed76171 > 100.0) {
# 1851 "lego_osek/lego_osek.c"
      speed_percent77172 = 100;
    } else
# 1853 "lego_osek/lego_osek.c"
    if (speed76171 < - 100.0) {
# 1854 "lego_osek/lego_osek.c"
      speed_percent77172 = -100;
    } else {
# 1856 "lego_osek/lego_osek.c"
      speed_percent77172 = (int )speed76171;
    }
# 1858 "lego_osek/lego_osek.c"
    port_id478173 = (U8___3 )port75170;
# 1859 "lego_osek/lego_osek.c"
    speed579174 = (S8___1 )speed_percent77172;
# 1860 "lego_osek/lego_osek.c"
    n680175 = (U32___3 )port_id478173;
# 1861 "lego_osek/lego_osek.c"
    speed_percent781176 = (int )speed579174;
# 1862 "lego_osek/lego_osek.c"
    brake882177 = 1;
# 1863 "lego_osek/lego_osek.c"
    if (n680175 < 3UL) {
# 1864 "lego_osek/lego_osek.c"
      if (speed_percent781176 > 100) {
# 1865 "lego_osek/lego_osek.c"
        speed_percent781176 = 100;
      }
# 1867 "lego_osek/lego_osek.c"
      if (speed_percent781176 < -100) {
# 1868 "lego_osek/lego_osek.c"
        speed_percent781176 = -100;
      }
# 1870 "lego_osek/lego_osek.c"
      motor[n680175].speed_percent = speed_percent781176;
# 1871 "lego_osek/lego_osek.c"
      n983178 = n680175;
# 1872 "lego_osek/lego_osek.c"
      power_percent1084179 = speed_percent781176;
# 1873 "lego_osek/lego_osek.c"
      brake1185180 = brake882177;
# 1874 "lego_osek/lego_osek.c"
      if (n983178 < 3UL) {
# 1875 "lego_osek/lego_osek.c"
        io_to_avr.output_percent[n983178] = (S8___0 )power_percent1084179;
# 1876 "lego_osek/lego_osek.c"
        if (brake1185180) {
# 1877 "lego_osek/lego_osek.c"
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n983178));
        } else {
# 1879 "lego_osek/lego_osek.c"
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n983178));
        }
      }
# 1882 "lego_osek/lego_osek.c"
      goto Lret_nxt_avr_set_motor___0;
      Lret_nxt_avr_set_motor___0: ;
    }
# 1885 "lego_osek/lego_osek.c"
    goto Lret_nxt_motor_set_speed___0;
    Lret_nxt_motor_set_speed___0: ;
# 1887 "lego_osek/lego_osek.c"
    goto Lret_ecrobot_set_motor_speed___0;
    Lret_ecrobot_set_motor_speed___0: ;
# 1889 "lego_osek/lego_osek.c"
    goto Lret_output_motor___0;
    Lret_output_motor___0: ;
  }
# 1892 "lego_osek/lego_osek.c"
  goto Lret_obst_detector_O_obstacle;
  Lret_obst_detector_O_obstacle:
# 1894 "lego_osek/lego_osek.c"
  L1766 = ctx_obst._Cg >= (_real___0 )90;
# 1895 "lego_osek/lego_osek.c"
  if (ctx_obst.M7) {
# 1896 "lego_osek/lego_osek.c"
    L1967 = 0;
  } else {
# 1898 "lego_osek/lego_osek.c"
    L1967 = ctx_obst.M20;
  }
# 1900 "lego_osek/lego_osek.c"
  if (L1766) {
# 1901 "lego_osek/lego_osek.c"
    tmp___187 = 1;
  } else
# 1903 "lego_osek/lego_osek.c"
  if (L1967) {
# 1904 "lego_osek/lego_osek.c"
    tmp___187 = 1;
  } else {
# 1906 "lego_osek/lego_osek.c"
    tmp___187 = 0;
  }
# 1908 "lego_osek/lego_osek.c"
  L1668 = tmp___187;
# 1909 "lego_osek/lego_osek.c"
  if (L1668) {
# 1910 "lego_osek/lego_osek.c"
    if (L1164) {
# 1911 "lego_osek/lego_osek.c"
      tmp___288 = 1;
    } else {
# 1913 "lego_osek/lego_osek.c"
      tmp___288 = 0;
    }
  } else {
# 1916 "lego_osek/lego_osek.c"
    tmp___288 = 0;
  }
# 1918 "lego_osek/lego_osek.c"
  L1569 = tmp___288;
# 1919 "lego_osek/lego_osek.c"
  L2470 = ctx_obst._Cg <= (_real___0 )35;
# 1920 "lego_osek/lego_osek.c"
  if (ctx_obst.M7) {
# 1921 "lego_osek/lego_osek.c"
    L2671 = 0;
  } else {
# 1923 "lego_osek/lego_osek.c"
    L2671 = ctx_obst.M27;
  }
# 1925 "lego_osek/lego_osek.c"
  if (L2470) {
# 1926 "lego_osek/lego_osek.c"
    tmp___389 = 1;
  } else
# 1928 "lego_osek/lego_osek.c"
  if (L2671) {
# 1929 "lego_osek/lego_osek.c"
    tmp___389 = 1;
  } else {
# 1931 "lego_osek/lego_osek.c"
    tmp___389 = 0;
  }
# 1933 "lego_osek/lego_osek.c"
  L2372 = tmp___389;
# 1934 "lego_osek/lego_osek.c"
  if (L2372) {
# 1935 "lego_osek/lego_osek.c"
    if (L1164) {
# 1936 "lego_osek/lego_osek.c"
      tmp___490 = 1;
    } else {
# 1938 "lego_osek/lego_osek.c"
      tmp___490 = 0;
    }
  } else {
# 1941 "lego_osek/lego_osek.c"
    tmp___490 = 0;
  }
# 1943 "lego_osek/lego_osek.c"
  L2273 = tmp___490;
# 1944 "lego_osek/lego_osek.c"
  L3074 = ctx_obst._Cg <= (_real___0 )90;
# 1945 "lego_osek/lego_osek.c"
  if (ctx_obst.M7) {
# 1946 "lego_osek/lego_osek.c"
    L3175 = 0;
  } else {
# 1948 "lego_osek/lego_osek.c"
    L3175 = ctx_obst.M32;
  }
# 1950 "lego_osek/lego_osek.c"
  if (L3074) {
# 1951 "lego_osek/lego_osek.c"
    tmp___591 = 1;
  } else
# 1953 "lego_osek/lego_osek.c"
  if (L3175) {
# 1954 "lego_osek/lego_osek.c"
    tmp___591 = 1;
  } else {
# 1956 "lego_osek/lego_osek.c"
    tmp___591 = 0;
  }
# 1958 "lego_osek/lego_osek.c"
  L2976 = tmp___591;
# 1959 "lego_osek/lego_osek.c"
  if (L2976) {
# 1960 "lego_osek/lego_osek.c"
    if (L1164) {
# 1961 "lego_osek/lego_osek.c"
      tmp___692 = 1;
    } else {
# 1963 "lego_osek/lego_osek.c"
      tmp___692 = 0;
    }
  } else {
# 1966 "lego_osek/lego_osek.c"
    tmp___692 = 0;
  }
# 1968 "lego_osek/lego_osek.c"
  L2877 = tmp___692;
# 1969 "lego_osek/lego_osek.c"
  if (L2273) {
# 1970 "lego_osek/lego_osek.c"
    if (L2877) {
# 1971 "lego_osek/lego_osek.c"
      tmp___793 = 1;
    } else {
# 1973 "lego_osek/lego_osek.c"
      tmp___793 = 0;
    }
  } else {
# 1976 "lego_osek/lego_osek.c"
    tmp___793 = 0;
  }
# 1978 "lego_osek/lego_osek.c"
  L2178 = tmp___793;
# 1979 "lego_osek/lego_osek.c"
  if (L1569) {
# 1980 "lego_osek/lego_osek.c"
    if (L2178) {
# 1981 "lego_osek/lego_osek.c"
      tmp___894 = 1;
    } else {
# 1983 "lego_osek/lego_osek.c"
      tmp___894 = 0;
    }
  } else {
# 1986 "lego_osek/lego_osek.c"
    tmp___894 = 0;
  }
# 1988 "lego_osek/lego_osek.c"
  L1479 = tmp___894;
# 1989 "lego_osek/lego_osek.c"
  T1380 = L1479;
# 1990 "lego_osek/lego_osek.c"
  T3281 = L2877;
# 1991 "lego_osek/lego_osek.c"
  T2782 = L2273;
# 1992 "lego_osek/lego_osek.c"
  T2083 = L1569;
# 1993 "lego_osek/lego_osek.c"
  T1084 = L265;
# 1994 "lego_osek/lego_osek.c"
  ctx_obst.M13 = T1380;
# 1995 "lego_osek/lego_osek.c"
  ctx_obst.M13_nil = 0;
# 1996 "lego_osek/lego_osek.c"
  ctx_obst.M32 = T3281;
# 1997 "lego_osek/lego_osek.c"
  ctx_obst.M32_nil = 0;
# 1998 "lego_osek/lego_osek.c"
  ctx_obst.M27 = T2782;
# 1999 "lego_osek/lego_osek.c"
  ctx_obst.M27_nil = 0;
# 2000 "lego_osek/lego_osek.c"
  ctx_obst.M20 = T2083;
# 2001 "lego_osek/lego_osek.c"
  ctx_obst.M20_nil = 0;
# 2002 "lego_osek/lego_osek.c"
  ctx_obst.M10 = T1084;
# 2003 "lego_osek/lego_osek.c"
  ctx_obst.M10_nil = 0;
# 2004 "lego_osek/lego_osek.c"
  if (ctx_obst.M7) {
# 2005 "lego_osek/lego_osek.c"
    tmp___995 = 0;
  } else {
# 2007 "lego_osek/lego_osek.c"
    tmp___995 = 0;
  }
# 2009 "lego_osek/lego_osek.c"
  ctx_obst.M7 = tmp___995;
# 2010 "lego_osek/lego_osek.c"
  goto Lret_obst_detector_step;
  Lret_obst_detector_step:
# 2012 "lego_osek/lego_osek.c"
  TerminateTask();
# 2013 "lego_osek/lego_osek.c"
  return;
}
}
# 2019 "lego_osek/lego_osek.c"
extern int create_task() ;
# 2020 "lego_osek/lego_osek.c"
extern int create_block() ;
# 2021 "lego_osek/lego_osek.c"
void main(void)
{


  {
# 2026 "lego_osek/lego_osek.c"
  create_task("TaskMainHighTask", "TaskMainHighTask", 2, 10, 1.611);
# 2027 "lego_osek/lego_osek.c"
  create_task("TaskMainLowTask", "TaskMainLowTask", 1, 30, 0.618);
# 2028 "lego_osek/lego_osek.c"
  create_block(629, "TaskMainHighTask", "lcd", 2, 2, 0.242);
# 2029 "lego_osek/lego_osek.c"
  create_block(781, "TaskMainHighTask", "lcd", 2, 2, 0.242);
# 2030 "lego_osek/lego_osek.c"
  create_block(1308, "TaskMainLowTask", "lcd", 3, 1, 0.242);
# 2031 "lego_osek/lego_osek.c"
  create_block(1504, "TaskMainLowTask", "lcd", 3, 1, 0.242);
# 2032 "lego_osek/lego_osek.c"
  create_block(1656, "TaskMainLowTask", "lcd", 3, 1, 0.242);
# 2033 "lego_osek/lego_osek.c"
  return;
}
}

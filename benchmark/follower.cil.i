# 1 "./follower.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./follower.cil.c"
# 4 "follower/follower.c"
typedef unsigned char U8;
# 5 "follower/follower.c"
typedef unsigned long U32;
# 6 "follower/follower.c"
typedef unsigned char byte;
# 7 "follower/follower.c"
typedef unsigned short TWOBYTES;
# 11 "follower/follower.c"
struct _freeBlock {
   TWOBYTES size : 15 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 17 "follower/follower.c"
struct _objects {
   byte _class ;
   byte padding : 5 ;
   byte mark : 1 ;
   byte isArray : 1 ;
   byte isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 26 "follower/follower.c"
struct _arrays {
   TWOBYTES length : 9 ;
   TWOBYTES type : 4 ;
   TWOBYTES mark : 1 ;
   TWOBYTES isArray : 1 ;
   TWOBYTES isAllocated : 1 ;
} __attribute__((__packed__)) ;
# 35 "follower/follower.c"
union _flags {
   TWOBYTES all ;
   struct _freeBlock freeBlock ;
   struct _objects objects ;
   struct _arrays arrays ;
} __attribute__((__packed__)) ;
# 43 "follower/follower.c"
struct S_Object {
   union _flags flags ;
   byte monitorCount ;
   byte threadId ;
} __attribute__((__packed__)) ;
# 50 "follower/follower.c"
typedef struct S_Object Object;
# 52 "follower/follower.c"
struct __anonstruct_display_array_740464799 {
   Object hdr ;
   U8 displayN[9][100] ;
} __attribute__((__packed__)) ;
# 58 "follower/follower.c"
typedef unsigned char U8___0;
# 59 "follower/follower.c"
typedef unsigned short U16___0;
# 60 "follower/follower.c"
typedef unsigned long U32___0;
# 63 "follower/follower.c"
struct i2c_partial_transaction {
   U8___0 start : 1 ;
   U8___0 restart : 1 ;
   U8___0 stop : 1 ;
   U8___0 tx : 1 ;
   U8___0 last_pt : 1 ;
   U16___0 nbytes ;
   U8___0 *data ;
};
# 74 "follower/follower.c"
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
# 94 "follower/follower.c"
typedef enum __anonenum_i2c_port_state_506411302 i2c_port_state;
# 95 "follower/follower.c"
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
# 118 "follower/follower.c"
typedef unsigned char U8___1;
# 119 "follower/follower.c"
typedef signed char S8___0;
# 120 "follower/follower.c"
typedef unsigned long U32___1;
# 121 "follower/follower.c"
struct __anonstruct_to_avr_432250394 {
   U8___1 power ;
   U8___1 pwm_frequency ;
   S8___0 output_percent[4] ;
   U8___1 output_mode ;
   U8___1 input_power ;
} __attribute__((__packed__)) ;
# 130 "follower/follower.c"
typedef struct __anonstruct_to_avr_432250394 to_avr;
# 131 "follower/follower.c"
typedef unsigned long U32___2;
# 132 "follower/follower.c"
struct motor_struct {
   int current_count ;
   int target_count ;
   int speed_percent ;
   U32___2 last ;
};
# 140 "follower/follower.c"
typedef unsigned char U8___2;
# 141 "follower/follower.c"
typedef unsigned long U32___3;
# 142 "follower/follower.c"
typedef long S32___0;
# 143 "follower/follower.c"
typedef unsigned char UINT8;
# 144 "follower/follower.c"
typedef unsigned long UINT32;
# 145 "follower/follower.c"
typedef UINT8 StatusType;
# 146 "follower/follower.c"
typedef UINT8 TaskType;
# 147 "follower/follower.c"
typedef UINT8 ResourceType;
# 148 "follower/follower.c"
typedef UINT32 EventMaskType;
# 149 "follower/follower.c"
typedef unsigned char U8___3;
# 150 "follower/follower.c"
typedef unsigned long U32___4;
# 151 "follower/follower.c"
typedef long S32___1;
# 152 "follower/follower.c"
typedef char CHAR___0;
# 153 "follower/follower.c"
typedef int SINT___0;
# 10 "follower/follower.c"
int true = 1;
# 154 "follower/follower.c"
int display_tick ;
# 155 "follower/follower.c"
int display_auto_update ;
# 156 "follower/follower.c"
extern void nxt_lcd_update(void) ;
# 157 "follower/follower.c"
extern void systick_wait_ms(unsigned long ms ) ;
# 159 "follower/follower.c"
extern __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1), __leaf__)) memset)(void *__s ,
                                                                                               int __c ,
                                                                                               unsigned long __n ) ;
# 162 "follower/follower.c"
static struct __anonstruct_display_array_740464799 display_array ;
# 163 "follower/follower.c"
static U8 (*display_buffer)[100] = display_array.displayN;
# 165 "follower/follower.c"
static U8 const font[128][5] =
# 165 "follower/follower.c"
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
# 422 "follower/follower.c"
int display_tick = 0;
# 423 "follower/follower.c"
int display_auto_update = 1;
# 424 "follower/follower.c"
int display_x ;
# 425 "follower/follower.c"
int display_y ;
# 426 "follower/follower.c"
static struct i2c_port_struct i2c_port[4] ;
# 427 "follower/follower.c"
char const avr_brainwash_string[48] =
# 427 "follower/follower.c"
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
# 440 "follower/follower.c"
static to_avr io_to_avr ;
# 441 "follower/follower.c"
static struct motor_struct motor[3] ;
# 442 "follower/follower.c"
extern void bt_receive(unsigned char *buf ) ;
# 443 "follower/follower.c"
extern int ecrobot_get_bt_status(void) ;
# 444 "follower/follower.c"
extern unsigned long ecrobot_send_bt_packet(unsigned char *buf , unsigned long bufLen ) ;
# 445 "follower/follower.c"
extern int ecrobot_sound_tone(U32___3 freq , U32___3 ms , U32___3 vol ) ;
# 446 "follower/follower.c"
static S32___0 distance_state[4] = { (S32___0 )-1, (S32___0 )-1, (S32___0 )-1, (S32___0 )-1};
# 447 "follower/follower.c"
static U8___2 data[4] = { (U8___2 )0};
# 448 "follower/follower.c"
U8___2 const NXT_COLORSENSOR_PROTOCOLS[7] = { (U8___2 const )176, (U8___2 const )112, (U8___2 const )240, (U8___2 const )8,
        (U8___2 const )176, (U8___2 const )136, (U8___2 const )136};
# 450 "follower/follower.c"
extern StatusType TerminateTask(void) ;
# 451 "follower/follower.c"
extern StatusType GetResource(ResourceType resid ) ;
# 452 "follower/follower.c"
extern StatusType ReleaseResource(ResourceType resid ) ;
# 453 "follower/follower.c"
extern StatusType SetEvent(TaskType tskid , EventMaskType mask ) ;
# 454 "follower/follower.c"
extern StatusType ClearEvent(EventMaskType mask ) ;
# 455 "follower/follower.c"
extern StatusType WaitEvent(EventMaskType mask ) ;
# 456 "follower/follower.c"
static U8___3 open_bt_stream(void) ;
# 457 "follower/follower.c"
static SINT___0 connect_bt_slave(CHAR___0 const *pin ) ;
# 458 "follower/follower.c"
static unsigned char bt_status = (U8___3 )4;
# 459 "follower/follower.c"
static U8___3 receiveBuf[128] ;
# 460 "follower/follower.c"
extern TaskType const SpeedTask ;
# 461 "follower/follower.c"
extern TaskType const BrakeTask ;
# 462 "follower/follower.c"
extern EventMaskType const TouchSensorOnEvent ;
# 463 "follower/follower.c"
extern EventMaskType const event1 ;
# 464 "follower/follower.c"
extern EventMaskType const event2 ;
# 465 "follower/follower.c"
extern ResourceType R1 ;
# 466 "follower/follower.c"
int Current_speed = 55;
# 467 "follower/follower.c"
int LR_Way = 0;
# 468 "follower/follower.c"
int Slow_brake = 0;
# 469 "follower/follower.c"
int Motor_Run = 0;
# 470 "follower/follower.c"
int Pre_Order = 0;
# 471 "follower/follower.c"
int Brake ;
# 472 "follower/follower.c"
int Steering ;
# 473 "follower/follower.c"
int Sonar_1 = 0;
# 474 "follower/follower.c"
int Sonar_2 = 0;
# 475 "follower/follower.c"
int Sonar_Check_1 = 2;
# 476 "follower/follower.c"
int Sonar_check_2 = 2;
# 477 "follower/follower.c"
int Actual_Sonar_Num_1 = 0;
# 478 "follower/follower.c"
int Actual_Sonar_Num_2 = 0;
# 479 "follower/follower.c"
int Speed_H = 75;
# 480 "follower/follower.c"
int Speed_L = 55;
# 481 "follower/follower.c"
int Active_Only_One_Sonar = 0;
# 482 "follower/follower.c"
int Terminate_Check = 1601;
# 483 "follower/follower.c"
extern void Motor_Run_Fun(U8___3 buf ) ;
# 484 "follower/follower.c"
static U8___3 bt_receive_buf[32] ;
# 485 "follower/follower.c"
void TaskMainEventDispatcher(void) ;
# 487 "follower/follower.c"
void TaskMainEventDispatcher(void)
{
  int temp ;
  float err ;
  int tmp ;
  int temp_1 ;
  U8___3 *buf6 ;
  U32___4 bufLen7 ;
  SINT___0 i8 ;
  U32___4 len9 ;
  U32___2 n9 ;
  int speed_percent10 ;
  int brake11 ;
  U32___2 n12 ;
  int speed_percent13 ;
  int brake14 ;
  U32___2 n15 ;
  int speed_percent16 ;
  int brake17 ;
  U32___2 n18 ;
  int speed_percent19 ;
  int brake20 ;
  U32___2 n21 ;
  int speed_percent22 ;
  int brake23 ;
  U32___2 n24 ;
  int speed_percent25 ;
  int brake26 ;
  U32___2 n27 ;
  int speed_percent28 ;
  int brake29 ;
  U32___2 n30 ;
  int speed_percent31 ;
  int brake32 ;
  U32___2 n33 ;
  int speed_percent34 ;
  int brake35 ;
  U32___2 n36 ;
  int speed_percent37 ;
  int brake38 ;
  U32___2 n39 ;
  int speed_percent40 ;
  int brake41 ;
  U32___2 n42 ;
  int ret_nxt_motor_get_count43 ;
  U32___1 n44 ;
  int power_percent45 ;
  int brake46 ;
  U32___1 n47 ;
  int power_percent48 ;
  int brake49 ;
  U32___1 n50 ;
  int power_percent51 ;
  int brake52 ;
  U32___1 n53 ;
  int power_percent54 ;
  int brake55 ;
  U32___1 n56 ;
  int power_percent57 ;
  int brake58 ;
  U32___1 n59 ;
  int power_percent60 ;
  int brake61 ;
  U32___1 n62 ;
  int power_percent63 ;
  int brake64 ;
  U32___1 n65 ;
  int power_percent66 ;
  int brake67 ;
  U32___1 n68 ;
  int power_percent69 ;
  int brake70 ;
  U32___1 n71 ;
  int power_percent72 ;
  int brake73 ;
  U32___1 n74 ;
  int power_percent75 ;
  int brake76 ;

  {
# 567 "follower/follower.c"
  buf6 = bt_receive_buf;
# 568 "follower/follower.c"
  bufLen7 = (U32___4 )32;
# 569 "follower/follower.c"
  if ((int )bt_status == 7) {
# 570 "follower/follower.c"
    if (bufLen7 <= 126UL) {
# 571 "follower/follower.c"
      bt_receive(& receiveBuf[0]);
# 572 "follower/follower.c"
      len9 = (U32___4 )receiveBuf[0];
# 573 "follower/follower.c"
      if (len9 > 0UL) {
# 574 "follower/follower.c"
        if (len9 <= bufLen7) {
# 575 "follower/follower.c"
          i8 = 0;
# 576 "follower/follower.c"
          while ((U32___4 )i8 < len9) {
# 577 "follower/follower.c"
            *(buf6 + i8) = receiveBuf[i8 + 2];
# 578 "follower/follower.c"
            i8 ++;
          }
# 580 "follower/follower.c"
          goto Lret_ecrobot_read_bt_packet;
        }
      }
    }
  }
# 585 "follower/follower.c"
  goto Lret_ecrobot_read_bt_packet;
  Lret_ecrobot_read_bt_packet: ;
# 587 "follower/follower.c"
  if (Actual_Sonar_Num_1 - Actual_Sonar_Num_2 > 3) {
# 588 "follower/follower.c"
    bt_receive_buf[4] = (U8___3 )3;
  } else
# 590 "follower/follower.c"
  if (Actual_Sonar_Num_1 == 100) {
# 591 "follower/follower.c"
    if (Actual_Sonar_Num_2 < 50) {
# 592 "follower/follower.c"
      bt_receive_buf[4] = (U8___3 )3;
    } else {
# 594 "follower/follower.c"
      goto _L___0;
    }
  } else
  _L___0:
# 598 "follower/follower.c"
  if (Actual_Sonar_Num_2 - Actual_Sonar_Num_1 > 3) {
# 599 "follower/follower.c"
    bt_receive_buf[4] = (U8___3 )4;
  } else
# 601 "follower/follower.c"
  if (Actual_Sonar_Num_2 == 100) {
# 602 "follower/follower.c"
    if (Actual_Sonar_Num_1 < 50) {
# 603 "follower/follower.c"
      bt_receive_buf[4] = (U8___3 )4;
    } else {
# 605 "follower/follower.c"
      goto _L;
    }
  } else
  _L:
# 609 "follower/follower.c"
  if (Actual_Sonar_Num_2 < 50) {
# 610 "follower/follower.c"
    if (Actual_Sonar_Num_1 < 50) {
# 611 "follower/follower.c"
      bt_receive_buf[4] = (U8___3 )0;
    }
  }
# 614 "follower/follower.c"
  if (Actual_Sonar_Num_1 < 50) {
# 615 "follower/follower.c"
    if (Actual_Sonar_Num_2 < 50) {
# 616 "follower/follower.c"
      if ((Actual_Sonar_Num_1 + Actual_Sonar_Num_2) / 2 < 26) {
# 617 "follower/follower.c"
        if ((Actual_Sonar_Num_1 + Actual_Sonar_Num_2) / 2 > 20) {
# 618 "follower/follower.c"
          Current_speed = Speed_L;
# 619 "follower/follower.c"
          Motor_Run = 1;
# 620 "follower/follower.c"
          bt_receive_buf[3] = (U8___3 )1;
        } else {
# 622 "follower/follower.c"
          goto _L___1;
        }
      } else
      _L___1:
# 626 "follower/follower.c"
      if ((Actual_Sonar_Num_1 + Actual_Sonar_Num_2) / 2 >= 26) {
# 627 "follower/follower.c"
        Current_speed = Speed_H;
# 628 "follower/follower.c"
        Motor_Run = 1;
# 629 "follower/follower.c"
        bt_receive_buf[3] = (U8___3 )1;
      } else {
# 631 "follower/follower.c"
        Current_speed = 0;
# 632 "follower/follower.c"
        Motor_Run = 0;
# 633 "follower/follower.c"
        n9 = (U32___4 )1;
# 634 "follower/follower.c"
        speed_percent10 = 0;
# 635 "follower/follower.c"
        brake11 = 1;
# 636 "follower/follower.c"
        if (n9 < 3UL) {
# 637 "follower/follower.c"
          if (speed_percent10 > 100) {
# 638 "follower/follower.c"
            speed_percent10 = 100;
          }
# 640 "follower/follower.c"
          if (speed_percent10 < -100) {
# 641 "follower/follower.c"
            speed_percent10 = -100;
          }
# 643 "follower/follower.c"
          motor[n9].speed_percent = speed_percent10;
# 644 "follower/follower.c"
          n44 = n9;
# 645 "follower/follower.c"
          power_percent45 = speed_percent10;
# 646 "follower/follower.c"
          brake46 = brake11;
# 647 "follower/follower.c"
          if (n44 < 3UL) {
# 648 "follower/follower.c"
            io_to_avr.output_percent[n44] = (S8___0 )power_percent45;
# 649 "follower/follower.c"
            if (brake46) {
# 650 "follower/follower.c"
              io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n44));
            } else {
# 652 "follower/follower.c"
              io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n44));
            }
          }
# 655 "follower/follower.c"
          goto Lret_nxt_avr_set_motor;
          Lret_nxt_avr_set_motor: ;
        }
# 658 "follower/follower.c"
        goto Lret_nxt_motor_set_speed;
        Lret_nxt_motor_set_speed:
# 660 "follower/follower.c"
        n12 = (U32___4 )2;
# 661 "follower/follower.c"
        speed_percent13 = 0;
# 662 "follower/follower.c"
        brake14 = 1;
# 663 "follower/follower.c"
        if (n12 < 3UL) {
# 664 "follower/follower.c"
          if (speed_percent13 > 100) {
# 665 "follower/follower.c"
            speed_percent13 = 100;
          }
# 667 "follower/follower.c"
          if (speed_percent13 < -100) {
# 668 "follower/follower.c"
            speed_percent13 = -100;
          }
# 670 "follower/follower.c"
          motor[n12].speed_percent = speed_percent13;
# 671 "follower/follower.c"
          n47 = n12;
# 672 "follower/follower.c"
          power_percent48 = speed_percent13;
# 673 "follower/follower.c"
          brake49 = brake14;
# 674 "follower/follower.c"
          if (n47 < 3UL) {
# 675 "follower/follower.c"
            io_to_avr.output_percent[n47] = (S8___0 )power_percent48;
# 676 "follower/follower.c"
            if (brake49) {
# 677 "follower/follower.c"
              io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n47));
            } else {
# 679 "follower/follower.c"
              io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n47));
            }
          }
# 682 "follower/follower.c"
          goto Lret_nxt_avr_set_motor___0;
          Lret_nxt_avr_set_motor___0: ;
        }
# 685 "follower/follower.c"
        goto Lret_nxt_motor_set_speed___0;
        Lret_nxt_motor_set_speed___0:
# 687 "follower/follower.c"
        bt_receive_buf[3] = (U8___3 )0;
      }
# 689 "follower/follower.c"
      Terminate_Check = 0;
    } else {
# 691 "follower/follower.c"
      goto _L___2;
    }
  } else
  _L___2:
# 695 "follower/follower.c"
  if (Actual_Sonar_Num_1 < 50) {
# 696 "follower/follower.c"
    Current_speed = Speed_L;
# 697 "follower/follower.c"
    Motor_Run = 1;
# 698 "follower/follower.c"
    bt_receive_buf[3] = (U8___3 )1;
# 699 "follower/follower.c"
    Terminate_Check = 0;
  } else
# 701 "follower/follower.c"
  if (Actual_Sonar_Num_2 < 50) {
# 702 "follower/follower.c"
    Current_speed = Speed_L;
# 703 "follower/follower.c"
    Motor_Run = 1;
# 704 "follower/follower.c"
    bt_receive_buf[3] = (U8___3 )1;
# 705 "follower/follower.c"
    Terminate_Check = 0;
  } else {
# 707 "follower/follower.c"
    Terminate_Check ++;
# 708 "follower/follower.c"
    if (Terminate_Check == 700) {
# 709 "follower/follower.c"
      Current_speed = 0;
# 710 "follower/follower.c"
      Motor_Run = 0;
# 711 "follower/follower.c"
      n15 = (U32___4 )1;
# 712 "follower/follower.c"
      speed_percent16 = 0;
# 713 "follower/follower.c"
      brake17 = 1;
# 714 "follower/follower.c"
      if (n15 < 3UL) {
# 715 "follower/follower.c"
        if (speed_percent16 > 100) {
# 716 "follower/follower.c"
          speed_percent16 = 100;
        }
# 718 "follower/follower.c"
        if (speed_percent16 < -100) {
# 719 "follower/follower.c"
          speed_percent16 = -100;
        }
# 721 "follower/follower.c"
        motor[n15].speed_percent = speed_percent16;
# 722 "follower/follower.c"
        n50 = n15;
# 723 "follower/follower.c"
        power_percent51 = speed_percent16;
# 724 "follower/follower.c"
        brake52 = brake17;
# 725 "follower/follower.c"
        if (n50 < 3UL) {
# 726 "follower/follower.c"
          io_to_avr.output_percent[n50] = (S8___0 )power_percent51;
# 727 "follower/follower.c"
          if (brake52) {
# 728 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n50));
          } else {
# 730 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n50));
          }
        }
# 733 "follower/follower.c"
        goto Lret_nxt_avr_set_motor___1;
        Lret_nxt_avr_set_motor___1: ;
      }
# 736 "follower/follower.c"
      goto Lret_nxt_motor_set_speed___1;
      Lret_nxt_motor_set_speed___1:
# 738 "follower/follower.c"
      n18 = (U32___4 )2;
# 739 "follower/follower.c"
      speed_percent19 = 0;
# 740 "follower/follower.c"
      brake20 = 1;
# 741 "follower/follower.c"
      if (n18 < 3UL) {
# 742 "follower/follower.c"
        if (speed_percent19 > 100) {
# 743 "follower/follower.c"
          speed_percent19 = 100;
        }
# 745 "follower/follower.c"
        if (speed_percent19 < -100) {
# 746 "follower/follower.c"
          speed_percent19 = -100;
        }
# 748 "follower/follower.c"
        motor[n18].speed_percent = speed_percent19;
# 749 "follower/follower.c"
        n53 = n18;
# 750 "follower/follower.c"
        power_percent54 = speed_percent19;
# 751 "follower/follower.c"
        brake55 = brake20;
# 752 "follower/follower.c"
        if (n53 < 3UL) {
# 753 "follower/follower.c"
          io_to_avr.output_percent[n53] = (S8___0 )power_percent54;
# 754 "follower/follower.c"
          if (brake55) {
# 755 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n53));
          } else {
# 757 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n53));
          }
        }
# 760 "follower/follower.c"
        goto Lret_nxt_avr_set_motor___2;
        Lret_nxt_avr_set_motor___2: ;
      }
# 763 "follower/follower.c"
      goto Lret_nxt_motor_set_speed___2;
      Lret_nxt_motor_set_speed___2:
# 765 "follower/follower.c"
      bt_receive_buf[3] = (U8___3 )0;
# 766 "follower/follower.c"
      ecrobot_sound_tone((U32___4 )1500, (U32___4 )80, (U32___4 )80);
    }
  }
# 769 "follower/follower.c"
  temp = Pre_Order;
# 770 "follower/follower.c"
  if ((int )bt_receive_buf[3] == 1) {
# 771 "follower/follower.c"
    temp = (int )bt_receive_buf[3];
  } else
# 773 "follower/follower.c"
  if ((int )bt_receive_buf[3] == 2) {
# 774 "follower/follower.c"
    temp = (int )bt_receive_buf[3];
  }
# 776 "follower/follower.c"
  if (temp != Pre_Order) {
# 777 "follower/follower.c"
    if ((int )bt_receive_buf[4] != 3) {
# 778 "follower/follower.c"
      if ((int )bt_receive_buf[4] != 4) {
# 779 "follower/follower.c"
        if (LR_Way != 100) {
# 780 "follower/follower.c"
          if (LR_Way != -100) {
# 781 "follower/follower.c"
            Motor_Run = 1;
          }
        }
      }
    }
  }
# 787 "follower/follower.c"
  if ((int )bt_receive_buf[4] == 3) {
# 788 "follower/follower.c"
    LR_Way = -100;
  } else
# 790 "follower/follower.c"
  if ((int )bt_receive_buf[4] == 4) {
# 791 "follower/follower.c"
    LR_Way = 100;
  } else {
# 793 "follower/follower.c"
    LR_Way = 0;
  }
# 795 "follower/follower.c"
  n42 = (U32___4 )0;
# 796 "follower/follower.c"
  if (n42 < 3UL) {
# 797 "follower/follower.c"
    ret_nxt_motor_get_count43 = motor[n42].current_count;
# 798 "follower/follower.c"
    goto Lret_nxt_motor_get_count;
  } else {
# 800 "follower/follower.c"
    ret_nxt_motor_get_count43 = 0;
# 801 "follower/follower.c"
    goto Lret_nxt_motor_get_count;
  }
  Lret_nxt_motor_get_count:
# 804 "follower/follower.c"
  tmp = ret_nxt_motor_get_count43;
# 805 "follower/follower.c"
  err = (float )((50 * LR_Way) / 100 - tmp);
# 806 "follower/follower.c"
  if (err > (float )0) {
# 807 "follower/follower.c"
    n21 = (U32___4 )0;
# 808 "follower/follower.c"
    speed_percent22 = (int )(err / (float )2 + (float )10);
# 809 "follower/follower.c"
    brake23 = 1;
# 810 "follower/follower.c"
    if (n21 < 3UL) {
# 811 "follower/follower.c"
      if (speed_percent22 > 100) {
# 812 "follower/follower.c"
        speed_percent22 = 100;
      }
# 814 "follower/follower.c"
      if (speed_percent22 < -100) {
# 815 "follower/follower.c"
        speed_percent22 = -100;
      }
# 817 "follower/follower.c"
      motor[n21].speed_percent = speed_percent22;
# 818 "follower/follower.c"
      n56 = n21;
# 819 "follower/follower.c"
      power_percent57 = speed_percent22;
# 820 "follower/follower.c"
      brake58 = brake23;
# 821 "follower/follower.c"
      if (n56 < 3UL) {
# 822 "follower/follower.c"
        io_to_avr.output_percent[n56] = (S8___0 )power_percent57;
# 823 "follower/follower.c"
        if (brake58) {
# 824 "follower/follower.c"
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n56));
        } else {
# 826 "follower/follower.c"
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n56));
        }
      }
# 829 "follower/follower.c"
      goto Lret_nxt_avr_set_motor___3;
      Lret_nxt_avr_set_motor___3: ;
    }
# 832 "follower/follower.c"
    goto Lret_nxt_motor_set_speed___3;
    Lret_nxt_motor_set_speed___3: ;
  } else
# 835 "follower/follower.c"
  if (err < (float )0) {
# 836 "follower/follower.c"
    n24 = (U32___4 )0;
# 837 "follower/follower.c"
    speed_percent25 = (int )(err / (float )2 - (float )10);
# 838 "follower/follower.c"
    brake26 = 1;
# 839 "follower/follower.c"
    if (n24 < 3UL) {
# 840 "follower/follower.c"
      if (speed_percent25 > 100) {
# 841 "follower/follower.c"
        speed_percent25 = 100;
      }
# 843 "follower/follower.c"
      if (speed_percent25 < -100) {
# 844 "follower/follower.c"
        speed_percent25 = -100;
      }
# 846 "follower/follower.c"
      motor[n24].speed_percent = speed_percent25;
# 847 "follower/follower.c"
      n59 = n24;
# 848 "follower/follower.c"
      power_percent60 = speed_percent25;
# 849 "follower/follower.c"
      brake61 = brake26;
# 850 "follower/follower.c"
      if (n59 < 3UL) {
# 851 "follower/follower.c"
        io_to_avr.output_percent[n59] = (S8___0 )power_percent60;
# 852 "follower/follower.c"
        if (brake61) {
# 853 "follower/follower.c"
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n59));
        } else {
# 855 "follower/follower.c"
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n59));
        }
      }
# 858 "follower/follower.c"
      goto Lret_nxt_avr_set_motor___4;
      Lret_nxt_avr_set_motor___4: ;
    }
# 861 "follower/follower.c"
    goto Lret_nxt_motor_set_speed___4;
    Lret_nxt_motor_set_speed___4: ;
  } else {
# 864 "follower/follower.c"
    n27 = (U32___4 )0;
# 865 "follower/follower.c"
    speed_percent28 = 0;
# 866 "follower/follower.c"
    brake29 = 1;
# 867 "follower/follower.c"
    if (n27 < 3UL) {
# 868 "follower/follower.c"
      if (speed_percent28 > 100) {
# 869 "follower/follower.c"
        speed_percent28 = 100;
      }
# 871 "follower/follower.c"
      if (speed_percent28 < -100) {
# 872 "follower/follower.c"
        speed_percent28 = -100;
      }
# 874 "follower/follower.c"
      motor[n27].speed_percent = speed_percent28;
# 875 "follower/follower.c"
      n62 = n27;
# 876 "follower/follower.c"
      power_percent63 = speed_percent28;
# 877 "follower/follower.c"
      brake64 = brake29;
# 878 "follower/follower.c"
      if (n62 < 3UL) {
# 879 "follower/follower.c"
        io_to_avr.output_percent[n62] = (S8___0 )power_percent63;
# 880 "follower/follower.c"
        if (brake64) {
# 881 "follower/follower.c"
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n62));
        } else {
# 883 "follower/follower.c"
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n62));
        }
      }
# 886 "follower/follower.c"
      goto Lret_nxt_avr_set_motor___5;
      Lret_nxt_avr_set_motor___5: ;
    }
# 889 "follower/follower.c"
    goto Lret_nxt_motor_set_speed___5;
    Lret_nxt_motor_set_speed___5: ;
  }
# 892 "follower/follower.c"
  if ((int )bt_receive_buf[5] == 1) {
# 893 "follower/follower.c"
    if (Current_speed != Speed_H) {
# 894 "follower/follower.c"
      Motor_Run = 1;
# 895 "follower/follower.c"
      SetEvent((TaskType )SpeedTask, (EventMaskType )event1);
    }
  } else
# 898 "follower/follower.c"
  if ((int )bt_receive_buf[5] == 2) {
# 899 "follower/follower.c"
    if (Current_speed != Speed_L) {
# 900 "follower/follower.c"
      Motor_Run = 1;
# 901 "follower/follower.c"
      SetEvent((TaskType )SpeedTask, (EventMaskType )event1);
    }
  }
# 904 "follower/follower.c"
  if (Slow_brake > 0) {
# 905 "follower/follower.c"
    if (Current_speed == Speed_H) {
# 906 "follower/follower.c"
      temp_1 = ((Speed_H * 2 + 1) - Slow_brake) / 2;
    }
# 908 "follower/follower.c"
    if (Current_speed == Speed_L) {
# 909 "follower/follower.c"
      temp_1 = ((Speed_L * 2 + 1) - Slow_brake) / 2;
    }
# 911 "follower/follower.c"
    if ((int )bt_receive_buf[3] == 1) {
# 912 "follower/follower.c"
      n30 = (U32___4 )1;
# 913 "follower/follower.c"
      speed_percent31 = - Current_speed + temp_1;
# 914 "follower/follower.c"
      brake32 = 1;
# 915 "follower/follower.c"
      if (n30 < 3UL) {
# 916 "follower/follower.c"
        if (speed_percent31 > 100) {
# 917 "follower/follower.c"
          speed_percent31 = 100;
        }
# 919 "follower/follower.c"
        if (speed_percent31 < -100) {
# 920 "follower/follower.c"
          speed_percent31 = -100;
        }
# 922 "follower/follower.c"
        motor[n30].speed_percent = speed_percent31;
# 923 "follower/follower.c"
        n65 = n30;
# 924 "follower/follower.c"
        power_percent66 = speed_percent31;
# 925 "follower/follower.c"
        brake67 = brake32;
# 926 "follower/follower.c"
        if (n65 < 3UL) {
# 927 "follower/follower.c"
          io_to_avr.output_percent[n65] = (S8___0 )power_percent66;
# 928 "follower/follower.c"
          if (brake67) {
# 929 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n65));
          } else {
# 931 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n65));
          }
        }
# 934 "follower/follower.c"
        goto Lret_nxt_avr_set_motor___6;
        Lret_nxt_avr_set_motor___6: ;
      }
# 937 "follower/follower.c"
      goto Lret_nxt_motor_set_speed___6;
      Lret_nxt_motor_set_speed___6:
# 939 "follower/follower.c"
      n33 = (U32___4 )2;
# 940 "follower/follower.c"
      speed_percent34 = - Current_speed + temp_1;
# 941 "follower/follower.c"
      brake35 = 1;
# 942 "follower/follower.c"
      if (n33 < 3UL) {
# 943 "follower/follower.c"
        if (speed_percent34 > 100) {
# 944 "follower/follower.c"
          speed_percent34 = 100;
        }
# 946 "follower/follower.c"
        if (speed_percent34 < -100) {
# 947 "follower/follower.c"
          speed_percent34 = -100;
        }
# 949 "follower/follower.c"
        motor[n33].speed_percent = speed_percent34;
# 950 "follower/follower.c"
        n68 = n33;
# 951 "follower/follower.c"
        power_percent69 = speed_percent34;
# 952 "follower/follower.c"
        brake70 = brake35;
# 953 "follower/follower.c"
        if (n68 < 3UL) {
# 954 "follower/follower.c"
          io_to_avr.output_percent[n68] = (S8___0 )power_percent69;
# 955 "follower/follower.c"
          if (brake70) {
# 956 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n68));
          } else {
# 958 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n68));
          }
        }
# 961 "follower/follower.c"
        goto Lret_nxt_avr_set_motor___7;
        Lret_nxt_avr_set_motor___7: ;
      }
# 964 "follower/follower.c"
      goto Lret_nxt_motor_set_speed___7;
      Lret_nxt_motor_set_speed___7: ;
    }
# 967 "follower/follower.c"
    if ((int )bt_receive_buf[3] == 2) {
# 968 "follower/follower.c"
      n36 = (U32___4 )1;
# 969 "follower/follower.c"
      speed_percent37 = Current_speed - temp_1;
# 970 "follower/follower.c"
      brake38 = 1;
# 971 "follower/follower.c"
      if (n36 < 3UL) {
# 972 "follower/follower.c"
        if (speed_percent37 > 100) {
# 973 "follower/follower.c"
          speed_percent37 = 100;
        }
# 975 "follower/follower.c"
        if (speed_percent37 < -100) {
# 976 "follower/follower.c"
          speed_percent37 = -100;
        }
# 978 "follower/follower.c"
        motor[n36].speed_percent = speed_percent37;
# 979 "follower/follower.c"
        n71 = n36;
# 980 "follower/follower.c"
        power_percent72 = speed_percent37;
# 981 "follower/follower.c"
        brake73 = brake38;
# 982 "follower/follower.c"
        if (n71 < 3UL) {
# 983 "follower/follower.c"
          io_to_avr.output_percent[n71] = (S8___0 )power_percent72;
# 984 "follower/follower.c"
          if (brake73) {
# 985 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n71));
          } else {
# 987 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n71));
          }
        }
# 990 "follower/follower.c"
        goto Lret_nxt_avr_set_motor___8;
        Lret_nxt_avr_set_motor___8: ;
      }
# 993 "follower/follower.c"
      goto Lret_nxt_motor_set_speed___8;
      Lret_nxt_motor_set_speed___8:
# 995 "follower/follower.c"
      n39 = (U32___4 )2;
# 996 "follower/follower.c"
      speed_percent40 = Current_speed - temp_1;
# 997 "follower/follower.c"
      brake41 = 1;
# 998 "follower/follower.c"
      if (n39 < 3UL) {
# 999 "follower/follower.c"
        if (speed_percent40 > 100) {
# 1000 "follower/follower.c"
          speed_percent40 = 100;
        }
# 1002 "follower/follower.c"
        if (speed_percent40 < -100) {
# 1003 "follower/follower.c"
          speed_percent40 = -100;
        }
# 1005 "follower/follower.c"
        motor[n39].speed_percent = speed_percent40;
# 1006 "follower/follower.c"
        n74 = n39;
# 1007 "follower/follower.c"
        power_percent75 = speed_percent40;
# 1008 "follower/follower.c"
        brake76 = brake41;
# 1009 "follower/follower.c"
        if (n74 < 3UL) {
# 1010 "follower/follower.c"
          io_to_avr.output_percent[n74] = (S8___0 )power_percent75;
# 1011 "follower/follower.c"
          if (brake76) {
# 1012 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n74));
          } else {
# 1014 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n74));
          }
        }
# 1017 "follower/follower.c"
        goto Lret_nxt_avr_set_motor___9;
        Lret_nxt_avr_set_motor___9: ;
      }
# 1020 "follower/follower.c"
      goto Lret_nxt_motor_set_speed___9;
      Lret_nxt_motor_set_speed___9: ;
    }
# 1023 "follower/follower.c"
    Slow_brake --;
# 1024 "follower/follower.c"
    Motor_Run = 0;
  } else
# 1026 "follower/follower.c"
  if ((int )bt_receive_buf[6] == 1) {
# 1027 "follower/follower.c"
    goto _L___4;
  } else
# 1029 "follower/follower.c"
  if ((int )bt_receive_buf[6] == 2) {
    _L___4:
# 1031 "follower/follower.c"
    if ((int )bt_receive_buf[7] == 1) {
# 1032 "follower/follower.c"
      Brake = (int )bt_receive_buf[6];
# 1033 "follower/follower.c"
      SetEvent((TaskType )BrakeTask, (EventMaskType )event2);
    } else {
# 1035 "follower/follower.c"
      goto _L___3;
    }
  } else
  _L___3:
# 1039 "follower/follower.c"
  if (Motor_Run == 1) {
# 1040 "follower/follower.c"
    Motor_Run_Fun(bt_receive_buf[3]);
# 1041 "follower/follower.c"
    if ((int )bt_receive_buf[3] == 1) {
# 1042 "follower/follower.c"
      Pre_Order = (int )bt_receive_buf[3];
    } else
# 1044 "follower/follower.c"
    if ((int )bt_receive_buf[3] == 2) {
# 1045 "follower/follower.c"
      Pre_Order = (int )bt_receive_buf[3];
    }
  }
# 1048 "follower/follower.c"
  TerminateTask();
# 1049 "follower/follower.c"
  return;
}
}
# 1053 "follower/follower.c"
static U8___3 bt_send_buf[32] ;
# 1055 "follower/follower.c"
void TaskMainEventHandler(void)
{


  {
# 1060 "follower/follower.c"
  while (true) {
# 1061 "follower/follower.c"
    WaitEvent((EventMaskType )TouchSensorOnEvent);
# 1062 "follower/follower.c"
    ClearEvent((EventMaskType )TouchSensorOnEvent);
# 1063 "follower/follower.c"
    bt_send_buf[0] = (U8___3 )1;
# 1064 "follower/follower.c"
    ecrobot_send_bt_packet(bt_send_buf, (U32___4 )32);
# 1065 "follower/follower.c"
    bt_send_buf[0] = (U8___3 )0;
# 1066 "follower/follower.c"
    ecrobot_send_bt_packet(bt_send_buf, (U32___4 )32);
  }
# 1068 "follower/follower.c"
  TerminateTask();
# 1070 "follower/follower.c"
  return;
}
}
# 1071 "follower/follower.c"
void TaskMainInitialize(void)
{
  int Count_temp ;
  int Right_Count ;
  int Left_Count ;
  int temp ;
  int tmp ;
  int tmp___0 ;
  int tmp___1 ;
  int tmp___2 ;
  U32___2 n9 ;
  int speed_percent10 ;
  int brake11 ;
  U32___2 n12 ;
  int speed_percent13 ;
  int brake14 ;
  U32___2 n15 ;
  int speed_percent16 ;
  int brake17 ;
  U32___2 n18 ;
  int speed_percent19 ;
  int brake20 ;
  U32___2 n21 ;
  int speed_percent22 ;
  int brake23 ;
  U32___2 n24 ;
  int speed_percent25 ;
  int brake26 ;
  U32___2 n27 ;
  int speed_percent28 ;
  int brake29 ;
  U32___2 n30 ;
  int speed_percent31 ;
  int brake32 ;
  U32___2 n33 ;
  int speed_percent34 ;
  int brake35 ;
  U32___2 n36 ;
  int speed_percent37 ;
  int brake38 ;
  U32___2 n39 ;
  int speed_percent40 ;
  int brake41 ;
  U32___2 n42 ;
  int speed_percent43 ;
  int brake44 ;
  U32___2 n45 ;
  int speed_percent46 ;
  int brake47 ;
  U32___2 n48 ;
  int speed_percent49 ;
  int brake50 ;
  U32___2 n51 ;
  int count52 ;
  U32___2 n53 ;
  int count54 ;
  U32___2 n55 ;
  int count56 ;
  U32___2 n57 ;
  int ret_nxt_motor_get_count58 ;
  U32___2 n59 ;
  int ret_nxt_motor_get_count60 ;
  U32___2 n61 ;
  int ret_nxt_motor_get_count62 ;
  U32___2 n63 ;
  int ret_nxt_motor_get_count64 ;
  U32___2 n65 ;
  int ret_nxt_motor_get_count66 ;
  U32___2 n67 ;
  int ret_nxt_motor_get_count68 ;
  U32___2 n69 ;
  int ret_nxt_motor_get_count70 ;
  U32___2 n71 ;
  int ret_nxt_motor_get_count72 ;
  U32___2 n73 ;
  int ret_nxt_motor_get_count74 ;
  U32___2 n75 ;
  int ret_nxt_motor_get_count76 ;
  U32___1 n77 ;
  int power_percent78 ;
  int brake79 ;
  U32___1 n80 ;
  int power_percent81 ;
  int brake82 ;
  U32___1 n83 ;
  int power_percent84 ;
  int brake85 ;
  U32___1 n86 ;
  int power_percent87 ;
  int brake88 ;
  U32___1 n89 ;
  int power_percent90 ;
  int brake91 ;
  U32___1 n92 ;
  int power_percent93 ;
  int brake94 ;
  U32___1 n95 ;
  int power_percent96 ;
  int brake97 ;
  U32___1 n98 ;
  int power_percent99 ;
  int brake100 ;
  U32___1 n101 ;
  int power_percent102 ;
  int brake103 ;
  U32___1 n104 ;
  int power_percent105 ;
  int brake106 ;
  U32___1 n107 ;
  int power_percent108 ;
  int brake109 ;
  U32___1 n110 ;
  int power_percent111 ;
  int brake112 ;
  U32___1 n113 ;
  int power_percent114 ;
  int brake115 ;
  U32___1 n116 ;
  int power_percent117 ;
  int brake118 ;

  {
# 1196 "follower/follower.c"
  GetResource(R1);
# 1197 "follower/follower.c"
  Count_temp = 0;
# 1198 "follower/follower.c"
  Right_Count = 0;
# 1199 "follower/follower.c"
  Left_Count = 0;
# 1200 "follower/follower.c"
  temp = 100;
# 1201 "follower/follower.c"
  n9 = (U32___4 )0;
# 1202 "follower/follower.c"
  speed_percent10 = 35;
# 1203 "follower/follower.c"
  brake11 = 1;
# 1204 "follower/follower.c"
  if (n9 < 3UL) {
# 1205 "follower/follower.c"
    if (speed_percent10 > 100) {
# 1206 "follower/follower.c"
      speed_percent10 = 100;
    }
# 1208 "follower/follower.c"
    if (speed_percent10 < -100) {
# 1209 "follower/follower.c"
      speed_percent10 = -100;
    }
# 1211 "follower/follower.c"
    motor[n9].speed_percent = speed_percent10;
# 1212 "follower/follower.c"
    n77 = n9;
# 1213 "follower/follower.c"
    power_percent78 = speed_percent10;
# 1214 "follower/follower.c"
    brake79 = brake11;
# 1215 "follower/follower.c"
    if (n77 < 3UL) {
# 1216 "follower/follower.c"
      io_to_avr.output_percent[n77] = (S8___0 )power_percent78;
# 1217 "follower/follower.c"
      if (brake79) {
# 1218 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n77));
      } else {
# 1220 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n77));
      }
    }
# 1223 "follower/follower.c"
    goto Lret_nxt_avr_set_motor;
    Lret_nxt_avr_set_motor: ;
  }
# 1226 "follower/follower.c"
  goto Lret_nxt_motor_set_speed;
  Lret_nxt_motor_set_speed: ;
# 1228 "follower/follower.c"
  while (true) {
# 1229 "follower/follower.c"
    n57 = (U32___4 )0;
# 1230 "follower/follower.c"
    if (n57 < 3UL) {
# 1231 "follower/follower.c"
      ret_nxt_motor_get_count58 = motor[n57].current_count;
# 1232 "follower/follower.c"
      goto Lret_nxt_motor_get_count;
    } else {
# 1234 "follower/follower.c"
      ret_nxt_motor_get_count58 = 0;
# 1235 "follower/follower.c"
      goto Lret_nxt_motor_get_count;
    }
    Lret_nxt_motor_get_count:
# 1238 "follower/follower.c"
    tmp = ret_nxt_motor_get_count58;
# 1239 "follower/follower.c"
    if (! (temp != tmp)) {
# 1240 "follower/follower.c"
      break;
    }
# 1242 "follower/follower.c"
    n59 = (U32___4 )0;
# 1243 "follower/follower.c"
    if (n59 < 3UL) {
# 1244 "follower/follower.c"
      ret_nxt_motor_get_count60 = motor[n59].current_count;
# 1245 "follower/follower.c"
      goto Lret_nxt_motor_get_count___0;
    } else {
# 1247 "follower/follower.c"
      ret_nxt_motor_get_count60 = 0;
# 1248 "follower/follower.c"
      goto Lret_nxt_motor_get_count___0;
    }
    Lret_nxt_motor_get_count___0:
# 1251 "follower/follower.c"
    temp = ret_nxt_motor_get_count60;
# 1252 "follower/follower.c"
    systick_wait_ms((U32___4 )50);
  }
# 1254 "follower/follower.c"
  n12 = (U32___4 )0;
# 1255 "follower/follower.c"
  speed_percent13 = 0;
# 1256 "follower/follower.c"
  brake14 = 1;
# 1257 "follower/follower.c"
  if (n12 < 3UL) {
# 1258 "follower/follower.c"
    if (speed_percent13 > 100) {
# 1259 "follower/follower.c"
      speed_percent13 = 100;
    }
# 1261 "follower/follower.c"
    if (speed_percent13 < -100) {
# 1262 "follower/follower.c"
      speed_percent13 = -100;
    }
# 1264 "follower/follower.c"
    motor[n12].speed_percent = speed_percent13;
# 1265 "follower/follower.c"
    n80 = n12;
# 1266 "follower/follower.c"
    power_percent81 = speed_percent13;
# 1267 "follower/follower.c"
    brake82 = brake14;
# 1268 "follower/follower.c"
    if (n80 < 3UL) {
# 1269 "follower/follower.c"
      io_to_avr.output_percent[n80] = (S8___0 )power_percent81;
# 1270 "follower/follower.c"
      if (brake82) {
# 1271 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n80));
      } else {
# 1273 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n80));
      }
    }
# 1276 "follower/follower.c"
    goto Lret_nxt_avr_set_motor___0;
    Lret_nxt_avr_set_motor___0: ;
  }
# 1279 "follower/follower.c"
  goto Lret_nxt_motor_set_speed___0;
  Lret_nxt_motor_set_speed___0:
# 1281 "follower/follower.c"
  n61 = (U32___4 )0;
# 1282 "follower/follower.c"
  if (n61 < 3UL) {
# 1283 "follower/follower.c"
    ret_nxt_motor_get_count62 = motor[n61].current_count;
# 1284 "follower/follower.c"
    goto Lret_nxt_motor_get_count___1;
  } else {
# 1286 "follower/follower.c"
    ret_nxt_motor_get_count62 = 0;
# 1287 "follower/follower.c"
    goto Lret_nxt_motor_get_count___1;
  }
  Lret_nxt_motor_get_count___1:
# 1290 "follower/follower.c"
  Right_Count = ret_nxt_motor_get_count62;
# 1291 "follower/follower.c"
  n15 = (U32___4 )0;
# 1292 "follower/follower.c"
  speed_percent16 = -35;
# 1293 "follower/follower.c"
  brake17 = 1;
# 1294 "follower/follower.c"
  if (n15 < 3UL) {
# 1295 "follower/follower.c"
    if (speed_percent16 > 100) {
# 1296 "follower/follower.c"
      speed_percent16 = 100;
    }
# 1298 "follower/follower.c"
    if (speed_percent16 < -100) {
# 1299 "follower/follower.c"
      speed_percent16 = -100;
    }
# 1301 "follower/follower.c"
    motor[n15].speed_percent = speed_percent16;
# 1302 "follower/follower.c"
    n83 = n15;
# 1303 "follower/follower.c"
    power_percent84 = speed_percent16;
# 1304 "follower/follower.c"
    brake85 = brake17;
# 1305 "follower/follower.c"
    if (n83 < 3UL) {
# 1306 "follower/follower.c"
      io_to_avr.output_percent[n83] = (S8___0 )power_percent84;
# 1307 "follower/follower.c"
      if (brake85) {
# 1308 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n83));
      } else {
# 1310 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n83));
      }
    }
# 1313 "follower/follower.c"
    goto Lret_nxt_avr_set_motor___1;
    Lret_nxt_avr_set_motor___1: ;
  }
# 1316 "follower/follower.c"
  goto Lret_nxt_motor_set_speed___1;
  Lret_nxt_motor_set_speed___1:
# 1318 "follower/follower.c"
  temp = 100;
# 1319 "follower/follower.c"
  while (true) {
# 1320 "follower/follower.c"
    n63 = (U32___4 )0;
# 1321 "follower/follower.c"
    if (n63 < 3UL) {
# 1322 "follower/follower.c"
      ret_nxt_motor_get_count64 = motor[n63].current_count;
# 1323 "follower/follower.c"
      goto Lret_nxt_motor_get_count___2;
    } else {
# 1325 "follower/follower.c"
      ret_nxt_motor_get_count64 = 0;
# 1326 "follower/follower.c"
      goto Lret_nxt_motor_get_count___2;
    }
    Lret_nxt_motor_get_count___2:
# 1329 "follower/follower.c"
    tmp___0 = ret_nxt_motor_get_count64;
# 1330 "follower/follower.c"
    if (! (temp != tmp___0)) {
# 1331 "follower/follower.c"
      break;
    }
# 1333 "follower/follower.c"
    n65 = (U32___4 )0;
# 1334 "follower/follower.c"
    if (n65 < 3UL) {
# 1335 "follower/follower.c"
      ret_nxt_motor_get_count66 = motor[n65].current_count;
# 1336 "follower/follower.c"
      goto Lret_nxt_motor_get_count___3;
    } else {
# 1338 "follower/follower.c"
      ret_nxt_motor_get_count66 = 0;
# 1339 "follower/follower.c"
      goto Lret_nxt_motor_get_count___3;
    }
    Lret_nxt_motor_get_count___3:
# 1342 "follower/follower.c"
    temp = ret_nxt_motor_get_count66;
# 1343 "follower/follower.c"
    systick_wait_ms((U32___4 )50);
  }
# 1345 "follower/follower.c"
  n18 = (U32___4 )0;
# 1346 "follower/follower.c"
  speed_percent19 = 0;
# 1347 "follower/follower.c"
  brake20 = 1;
# 1348 "follower/follower.c"
  if (n18 < 3UL) {
# 1349 "follower/follower.c"
    if (speed_percent19 > 100) {
# 1350 "follower/follower.c"
      speed_percent19 = 100;
    }
# 1352 "follower/follower.c"
    if (speed_percent19 < -100) {
# 1353 "follower/follower.c"
      speed_percent19 = -100;
    }
# 1355 "follower/follower.c"
    motor[n18].speed_percent = speed_percent19;
# 1356 "follower/follower.c"
    n86 = n18;
# 1357 "follower/follower.c"
    power_percent87 = speed_percent19;
# 1358 "follower/follower.c"
    brake88 = brake20;
# 1359 "follower/follower.c"
    if (n86 < 3UL) {
# 1360 "follower/follower.c"
      io_to_avr.output_percent[n86] = (S8___0 )power_percent87;
# 1361 "follower/follower.c"
      if (brake88) {
# 1362 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n86));
      } else {
# 1364 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n86));
      }
    }
# 1367 "follower/follower.c"
    goto Lret_nxt_avr_set_motor___2;
    Lret_nxt_avr_set_motor___2: ;
  }
# 1370 "follower/follower.c"
  goto Lret_nxt_motor_set_speed___2;
  Lret_nxt_motor_set_speed___2:
# 1372 "follower/follower.c"
  n67 = (U32___4 )0;
# 1373 "follower/follower.c"
  if (n67 < 3UL) {
# 1374 "follower/follower.c"
    ret_nxt_motor_get_count68 = motor[n67].current_count;
# 1375 "follower/follower.c"
    goto Lret_nxt_motor_get_count___4;
  } else {
# 1377 "follower/follower.c"
    ret_nxt_motor_get_count68 = 0;
# 1378 "follower/follower.c"
    goto Lret_nxt_motor_get_count___4;
  }
  Lret_nxt_motor_get_count___4:
# 1381 "follower/follower.c"
  Left_Count = ret_nxt_motor_get_count68;
# 1382 "follower/follower.c"
  Count_temp = (Right_Count - Left_Count) / 2 + Left_Count;
# 1383 "follower/follower.c"
  n21 = (U32___4 )0;
# 1384 "follower/follower.c"
  speed_percent22 = 35;
# 1385 "follower/follower.c"
  brake23 = 1;
# 1386 "follower/follower.c"
  if (n21 < 3UL) {
# 1387 "follower/follower.c"
    if (speed_percent22 > 100) {
# 1388 "follower/follower.c"
      speed_percent22 = 100;
    }
# 1390 "follower/follower.c"
    if (speed_percent22 < -100) {
# 1391 "follower/follower.c"
      speed_percent22 = -100;
    }
# 1393 "follower/follower.c"
    motor[n21].speed_percent = speed_percent22;
# 1394 "follower/follower.c"
    n89 = n21;
# 1395 "follower/follower.c"
    power_percent90 = speed_percent22;
# 1396 "follower/follower.c"
    brake91 = brake23;
# 1397 "follower/follower.c"
    if (n89 < 3UL) {
# 1398 "follower/follower.c"
      io_to_avr.output_percent[n89] = (S8___0 )power_percent90;
# 1399 "follower/follower.c"
      if (brake91) {
# 1400 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n89));
      } else {
# 1402 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n89));
      }
    }
# 1405 "follower/follower.c"
    goto Lret_nxt_avr_set_motor___3;
    Lret_nxt_avr_set_motor___3: ;
  }
# 1408 "follower/follower.c"
  goto Lret_nxt_motor_set_speed___3;
  Lret_nxt_motor_set_speed___3:
# 1410 "follower/follower.c"
  n69 = (U32___4 )0;
# 1411 "follower/follower.c"
  if (n69 < 3UL) {
# 1412 "follower/follower.c"
    ret_nxt_motor_get_count70 = motor[n69].current_count;
# 1413 "follower/follower.c"
    goto Lret_nxt_motor_get_count___5;
  } else {
# 1415 "follower/follower.c"
    ret_nxt_motor_get_count70 = 0;
# 1416 "follower/follower.c"
    goto Lret_nxt_motor_get_count___5;
  }
  Lret_nxt_motor_get_count___5:
# 1419 "follower/follower.c"
  temp = ret_nxt_motor_get_count70;
# 1420 "follower/follower.c"
  while (temp != Count_temp) {
# 1421 "follower/follower.c"
    n71 = (U32___4 )0;
# 1422 "follower/follower.c"
    if (n71 < 3UL) {
# 1423 "follower/follower.c"
      ret_nxt_motor_get_count72 = motor[n71].current_count;
# 1424 "follower/follower.c"
      goto Lret_nxt_motor_get_count___6;
    } else {
# 1426 "follower/follower.c"
      ret_nxt_motor_get_count72 = 0;
# 1427 "follower/follower.c"
      goto Lret_nxt_motor_get_count___6;
    }
    Lret_nxt_motor_get_count___6:
# 1430 "follower/follower.c"
    temp = ret_nxt_motor_get_count72;
  }
# 1432 "follower/follower.c"
  n24 = (U32___4 )0;
# 1433 "follower/follower.c"
  speed_percent25 = 0;
# 1434 "follower/follower.c"
  brake26 = 1;
# 1435 "follower/follower.c"
  if (n24 < 3UL) {
# 1436 "follower/follower.c"
    if (speed_percent25 > 100) {
# 1437 "follower/follower.c"
      speed_percent25 = 100;
    }
# 1439 "follower/follower.c"
    if (speed_percent25 < -100) {
# 1440 "follower/follower.c"
      speed_percent25 = -100;
    }
# 1442 "follower/follower.c"
    motor[n24].speed_percent = speed_percent25;
# 1443 "follower/follower.c"
    n92 = n24;
# 1444 "follower/follower.c"
    power_percent93 = speed_percent25;
# 1445 "follower/follower.c"
    brake94 = brake26;
# 1446 "follower/follower.c"
    if (n92 < 3UL) {
# 1447 "follower/follower.c"
      io_to_avr.output_percent[n92] = (S8___0 )power_percent93;
# 1448 "follower/follower.c"
      if (brake94) {
# 1449 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n92));
      } else {
# 1451 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n92));
      }
    }
# 1454 "follower/follower.c"
    goto Lret_nxt_avr_set_motor___4;
    Lret_nxt_avr_set_motor___4: ;
  }
# 1457 "follower/follower.c"
  goto Lret_nxt_motor_set_speed___4;
  Lret_nxt_motor_set_speed___4:
# 1459 "follower/follower.c"
  n51 = (U32___4 )0;
# 1460 "follower/follower.c"
  count52 = 0;
# 1461 "follower/follower.c"
  if (n51 < 3UL) {
# 1462 "follower/follower.c"
    motor[n51].current_count = count52;
  }
# 1464 "follower/follower.c"
  goto Lret_nxt_motor_set_count;
  Lret_nxt_motor_set_count:
# 1466 "follower/follower.c"
  n27 = (U32___4 )1;
# 1467 "follower/follower.c"
  speed_percent28 = 0;
# 1468 "follower/follower.c"
  brake29 = 1;
# 1469 "follower/follower.c"
  if (n27 < 3UL) {
# 1470 "follower/follower.c"
    if (speed_percent28 > 100) {
# 1471 "follower/follower.c"
      speed_percent28 = 100;
    }
# 1473 "follower/follower.c"
    if (speed_percent28 < -100) {
# 1474 "follower/follower.c"
      speed_percent28 = -100;
    }
# 1476 "follower/follower.c"
    motor[n27].speed_percent = speed_percent28;
# 1477 "follower/follower.c"
    n95 = n27;
# 1478 "follower/follower.c"
    power_percent96 = speed_percent28;
# 1479 "follower/follower.c"
    brake97 = brake29;
# 1480 "follower/follower.c"
    if (n95 < 3UL) {
# 1481 "follower/follower.c"
      io_to_avr.output_percent[n95] = (S8___0 )power_percent96;
# 1482 "follower/follower.c"
      if (brake97) {
# 1483 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n95));
      } else {
# 1485 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n95));
      }
    }
# 1488 "follower/follower.c"
    goto Lret_nxt_avr_set_motor___5;
    Lret_nxt_avr_set_motor___5: ;
  }
# 1491 "follower/follower.c"
  goto Lret_nxt_motor_set_speed___5;
  Lret_nxt_motor_set_speed___5:
# 1493 "follower/follower.c"
  n30 = (U32___4 )2;
# 1494 "follower/follower.c"
  speed_percent31 = 0;
# 1495 "follower/follower.c"
  brake32 = 1;
# 1496 "follower/follower.c"
  if (n30 < 3UL) {
# 1497 "follower/follower.c"
    if (speed_percent31 > 100) {
# 1498 "follower/follower.c"
      speed_percent31 = 100;
    }
# 1500 "follower/follower.c"
    if (speed_percent31 < -100) {
# 1501 "follower/follower.c"
      speed_percent31 = -100;
    }
# 1503 "follower/follower.c"
    motor[n30].speed_percent = speed_percent31;
# 1504 "follower/follower.c"
    n98 = n30;
# 1505 "follower/follower.c"
    power_percent99 = speed_percent31;
# 1506 "follower/follower.c"
    brake100 = brake32;
# 1507 "follower/follower.c"
    if (n98 < 3UL) {
# 1508 "follower/follower.c"
      io_to_avr.output_percent[n98] = (S8___0 )power_percent99;
# 1509 "follower/follower.c"
      if (brake100) {
# 1510 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n98));
      } else {
# 1512 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n98));
      }
    }
# 1515 "follower/follower.c"
    goto Lret_nxt_avr_set_motor___6;
    Lret_nxt_avr_set_motor___6: ;
  }
# 1518 "follower/follower.c"
  goto Lret_nxt_motor_set_speed___6;
  Lret_nxt_motor_set_speed___6:
# 1520 "follower/follower.c"
  n53 = (U32___4 )1;
# 1521 "follower/follower.c"
  count54 = 0;
# 1522 "follower/follower.c"
  if (n53 < 3UL) {
# 1523 "follower/follower.c"
    motor[n53].current_count = count54;
  }
# 1525 "follower/follower.c"
  goto Lret_nxt_motor_set_count___0;
  Lret_nxt_motor_set_count___0:
# 1527 "follower/follower.c"
  n55 = (U32___4 )2;
# 1528 "follower/follower.c"
  count56 = 0;
# 1529 "follower/follower.c"
  if (n55 < 3UL) {
# 1530 "follower/follower.c"
    motor[n55].current_count = count56;
  }
# 1532 "follower/follower.c"
  goto Lret_nxt_motor_set_count___1;
  Lret_nxt_motor_set_count___1:
# 1534 "follower/follower.c"
  systick_wait_ms((U32___4 )500);
# 1535 "follower/follower.c"
  n33 = (U32___4 )1;
# 1536 "follower/follower.c"
  speed_percent34 = 100;
# 1537 "follower/follower.c"
  brake35 = 1;
# 1538 "follower/follower.c"
  if (n33 < 3UL) {
# 1539 "follower/follower.c"
    if (speed_percent34 > 100) {
# 1540 "follower/follower.c"
      speed_percent34 = 100;
    }
# 1542 "follower/follower.c"
    if (speed_percent34 < -100) {
# 1543 "follower/follower.c"
      speed_percent34 = -100;
    }
# 1545 "follower/follower.c"
    motor[n33].speed_percent = speed_percent34;
# 1546 "follower/follower.c"
    n101 = n33;
# 1547 "follower/follower.c"
    power_percent102 = speed_percent34;
# 1548 "follower/follower.c"
    brake103 = brake35;
# 1549 "follower/follower.c"
    if (n101 < 3UL) {
# 1550 "follower/follower.c"
      io_to_avr.output_percent[n101] = (S8___0 )power_percent102;
# 1551 "follower/follower.c"
      if (brake103) {
# 1552 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n101));
      } else {
# 1554 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n101));
      }
    }
# 1557 "follower/follower.c"
    goto Lret_nxt_avr_set_motor___7;
    Lret_nxt_avr_set_motor___7: ;
  }
# 1560 "follower/follower.c"
  goto Lret_nxt_motor_set_speed___7;
  Lret_nxt_motor_set_speed___7:
# 1562 "follower/follower.c"
  n36 = (U32___4 )2;
# 1563 "follower/follower.c"
  speed_percent37 = 100;
# 1564 "follower/follower.c"
  brake38 = 1;
# 1565 "follower/follower.c"
  if (n36 < 3UL) {
# 1566 "follower/follower.c"
    if (speed_percent37 > 100) {
# 1567 "follower/follower.c"
      speed_percent37 = 100;
    }
# 1569 "follower/follower.c"
    if (speed_percent37 < -100) {
# 1570 "follower/follower.c"
      speed_percent37 = -100;
    }
# 1572 "follower/follower.c"
    motor[n36].speed_percent = speed_percent37;
# 1573 "follower/follower.c"
    n104 = n36;
# 1574 "follower/follower.c"
    power_percent105 = speed_percent37;
# 1575 "follower/follower.c"
    brake106 = brake38;
# 1576 "follower/follower.c"
    if (n104 < 3UL) {
# 1577 "follower/follower.c"
      io_to_avr.output_percent[n104] = (S8___0 )power_percent105;
# 1578 "follower/follower.c"
      if (brake106) {
# 1579 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n104));
      } else {
# 1581 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n104));
      }
    }
# 1584 "follower/follower.c"
    goto Lret_nxt_avr_set_motor___8;
    Lret_nxt_avr_set_motor___8: ;
  }
# 1587 "follower/follower.c"
  goto Lret_nxt_motor_set_speed___8;
  Lret_nxt_motor_set_speed___8:
# 1589 "follower/follower.c"
  systick_wait_ms((U32___4 )1000);
# 1590 "follower/follower.c"
  n73 = (U32___4 )1;
# 1591 "follower/follower.c"
  if (n73 < 3UL) {
# 1592 "follower/follower.c"
    ret_nxt_motor_get_count74 = motor[n73].current_count;
# 1593 "follower/follower.c"
    goto Lret_nxt_motor_get_count___7;
  } else {
# 1595 "follower/follower.c"
    ret_nxt_motor_get_count74 = 0;
# 1596 "follower/follower.c"
    goto Lret_nxt_motor_get_count___7;
  }
  Lret_nxt_motor_get_count___7:
# 1599 "follower/follower.c"
  tmp___1 = ret_nxt_motor_get_count74;
# 1600 "follower/follower.c"
  Right_Count = tmp___1 / 10;
# 1601 "follower/follower.c"
  n75 = (U32___4 )2;
# 1602 "follower/follower.c"
  if (n75 < 3UL) {
# 1603 "follower/follower.c"
    ret_nxt_motor_get_count76 = motor[n75].current_count;
# 1604 "follower/follower.c"
    goto Lret_nxt_motor_get_count___8;
  } else {
# 1606 "follower/follower.c"
    ret_nxt_motor_get_count76 = 0;
# 1607 "follower/follower.c"
    goto Lret_nxt_motor_get_count___8;
  }
  Lret_nxt_motor_get_count___8:
# 1610 "follower/follower.c"
  tmp___2 = ret_nxt_motor_get_count76;
# 1611 "follower/follower.c"
  Left_Count = tmp___2 / 10;
# 1612 "follower/follower.c"
  Steering = 38 + ((Right_Count + Left_Count) / 2) * 2;
# 1613 "follower/follower.c"
  n39 = (U32___4 )1;
# 1614 "follower/follower.c"
  speed_percent40 = -100;
# 1615 "follower/follower.c"
  brake41 = 1;
# 1616 "follower/follower.c"
  if (n39 < 3UL) {
# 1617 "follower/follower.c"
    if (speed_percent40 > 100) {
# 1618 "follower/follower.c"
      speed_percent40 = 100;
    }
# 1620 "follower/follower.c"
    if (speed_percent40 < -100) {
# 1621 "follower/follower.c"
      speed_percent40 = -100;
    }
# 1623 "follower/follower.c"
    motor[n39].speed_percent = speed_percent40;
# 1624 "follower/follower.c"
    n107 = n39;
# 1625 "follower/follower.c"
    power_percent108 = speed_percent40;
# 1626 "follower/follower.c"
    brake109 = brake41;
# 1627 "follower/follower.c"
    if (n107 < 3UL) {
# 1628 "follower/follower.c"
      io_to_avr.output_percent[n107] = (S8___0 )power_percent108;
# 1629 "follower/follower.c"
      if (brake109) {
# 1630 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n107));
      } else {
# 1632 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n107));
      }
    }
# 1635 "follower/follower.c"
    goto Lret_nxt_avr_set_motor___9;
    Lret_nxt_avr_set_motor___9: ;
  }
# 1638 "follower/follower.c"
  goto Lret_nxt_motor_set_speed___9;
  Lret_nxt_motor_set_speed___9:
# 1640 "follower/follower.c"
  n42 = (U32___4 )2;
# 1641 "follower/follower.c"
  speed_percent43 = -100;
# 1642 "follower/follower.c"
  brake44 = 1;
# 1643 "follower/follower.c"
  if (n42 < 3UL) {
# 1644 "follower/follower.c"
    if (speed_percent43 > 100) {
# 1645 "follower/follower.c"
      speed_percent43 = 100;
    }
# 1647 "follower/follower.c"
    if (speed_percent43 < -100) {
# 1648 "follower/follower.c"
      speed_percent43 = -100;
    }
# 1650 "follower/follower.c"
    motor[n42].speed_percent = speed_percent43;
# 1651 "follower/follower.c"
    n110 = n42;
# 1652 "follower/follower.c"
    power_percent111 = speed_percent43;
# 1653 "follower/follower.c"
    brake112 = brake44;
# 1654 "follower/follower.c"
    if (n110 < 3UL) {
# 1655 "follower/follower.c"
      io_to_avr.output_percent[n110] = (S8___0 )power_percent111;
# 1656 "follower/follower.c"
      if (brake112) {
# 1657 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n110));
      } else {
# 1659 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n110));
      }
    }
# 1662 "follower/follower.c"
    goto Lret_nxt_avr_set_motor___10;
    Lret_nxt_avr_set_motor___10: ;
  }
# 1665 "follower/follower.c"
  goto Lret_nxt_motor_set_speed___10;
  Lret_nxt_motor_set_speed___10:
# 1667 "follower/follower.c"
  systick_wait_ms((U32___4 )1000);
# 1668 "follower/follower.c"
  n45 = (U32___4 )1;
# 1669 "follower/follower.c"
  speed_percent46 = 0;
# 1670 "follower/follower.c"
  brake47 = 1;
# 1671 "follower/follower.c"
  if (n45 < 3UL) {
# 1672 "follower/follower.c"
    if (speed_percent46 > 100) {
# 1673 "follower/follower.c"
      speed_percent46 = 100;
    }
# 1675 "follower/follower.c"
    if (speed_percent46 < -100) {
# 1676 "follower/follower.c"
      speed_percent46 = -100;
    }
# 1678 "follower/follower.c"
    motor[n45].speed_percent = speed_percent46;
# 1679 "follower/follower.c"
    n113 = n45;
# 1680 "follower/follower.c"
    power_percent114 = speed_percent46;
# 1681 "follower/follower.c"
    brake115 = brake47;
# 1682 "follower/follower.c"
    if (n113 < 3UL) {
# 1683 "follower/follower.c"
      io_to_avr.output_percent[n113] = (S8___0 )power_percent114;
# 1684 "follower/follower.c"
      if (brake115) {
# 1685 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n113));
      } else {
# 1687 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n113));
      }
    }
# 1690 "follower/follower.c"
    goto Lret_nxt_avr_set_motor___11;
    Lret_nxt_avr_set_motor___11: ;
  }
# 1693 "follower/follower.c"
  goto Lret_nxt_motor_set_speed___11;
  Lret_nxt_motor_set_speed___11:
# 1695 "follower/follower.c"
  n48 = (U32___4 )2;
# 1696 "follower/follower.c"
  speed_percent49 = 0;
# 1697 "follower/follower.c"
  brake50 = 1;
# 1698 "follower/follower.c"
  if (n48 < 3UL) {
# 1699 "follower/follower.c"
    if (speed_percent49 > 100) {
# 1700 "follower/follower.c"
      speed_percent49 = 100;
    }
# 1702 "follower/follower.c"
    if (speed_percent49 < -100) {
# 1703 "follower/follower.c"
      speed_percent49 = -100;
    }
# 1705 "follower/follower.c"
    motor[n48].speed_percent = speed_percent49;
# 1706 "follower/follower.c"
    n116 = n48;
# 1707 "follower/follower.c"
    power_percent117 = speed_percent49;
# 1708 "follower/follower.c"
    brake118 = brake50;
# 1709 "follower/follower.c"
    if (n116 < 3UL) {
# 1710 "follower/follower.c"
      io_to_avr.output_percent[n116] = (S8___0 )power_percent117;
# 1711 "follower/follower.c"
      if (brake118) {
# 1712 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n116));
      } else {
# 1714 "follower/follower.c"
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n116));
      }
    }
# 1717 "follower/follower.c"
    goto Lret_nxt_avr_set_motor___12;
    Lret_nxt_avr_set_motor___12: ;
  }
# 1720 "follower/follower.c"
  goto Lret_nxt_motor_set_speed___12;
  Lret_nxt_motor_set_speed___12:
# 1722 "follower/follower.c"
  ReleaseResource(R1);
# 1723 "follower/follower.c"
  TerminateTask();
# 1724 "follower/follower.c"
  return;
}
}
# 1727 "follower/follower.c"
void TaskMainSpeedTask(void)
{


  {
# 1732 "follower/follower.c"
  while (true) {
# 1733 "follower/follower.c"
    WaitEvent((EventMaskType )event1);
# 1734 "follower/follower.c"
    ClearEvent((EventMaskType )event1);
# 1735 "follower/follower.c"
    GetResource(R1);
# 1736 "follower/follower.c"
    if (Current_speed == Speed_L) {
# 1737 "follower/follower.c"
      Current_speed = Speed_H;
    } else
# 1739 "follower/follower.c"
    if (Current_speed == Speed_H) {
# 1740 "follower/follower.c"
      Current_speed = Speed_L;
    }
# 1742 "follower/follower.c"
    Motor_Run_Fun((U8___3 )Pre_Order);
# 1743 "follower/follower.c"
    ReleaseResource(R1);
  }
# 1745 "follower/follower.c"
  TerminateTask();
# 1747 "follower/follower.c"
  return;
}
}
# 1748 "follower/follower.c"
void TaskMainBrakeTask(void)
{
  U32___2 n1 ;
  int speed_percent2 ;
  int brake3 ;
  U32___2 n4 ;
  int speed_percent5 ;
  int brake6 ;
  U32___1 n7 ;
  int power_percent8 ;
  int brake9 ;
  U32___1 n10 ;
  int power_percent11 ;
  int brake12 ;

  {
# 1764 "follower/follower.c"
  while (true) {
# 1765 "follower/follower.c"
    WaitEvent((EventMaskType )event2);
# 1766 "follower/follower.c"
    ClearEvent((EventMaskType )event2);
# 1767 "follower/follower.c"
    GetResource(R1);
# 1768 "follower/follower.c"
    if (Brake == 1) {
# 1769 "follower/follower.c"
      n1 = (U32___4 )1;
# 1770 "follower/follower.c"
      speed_percent2 = 0;
# 1771 "follower/follower.c"
      brake3 = 1;
# 1772 "follower/follower.c"
      if (n1 < 3UL) {
# 1773 "follower/follower.c"
        if (speed_percent2 > 100) {
# 1774 "follower/follower.c"
          speed_percent2 = 100;
        }
# 1776 "follower/follower.c"
        if (speed_percent2 < -100) {
# 1777 "follower/follower.c"
          speed_percent2 = -100;
        }
# 1779 "follower/follower.c"
        motor[n1].speed_percent = speed_percent2;
# 1780 "follower/follower.c"
        n7 = n1;
# 1781 "follower/follower.c"
        power_percent8 = speed_percent2;
# 1782 "follower/follower.c"
        brake9 = brake3;
# 1783 "follower/follower.c"
        if (n7 < 3UL) {
# 1784 "follower/follower.c"
          io_to_avr.output_percent[n7] = (S8___0 )power_percent8;
# 1785 "follower/follower.c"
          if (brake9) {
# 1786 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n7));
          } else {
# 1788 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n7));
          }
        }
# 1791 "follower/follower.c"
        goto Lret_nxt_avr_set_motor;
        Lret_nxt_avr_set_motor: ;
      }
# 1794 "follower/follower.c"
      goto Lret_nxt_motor_set_speed;
      Lret_nxt_motor_set_speed:
# 1796 "follower/follower.c"
      n4 = (U32___4 )2;
# 1797 "follower/follower.c"
      speed_percent5 = 0;
# 1798 "follower/follower.c"
      brake6 = 1;
# 1799 "follower/follower.c"
      if (n4 < 3UL) {
# 1800 "follower/follower.c"
        if (speed_percent5 > 100) {
# 1801 "follower/follower.c"
          speed_percent5 = 100;
        }
# 1803 "follower/follower.c"
        if (speed_percent5 < -100) {
# 1804 "follower/follower.c"
          speed_percent5 = -100;
        }
# 1806 "follower/follower.c"
        motor[n4].speed_percent = speed_percent5;
# 1807 "follower/follower.c"
        n10 = n4;
# 1808 "follower/follower.c"
        power_percent11 = speed_percent5;
# 1809 "follower/follower.c"
        brake12 = brake6;
# 1810 "follower/follower.c"
        if (n10 < 3UL) {
# 1811 "follower/follower.c"
          io_to_avr.output_percent[n10] = (S8___0 )power_percent11;
# 1812 "follower/follower.c"
          if (brake12) {
# 1813 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n10));
          } else {
# 1815 "follower/follower.c"
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n10));
          }
        }
# 1818 "follower/follower.c"
        goto Lret_nxt_avr_set_motor___0;
        Lret_nxt_avr_set_motor___0: ;
      }
# 1821 "follower/follower.c"
      goto Lret_nxt_motor_set_speed___0;
      Lret_nxt_motor_set_speed___0: ;
    } else
# 1824 "follower/follower.c"
    if (Brake == 2) {
# 1825 "follower/follower.c"
      if (Current_speed == Speed_H) {
# 1826 "follower/follower.c"
        if (Motor_Run == 1) {
# 1827 "follower/follower.c"
          Slow_brake = Speed_H * 2;
        } else {
# 1829 "follower/follower.c"
          goto _L;
        }
      } else
      _L:
# 1833 "follower/follower.c"
      if (Current_speed == Speed_L) {
# 1834 "follower/follower.c"
        if (Motor_Run == 1) {
# 1835 "follower/follower.c"
          Slow_brake = Speed_L * 2;
        }
      }
# 1838 "follower/follower.c"
      Motor_Run = 0;
    }
# 1840 "follower/follower.c"
    ReleaseResource(R1);
  }
# 1842 "follower/follower.c"
  TerminateTask();
# 1844 "follower/follower.c"
  return;
}
}
# 1845 "follower/follower.c"
void TaskMainSonarSensing(void)
{
  int temp ;
  S32___1 tmp ;
  int temp1 ;
  S32___1 tmp___0 ;
  U8___2 port_id5 ;
  int tmp6 ;
  long ret_ecrobot_get_sonar_sensor7 ;
  U8___2 port_id8 ;
  int tmp9 ;
  long ret_ecrobot_get_sonar_sensor10 ;
  int port11 ;
  int ret_i2c_busy12 ;
  int port13 ;
  int ret_i2c_busy14 ;
  int port15 ;
  U32___0 address16 ;
  int internal_address17 ;
  int n_internal_address_bytes18 ;
  U8___0 *data19 ;
  U32___0 nbytes20 ;
  int write21 ;
  struct i2c_port_struct *p22 ;
  struct i2c_partial_transaction *pt23 ;
  int tmp24 ;
  int tmp___025 ;
  int port1226 ;
  int ret_i2c_busy1327 ;
  int port28 ;
  U32___0 address29 ;
  int internal_address30 ;
  int n_internal_address_bytes31 ;
  U8___0 *data32 ;
  U32___0 nbytes33 ;
  int write34 ;
  struct i2c_port_struct *p35 ;
  struct i2c_partial_transaction *pt36 ;
  int tmp37 ;
  int tmp___038 ;
  int port1239 ;
  int ret_i2c_busy1340 ;

  {
# 1889 "follower/follower.c"
  if (Active_Only_One_Sonar == 0) {
# 1890 "follower/follower.c"
    temp = 0;
# 1891 "follower/follower.c"
    port_id5 = (U8___3 )1;
# 1892 "follower/follower.c"
    port11 = (int )port_id5;
# 1893 "follower/follower.c"
    if (port11 >= 0) {
# 1894 "follower/follower.c"
      if (port11 < 4) {
# 1895 "follower/follower.c"
        ret_i2c_busy12 = (unsigned int )i2c_port[port11].state > 1U;
# 1896 "follower/follower.c"
        goto Lret_i2c_busy;
      }
    }
# 1899 "follower/follower.c"
    ret_i2c_busy12 = 0;
# 1900 "follower/follower.c"
    goto Lret_i2c_busy;
    Lret_i2c_busy:
# 1902 "follower/follower.c"
    tmp6 = ret_i2c_busy12;
# 1903 "follower/follower.c"
    if (tmp6 == 0) {
# 1904 "follower/follower.c"
      distance_state[port_id5] = (S32___0 )data[port_id5];
# 1905 "follower/follower.c"
      port15 = (int )port_id5;
# 1906 "follower/follower.c"
      address16 = (U32___3 )1;
# 1907 "follower/follower.c"
      internal_address17 = 66;
# 1908 "follower/follower.c"
      n_internal_address_bytes18 = 1;
# 1909 "follower/follower.c"
      data19 = & data[port_id5];
# 1910 "follower/follower.c"
      nbytes20 = (U32___3 )1;
# 1911 "follower/follower.c"
      write21 = 0;
# 1912 "follower/follower.c"
      if (port15 < 0) {
# 1913 "follower/follower.c"
        goto Lret_i2c_start_transaction;
      } else
# 1915 "follower/follower.c"
      if (port15 >= 4) {
# 1916 "follower/follower.c"
        goto Lret_i2c_start_transaction;
      }
# 1918 "follower/follower.c"
      port1226 = port15;
# 1919 "follower/follower.c"
      if (port1226 >= 0) {
# 1920 "follower/follower.c"
        if (port1226 < 4) {
# 1921 "follower/follower.c"
          ret_i2c_busy1327 = (unsigned int )i2c_port[port1226].state > 1U;
# 1922 "follower/follower.c"
          goto Lret_i2c_busy___1;
        }
      }
# 1925 "follower/follower.c"
      ret_i2c_busy1327 = 0;
# 1926 "follower/follower.c"
      goto Lret_i2c_busy___1;
      Lret_i2c_busy___1:
# 1928 "follower/follower.c"
      tmp24 = ret_i2c_busy1327;
# 1929 "follower/follower.c"
      if (tmp24) {
# 1930 "follower/follower.c"
        goto Lret_i2c_start_transaction;
      }
# 1932 "follower/follower.c"
      p22 = & i2c_port[port15];
# 1933 "follower/follower.c"
      p22->pt_num = (U32___0 )0;
# 1934 "follower/follower.c"
      p22->pt_begun = (U32___0 )0;
# 1935 "follower/follower.c"
      pt23 = p22->partial_transaction;
# 1936 "follower/follower.c"
      p22->current_pt = pt23;
# 1937 "follower/follower.c"
      memset((void *)pt23, 0, sizeof(p22->partial_transaction));
# 1938 "follower/follower.c"
      if (n_internal_address_bytes18 > 0) {
# 1939 "follower/follower.c"
        p22->addr_int[0] = (U8___0 )(address16 << 1);
# 1940 "follower/follower.c"
        p22->addr_int[1] = (U8___0 )internal_address17;
# 1941 "follower/follower.c"
        pt23->start = (U8___0 )1;
# 1942 "follower/follower.c"
        if (write21) {
# 1943 "follower/follower.c"
          pt23->stop = (U8___0 )0;
        } else {
# 1945 "follower/follower.c"
          pt23->stop = (U8___0 )1;
        }
# 1947 "follower/follower.c"
        pt23->tx = (U8___0 )1;
# 1948 "follower/follower.c"
        pt23->data = p22->addr_int;
# 1949 "follower/follower.c"
        pt23->nbytes = (U16___0 )2;
# 1950 "follower/follower.c"
        pt23 ++;
      }
# 1952 "follower/follower.c"
      if (n_internal_address_bytes18 == 0) {
# 1953 "follower/follower.c"
        goto _L;
      } else
# 1955 "follower/follower.c"
      if (! write21) {
        _L:
# 1957 "follower/follower.c"
        if (n_internal_address_bytes18 > 0) {
# 1958 "follower/follower.c"
          pt23->start = (U8___0 )0;
        } else {
# 1960 "follower/follower.c"
          pt23->start = (U8___0 )1;
        }
# 1962 "follower/follower.c"
        pt23->restart = (U8___0 )(! pt23->start);
# 1963 "follower/follower.c"
        pt23->stop = (U8___0 )0;
# 1964 "follower/follower.c"
        pt23->tx = (U8___0 )1;
# 1965 "follower/follower.c"
        if (write21) {
# 1966 "follower/follower.c"
          tmp___025 = 0;
        } else {
# 1968 "follower/follower.c"
          tmp___025 = 1;
        }
# 1970 "follower/follower.c"
        p22->addr = (U8___0 )((address16 << 1) | (unsigned long )tmp___025);
# 1971 "follower/follower.c"
        pt23->data = & p22->addr;
# 1972 "follower/follower.c"
        pt23->nbytes = (U16___0 )1;
# 1973 "follower/follower.c"
        pt23 ++;
      }
# 1975 "follower/follower.c"
      pt23->start = (U8___0 )0;
# 1976 "follower/follower.c"
      pt23->stop = (U8___0 )1;
# 1977 "follower/follower.c"
      if (write21) {
# 1978 "follower/follower.c"
        pt23->tx = (U8___0 )1;
      } else {
# 1980 "follower/follower.c"
        pt23->tx = (U8___0 )0;
      }
# 1982 "follower/follower.c"
      pt23->data = data19;
# 1983 "follower/follower.c"
      pt23->nbytes = (U16___0 )nbytes20;
# 1984 "follower/follower.c"
      pt23->last_pt = (U8___0 )1;
# 1985 "follower/follower.c"
      p22->state = (i2c_port_state )2;
# 1986 "follower/follower.c"
      goto Lret_i2c_start_transaction;
      Lret_i2c_start_transaction: ;
    }
# 1989 "follower/follower.c"
    ret_ecrobot_get_sonar_sensor7 = distance_state[port_id5];
# 1990 "follower/follower.c"
    goto Lret_ecrobot_get_sonar_sensor;
    Lret_ecrobot_get_sonar_sensor:
# 1992 "follower/follower.c"
    tmp = ret_ecrobot_get_sonar_sensor7;
# 1993 "follower/follower.c"
    temp = (int )tmp;
# 1994 "follower/follower.c"
    if (temp < 50) {
# 1995 "follower/follower.c"
      if (temp > 1) {
# 1996 "follower/follower.c"
        if (Sonar_1 == temp) {
# 1997 "follower/follower.c"
          if (temp != 0) {
# 1998 "follower/follower.c"
            Sonar_Check_1 --;
# 1999 "follower/follower.c"
            if (Sonar_Check_1 == 0) {
# 2000 "follower/follower.c"
              Actual_Sonar_Num_1 = temp;
# 2001 "follower/follower.c"
              Sonar_Check_1 = 1;
            }
          } else {
# 2004 "follower/follower.c"
            Sonar_1 = temp;
# 2005 "follower/follower.c"
            Sonar_Check_1 = 2;
          }
        } else {
# 2008 "follower/follower.c"
          Sonar_1 = temp;
# 2009 "follower/follower.c"
          Sonar_Check_1 = 2;
        }
      } else {
# 2012 "follower/follower.c"
        Actual_Sonar_Num_1 = 100;
      }
    } else {
# 2015 "follower/follower.c"
      Actual_Sonar_Num_1 = 100;
    }
  } else
# 2018 "follower/follower.c"
  if (Active_Only_One_Sonar == 1) {
# 2019 "follower/follower.c"
    temp1 = 0;
# 2020 "follower/follower.c"
    port_id8 = (U8___3 )2;
# 2021 "follower/follower.c"
    port13 = (int )port_id8;
# 2022 "follower/follower.c"
    if (port13 >= 0) {
# 2023 "follower/follower.c"
      if (port13 < 4) {
# 2024 "follower/follower.c"
        ret_i2c_busy14 = (unsigned int )i2c_port[port13].state > 1U;
# 2025 "follower/follower.c"
        goto Lret_i2c_busy___0;
      }
    }
# 2028 "follower/follower.c"
    ret_i2c_busy14 = 0;
# 2029 "follower/follower.c"
    goto Lret_i2c_busy___0;
    Lret_i2c_busy___0:
# 2031 "follower/follower.c"
    tmp9 = ret_i2c_busy14;
# 2032 "follower/follower.c"
    if (tmp9 == 0) {
# 2033 "follower/follower.c"
      distance_state[port_id8] = (S32___0 )data[port_id8];
# 2034 "follower/follower.c"
      port28 = (int )port_id8;
# 2035 "follower/follower.c"
      address29 = (U32___3 )1;
# 2036 "follower/follower.c"
      internal_address30 = 66;
# 2037 "follower/follower.c"
      n_internal_address_bytes31 = 1;
# 2038 "follower/follower.c"
      data32 = & data[port_id8];
# 2039 "follower/follower.c"
      nbytes33 = (U32___3 )1;
# 2040 "follower/follower.c"
      write34 = 0;
# 2041 "follower/follower.c"
      if (port28 < 0) {
# 2042 "follower/follower.c"
        goto Lret_i2c_start_transaction___0;
      } else
# 2044 "follower/follower.c"
      if (port28 >= 4) {
# 2045 "follower/follower.c"
        goto Lret_i2c_start_transaction___0;
      }
# 2047 "follower/follower.c"
      port1239 = port28;
# 2048 "follower/follower.c"
      if (port1239 >= 0) {
# 2049 "follower/follower.c"
        if (port1239 < 4) {
# 2050 "follower/follower.c"
          ret_i2c_busy1340 = (unsigned int )i2c_port[port1239].state > 1U;
# 2051 "follower/follower.c"
          goto Lret_i2c_busy___2;
        }
      }
# 2054 "follower/follower.c"
      ret_i2c_busy1340 = 0;
# 2055 "follower/follower.c"
      goto Lret_i2c_busy___2;
      Lret_i2c_busy___2:
# 2057 "follower/follower.c"
      tmp37 = ret_i2c_busy1340;
# 2058 "follower/follower.c"
      if (tmp37) {
# 2059 "follower/follower.c"
        goto Lret_i2c_start_transaction___0;
      }
# 2061 "follower/follower.c"
      p35 = & i2c_port[port28];
# 2062 "follower/follower.c"
      p35->pt_num = (U32___0 )0;
# 2063 "follower/follower.c"
      p35->pt_begun = (U32___0 )0;
# 2064 "follower/follower.c"
      pt36 = p35->partial_transaction;
# 2065 "follower/follower.c"
      p35->current_pt = pt36;
# 2066 "follower/follower.c"
      memset((void *)pt36, 0, sizeof(p35->partial_transaction));
# 2067 "follower/follower.c"
      if (n_internal_address_bytes31 > 0) {
# 2068 "follower/follower.c"
        p35->addr_int[0] = (U8___0 )(address29 << 1);
# 2069 "follower/follower.c"
        p35->addr_int[1] = (U8___0 )internal_address30;
# 2070 "follower/follower.c"
        pt36->start = (U8___0 )1;
# 2071 "follower/follower.c"
        if (write34) {
# 2072 "follower/follower.c"
          pt36->stop = (U8___0 )0;
        } else {
# 2074 "follower/follower.c"
          pt36->stop = (U8___0 )1;
        }
# 2076 "follower/follower.c"
        pt36->tx = (U8___0 )1;
# 2077 "follower/follower.c"
        pt36->data = p35->addr_int;
# 2078 "follower/follower.c"
        pt36->nbytes = (U16___0 )2;
# 2079 "follower/follower.c"
        pt36 ++;
      }
# 2081 "follower/follower.c"
      if (n_internal_address_bytes31 == 0) {
# 2082 "follower/follower.c"
        goto _L___0;
      } else
# 2084 "follower/follower.c"
      if (! write34) {
        _L___0:
# 2086 "follower/follower.c"
        if (n_internal_address_bytes31 > 0) {
# 2087 "follower/follower.c"
          pt36->start = (U8___0 )0;
        } else {
# 2089 "follower/follower.c"
          pt36->start = (U8___0 )1;
        }
# 2091 "follower/follower.c"
        pt36->restart = (U8___0 )(! pt36->start);
# 2092 "follower/follower.c"
        pt36->stop = (U8___0 )0;
# 2093 "follower/follower.c"
        pt36->tx = (U8___0 )1;
# 2094 "follower/follower.c"
        if (write34) {
# 2095 "follower/follower.c"
          tmp___038 = 0;
        } else {
# 2097 "follower/follower.c"
          tmp___038 = 1;
        }
# 2099 "follower/follower.c"
        p35->addr = (U8___0 )((address29 << 1) | (unsigned long )tmp___038);
# 2100 "follower/follower.c"
        pt36->data = & p35->addr;
# 2101 "follower/follower.c"
        pt36->nbytes = (U16___0 )1;
# 2102 "follower/follower.c"
        pt36 ++;
      }
# 2104 "follower/follower.c"
      pt36->start = (U8___0 )0;
# 2105 "follower/follower.c"
      pt36->stop = (U8___0 )1;
# 2106 "follower/follower.c"
      if (write34) {
# 2107 "follower/follower.c"
        pt36->tx = (U8___0 )1;
      } else {
# 2109 "follower/follower.c"
        pt36->tx = (U8___0 )0;
      }
# 2111 "follower/follower.c"
      pt36->data = data32;
# 2112 "follower/follower.c"
      pt36->nbytes = (U16___0 )nbytes33;
# 2113 "follower/follower.c"
      pt36->last_pt = (U8___0 )1;
# 2114 "follower/follower.c"
      p35->state = (i2c_port_state )2;
# 2115 "follower/follower.c"
      goto Lret_i2c_start_transaction___0;
      Lret_i2c_start_transaction___0: ;
    }
# 2118 "follower/follower.c"
    ret_ecrobot_get_sonar_sensor10 = distance_state[port_id8];
# 2119 "follower/follower.c"
    goto Lret_ecrobot_get_sonar_sensor___0;
    Lret_ecrobot_get_sonar_sensor___0:
# 2121 "follower/follower.c"
    tmp___0 = ret_ecrobot_get_sonar_sensor10;
# 2122 "follower/follower.c"
    temp1 = (int )tmp___0;
# 2123 "follower/follower.c"
    if (temp1 < 50) {
# 2124 "follower/follower.c"
      if (temp1 > 1) {
# 2125 "follower/follower.c"
        if (Sonar_2 == temp1) {
# 2126 "follower/follower.c"
          if (temp1 != 0) {
# 2127 "follower/follower.c"
            Sonar_check_2 --;
# 2128 "follower/follower.c"
            if (Sonar_check_2 == 0) {
# 2129 "follower/follower.c"
              Actual_Sonar_Num_2 = temp1;
# 2130 "follower/follower.c"
              Sonar_check_2 = 1;
            }
          } else {
# 2133 "follower/follower.c"
            Sonar_2 = temp1;
# 2134 "follower/follower.c"
            Sonar_check_2 = 2;
          }
        } else {
# 2137 "follower/follower.c"
          Sonar_2 = temp1;
# 2138 "follower/follower.c"
          Sonar_check_2 = 2;
        }
      } else {
# 2141 "follower/follower.c"
        Actual_Sonar_Num_2 = 100;
      }
    } else {
# 2144 "follower/follower.c"
      Actual_Sonar_Num_2 = 100;
    }
  }
# 2147 "follower/follower.c"
  if (Active_Only_One_Sonar == 0) {
# 2148 "follower/follower.c"
    Active_Only_One_Sonar = 1;
  } else
# 2150 "follower/follower.c"
  if (Active_Only_One_Sonar == 1) {
# 2151 "follower/follower.c"
    Active_Only_One_Sonar = 0;
  }
# 2153 "follower/follower.c"
  TerminateTask();
# 2154 "follower/follower.c"
  return;
}
}
# 2157 "follower/follower.c"
void TaskMainIdleTask(void) ;
# 2158 "follower/follower.c"
static SINT___0 bt_status___0 = 4;
# 2159 "follower/follower.c"
void TaskMainIdleTask(void)
{
  SINT___0 tmp ;
  char const *pin2 ;
  char const *str3 ;
  int c4 ;
  int i5 ;
  U8 *b6 ;
  U8 const *f7 ;
  U32 updateToo8 ;
  int x9 ;
  int y10 ;

  {
# 2173 "follower/follower.c"
  while (true) {
# 2174 "follower/follower.c"
    pin2 = "LEJOS-DONGHYUN";
# 2175 "follower/follower.c"
    connect_bt_slave(pin2);
# 2176 "follower/follower.c"
    open_bt_stream();
# 2177 "follower/follower.c"
    goto Lret_ecrobot_init_bt_slave;
    Lret_ecrobot_init_bt_slave:
# 2179 "follower/follower.c"
    tmp = ecrobot_get_bt_status();
# 2180 "follower/follower.c"
    if (tmp == 7) {
# 2181 "follower/follower.c"
      if (bt_status___0 != 7) {
# 2182 "follower/follower.c"
        updateToo8 = (U32___4 )0;
# 2183 "follower/follower.c"
        if (updateToo8) {
# 2184 "follower/follower.c"
          display_tick = 0;
# 2185 "follower/follower.c"
          nxt_lcd_update();
# 2186 "follower/follower.c"
          goto Lret_display_update;
          Lret_display_update: ;
        }
# 2189 "follower/follower.c"
        goto Lret_display_clear;
        Lret_display_clear:
# 2191 "follower/follower.c"
        x9 = 0;
# 2192 "follower/follower.c"
        y10 = 0;
# 2193 "follower/follower.c"
        display_x = x9;
# 2194 "follower/follower.c"
        display_y = y10;
# 2195 "follower/follower.c"
        goto Lret_display_goto_xy;
        Lret_display_goto_xy:
# 2197 "follower/follower.c"
        str3 = "[BT]";
# 2198 "follower/follower.c"
        while (*str3) {
# 2199 "follower/follower.c"
          if ((int const )*str3 != 10) {
# 2200 "follower/follower.c"
            c4 = (int )*str3;
# 2201 "follower/follower.c"
            if (c4 >= 0) {
# 2202 "follower/follower.c"
              if (c4 < 128) {
# 2203 "follower/follower.c"
                if (display_x >= 0) {
# 2204 "follower/follower.c"
                  if (display_x < 16) {
# 2205 "follower/follower.c"
                    if (display_y >= 0) {
# 2206 "follower/follower.c"
                      if (display_y < 8) {
# 2207 "follower/follower.c"
                        b6 = & (*(display_buffer + display_y))[display_x * 6];
# 2208 "follower/follower.c"
                        f7 = font[c4];
# 2209 "follower/follower.c"
                        i5 = 0;
# 2210 "follower/follower.c"
                        while (i5 < 5) {
# 2211 "follower/follower.c"
                          *b6 = (U8 )*f7;
# 2212 "follower/follower.c"
                          b6 ++;
# 2213 "follower/follower.c"
                          f7 ++;
# 2214 "follower/follower.c"
                          i5 ++;
                        }
                      }
                    }
                  }
                }
              }
            }
# 2222 "follower/follower.c"
            goto Lret_display_char;
            Lret_display_char:
# 2224 "follower/follower.c"
            display_x ++;
          } else {
# 2226 "follower/follower.c"
            display_x = 0;
# 2227 "follower/follower.c"
            display_y ++;
          }
# 2229 "follower/follower.c"
          str3 ++;
        }
# 2231 "follower/follower.c"
        goto Lret_display_string;
        Lret_display_string:
# 2233 "follower/follower.c"
        display_tick = 0;
# 2234 "follower/follower.c"
        nxt_lcd_update();
# 2235 "follower/follower.c"
        goto Lret_display_update___0;
        Lret_display_update___0: ;
      }
    }
# 2239 "follower/follower.c"
    bt_status___0 = ecrobot_get_bt_status();
  }
# 2242 "follower/follower.c"
  return;
}
}
# 2401 "follower/follower.c"
extern int create_task() ;
# 2402 "follower/follower.c"
extern int create_block() ;
# 2403 "follower/follower.c"
void main(void)
{


  {
# 2408 "follower/follower.c"
  create_task("TaskMainSonarSensing", "TaskMainSonarSensing", 5, 500, 0.045);
# 2409 "follower/follower.c"
  create_task("TaskMainEventDispatcher", "TaskMainEventDispatcher", 4, 5, 0.097);
# 2410 "follower/follower.c"
  create_task("TaskMainInitialize", "TaskMainInitialize", 6, 4, 0.048);
# 2411 "follower/follower.c"
  create_task("TaskMainSpeedTask", "TaskMainSpeedTask", 7, 4, 0.14);
# 2412 "follower/follower.c"
  create_task("TaskMainBrakeTask", "TaskMainBrakeTask", 8, 4, 0.028);
# 2413 "follower/follower.c"
  create_task("TaskMainEventHandler", "TaskMainEventHandler", 3, 10, 0.014);
# 2414 "follower/follower.c"
  create_task("TaskMainIdleTask", "TaskMainIdleTask", 1, 200, 0.014);
# 2416 "follower/follower.c"
  create_block(1196, "TaskMainInitialize", "R1", 1, 6, 0.048);
# 2417 "follower/follower.c"
  create_block(1735, "TaskMainSpeedTask", "R1", 1, 7, 0.011);
# 2418 "follower/follower.c"
  create_block(1767, "TaskMainBrakeTask", "R1", 1, 8, 0.022);
# 2421 "follower/follower.c"
  return;
}
}

# 1 "follower/follower.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "follower/follower.c"



typedef unsigned char U8;
typedef unsigned long U32;
typedef unsigned char byte;
typedef unsigned short TWOBYTES;


int true = 1;
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
   U8 displayN[9][100] ;
} __attribute__((__packed__)) ;


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


typedef unsigned char U8___1;
typedef signed char S8___0;
typedef unsigned long U32___1;
struct __anonstruct_to_avr_432250394 {
   U8___1 power ;
   U8___1 pwm_frequency ;
   S8___0 output_percent[4] ;
   U8___1 output_mode ;
   U8___1 input_power ;
} __attribute__((__packed__)) ;


typedef struct __anonstruct_to_avr_432250394 to_avr;
typedef unsigned long U32___2;
struct motor_struct {
   int current_count ;
   int target_count ;
   int speed_percent ;
   U32___2 last ;
};


typedef unsigned char U8___2;
typedef unsigned long U32___3;
typedef long S32___0;
typedef unsigned char UINT8;
typedef unsigned long UINT32;
typedef UINT8 StatusType;
typedef UINT8 TaskType;
typedef UINT8 ResourceType;
typedef UINT32 EventMaskType;
typedef unsigned char U8___3;
typedef unsigned long U32___4;
typedef long S32___1;
typedef char CHAR___0;
typedef int SINT___0;
int display_tick ;
int display_auto_update ;
extern void nxt_lcd_update(void) ;
extern void systick_wait_ms(unsigned long ms ) ;

extern __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1), __leaf__)) memset)(void *__s ,
                                                                                               int __c ,
                                                                                               unsigned long __n ) ;
static struct __anonstruct_display_array_740464799 display_array ;
static U8 (*display_buffer)[100] = display_array.displayN;

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
int display_tick = 0;
int display_auto_update = 1;
int display_x ;
int display_y ;
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
static to_avr io_to_avr ;
static struct motor_struct motor[3] ;
extern void bt_receive(unsigned char *buf ) ;
extern int ecrobot_get_bt_status(void) ;
extern unsigned long ecrobot_send_bt_packet(unsigned char *buf , unsigned long bufLen ) ;
extern int ecrobot_sound_tone(U32___3 freq , U32___3 ms , U32___3 vol ) ;
static S32___0 distance_state[4] = { (S32___0 )-1, (S32___0 )-1, (S32___0 )-1, (S32___0 )-1};
static U8___2 data[4] = { (U8___2 )0};
U8___2 const NXT_COLORSENSOR_PROTOCOLS[7] = { (U8___2 const )176, (U8___2 const )112, (U8___2 const )240, (U8___2 const )8,
        (U8___2 const )176, (U8___2 const )136, (U8___2 const )136};
extern StatusType TerminateTask(void) ;
extern StatusType GetResource(ResourceType resid ) ;
extern StatusType ReleaseResource(ResourceType resid ) ;
extern StatusType SetEvent(TaskType tskid , EventMaskType mask ) ;
extern StatusType ClearEvent(EventMaskType mask ) ;
extern StatusType WaitEvent(EventMaskType mask ) ;
static U8___3 open_bt_stream(void) ;
static SINT___0 connect_bt_slave(CHAR___0 const *pin ) ;
static unsigned char bt_status = (U8___3 )4;
static U8___3 receiveBuf[128] ;
extern TaskType const SpeedTask ;
extern TaskType const BrakeTask ;
extern EventMaskType const TouchSensorOnEvent ;
extern EventMaskType const event1 ;
extern EventMaskType const event2 ;
extern ResourceType R1 ;
int Current_speed = 55;
int LR_Way = 0;
int Slow_brake = 0;
int Motor_Run = 0;
int Pre_Order = 0;
int Brake ;
int Steering ;
int Sonar_1 = 0;
int Sonar_2 = 0;
int Sonar_Check_1 = 2;
int Sonar_check_2 = 2;
int Actual_Sonar_Num_1 = 0;
int Actual_Sonar_Num_2 = 0;
int Speed_H = 75;
int Speed_L = 55;
int Active_Only_One_Sonar = 0;
int Terminate_Check = 1601;
void Motor_Run_Fun(U8___3 buf ) ;
static U8___3 bt_receive_buf[32] ;
void TaskMainEventDispatcher(void) ;

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
  buf6 = bt_receive_buf;
  bufLen7 = (U32___4 )32;
  if ((int )bt_status == 7) {
    if (bufLen7 <= 126UL) {
      bt_receive(& receiveBuf[0]);
      len9 = (U32___4 )receiveBuf[0];
      if (len9 > 0UL) {
        if (len9 <= bufLen7) {
          i8 = 0;
          while ((U32___4 )i8 < len9) {
            *(buf6 + i8) = receiveBuf[i8 + 2];
            i8 ++;
          }
          goto Lret_ecrobot_read_bt_packet;
        }
      }
    }
  }
  goto Lret_ecrobot_read_bt_packet;
  Lret_ecrobot_read_bt_packet: ;
  if (Actual_Sonar_Num_1 - Actual_Sonar_Num_2 > 3) {
    bt_receive_buf[4] = (U8___3 )3;
  } else
  if (Actual_Sonar_Num_1 == 100) {
    if (Actual_Sonar_Num_2 < 50) {
      bt_receive_buf[4] = (U8___3 )3;
    } else {
      goto _L___0;
    }
  } else
  _L___0:
  if (Actual_Sonar_Num_2 - Actual_Sonar_Num_1 > 3) {
    bt_receive_buf[4] = (U8___3 )4;
  } else
  if (Actual_Sonar_Num_2 == 100) {
    if (Actual_Sonar_Num_1 < 50) {
      bt_receive_buf[4] = (U8___3 )4;
    } else {
      goto _L;
    }
  } else
  _L:
  if (Actual_Sonar_Num_2 < 50) {
    if (Actual_Sonar_Num_1 < 50) {
      bt_receive_buf[4] = (U8___3 )0;
    }
  }
  if (Actual_Sonar_Num_1 < 50) {
    if (Actual_Sonar_Num_2 < 50) {
      if ((Actual_Sonar_Num_1 + Actual_Sonar_Num_2) / 2 < 26) {
        if ((Actual_Sonar_Num_1 + Actual_Sonar_Num_2) / 2 > 20) {
          Current_speed = Speed_L;
          Motor_Run = 1;
          bt_receive_buf[3] = (U8___3 )1;
        } else {
          goto _L___1;
        }
      } else
      _L___1:
      if ((Actual_Sonar_Num_1 + Actual_Sonar_Num_2) / 2 >= 26) {
        Current_speed = Speed_H;
        Motor_Run = 1;
        bt_receive_buf[3] = (U8___3 )1;
      } else {
        Current_speed = 0;
        Motor_Run = 0;
        n9 = (U32___4 )1;
        speed_percent10 = 0;
        brake11 = 1;
        if (n9 < 3UL) {
          if (speed_percent10 > 100) {
            speed_percent10 = 100;
          }
          if (speed_percent10 < -100) {
            speed_percent10 = -100;
          }
          motor[n9].speed_percent = speed_percent10;
          n44 = n9;
          power_percent45 = speed_percent10;
          brake46 = brake11;
          if (n44 < 3UL) {
            io_to_avr.output_percent[n44] = (S8___0 )power_percent45;
            if (brake46) {
              io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n44));
            } else {
              io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n44));
            }
          }
          goto Lret_nxt_avr_set_motor;
          Lret_nxt_avr_set_motor: ;
        }
        goto Lret_nxt_motor_set_speed;
        Lret_nxt_motor_set_speed:
        n12 = (U32___4 )2;
        speed_percent13 = 0;
        brake14 = 1;
        if (n12 < 3UL) {
          if (speed_percent13 > 100) {
            speed_percent13 = 100;
          }
          if (speed_percent13 < -100) {
            speed_percent13 = -100;
          }
          motor[n12].speed_percent = speed_percent13;
          n47 = n12;
          power_percent48 = speed_percent13;
          brake49 = brake14;
          if (n47 < 3UL) {
            io_to_avr.output_percent[n47] = (S8___0 )power_percent48;
            if (brake49) {
              io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n47));
            } else {
              io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n47));
            }
          }
          goto Lret_nxt_avr_set_motor___0;
          Lret_nxt_avr_set_motor___0: ;
        }
        goto Lret_nxt_motor_set_speed___0;
        Lret_nxt_motor_set_speed___0:
        bt_receive_buf[3] = (U8___3 )0;
      }
      Terminate_Check = 0;
    } else {
      goto _L___2;
    }
  } else
  _L___2:
  if (Actual_Sonar_Num_1 < 50) {
    Current_speed = Speed_L;
    Motor_Run = 1;
    bt_receive_buf[3] = (U8___3 )1;
    Terminate_Check = 0;
  } else
  if (Actual_Sonar_Num_2 < 50) {
    Current_speed = Speed_L;
    Motor_Run = 1;
    bt_receive_buf[3] = (U8___3 )1;
    Terminate_Check = 0;
  } else {
    Terminate_Check ++;
    if (Terminate_Check == 700) {
      Current_speed = 0;
      Motor_Run = 0;
      n15 = (U32___4 )1;
      speed_percent16 = 0;
      brake17 = 1;
      if (n15 < 3UL) {
        if (speed_percent16 > 100) {
          speed_percent16 = 100;
        }
        if (speed_percent16 < -100) {
          speed_percent16 = -100;
        }
        motor[n15].speed_percent = speed_percent16;
        n50 = n15;
        power_percent51 = speed_percent16;
        brake52 = brake17;
        if (n50 < 3UL) {
          io_to_avr.output_percent[n50] = (S8___0 )power_percent51;
          if (brake52) {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n50));
          } else {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n50));
          }
        }
        goto Lret_nxt_avr_set_motor___1;
        Lret_nxt_avr_set_motor___1: ;
      }
      goto Lret_nxt_motor_set_speed___1;
      Lret_nxt_motor_set_speed___1:
      n18 = (U32___4 )2;
      speed_percent19 = 0;
      brake20 = 1;
      if (n18 < 3UL) {
        if (speed_percent19 > 100) {
          speed_percent19 = 100;
        }
        if (speed_percent19 < -100) {
          speed_percent19 = -100;
        }
        motor[n18].speed_percent = speed_percent19;
        n53 = n18;
        power_percent54 = speed_percent19;
        brake55 = brake20;
        if (n53 < 3UL) {
          io_to_avr.output_percent[n53] = (S8___0 )power_percent54;
          if (brake55) {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n53));
          } else {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n53));
          }
        }
        goto Lret_nxt_avr_set_motor___2;
        Lret_nxt_avr_set_motor___2: ;
      }
      goto Lret_nxt_motor_set_speed___2;
      Lret_nxt_motor_set_speed___2:
      bt_receive_buf[3] = (U8___3 )0;
      ecrobot_sound_tone((U32___4 )1500, (U32___4 )80, (U32___4 )80);
    }
  }
  temp = Pre_Order;
  if ((int )bt_receive_buf[3] == 1) {
    temp = (int )bt_receive_buf[3];
  } else
  if ((int )bt_receive_buf[3] == 2) {
    temp = (int )bt_receive_buf[3];
  }
  if (temp != Pre_Order) {
    if ((int )bt_receive_buf[4] != 3) {
      if ((int )bt_receive_buf[4] != 4) {
        if (LR_Way != 100) {
          if (LR_Way != -100) {
            Motor_Run = 1;
          }
        }
      }
    }
  }
  if ((int )bt_receive_buf[4] == 3) {
    LR_Way = -100;
  } else
  if ((int )bt_receive_buf[4] == 4) {
    LR_Way = 100;
  } else {
    LR_Way = 0;
  }
  n42 = (U32___4 )0;
  if (n42 < 3UL) {
    ret_nxt_motor_get_count43 = motor[n42].current_count;
    goto Lret_nxt_motor_get_count;
  } else {
    ret_nxt_motor_get_count43 = 0;
    goto Lret_nxt_motor_get_count;
  }
  Lret_nxt_motor_get_count:
  tmp = ret_nxt_motor_get_count43;
  err = (float )((50 * LR_Way) / 100 - tmp);
  if (err > (float )0) {
    n21 = (U32___4 )0;
    speed_percent22 = (int )(err / (float )2 + (float )10);
    brake23 = 1;
    if (n21 < 3UL) {
      if (speed_percent22 > 100) {
        speed_percent22 = 100;
      }
      if (speed_percent22 < -100) {
        speed_percent22 = -100;
      }
      motor[n21].speed_percent = speed_percent22;
      n56 = n21;
      power_percent57 = speed_percent22;
      brake58 = brake23;
      if (n56 < 3UL) {
        io_to_avr.output_percent[n56] = (S8___0 )power_percent57;
        if (brake58) {
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n56));
        } else {
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n56));
        }
      }
      goto Lret_nxt_avr_set_motor___3;
      Lret_nxt_avr_set_motor___3: ;
    }
    goto Lret_nxt_motor_set_speed___3;
    Lret_nxt_motor_set_speed___3: ;
  } else
  if (err < (float )0) {
    n24 = (U32___4 )0;
    speed_percent25 = (int )(err / (float )2 - (float )10);
    brake26 = 1;
    if (n24 < 3UL) {
      if (speed_percent25 > 100) {
        speed_percent25 = 100;
      }
      if (speed_percent25 < -100) {
        speed_percent25 = -100;
      }
      motor[n24].speed_percent = speed_percent25;
      n59 = n24;
      power_percent60 = speed_percent25;
      brake61 = brake26;
      if (n59 < 3UL) {
        io_to_avr.output_percent[n59] = (S8___0 )power_percent60;
        if (brake61) {
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n59));
        } else {
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n59));
        }
      }
      goto Lret_nxt_avr_set_motor___4;
      Lret_nxt_avr_set_motor___4: ;
    }
    goto Lret_nxt_motor_set_speed___4;
    Lret_nxt_motor_set_speed___4: ;
  } else {
    n27 = (U32___4 )0;
    speed_percent28 = 0;
    brake29 = 1;
    if (n27 < 3UL) {
      if (speed_percent28 > 100) {
        speed_percent28 = 100;
      }
      if (speed_percent28 < -100) {
        speed_percent28 = -100;
      }
      motor[n27].speed_percent = speed_percent28;
      n62 = n27;
      power_percent63 = speed_percent28;
      brake64 = brake29;
      if (n62 < 3UL) {
        io_to_avr.output_percent[n62] = (S8___0 )power_percent63;
        if (brake64) {
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n62));
        } else {
          io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n62));
        }
      }
      goto Lret_nxt_avr_set_motor___5;
      Lret_nxt_avr_set_motor___5: ;
    }
    goto Lret_nxt_motor_set_speed___5;
    Lret_nxt_motor_set_speed___5: ;
  }
  if ((int )bt_receive_buf[5] == 1) {
    if (Current_speed != Speed_H) {
      Motor_Run = 1;
      SetEvent((TaskType )SpeedTask, (EventMaskType )event1);
    }
  } else
  if ((int )bt_receive_buf[5] == 2) {
    if (Current_speed != Speed_L) {
      Motor_Run = 1;
      SetEvent((TaskType )SpeedTask, (EventMaskType )event1);
    }
  }
  if (Slow_brake > 0) {
    if (Current_speed == Speed_H) {
      temp_1 = ((Speed_H * 2 + 1) - Slow_brake) / 2;
    }
    if (Current_speed == Speed_L) {
      temp_1 = ((Speed_L * 2 + 1) - Slow_brake) / 2;
    }
    if ((int )bt_receive_buf[3] == 1) {
      n30 = (U32___4 )1;
      speed_percent31 = - Current_speed + temp_1;
      brake32 = 1;
      if (n30 < 3UL) {
        if (speed_percent31 > 100) {
          speed_percent31 = 100;
        }
        if (speed_percent31 < -100) {
          speed_percent31 = -100;
        }
        motor[n30].speed_percent = speed_percent31;
        n65 = n30;
        power_percent66 = speed_percent31;
        brake67 = brake32;
        if (n65 < 3UL) {
          io_to_avr.output_percent[n65] = (S8___0 )power_percent66;
          if (brake67) {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n65));
          } else {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n65));
          }
        }
        goto Lret_nxt_avr_set_motor___6;
        Lret_nxt_avr_set_motor___6: ;
      }
      goto Lret_nxt_motor_set_speed___6;
      Lret_nxt_motor_set_speed___6:
      n33 = (U32___4 )2;
      speed_percent34 = - Current_speed + temp_1;
      brake35 = 1;
      if (n33 < 3UL) {
        if (speed_percent34 > 100) {
          speed_percent34 = 100;
        }
        if (speed_percent34 < -100) {
          speed_percent34 = -100;
        }
        motor[n33].speed_percent = speed_percent34;
        n68 = n33;
        power_percent69 = speed_percent34;
        brake70 = brake35;
        if (n68 < 3UL) {
          io_to_avr.output_percent[n68] = (S8___0 )power_percent69;
          if (brake70) {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n68));
          } else {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n68));
          }
        }
        goto Lret_nxt_avr_set_motor___7;
        Lret_nxt_avr_set_motor___7: ;
      }
      goto Lret_nxt_motor_set_speed___7;
      Lret_nxt_motor_set_speed___7: ;
    }
    if ((int )bt_receive_buf[3] == 2) {
      n36 = (U32___4 )1;
      speed_percent37 = Current_speed - temp_1;
      brake38 = 1;
      if (n36 < 3UL) {
        if (speed_percent37 > 100) {
          speed_percent37 = 100;
        }
        if (speed_percent37 < -100) {
          speed_percent37 = -100;
        }
        motor[n36].speed_percent = speed_percent37;
        n71 = n36;
        power_percent72 = speed_percent37;
        brake73 = brake38;
        if (n71 < 3UL) {
          io_to_avr.output_percent[n71] = (S8___0 )power_percent72;
          if (brake73) {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n71));
          } else {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n71));
          }
        }
        goto Lret_nxt_avr_set_motor___8;
        Lret_nxt_avr_set_motor___8: ;
      }
      goto Lret_nxt_motor_set_speed___8;
      Lret_nxt_motor_set_speed___8:
      n39 = (U32___4 )2;
      speed_percent40 = Current_speed - temp_1;
      brake41 = 1;
      if (n39 < 3UL) {
        if (speed_percent40 > 100) {
          speed_percent40 = 100;
        }
        if (speed_percent40 < -100) {
          speed_percent40 = -100;
        }
        motor[n39].speed_percent = speed_percent40;
        n74 = n39;
        power_percent75 = speed_percent40;
        brake76 = brake41;
        if (n74 < 3UL) {
          io_to_avr.output_percent[n74] = (S8___0 )power_percent75;
          if (brake76) {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n74));
          } else {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n74));
          }
        }
        goto Lret_nxt_avr_set_motor___9;
        Lret_nxt_avr_set_motor___9: ;
      }
      goto Lret_nxt_motor_set_speed___9;
      Lret_nxt_motor_set_speed___9: ;
    }
    Slow_brake --;
    Motor_Run = 0;
  } else
  if ((int )bt_receive_buf[6] == 1) {
    goto _L___4;
  } else
  if ((int )bt_receive_buf[6] == 2) {
    _L___4:
    if ((int )bt_receive_buf[7] == 1) {
      Brake = (int )bt_receive_buf[6];
      SetEvent((TaskType )BrakeTask, (EventMaskType )event2);
    } else {
      goto _L___3;
    }
  } else
  _L___3:
  if (Motor_Run == 1) {
    Motor_Run_Fun(bt_receive_buf[3]);
    if ((int )bt_receive_buf[3] == 1) {
      Pre_Order = (int )bt_receive_buf[3];
    } else
    if ((int )bt_receive_buf[3] == 2) {
      Pre_Order = (int )bt_receive_buf[3];
    }
  }
  TerminateTask();
  return;
}
}

static U8___3 bt_send_buf[32] ;

void TaskMainEventHandler(void)
{


  {
  while (true) {
    WaitEvent((EventMaskType )TouchSensorOnEvent);
    ClearEvent((EventMaskType )TouchSensorOnEvent);
    bt_send_buf[0] = (U8___3 )1;
    ecrobot_send_bt_packet(bt_send_buf, (U32___4 )32);
    bt_send_buf[0] = (U8___3 )0;
    ecrobot_send_bt_packet(bt_send_buf, (U32___4 )32);
  }
  TerminateTask();
}
}
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
  GetResource(R1);
  Count_temp = 0;
  Right_Count = 0;
  Left_Count = 0;
  temp = 100;
  n9 = (U32___4 )0;
  speed_percent10 = 35;
  brake11 = 1;
  if (n9 < 3UL) {
    if (speed_percent10 > 100) {
      speed_percent10 = 100;
    }
    if (speed_percent10 < -100) {
      speed_percent10 = -100;
    }
    motor[n9].speed_percent = speed_percent10;
    n77 = n9;
    power_percent78 = speed_percent10;
    brake79 = brake11;
    if (n77 < 3UL) {
      io_to_avr.output_percent[n77] = (S8___0 )power_percent78;
      if (brake79) {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n77));
      } else {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n77));
      }
    }
    goto Lret_nxt_avr_set_motor;
    Lret_nxt_avr_set_motor: ;
  }
  goto Lret_nxt_motor_set_speed;
  Lret_nxt_motor_set_speed: ;
  while (true) {
    n57 = (U32___4 )0;
    if (n57 < 3UL) {
      ret_nxt_motor_get_count58 = motor[n57].current_count;
      goto Lret_nxt_motor_get_count;
    } else {
      ret_nxt_motor_get_count58 = 0;
      goto Lret_nxt_motor_get_count;
    }
    Lret_nxt_motor_get_count:
    tmp = ret_nxt_motor_get_count58;
    if (! (temp != tmp)) {
      break;
    }
    n59 = (U32___4 )0;
    if (n59 < 3UL) {
      ret_nxt_motor_get_count60 = motor[n59].current_count;
      goto Lret_nxt_motor_get_count___0;
    } else {
      ret_nxt_motor_get_count60 = 0;
      goto Lret_nxt_motor_get_count___0;
    }
    Lret_nxt_motor_get_count___0:
    temp = ret_nxt_motor_get_count60;
    systick_wait_ms((U32___4 )50);
  }
  n12 = (U32___4 )0;
  speed_percent13 = 0;
  brake14 = 1;
  if (n12 < 3UL) {
    if (speed_percent13 > 100) {
      speed_percent13 = 100;
    }
    if (speed_percent13 < -100) {
      speed_percent13 = -100;
    }
    motor[n12].speed_percent = speed_percent13;
    n80 = n12;
    power_percent81 = speed_percent13;
    brake82 = brake14;
    if (n80 < 3UL) {
      io_to_avr.output_percent[n80] = (S8___0 )power_percent81;
      if (brake82) {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n80));
      } else {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n80));
      }
    }
    goto Lret_nxt_avr_set_motor___0;
    Lret_nxt_avr_set_motor___0: ;
  }
  goto Lret_nxt_motor_set_speed___0;
  Lret_nxt_motor_set_speed___0:
  n61 = (U32___4 )0;
  if (n61 < 3UL) {
    ret_nxt_motor_get_count62 = motor[n61].current_count;
    goto Lret_nxt_motor_get_count___1;
  } else {
    ret_nxt_motor_get_count62 = 0;
    goto Lret_nxt_motor_get_count___1;
  }
  Lret_nxt_motor_get_count___1:
  Right_Count = ret_nxt_motor_get_count62;
  n15 = (U32___4 )0;
  speed_percent16 = -35;
  brake17 = 1;
  if (n15 < 3UL) {
    if (speed_percent16 > 100) {
      speed_percent16 = 100;
    }
    if (speed_percent16 < -100) {
      speed_percent16 = -100;
    }
    motor[n15].speed_percent = speed_percent16;
    n83 = n15;
    power_percent84 = speed_percent16;
    brake85 = brake17;
    if (n83 < 3UL) {
      io_to_avr.output_percent[n83] = (S8___0 )power_percent84;
      if (brake85) {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n83));
      } else {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n83));
      }
    }
    goto Lret_nxt_avr_set_motor___1;
    Lret_nxt_avr_set_motor___1: ;
  }
  goto Lret_nxt_motor_set_speed___1;
  Lret_nxt_motor_set_speed___1:
  temp = 100;
  while (true) {
    n63 = (U32___4 )0;
    if (n63 < 3UL) {
      ret_nxt_motor_get_count64 = motor[n63].current_count;
      goto Lret_nxt_motor_get_count___2;
    } else {
      ret_nxt_motor_get_count64 = 0;
      goto Lret_nxt_motor_get_count___2;
    }
    Lret_nxt_motor_get_count___2:
    tmp___0 = ret_nxt_motor_get_count64;
    if (! (temp != tmp___0)) {
      break;
    }
    n65 = (U32___4 )0;
    if (n65 < 3UL) {
      ret_nxt_motor_get_count66 = motor[n65].current_count;
      goto Lret_nxt_motor_get_count___3;
    } else {
      ret_nxt_motor_get_count66 = 0;
      goto Lret_nxt_motor_get_count___3;
    }
    Lret_nxt_motor_get_count___3:
    temp = ret_nxt_motor_get_count66;
    systick_wait_ms((U32___4 )50);
  }
  n18 = (U32___4 )0;
  speed_percent19 = 0;
  brake20 = 1;
  if (n18 < 3UL) {
    if (speed_percent19 > 100) {
      speed_percent19 = 100;
    }
    if (speed_percent19 < -100) {
      speed_percent19 = -100;
    }
    motor[n18].speed_percent = speed_percent19;
    n86 = n18;
    power_percent87 = speed_percent19;
    brake88 = brake20;
    if (n86 < 3UL) {
      io_to_avr.output_percent[n86] = (S8___0 )power_percent87;
      if (brake88) {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n86));
      } else {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n86));
      }
    }
    goto Lret_nxt_avr_set_motor___2;
    Lret_nxt_avr_set_motor___2: ;
  }
  goto Lret_nxt_motor_set_speed___2;
  Lret_nxt_motor_set_speed___2:
  n67 = (U32___4 )0;
  if (n67 < 3UL) {
    ret_nxt_motor_get_count68 = motor[n67].current_count;
    goto Lret_nxt_motor_get_count___4;
  } else {
    ret_nxt_motor_get_count68 = 0;
    goto Lret_nxt_motor_get_count___4;
  }
  Lret_nxt_motor_get_count___4:
  Left_Count = ret_nxt_motor_get_count68;
  Count_temp = (Right_Count - Left_Count) / 2 + Left_Count;
  n21 = (U32___4 )0;
  speed_percent22 = 35;
  brake23 = 1;
  if (n21 < 3UL) {
    if (speed_percent22 > 100) {
      speed_percent22 = 100;
    }
    if (speed_percent22 < -100) {
      speed_percent22 = -100;
    }
    motor[n21].speed_percent = speed_percent22;
    n89 = n21;
    power_percent90 = speed_percent22;
    brake91 = brake23;
    if (n89 < 3UL) {
      io_to_avr.output_percent[n89] = (S8___0 )power_percent90;
      if (brake91) {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n89));
      } else {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n89));
      }
    }
    goto Lret_nxt_avr_set_motor___3;
    Lret_nxt_avr_set_motor___3: ;
  }
  goto Lret_nxt_motor_set_speed___3;
  Lret_nxt_motor_set_speed___3:
  n69 = (U32___4 )0;
  if (n69 < 3UL) {
    ret_nxt_motor_get_count70 = motor[n69].current_count;
    goto Lret_nxt_motor_get_count___5;
  } else {
    ret_nxt_motor_get_count70 = 0;
    goto Lret_nxt_motor_get_count___5;
  }
  Lret_nxt_motor_get_count___5:
  temp = ret_nxt_motor_get_count70;
  while (temp != Count_temp) {
    n71 = (U32___4 )0;
    if (n71 < 3UL) {
      ret_nxt_motor_get_count72 = motor[n71].current_count;
      goto Lret_nxt_motor_get_count___6;
    } else {
      ret_nxt_motor_get_count72 = 0;
      goto Lret_nxt_motor_get_count___6;
    }
    Lret_nxt_motor_get_count___6:
    temp = ret_nxt_motor_get_count72;
  }
  n24 = (U32___4 )0;
  speed_percent25 = 0;
  brake26 = 1;
  if (n24 < 3UL) {
    if (speed_percent25 > 100) {
      speed_percent25 = 100;
    }
    if (speed_percent25 < -100) {
      speed_percent25 = -100;
    }
    motor[n24].speed_percent = speed_percent25;
    n92 = n24;
    power_percent93 = speed_percent25;
    brake94 = brake26;
    if (n92 < 3UL) {
      io_to_avr.output_percent[n92] = (S8___0 )power_percent93;
      if (brake94) {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n92));
      } else {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n92));
      }
    }
    goto Lret_nxt_avr_set_motor___4;
    Lret_nxt_avr_set_motor___4: ;
  }
  goto Lret_nxt_motor_set_speed___4;
  Lret_nxt_motor_set_speed___4:
  n51 = (U32___4 )0;
  count52 = 0;
  if (n51 < 3UL) {
    motor[n51].current_count = count52;
  }
  goto Lret_nxt_motor_set_count;
  Lret_nxt_motor_set_count:
  n27 = (U32___4 )1;
  speed_percent28 = 0;
  brake29 = 1;
  if (n27 < 3UL) {
    if (speed_percent28 > 100) {
      speed_percent28 = 100;
    }
    if (speed_percent28 < -100) {
      speed_percent28 = -100;
    }
    motor[n27].speed_percent = speed_percent28;
    n95 = n27;
    power_percent96 = speed_percent28;
    brake97 = brake29;
    if (n95 < 3UL) {
      io_to_avr.output_percent[n95] = (S8___0 )power_percent96;
      if (brake97) {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n95));
      } else {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n95));
      }
    }
    goto Lret_nxt_avr_set_motor___5;
    Lret_nxt_avr_set_motor___5: ;
  }
  goto Lret_nxt_motor_set_speed___5;
  Lret_nxt_motor_set_speed___5:
  n30 = (U32___4 )2;
  speed_percent31 = 0;
  brake32 = 1;
  if (n30 < 3UL) {
    if (speed_percent31 > 100) {
      speed_percent31 = 100;
    }
    if (speed_percent31 < -100) {
      speed_percent31 = -100;
    }
    motor[n30].speed_percent = speed_percent31;
    n98 = n30;
    power_percent99 = speed_percent31;
    brake100 = brake32;
    if (n98 < 3UL) {
      io_to_avr.output_percent[n98] = (S8___0 )power_percent99;
      if (brake100) {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n98));
      } else {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n98));
      }
    }
    goto Lret_nxt_avr_set_motor___6;
    Lret_nxt_avr_set_motor___6: ;
  }
  goto Lret_nxt_motor_set_speed___6;
  Lret_nxt_motor_set_speed___6:
  n53 = (U32___4 )1;
  count54 = 0;
  if (n53 < 3UL) {
    motor[n53].current_count = count54;
  }
  goto Lret_nxt_motor_set_count___0;
  Lret_nxt_motor_set_count___0:
  n55 = (U32___4 )2;
  count56 = 0;
  if (n55 < 3UL) {
    motor[n55].current_count = count56;
  }
  goto Lret_nxt_motor_set_count___1;
  Lret_nxt_motor_set_count___1:
  systick_wait_ms((U32___4 )500);
  n33 = (U32___4 )1;
  speed_percent34 = 100;
  brake35 = 1;
  if (n33 < 3UL) {
    if (speed_percent34 > 100) {
      speed_percent34 = 100;
    }
    if (speed_percent34 < -100) {
      speed_percent34 = -100;
    }
    motor[n33].speed_percent = speed_percent34;
    n101 = n33;
    power_percent102 = speed_percent34;
    brake103 = brake35;
    if (n101 < 3UL) {
      io_to_avr.output_percent[n101] = (S8___0 )power_percent102;
      if (brake103) {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n101));
      } else {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n101));
      }
    }
    goto Lret_nxt_avr_set_motor___7;
    Lret_nxt_avr_set_motor___7: ;
  }
  goto Lret_nxt_motor_set_speed___7;
  Lret_nxt_motor_set_speed___7:
  n36 = (U32___4 )2;
  speed_percent37 = 100;
  brake38 = 1;
  if (n36 < 3UL) {
    if (speed_percent37 > 100) {
      speed_percent37 = 100;
    }
    if (speed_percent37 < -100) {
      speed_percent37 = -100;
    }
    motor[n36].speed_percent = speed_percent37;
    n104 = n36;
    power_percent105 = speed_percent37;
    brake106 = brake38;
    if (n104 < 3UL) {
      io_to_avr.output_percent[n104] = (S8___0 )power_percent105;
      if (brake106) {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n104));
      } else {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n104));
      }
    }
    goto Lret_nxt_avr_set_motor___8;
    Lret_nxt_avr_set_motor___8: ;
  }
  goto Lret_nxt_motor_set_speed___8;
  Lret_nxt_motor_set_speed___8:
  systick_wait_ms((U32___4 )1000);
  n73 = (U32___4 )1;
  if (n73 < 3UL) {
    ret_nxt_motor_get_count74 = motor[n73].current_count;
    goto Lret_nxt_motor_get_count___7;
  } else {
    ret_nxt_motor_get_count74 = 0;
    goto Lret_nxt_motor_get_count___7;
  }
  Lret_nxt_motor_get_count___7:
  tmp___1 = ret_nxt_motor_get_count74;
  Right_Count = tmp___1 / 10;
  n75 = (U32___4 )2;
  if (n75 < 3UL) {
    ret_nxt_motor_get_count76 = motor[n75].current_count;
    goto Lret_nxt_motor_get_count___8;
  } else {
    ret_nxt_motor_get_count76 = 0;
    goto Lret_nxt_motor_get_count___8;
  }
  Lret_nxt_motor_get_count___8:
  tmp___2 = ret_nxt_motor_get_count76;
  Left_Count = tmp___2 / 10;
  Steering = 38 + ((Right_Count + Left_Count) / 2) * 2;
  n39 = (U32___4 )1;
  speed_percent40 = -100;
  brake41 = 1;
  if (n39 < 3UL) {
    if (speed_percent40 > 100) {
      speed_percent40 = 100;
    }
    if (speed_percent40 < -100) {
      speed_percent40 = -100;
    }
    motor[n39].speed_percent = speed_percent40;
    n107 = n39;
    power_percent108 = speed_percent40;
    brake109 = brake41;
    if (n107 < 3UL) {
      io_to_avr.output_percent[n107] = (S8___0 )power_percent108;
      if (brake109) {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n107));
      } else {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n107));
      }
    }
    goto Lret_nxt_avr_set_motor___9;
    Lret_nxt_avr_set_motor___9: ;
  }
  goto Lret_nxt_motor_set_speed___9;
  Lret_nxt_motor_set_speed___9:
  n42 = (U32___4 )2;
  speed_percent43 = -100;
  brake44 = 1;
  if (n42 < 3UL) {
    if (speed_percent43 > 100) {
      speed_percent43 = 100;
    }
    if (speed_percent43 < -100) {
      speed_percent43 = -100;
    }
    motor[n42].speed_percent = speed_percent43;
    n110 = n42;
    power_percent111 = speed_percent43;
    brake112 = brake44;
    if (n110 < 3UL) {
      io_to_avr.output_percent[n110] = (S8___0 )power_percent111;
      if (brake112) {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n110));
      } else {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n110));
      }
    }
    goto Lret_nxt_avr_set_motor___10;
    Lret_nxt_avr_set_motor___10: ;
  }
  goto Lret_nxt_motor_set_speed___10;
  Lret_nxt_motor_set_speed___10:
  systick_wait_ms((U32___4 )1000);
  n45 = (U32___4 )1;
  speed_percent46 = 0;
  brake47 = 1;
  if (n45 < 3UL) {
    if (speed_percent46 > 100) {
      speed_percent46 = 100;
    }
    if (speed_percent46 < -100) {
      speed_percent46 = -100;
    }
    motor[n45].speed_percent = speed_percent46;
    n113 = n45;
    power_percent114 = speed_percent46;
    brake115 = brake47;
    if (n113 < 3UL) {
      io_to_avr.output_percent[n113] = (S8___0 )power_percent114;
      if (brake115) {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n113));
      } else {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n113));
      }
    }
    goto Lret_nxt_avr_set_motor___11;
    Lret_nxt_avr_set_motor___11: ;
  }
  goto Lret_nxt_motor_set_speed___11;
  Lret_nxt_motor_set_speed___11:
  n48 = (U32___4 )2;
  speed_percent49 = 0;
  brake50 = 1;
  if (n48 < 3UL) {
    if (speed_percent49 > 100) {
      speed_percent49 = 100;
    }
    if (speed_percent49 < -100) {
      speed_percent49 = -100;
    }
    motor[n48].speed_percent = speed_percent49;
    n116 = n48;
    power_percent117 = speed_percent49;
    brake118 = brake50;
    if (n116 < 3UL) {
      io_to_avr.output_percent[n116] = (S8___0 )power_percent117;
      if (brake118) {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n116));
      } else {
        io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n116));
      }
    }
    goto Lret_nxt_avr_set_motor___12;
    Lret_nxt_avr_set_motor___12: ;
  }
  goto Lret_nxt_motor_set_speed___12;
  Lret_nxt_motor_set_speed___12:
  ReleaseResource(R1);
  TerminateTask();
  return;
}
}
void TaskMainSpeedTask(void)
{


  {
  while (true) {
    WaitEvent((EventMaskType )event1);
    ClearEvent((EventMaskType )event1);
    GetResource(R1);
    if (Current_speed == Speed_L) {
      Current_speed = Speed_H;
    } else
    if (Current_speed == Speed_H) {
      Current_speed = Speed_L;
    }
    Motor_Run_Fun((U8___3 )Pre_Order);
    ReleaseResource(R1);
  }
  TerminateTask();
}
}
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
  while (true) {
    WaitEvent((EventMaskType )event2);
    ClearEvent((EventMaskType )event2);
    GetResource(R1);
    if (Brake == 1) {
      n1 = (U32___4 )1;
      speed_percent2 = 0;
      brake3 = 1;
      if (n1 < 3UL) {
        if (speed_percent2 > 100) {
          speed_percent2 = 100;
        }
        if (speed_percent2 < -100) {
          speed_percent2 = -100;
        }
        motor[n1].speed_percent = speed_percent2;
        n7 = n1;
        power_percent8 = speed_percent2;
        brake9 = brake3;
        if (n7 < 3UL) {
          io_to_avr.output_percent[n7] = (S8___0 )power_percent8;
          if (brake9) {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n7));
          } else {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n7));
          }
        }
        goto Lret_nxt_avr_set_motor;
        Lret_nxt_avr_set_motor: ;
      }
      goto Lret_nxt_motor_set_speed;
      Lret_nxt_motor_set_speed:
      n4 = (U32___4 )2;
      speed_percent5 = 0;
      brake6 = 1;
      if (n4 < 3UL) {
        if (speed_percent5 > 100) {
          speed_percent5 = 100;
        }
        if (speed_percent5 < -100) {
          speed_percent5 = -100;
        }
        motor[n4].speed_percent = speed_percent5;
        n10 = n4;
        power_percent11 = speed_percent5;
        brake12 = brake6;
        if (n10 < 3UL) {
          io_to_avr.output_percent[n10] = (S8___0 )power_percent11;
          if (brake12) {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode | (1 << n10));
          } else {
            io_to_avr.output_mode = (U8___1 )((int )io_to_avr.output_mode & ~ (1 << n10));
          }
        }
        goto Lret_nxt_avr_set_motor___0;
        Lret_nxt_avr_set_motor___0: ;
      }
      goto Lret_nxt_motor_set_speed___0;
      Lret_nxt_motor_set_speed___0: ;
    } else
    if (Brake == 2) {
      if (Current_speed == Speed_H) {
        if (Motor_Run == 1) {
          Slow_brake = Speed_H * 2;
        } else {
          goto _L;
        }
      } else
      _L:
      if (Current_speed == Speed_L) {
        if (Motor_Run == 1) {
          Slow_brake = Speed_L * 2;
        }
      }
      Motor_Run = 0;
    }
    ReleaseResource(R1);
  }
  TerminateTask();
}
}
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
  if (Active_Only_One_Sonar == 0) {
    temp = 0;
    port_id5 = (U8___3 )1;
    port11 = (int )port_id5;
    if (port11 >= 0) {
      if (port11 < 4) {
        ret_i2c_busy12 = (unsigned int )i2c_port[port11].state > 1U;
        goto Lret_i2c_busy;
      }
    }
    ret_i2c_busy12 = 0;
    goto Lret_i2c_busy;
    Lret_i2c_busy:
    tmp6 = ret_i2c_busy12;
    if (tmp6 == 0) {
      distance_state[port_id5] = (S32___0 )data[port_id5];
      port15 = (int )port_id5;
      address16 = (U32___3 )1;
      internal_address17 = 66;
      n_internal_address_bytes18 = 1;
      data19 = & data[port_id5];
      nbytes20 = (U32___3 )1;
      write21 = 0;
      if (port15 < 0) {
        goto Lret_i2c_start_transaction;
      } else
      if (port15 >= 4) {
        goto Lret_i2c_start_transaction;
      }
      port1226 = port15;
      if (port1226 >= 0) {
        if (port1226 < 4) {
          ret_i2c_busy1327 = (unsigned int )i2c_port[port1226].state > 1U;
          goto Lret_i2c_busy___1;
        }
      }
      ret_i2c_busy1327 = 0;
      goto Lret_i2c_busy___1;
      Lret_i2c_busy___1:
      tmp24 = ret_i2c_busy1327;
      if (tmp24) {
        goto Lret_i2c_start_transaction;
      }
      p22 = & i2c_port[port15];
      p22->pt_num = (U32___0 )0;
      p22->pt_begun = (U32___0 )0;
      pt23 = p22->partial_transaction;
      p22->current_pt = pt23;
      memset((void *)pt23, 0, sizeof(p22->partial_transaction));
      if (n_internal_address_bytes18 > 0) {
        p22->addr_int[0] = (U8___0 )(address16 << 1);
        p22->addr_int[1] = (U8___0 )internal_address17;
        pt23->start = (U8___0 )1;
        if (write21) {
          pt23->stop = (U8___0 )0;
        } else {
          pt23->stop = (U8___0 )1;
        }
        pt23->tx = (U8___0 )1;
        pt23->data = p22->addr_int;
        pt23->nbytes = (U16___0 )2;
        pt23 ++;
      }
      if (n_internal_address_bytes18 == 0) {
        goto _L;
      } else
      if (! write21) {
        _L:
        if (n_internal_address_bytes18 > 0) {
          pt23->start = (U8___0 )0;
        } else {
          pt23->start = (U8___0 )1;
        }
        pt23->restart = (U8___0 )(! pt23->start);
        pt23->stop = (U8___0 )0;
        pt23->tx = (U8___0 )1;
        if (write21) {
          tmp___025 = 0;
        } else {
          tmp___025 = 1;
        }
        p22->addr = (U8___0 )((address16 << 1) | (unsigned long )tmp___025);
        pt23->data = & p22->addr;
        pt23->nbytes = (U16___0 )1;
        pt23 ++;
      }
      pt23->start = (U8___0 )0;
      pt23->stop = (U8___0 )1;
      if (write21) {
        pt23->tx = (U8___0 )1;
      } else {
        pt23->tx = (U8___0 )0;
      }
      pt23->data = data19;
      pt23->nbytes = (U16___0 )nbytes20;
      pt23->last_pt = (U8___0 )1;
      p22->state = (i2c_port_state )2;
      goto Lret_i2c_start_transaction;
      Lret_i2c_start_transaction: ;
    }
    ret_ecrobot_get_sonar_sensor7 = distance_state[port_id5];
    goto Lret_ecrobot_get_sonar_sensor;
    Lret_ecrobot_get_sonar_sensor:
    tmp = ret_ecrobot_get_sonar_sensor7;
    temp = (int )tmp;
    if (temp < 50) {
      if (temp > 1) {
        if (Sonar_1 == temp) {
          if (temp != 0) {
            Sonar_Check_1 --;
            if (Sonar_Check_1 == 0) {
              Actual_Sonar_Num_1 = temp;
              Sonar_Check_1 = 1;
            }
          } else {
            Sonar_1 = temp;
            Sonar_Check_1 = 2;
          }
        } else {
          Sonar_1 = temp;
          Sonar_Check_1 = 2;
        }
      } else {
        Actual_Sonar_Num_1 = 100;
      }
    } else {
      Actual_Sonar_Num_1 = 100;
    }
  } else
  if (Active_Only_One_Sonar == 1) {
    temp1 = 0;
    port_id8 = (U8___3 )2;
    port13 = (int )port_id8;
    if (port13 >= 0) {
      if (port13 < 4) {
        ret_i2c_busy14 = (unsigned int )i2c_port[port13].state > 1U;
        goto Lret_i2c_busy___0;
      }
    }
    ret_i2c_busy14 = 0;
    goto Lret_i2c_busy___0;
    Lret_i2c_busy___0:
    tmp9 = ret_i2c_busy14;
    if (tmp9 == 0) {
      distance_state[port_id8] = (S32___0 )data[port_id8];
      port28 = (int )port_id8;
      address29 = (U32___3 )1;
      internal_address30 = 66;
      n_internal_address_bytes31 = 1;
      data32 = & data[port_id8];
      nbytes33 = (U32___3 )1;
      write34 = 0;
      if (port28 < 0) {
        goto Lret_i2c_start_transaction___0;
      } else
      if (port28 >= 4) {
        goto Lret_i2c_start_transaction___0;
      }
      port1239 = port28;
      if (port1239 >= 0) {
        if (port1239 < 4) {
          ret_i2c_busy1340 = (unsigned int )i2c_port[port1239].state > 1U;
          goto Lret_i2c_busy___2;
        }
      }
      ret_i2c_busy1340 = 0;
      goto Lret_i2c_busy___2;
      Lret_i2c_busy___2:
      tmp37 = ret_i2c_busy1340;
      if (tmp37) {
        goto Lret_i2c_start_transaction___0;
      }
      p35 = & i2c_port[port28];
      p35->pt_num = (U32___0 )0;
      p35->pt_begun = (U32___0 )0;
      pt36 = p35->partial_transaction;
      p35->current_pt = pt36;
      memset((void *)pt36, 0, sizeof(p35->partial_transaction));
      if (n_internal_address_bytes31 > 0) {
        p35->addr_int[0] = (U8___0 )(address29 << 1);
        p35->addr_int[1] = (U8___0 )internal_address30;
        pt36->start = (U8___0 )1;
        if (write34) {
          pt36->stop = (U8___0 )0;
        } else {
          pt36->stop = (U8___0 )1;
        }
        pt36->tx = (U8___0 )1;
        pt36->data = p35->addr_int;
        pt36->nbytes = (U16___0 )2;
        pt36 ++;
      }
      if (n_internal_address_bytes31 == 0) {
        goto _L___0;
      } else
      if (! write34) {
        _L___0:
        if (n_internal_address_bytes31 > 0) {
          pt36->start = (U8___0 )0;
        } else {
          pt36->start = (U8___0 )1;
        }
        pt36->restart = (U8___0 )(! pt36->start);
        pt36->stop = (U8___0 )0;
        pt36->tx = (U8___0 )1;
        if (write34) {
          tmp___038 = 0;
        } else {
          tmp___038 = 1;
        }
        p35->addr = (U8___0 )((address29 << 1) | (unsigned long )tmp___038);
        pt36->data = & p35->addr;
        pt36->nbytes = (U16___0 )1;
        pt36 ++;
      }
      pt36->start = (U8___0 )0;
      pt36->stop = (U8___0 )1;
      if (write34) {
        pt36->tx = (U8___0 )1;
      } else {
        pt36->tx = (U8___0 )0;
      }
      pt36->data = data32;
      pt36->nbytes = (U16___0 )nbytes33;
      pt36->last_pt = (U8___0 )1;
      p35->state = (i2c_port_state )2;
      goto Lret_i2c_start_transaction___0;
      Lret_i2c_start_transaction___0: ;
    }
    ret_ecrobot_get_sonar_sensor10 = distance_state[port_id8];
    goto Lret_ecrobot_get_sonar_sensor___0;
    Lret_ecrobot_get_sonar_sensor___0:
    tmp___0 = ret_ecrobot_get_sonar_sensor10;
    temp1 = (int )tmp___0;
    if (temp1 < 50) {
      if (temp1 > 1) {
        if (Sonar_2 == temp1) {
          if (temp1 != 0) {
            Sonar_check_2 --;
            if (Sonar_check_2 == 0) {
              Actual_Sonar_Num_2 = temp1;
              Sonar_check_2 = 1;
            }
          } else {
            Sonar_2 = temp1;
            Sonar_check_2 = 2;
          }
        } else {
          Sonar_2 = temp1;
          Sonar_check_2 = 2;
        }
      } else {
        Actual_Sonar_Num_2 = 100;
      }
    } else {
      Actual_Sonar_Num_2 = 100;
    }
  }
  if (Active_Only_One_Sonar == 0) {
    Active_Only_One_Sonar = 1;
  } else
  if (Active_Only_One_Sonar == 1) {
    Active_Only_One_Sonar = 0;
  }
  TerminateTask();
  return;
}
}
void TaskMainIdleTask(void) ;
static SINT___0 bt_status___0 = 4;
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
  while (true) {
    pin2 = "LEJOS-DONGHYUN";
    connect_bt_slave(pin2);
    open_bt_stream();
    goto Lret_ecrobot_init_bt_slave;
    Lret_ecrobot_init_bt_slave:
    tmp = ecrobot_get_bt_status();
    if (tmp == 7) {
      if (bt_status___0 != 7) {
        updateToo8 = (U32___4 )0;
        if (updateToo8) {
          display_tick = 0;
          nxt_lcd_update();
          goto Lret_display_update;
          Lret_display_update: ;
        }
        goto Lret_display_clear;
        Lret_display_clear:
        x9 = 0;
        y10 = 0;
        display_x = x9;
        display_y = y10;
        goto Lret_display_goto_xy;
        Lret_display_goto_xy:
        str3 = "[BT]";
        while (*str3) {
          if ((int const )*str3 != 10) {
            c4 = (int )*str3;
            if (c4 >= 0) {
              if (c4 < 128) {
                if (display_x >= 0) {
                  if (display_x < 16) {
                    if (display_y >= 0) {
                      if (display_y < 8) {
                        b6 = & (*(display_buffer + display_y))[display_x * 6];
                        f7 = font[c4];
                        i5 = 0;
                        while (i5 < 5) {
                          *b6 = (U8 )*f7;
                          b6 ++;
                          f7 ++;
                          i5 ++;
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
          str3 ++;
        }
        goto Lret_display_string;
        Lret_display_string:
        display_tick = 0;
        nxt_lcd_update();
        goto Lret_display_update___0;
        Lret_display_update___0: ;
      }
    }
    bt_status___0 = ecrobot_get_bt_status();
  }
}
}
# 2401 "follower/follower.c"
extern int create_task() ;
extern int ( create_block)() ;
void main(void)
{
{


  create_task("TaskMainSonarSensing", "TaskMainSonarSensing", 5, 500, 0.045);
  create_task("TaskMainEventDispatcher", "TaskMainEventDispatcher", 4, 5, 0.097);
  create_task("TaskMainInitialize", "TaskMainInitialize", 6, 4, 0.048);
  create_task("TaskMainSpeedTask", "TaskMainSpeedTask", 7, 4, 0.14);
  create_task("TaskMainBrakeTask", "TaskMainBrakeTask", 8, 4, 0.028);
  create_task("TaskMainEventHandler", "TaskMainEventHandler", 3, 10, 0.014);
  create_task("TaskMainIdleTask", "TaskMainIdleTask", 1, 200, 0.014);

  create_block(1196, "TaskMainInitialize", "R1", 1, 6, 0.048);
  create_block(1735, "TaskMainSpeedTask", "R1", 1, 7, 0.011);
  create_block(1767, "TaskMainBrakeTask", "R1", 1, 8, 0.022);


  return;
}

}

# 1 "nxtway_gs/nxtway_gs.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "nxtway_gs/nxtway_gs.c"


typedef unsigned char U8;
typedef signed char S8;
typedef unsigned short U16;
typedef unsigned long U32;
typedef unsigned long size_t;
struct __anonstruct_to_avr_432250394 {
   U8 power ;
   U8 pwm_frequency ;
   S8 output_percent[4] ;
   U8 output_mode ;
   U8 input_power ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_to_avr_432250394 to_avr;
struct __anonstruct_from_avr_708559676 {
   U16 adc_value[4] ;
   U16 buttonsVal ;
   U16 extra ;
   U8 csum ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_from_avr_708559676 from_avr;
struct __anonstruct_nxt_avr_stats_680423455 {
   U32 good_rx ;
   U32 bad_rx ;
   U32 resets ;
   U32 still_busy ;
   U32 not_ok ;
};
typedef unsigned char U8___0;
typedef unsigned long U32___0;
typedef unsigned char byte;
typedef unsigned short TWOBYTES;
typedef unsigned long FOURBYTES;
typedef FOURBYTES STACKWORD;
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
typedef unsigned int AT91_REG___0;
typedef unsigned long size_t___0;
struct __anonstruct_display_array_740464799 {
   Object hdr ;
   U8___0 displayN[9][100] ;
} __attribute__((__packed__)) ;
typedef unsigned long U32___1;
struct motor_struct {
   int current_count ;
   int target_count ;
   int speed_percent ;
   U32___1 last ;
};
typedef unsigned char U8___1;
typedef unsigned long U32___2;
typedef int SINT;
typedef unsigned char U8___2;
typedef unsigned short U16___0;
typedef unsigned long U32___3;
typedef long S32___1;
typedef char CHAR___0;
typedef int SINT___0;
struct __anonstruct_nxt_inputs_83380041___0 {
   U32___3 battery_state ;
   U8___2 buttons_state ;
};
typedef struct __anonstruct_nxt_inputs_83380041___0 nxt_inputs___0;
typedef unsigned char UINT8;
typedef UINT8 StatusType;
typedef unsigned char U8___3;
typedef signed char S8___1;
typedef unsigned short U16___1;
typedef unsigned long U32___4;
typedef long S32___2;
typedef int SINT___1;
typedef float F32___0;
enum __anonenum_MODE_ENUM_460405356 {
    INIT_MODE = 0,
    CAL_MODE = 1,
    CONTROL_MODE = 2
} ;
typedef enum __anonenum_MODE_ENUM_460405356 MODE_ENUM;
void nxt_avr_init(void) ;
void nxt_avr_1kHz_update(void) ;
void nxt_avr_set_motor(U32 n , int power_percent , int brake ) ;
void nxt_avr_power_down(void) ;
U32 buttons_get(void) ;
U32 battery_voltage(void) ;
unsigned long sensor_adc(U32 n ) ;
void nxt_avr_set_input_power(U32 n , U32 power_type ) ;
extern int twi_init(void) ;
extern void twi_start_write(U32 dev_addr , U8 const *data , U32 nBytes ) ;
extern void twi_start_read(U32 dev_addr , U8 *data , U32 nBytes ) ;
extern int twi_status(void) ;
extern void nxt_motor_set_count(unsigned long n , int count ) ;
extern void nxt_motor_set_speed(unsigned long n , int speed_percent , int brake ) ;
extern unsigned long systick_get_ms(void) ;
extern void systick_wait_ms(unsigned long ms ) ;
extern __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1), __leaf__)) memset)(void *__s ,
                                                                                               int __c ,
                                                                                               unsigned long __n ) ;
extern __attribute__((__nothrow__)) size_t ( __attribute__((__nonnull__(1), __leaf__)) strlen)(char const *__s ) __attribute__((__pure__)) ;
void display_init(void) ;
void display_update(void) ;
void display_force_update(void) ;
void display_clear(unsigned long updateToo ) ;
void display_goto_xy(int x , int y ) ;
void display_char(int c ) ;
void display_string(char const *str ) ;
void display_int(int val , unsigned long places ) ;
void display_hex(unsigned long val , unsigned long places ) ;
void display_unsigned(unsigned long val , unsigned long places ) ;
void display_bitmap_copy(unsigned char const *data , unsigned long width , unsigned long depth ,
                         unsigned long x , unsigned long y ) ;
void display_test(void) ;
unsigned char *display_get_buffer(void) ;
void display_set_auto_update(int mode___0 ) ;
int display_tick ;
int display_auto_update ;
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
static U8 data_to_avr[9] ;
static from_avr data_from_avr[2] ;
static from_avr *io_from_avr ;
static U32 from_buf ;
static U16 prev_buttons ;
static U16 button_state ;
static U16 debounce_state ;
static U16 debounce_cnt ;
static struct __anonstruct_nxt_avr_stats_680423455 nxt_avr_stats ;
static U32 update_count ;
static U32 link_state = (U32 )0;
void nxt_lcd_init(U8___0 const *disp ) ;
void nxt_lcd_power_up(void) ;
void nxt_lcd_power_down(void) ;
void nxt_lcd_update(void) ;
void nxt_lcd_force_update(void) ;
void nxt_spi_init(void) ;
void nxt_spi_write(U32___0 CD , U8___0 const *dataM___0 , U32___0 nBytes ) ;
void nxt_spi_set_display(U8___0 const *disp ) ;
void nxt_spi_refresh(void) ;
extern int interrupts_get_and_disable(void) ;
extern void interrupts_enable(void) ;
extern void aic_set_vector(unsigned long vector , unsigned long mode , unsigned long isr ) ;
extern void aic_mask_on(unsigned long vector ) ;
extern void aic_mask_off(unsigned long vector ) ;
U8___0 const *displayM = (U8___0 const *)((U8___0 *)0);
unsigned char dirty = (U8___0 )0;
unsigned char page = (U8___0 )0;
U8___0 const *dataM = (U8___0 const *)((U8___0 *)0);
U8___0 mode = (U8___0 )255;
extern void spi_isr_entry(void) ;
static U8___0 *display = (U8___0 *)0;
static struct __anonstruct_display_array_740464799 display_array ;
static U8___0 (*display_buffer)[100] = display_array.displayN;
static U8___0 const font[128][5] =
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
int display_tick = 0;
int display_auto_update = 1;
int display_x ;
int display_y ;


static struct motor_struct motor[3] ;
extern int i2c_busy(int port ) ;
extern int i2c_start_transaction(int port , unsigned long address , int internal_address ,
                                 int n_internal_address_bytes , unsigned char *data ,
                                 unsigned long nbytes , int write ) ;
extern void bt_receive(U8___1 *buf ) ;
extern void sound_freq_vol(unsigned long freq , unsigned long ms , int vol ) ;
extern unsigned short ecrobot_get_gyro_sensor(unsigned char port_id ) ;
extern void ecrobot_bt_data_logger(signed char data1 , signed char data2 ) ;
static unsigned char bt_status = (U8___1 )4;
static U8___1 receiveBuf[128] ;
static S32___1 distance_state[4] = { (S32___1 )-1, (S32___1 )-1, (S32___1 )-1, (S32___1 )-1};
static U8___2 data[4] = { (U8___2 )0};
U8___2 const NXT_COLORSENSOR_PROTOCOLS[7] = { (U8___2 const )176, (U8___2 const )112, (U8___2 const )240, (U8___2 const )8,
        (U8___2 const )176, (U8___2 const )136, (U8___2 const )136};
static nxt_inputs___0 ecrobot_inputs ;
extern StatusType TerminateTask(void) ;
MODE_ENUM nxtway_gs_mode = (MODE_ENUM )0;
U8___3 obstacle_flag ;
static U32___4 gyro_offset ;
static U32___4 avg_cnt ;
static U32___4 cal_start_time ;
static U8___3 bt_receive_buf[32] ;
extern int balance_init() ;
extern int balance_control() ;
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
  switch ((unsigned int )nxtway_gs_mode) {
  case 0U:
  gyro_offset = (U32___4 )0;
  avg_cnt = (U32___4 )0;
  i = 0;
  while (i < 32) {
    bt_receive_buf[i] = (U8___3 )0;
    i ++;
  }
  balance_init();
  nxt_motor_set_count((U32___4 )2, 0);
  nxt_motor_set_count((U32___4 )1, 0);
  tmp12 = systick_get_ms();
  ret_ecrobot_get_systick_ms13 = tmp12;
  goto Lret_ecrobot_get_systick_ms;
  Lret_ecrobot_get_systick_ms:
  cal_start_time = ret_ecrobot_get_systick_ms13;
  nxtway_gs_mode = (MODE_ENUM )1;
  break;
  case 1U:
  tmp = ecrobot_get_gyro_sensor((U8___3 )3);
  gyro_offset += (U32___4 )tmp;
  avg_cnt ++;
  tmp14 = systick_get_ms();
  ret_ecrobot_get_systick_ms15 = tmp14;
  goto Lret_ecrobot_get_systick_ms___0;
  Lret_ecrobot_get_systick_ms___0:
  tmp___0 = ret_ecrobot_get_systick_ms15;
  if (tmp___0 - cal_start_time >= 1000UL) {
    gyro_offset /= avg_cnt;
    freq16 = (U32___4 )440U;
    ms17 = (U32___4 )500U;
    vol18 = (U32___4 )30U;
    sound_freq_vol(freq16, ms17, (int )vol18);
    goto Lret_ecrobot_sound_tone;
    Lret_ecrobot_sound_tone:
    nxtway_gs_mode = (MODE_ENUM )2;
  }
  break;
  case 2U:
  buf20 = bt_receive_buf;
  bufLen21 = (U32___4 )32;
  if ((int )bt_status == 7) {
    if (bufLen21 <= 126UL) {
      bt_receive(& receiveBuf[0]);
      len23 = (U32___2 )receiveBuf[0];
      if (len23 > 0UL) {
        if (len23 <= bufLen21) {
          i22 = 0;
          while ((U32___2 )i22 < len23) {
            *(buf20 + i22) = receiveBuf[i22 + 2];
            i22 ++;
          }
          goto Lret_ecrobot_read_bt_packet;
        }
      }
    }
  }
  goto Lret_ecrobot_read_bt_packet;
  Lret_ecrobot_read_bt_packet:
  cmd_forward = (S8___1 )(- ((int )((S8___1 )bt_receive_buf[0])));
  cmd_turn = (S8___1 )bt_receive_buf[1];
  if ((int )obstacle_flag == 1) {
    cmd_forward = (S8___1 )-100;
    cmd_turn = (S8___1 )0;
  }
  ret_ecrobot_get_battery_voltage19 = (U16___0 )ecrobot_inputs.battery_state;
  goto Lret_ecrobot_get_battery_voltage;
  Lret_ecrobot_get_battery_voltage:
  tmp___1 = ret_ecrobot_get_battery_voltage19;
  n24 = (U32___4 )1;
  if (n24 < 3UL) {
    ret_nxt_motor_get_count25 = motor[n24].current_count;
    goto Lret_nxt_motor_get_count;
  } else {
    ret_nxt_motor_get_count25 = 0;
    goto Lret_nxt_motor_get_count;
  }
  Lret_nxt_motor_get_count:
  tmp___2 = ret_nxt_motor_get_count25;
  n26 = (U32___4 )2;
  if (n26 < 3UL) {
    ret_nxt_motor_get_count27 = motor[n26].current_count;
    goto Lret_nxt_motor_get_count___0;
  } else {
    ret_nxt_motor_get_count27 = 0;
    goto Lret_nxt_motor_get_count___0;
  }
  Lret_nxt_motor_get_count___0:
  tmp___3 = ret_nxt_motor_get_count27;
  tmp___4 = ecrobot_get_gyro_sensor((U8___3 )3);
  balance_control((double )((F32___0 )cmd_forward), (double )((F32___0 )cmd_turn),
                  (double )((F32___0 )tmp___4), (double )((F32___0 )gyro_offset),
                  (double )((F32___0 )tmp___3), (double )((F32___0 )tmp___2), (double )((F32___0 )tmp___1),
                  & pwm_l, & pwm_r);
  nxt_motor_set_speed((U32___4 )2, (int )pwm_l, 1);
  nxt_motor_set_speed((U32___4 )1, (int )pwm_r, 1);
  ecrobot_bt_data_logger(cmd_forward, cmd_turn);
  break;
  default:
  nxt_motor_set_speed((U32___4 )2, 0, 1);
  nxt_motor_set_speed((U32___4 )1, 0, 1);
  break;
  }
  TerminateTask();
  return;
}
}
void TaskMainOSEK_Task_ts2(void)
{
  S32___2 tmp ;
  U8___2 port_id2 ;
  int tmp3 ;
  long ret_ecrobot_get_sonar_sensor4 ;

  {
  obstacle_flag = (U8___3 )0;
  if ((unsigned int )nxtway_gs_mode == 2U) {
    port_id2 = (U8___3 )1;
    tmp3 = i2c_busy((int )port_id2);
    if (tmp3 == 0) {
      distance_state[port_id2] = (S32___1 )data[port_id2];
      i2c_start_transaction((int )port_id2, (U32___3 )1, 66, 1, & data[port_id2],
                            (U32___3 )1, 0);
    }
    ret_ecrobot_get_sonar_sensor4 = distance_state[port_id2];
    goto Lret_ecrobot_get_sonar_sensor;
    Lret_ecrobot_get_sonar_sensor:
    tmp = ret_ecrobot_get_sonar_sensor4;
    if (tmp <= 25L) {
      obstacle_flag = (U8___3 )1;
    }
  }
  TerminateTask();
  return;
}
}
extern int getDistance() ;
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
  while (1) {
    target_name1 = "NXTway-GS OSEK";
    updateToo236 = (U32___3 )0;
    memset((void *)display_buffer, 0, (size_t___0 )800);
    if (updateToo236) {
      display_tick = 0;
      nxt_lcd_update();
      goto Lret_display_update___0;
      Lret_display_update___0: ;
    }
    goto Lret_display_clear;
    Lret_display_clear:
    x220 = 0;
    y221 = 0;
    display_x = x220;
    display_y = y221;
    goto Lret_display_goto_xy;
    Lret_display_goto_xy:
    str120 = target_name1;
    while (*str120) {
      if ((int const )*str120 != 10) {
        c140 = (int )*str120;
        if (c140 >= 0) {
          if (c140 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b142 = & (*(display_buffer + display_y))[display_x * 6];
                    f143 = font[c140];
                    i141 = 0;
                    while (i141 < 5) {
                      *b142 = (U8___0 )*f143;
                      b142 ++;
                      f143 ++;
                      i141 ++;
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
      str120 ++;
    }
    goto Lret_display_string;
    Lret_display_string:
    x222 = 0;
    y223 = 1;
    display_x = x222;
    display_y = y223;
    goto Lret_display_goto_xy___0;
    Lret_display_goto_xy___0:
    str121 = "TIME:";
    while (*str121) {
      if ((int const )*str121 != 10) {
        c144 = (int )*str121;
        if (c144 >= 0) {
          if (c144 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b146 = & (*(display_buffer + display_y))[display_x * 6];
                    f147 = font[c144];
                    i145 = 0;
                    while (i145 < 5) {
                      *b146 = (U8___0 )*f147;
                      b146 ++;
                      f147 ++;
                      i145 ++;
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
      str121 ++;
    }
    goto Lret_display_string___0;
    Lret_display_string___0:
    tmp2 = systick_get_ms();
    val20 = tmp2 / 1000UL;
    places21 = (U32___3 )0;
    val36 = val20;
    places37 = places21;
    sign38 = (U32___0 )0;
    p40 = & x39[11];
    p_count41 = 0;
    *p40 = (char)0;
    if (places37 > 11UL) {
      places37 = (U32___0 )11;
    }
    while (val36) {
      p40 --;
      p_count41 ++;
      *p40 = (char )(val36 % 10UL + 48UL);
      val36 /= 10UL;
    }
    if (! p_count41) {
      p40 --;
      p_count41 ++;
      *p40 = (char )'0';
    }
    if (sign38) {
      p40 --;
      p_count41 ++;
      *p40 = (char )'-';
    }
    while ((U32___0 )p_count41 < places37) {
      p40 --;
      p_count41 ++;
      *p40 = (char )' ';
    }
    str122 = (char const *)p40;
    while (*str122) {
      if ((int const )*str122 != 10) {
        c148 = (int )*str122;
        if (c148 >= 0) {
          if (c148 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b150 = & (*(display_buffer + display_y))[display_x * 6];
                    f151 = font[c148];
                    i149 = 0;
                    while (i149 < 5) {
                      *b150 = (U8___0 )*f151;
                      b150 ++;
                      f151 ++;
                      i149 ++;
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
      str122 ++;
    }
    goto Lret_display_string___1;
    Lret_display_string___1: ;
    goto Lret_display_unsigned_worker;
    Lret_display_unsigned_worker: ;
    goto Lret_display_unsigned;
    Lret_display_unsigned:
    x224 = 0;
    y225 = 2;
    display_x = x224;
    display_y = y225;
    goto Lret_display_goto_xy___1;
    Lret_display_goto_xy___1:
    str123 = "BATT:";
    while (*str123) {
      if ((int const )*str123 != 10) {
        c152 = (int )*str123;
        if (c152 >= 0) {
          if (c152 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b154 = & (*(display_buffer + display_y))[display_x * 6];
                    f155 = font[c152];
                    i153 = 0;
                    while (i153 < 5) {
                      *b154 = (U8___0 )*f155;
                      b154 ++;
                      f155 ++;
                      i153 ++;
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
      str123 ++;
    }
    goto Lret_display_string___2;
    Lret_display_string___2:
    val22 = ecrobot_inputs.battery_state / 100UL;
    places23 = (U32___3 )0;
    val42 = val22;
    places43 = places23;
    sign44 = (U32___0 )0;
    p46 = & x45[11];
    p_count47 = 0;
    *p46 = (char)0;
    if (places43 > 11UL) {
      places43 = (U32___0 )11;
    }
    while (val42) {
      p46 --;
      p_count47 ++;
      *p46 = (char )(val42 % 10UL + 48UL);
      val42 /= 10UL;
    }
    if (! p_count47) {
      p46 --;
      p_count47 ++;
      *p46 = (char )'0';
    }
    if (sign44) {
      p46 --;
      p_count47 ++;
      *p46 = (char )'-';
    }
    while ((U32___0 )p_count47 < places43) {
      p46 --;
      p_count47 ++;
      *p46 = (char )' ';
    }
    str124 = (char const *)p46;
    while (*str124) {
      if ((int const )*str124 != 10) {
        c156 = (int )*str124;
        if (c156 >= 0) {
          if (c156 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b158 = & (*(display_buffer + display_y))[display_x * 6];
                    f159 = font[c156];
                    i157 = 0;
                    while (i157 < 5) {
                      *b158 = (U8___0 )*f159;
                      b158 ++;
                      f159 ++;
                      i157 ++;
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
      str124 ++;
    }
    goto Lret_display_string___3;
    Lret_display_string___3: ;
    goto Lret_display_unsigned_worker___0;
    Lret_display_unsigned_worker___0: ;
    goto Lret_display_unsigned___0;
    Lret_display_unsigned___0:
    x226 = 0;
    y227 = 3;
    display_x = x226;
    display_y = y227;
    goto Lret_display_goto_xy___2;
    Lret_display_goto_xy___2:
    str125 = "REV: ";
    while (*str125) {
      if ((int const )*str125 != 10) {
        c160 = (int )*str125;
        if (c160 >= 0) {
          if (c160 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b162 = & (*(display_buffer + display_y))[display_x * 6];
                    f163 = font[c160];
                    i161 = 0;
                    while (i161 < 5) {
                      *b162 = (U8___0 )*f163;
                      b162 ++;
                      f163 ++;
                      i161 ++;
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
      str125 ++;
    }
    goto Lret_display_string___4;
    Lret_display_string___4:
    n14 = (U32___3 )0;
    if (n14 < 3UL) {
      ret_nxt_motor_get_count15 = motor[n14].current_count;
      goto Lret_nxt_motor_get_count;
    } else {
      ret_nxt_motor_get_count15 = 0;
      goto Lret_nxt_motor_get_count;
    }
    Lret_nxt_motor_get_count:
    tmp___03 = ret_nxt_motor_get_count15;
    val84 = tmp___03;
    places85 = (U32___3 )0;
    if (val84 < 0) {
      tmp86 = - val84;
    } else {
      tmp86 = val84;
    }
    val487 = (U32___0 )tmp86;
    places588 = places85;
    sign689 = (U32___0 )(val84 < 0);
    p891 = & x790[11];
    p_count992 = 0;
    *p891 = (char)0;
    if (places588 > 11UL) {
      places588 = (U32___0 )11;
    }
    while (val487) {
      p891 --;
      p_count992 ++;
      *p891 = (char )(val487 % 10UL + 48UL);
      val487 /= 10UL;
    }
    if (! p_count992) {
      p891 --;
      p_count992 ++;
      *p891 = (char )'0';
    }
    if (sign689) {
      p891 --;
      p_count992 ++;
      *p891 = (char )'-';
    }
    while ((U32___0 )p_count992 < places588) {
      p891 --;
      p_count992 ++;
      *p891 = (char )' ';
    }
    str126 = (char const *)p891;
    while (*str126) {
      if ((int const )*str126 != 10) {
        c164 = (int )*str126;
        if (c164 >= 0) {
          if (c164 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b166 = & (*(display_buffer + display_y))[display_x * 6];
                    f167 = font[c164];
                    i165 = 0;
                    while (i165 < 5) {
                      *b166 = (U8___0 )*f167;
                      b166 ++;
                      f167 ++;
                      i165 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___5;
        Lret_display_char___5:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str126 ++;
    }
    goto Lret_display_string___5;
    Lret_display_string___5: ;
    goto Lret_display_unsigned_worker___7;
    Lret_display_unsigned_worker___7: ;
    goto Lret_display_int;
    Lret_display_int:
    n16 = (U32___3 )1;
    if (n16 < 3UL) {
      ret_nxt_motor_get_count17 = motor[n16].current_count;
      goto Lret_nxt_motor_get_count___0;
    } else {
      ret_nxt_motor_get_count17 = 0;
      goto Lret_nxt_motor_get_count___0;
    }
    Lret_nxt_motor_get_count___0:
    tmp___14 = ret_nxt_motor_get_count17;
    val93 = tmp___14;
    places94 = (U32___3 )6;
    if (val93 < 0) {
      tmp95 = - val93;
    } else {
      tmp95 = val93;
    }
    val496 = (U32___0 )tmp95;
    places597 = places94;
    sign698 = (U32___0 )(val93 < 0);
    p8100 = & x799[11];
    p_count9101 = 0;
    *p8100 = (char)0;
    if (places597 > 11UL) {
      places597 = (U32___0 )11;
    }
    while (val496) {
      p8100 --;
      p_count9101 ++;
      *p8100 = (char )(val496 % 10UL + 48UL);
      val496 /= 10UL;
    }
    if (! p_count9101) {
      p8100 --;
      p_count9101 ++;
      *p8100 = (char )'0';
    }
    if (sign698) {
      p8100 --;
      p_count9101 ++;
      *p8100 = (char )'-';
    }
    while ((U32___0 )p_count9101 < places597) {
      p8100 --;
      p_count9101 ++;
      *p8100 = (char )' ';
    }
    str127 = (char const *)p8100;
    while (*str127) {
      if ((int const )*str127 != 10) {
        c168 = (int )*str127;
        if (c168 >= 0) {
          if (c168 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b170 = & (*(display_buffer + display_y))[display_x * 6];
                    f171 = font[c168];
                    i169 = 0;
                    while (i169 < 5) {
                      *b170 = (U8___0 )*f171;
                      b170 ++;
                      f171 ++;
                      i169 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___6;
        Lret_display_char___6:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str127 ++;
    }
    goto Lret_display_string___6;
    Lret_display_string___6: ;
    goto Lret_display_unsigned_worker___8;
    Lret_display_unsigned_worker___8: ;
    goto Lret_display_int___0;
    Lret_display_int___0:
    x228 = 0;
    y229 = 4;
    display_x = x228;
    display_y = y229;
    goto Lret_display_goto_xy___3;
    Lret_display_goto_xy___3:
    str128 = "     ";
    while (*str128) {
      if ((int const )*str128 != 10) {
        c172 = (int )*str128;
        if (c172 >= 0) {
          if (c172 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b174 = & (*(display_buffer + display_y))[display_x * 6];
                    f175 = font[c172];
                    i173 = 0;
                    while (i173 < 5) {
                      *b174 = (U8___0 )*f175;
                      b174 ++;
                      f175 ++;
                      i173 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___7;
        Lret_display_char___7:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str128 ++;
    }
    goto Lret_display_string___7;
    Lret_display_string___7:
    n18 = (U32___3 )2;
    if (n18 < 3UL) {
      ret_nxt_motor_get_count19 = motor[n18].current_count;
      goto Lret_nxt_motor_get_count___1;
    } else {
      ret_nxt_motor_get_count19 = 0;
      goto Lret_nxt_motor_get_count___1;
    }
    Lret_nxt_motor_get_count___1:
    tmp___25 = ret_nxt_motor_get_count19;
    val102 = tmp___25;
    places103 = (U32___3 )0;
    if (val102 < 0) {
      tmp104 = - val102;
    } else {
      tmp104 = val102;
    }
    val4105 = (U32___0 )tmp104;
    places5106 = places103;
    sign6107 = (U32___0 )(val102 < 0);
    p8109 = & x7108[11];
    p_count9110 = 0;
    *p8109 = (char)0;
    if (places5106 > 11UL) {
      places5106 = (U32___0 )11;
    }
    while (val4105) {
      p8109 --;
      p_count9110 ++;
      *p8109 = (char )(val4105 % 10UL + 48UL);
      val4105 /= 10UL;
    }
    if (! p_count9110) {
      p8109 --;
      p_count9110 ++;
      *p8109 = (char )'0';
    }
    if (sign6107) {
      p8109 --;
      p_count9110 ++;
      *p8109 = (char )'-';
    }
    while ((U32___0 )p_count9110 < places5106) {
      p8109 --;
      p_count9110 ++;
      *p8109 = (char )' ';
    }
    str129 = (char const *)p8109;
    while (*str129) {
      if ((int const )*str129 != 10) {
        c176 = (int )*str129;
        if (c176 >= 0) {
          if (c176 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b178 = & (*(display_buffer + display_y))[display_x * 6];
                    f179 = font[c176];
                    i177 = 0;
                    while (i177 < 5) {
                      *b178 = (U8___0 )*f179;
                      b178 ++;
                      f179 ++;
                      i177 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___8;
        Lret_display_char___8:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str129 ++;
    }
    goto Lret_display_string___8;
    Lret_display_string___8: ;
    goto Lret_display_unsigned_worker___9;
    Lret_display_unsigned_worker___9: ;
    goto Lret_display_int___1;
    Lret_display_int___1:
    x230 = 0;
    y231 = 5;
    display_x = x230;
    display_y = y231;
    goto Lret_display_goto_xy___4;
    Lret_display_goto_xy___4:
    str130 = "ADC: ";
    while (*str130) {
      if ((int const )*str130 != 10) {
        c180 = (int )*str130;
        if (c180 >= 0) {
          if (c180 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b182 = & (*(display_buffer + display_y))[display_x * 6];
                    f183 = font[c180];
                    i181 = 0;
                    while (i181 < 5) {
                      *b182 = (U8___0 )*f183;
                      b182 ++;
                      f183 ++;
                      i181 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___9;
        Lret_display_char___9:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str130 ++;
    }
    goto Lret_display_string___9;
    Lret_display_string___9:
    {
    n237 = (U32___3 )0;
    {
    if (n237 < 4UL) {
      {
      ret_sensor_adc238 = (U32 )io_from_avr->adc_value[n237];
      goto Lret_sensor_adc;
      }
    } else {
      {
      ret_sensor_adc238 = (U32 )0;
      goto Lret_sensor_adc;
      }
    }
    }
    Lret_sensor_adc:
    tmp___36 = ret_sensor_adc238;
    val24 = tmp___36;
    places25 = (U32___3 )0;
    val48 = val24;
    places49 = places25;
    sign50 = (U32___0 )0;
    p52 = & x51[11];
    p_count53 = 0;
    *p52 = (char)0;
    }
    if (places49 > 11UL) {
      places49 = (U32___0 )11;
    }
    while (val48) {
      p52 --;
      p_count53 ++;
      *p52 = (char )(val48 % 10UL + 48UL);
      val48 /= 10UL;
    }
    if (! p_count53) {
      p52 --;
      p_count53 ++;
      *p52 = (char )'0';
    }
    if (sign50) {
      p52 --;
      p_count53 ++;
      *p52 = (char )'-';
    }
    while ((U32___0 )p_count53 < places49) {
      p52 --;
      p_count53 ++;
      *p52 = (char )' ';
    }
    str131 = (char const *)p52;
    while (*str131) {
      if ((int const )*str131 != 10) {
        c184 = (int )*str131;
        if (c184 >= 0) {
          if (c184 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b186 = & (*(display_buffer + display_y))[display_x * 6];
                    f187 = font[c184];
                    i185 = 0;
                    while (i185 < 5) {
                      *b186 = (U8___0 )*f187;
                      b186 ++;
                      f187 ++;
                      i185 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___10;
        Lret_display_char___10:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str131 ++;
    }
    goto Lret_display_string___10;
    Lret_display_string___10: ;
    goto Lret_display_unsigned_worker___1;
    Lret_display_unsigned_worker___1: ;
    goto Lret_display_unsigned___1;
    Lret_display_unsigned___1:
    {
    n239 = (U32___3 )1;
    {
    if (n239 < 4UL) {
      {
      ret_sensor_adc240 = (U32 )io_from_avr->adc_value[n239];
      goto Lret_sensor_adc___0;
      }
    } else {
      {
      ret_sensor_adc240 = (U32 )0;
      goto Lret_sensor_adc___0;
      }
    }
    }
    Lret_sensor_adc___0:
    tmp___47 = ret_sensor_adc240;
    val26 = tmp___47;
    places27 = (U32___3 )5;
    val54 = val26;
    places55 = places27;
    sign56 = (U32___0 )0;
    p58 = & x57[11];
    p_count59 = 0;
    *p58 = (char)0;
    }
    if (places55 > 11UL) {
      places55 = (U32___0 )11;
    }
    while (val54) {
      p58 --;
      p_count59 ++;
      *p58 = (char )(val54 % 10UL + 48UL);
      val54 /= 10UL;
    }
    if (! p_count59) {
      p58 --;
      p_count59 ++;
      *p58 = (char )'0';
    }
    if (sign56) {
      p58 --;
      p_count59 ++;
      *p58 = (char )'-';
    }
    while ((U32___0 )p_count59 < places55) {
      p58 --;
      p_count59 ++;
      *p58 = (char )' ';
    }
    str132 = (char const *)p58;
    while (*str132) {
      if ((int const )*str132 != 10) {
        c188 = (int )*str132;
        if (c188 >= 0) {
          if (c188 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b190 = & (*(display_buffer + display_y))[display_x * 6];
                    f191 = font[c188];
                    i189 = 0;
                    while (i189 < 5) {
                      *b190 = (U8___0 )*f191;
                      b190 ++;
                      f191 ++;
                      i189 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___11;
        Lret_display_char___11:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str132 ++;
    }
    goto Lret_display_string___11;
    Lret_display_string___11: ;
    goto Lret_display_unsigned_worker___2;
    Lret_display_unsigned_worker___2: ;
    goto Lret_display_unsigned___2;
    Lret_display_unsigned___2:
    x232 = 0;
    y233 = 6;
    display_x = x232;
    display_y = y233;
    goto Lret_display_goto_xy___5;
    Lret_display_goto_xy___5:
    str133 = "     ";
    while (*str133) {
      if ((int const )*str133 != 10) {
        c192 = (int )*str133;
        if (c192 >= 0) {
          if (c192 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b194 = & (*(display_buffer + display_y))[display_x * 6];
                    f195 = font[c192];
                    i193 = 0;
                    while (i193 < 5) {
                      *b194 = (U8___0 )*f195;
                      b194 ++;
                      f195 ++;
                      i193 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___12;
        Lret_display_char___12:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str133 ++;
    }
    goto Lret_display_string___12;
    Lret_display_string___12:
    {
    n241 = (U32___3 )2;
    {
    if (n241 < 4UL) {
      {
      ret_sensor_adc242 = (U32 )io_from_avr->adc_value[n241];
      goto Lret_sensor_adc___1;
      }
    } else {
      {
      ret_sensor_adc242 = (U32 )0;
      goto Lret_sensor_adc___1;
      }
    }
    }
    Lret_sensor_adc___1:
    tmp___58 = ret_sensor_adc242;
    val28 = tmp___58;
    places29 = (U32___3 )0;
    val60 = val28;
    places61 = places29;
    sign62 = (U32___0 )0;
    p64 = & x63[11];
    p_count65 = 0;
    *p64 = (char)0;
    }
    if (places61 > 11UL) {
      places61 = (U32___0 )11;
    }
    while (val60) {
      p64 --;
      p_count65 ++;
      *p64 = (char )(val60 % 10UL + 48UL);
      val60 /= 10UL;
    }
    if (! p_count65) {
      p64 --;
      p_count65 ++;
      *p64 = (char )'0';
    }
    if (sign62) {
      p64 --;
      p_count65 ++;
      *p64 = (char )'-';
    }
    while ((U32___0 )p_count65 < places61) {
      p64 --;
      p_count65 ++;
      *p64 = (char )' ';
    }
    str134 = (char const *)p64;
    while (*str134) {
      if ((int const )*str134 != 10) {
        c196 = (int )*str134;
        if (c196 >= 0) {
          if (c196 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b198 = & (*(display_buffer + display_y))[display_x * 6];
                    f199 = font[c196];
                    i197 = 0;
                    while (i197 < 5) {
                      *b198 = (U8___0 )*f199;
                      b198 ++;
                      f199 ++;
                      i197 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___13;
        Lret_display_char___13:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str134 ++;
    }
    goto Lret_display_string___13;
    Lret_display_string___13: ;
    goto Lret_display_unsigned_worker___3;
    Lret_display_unsigned_worker___3: ;
    goto Lret_display_unsigned___3;
    Lret_display_unsigned___3:
    {
    n243 = (U32___3 )3;
    {
    if (n243 < 4UL) {
      {
      ret_sensor_adc244 = (U32 )io_from_avr->adc_value[n243];
      goto Lret_sensor_adc___2;
      }
    } else {
      {
      ret_sensor_adc244 = (U32 )0;
      goto Lret_sensor_adc___2;
      }
    }
    }
    Lret_sensor_adc___2:
    tmp___69 = ret_sensor_adc244;
    val30 = tmp___69;
    places31 = (U32___3 )5;
    val66 = val30;
    places67 = places31;
    sign68 = (U32___0 )0;
    p70 = & x69[11];
    p_count71 = 0;
    *p70 = (char)0;
    }
    if (places67 > 11UL) {
      places67 = (U32___0 )11;
    }
    while (val66) {
      p70 --;
      p_count71 ++;
      *p70 = (char )(val66 % 10UL + 48UL);
      val66 /= 10UL;
    }
    if (! p_count71) {
      p70 --;
      p_count71 ++;
      *p70 = (char )'0';
    }
    if (sign68) {
      p70 --;
      p_count71 ++;
      *p70 = (char )'-';
    }
    while ((U32___0 )p_count71 < places67) {
      p70 --;
      p_count71 ++;
      *p70 = (char )' ';
    }
    str135 = (char const *)p70;
    while (*str135) {
      if ((int const )*str135 != 10) {
        c200 = (int )*str135;
        if (c200 >= 0) {
          if (c200 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b202 = & (*(display_buffer + display_y))[display_x * 6];
                    f203 = font[c200];
                    i201 = 0;
                    while (i201 < 5) {
                      *b202 = (U8___0 )*f203;
                      b202 ++;
                      f203 ++;
                      i201 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___14;
        Lret_display_char___14:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str135 ++;
    }
    goto Lret_display_string___14;
    Lret_display_string___14: ;
    goto Lret_display_unsigned_worker___4;
    Lret_display_unsigned_worker___4: ;
    goto Lret_display_unsigned___4;
    Lret_display_unsigned___4:
    x234 = 0;
    y235 = 7;
    display_x = x234;
    display_y = y235;
    goto Lret_display_goto_xy___6;
    Lret_display_goto_xy___6:
    str136 = "BT/DST: ";
    while (*str136) {
      if ((int const )*str136 != 10) {
        c204 = (int )*str136;
        if (c204 >= 0) {
          if (c204 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b206 = & (*(display_buffer + display_y))[display_x * 6];
                    f207 = font[c204];
                    i205 = 0;
                    while (i205 < 5) {
                      *b206 = (U8___0 )*f207;
                      b206 ++;
                      f207 ++;
                      i205 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___15;
        Lret_display_char___15:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str136 ++;
    }
    goto Lret_display_string___15;
    Lret_display_string___15:
    ret_ecrobot_get_bt_status13 = (SINT )bt_status;
    goto Lret_ecrobot_get_bt_status;
    Lret_ecrobot_get_bt_status:
    tmp___710 = ret_ecrobot_get_bt_status13;
    if (tmp___710 == 7) {
      val32 = (U32___3 )1;
      places33 = (U32___3 )0;
      val72 = val32;
      places73 = places33;
      sign74 = (U32___0 )0;
      p76 = & x75[11];
      p_count77 = 0;
      *p76 = (char)0;
      if (places73 > 11UL) {
        places73 = (U32___0 )11;
      }
      while (val72) {
        p76 --;
        p_count77 ++;
        *p76 = (char )(val72 % 10UL + 48UL);
        val72 /= 10UL;
      }
      if (! p_count77) {
        p76 --;
        p_count77 ++;
        *p76 = (char )'0';
      }
      if (sign74) {
        p76 --;
        p_count77 ++;
        *p76 = (char )'-';
      }
      while ((U32___0 )p_count77 < places73) {
        p76 --;
        p_count77 ++;
        *p76 = (char )' ';
      }
      str137 = (char const *)p76;
      while (*str137) {
        if ((int const )*str137 != 10) {
          c208 = (int )*str137;
          if (c208 >= 0) {
            if (c208 < 128) {
              if (display_x >= 0) {
                if (display_x < 16) {
                  if (display_y >= 0) {
                    if (display_y < 8) {
                      b210 = & (*(display_buffer + display_y))[display_x * 6];
                      f211 = font[c208];
                      i209 = 0;
                      while (i209 < 5) {
                        *b210 = (U8___0 )*f211;
                        b210 ++;
                        f211 ++;
                        i209 ++;
                      }
                    }
                  }
                }
              }
            }
          }
          goto Lret_display_char___16;
          Lret_display_char___16:
          display_x ++;
        } else {
          display_x = 0;
          display_y ++;
        }
        str137 ++;
      }
      goto Lret_display_string___16;
      Lret_display_string___16: ;
      goto Lret_display_unsigned_worker___5;
      Lret_display_unsigned_worker___5: ;
      goto Lret_display_unsigned___5;
      Lret_display_unsigned___5: ;
    } else {
      val34 = (U32___3 )0;
      places35 = (U32___3 )0;
      val78 = val34;
      places79 = places35;
      sign80 = (U32___0 )0;
      p82 = & x81[11];
      p_count83 = 0;
      *p82 = (char)0;
      if (places79 > 11UL) {
        places79 = (U32___0 )11;
      }
      while (val78) {
        p82 --;
        p_count83 ++;
        *p82 = (char )(val78 % 10UL + 48UL);
        val78 /= 10UL;
      }
      if (! p_count83) {
        p82 --;
        p_count83 ++;
        *p82 = (char )'0';
      }
      if (sign80) {
        p82 --;
        p_count83 ++;
        *p82 = (char )'-';
      }
      while ((U32___0 )p_count83 < places79) {
        p82 --;
        p_count83 ++;
        *p82 = (char )' ';
      }
      str138 = (char const *)p82;
      while (*str138) {
        if ((int const )*str138 != 10) {
          c212 = (int )*str138;
          if (c212 >= 0) {
            if (c212 < 128) {
              if (display_x >= 0) {
                if (display_x < 16) {
                  if (display_y >= 0) {
                    if (display_y < 8) {
                      b214 = & (*(display_buffer + display_y))[display_x * 6];
                      f215 = font[c212];
                      i213 = 0;
                      while (i213 < 5) {
                        *b214 = (U8___0 )*f215;
                        b214 ++;
                        f215 ++;
                        i213 ++;
                      }
                    }
                  }
                }
              }
            }
          }
          goto Lret_display_char___17;
          Lret_display_char___17:
          display_x ++;
        } else {
          display_x = 0;
          display_y ++;
        }
        str138 ++;
      }
      goto Lret_display_string___17;
      Lret_display_string___17: ;
      goto Lret_display_unsigned_worker___6;
      Lret_display_unsigned_worker___6: ;
      goto Lret_display_unsigned___6;
      Lret_display_unsigned___6: ;
    }
    tmp = getDistance();
    tmp___811 = (S32___1 )tmp;
    val111 = (int )tmp___811;
    places112 = (U32___3 )5;
    if (val111 < 0) {
      tmp113 = - val111;
    } else {
      tmp113 = val111;
    }
    val4114 = (U32___0 )tmp113;
    places5115 = places112;
    sign6116 = (U32___0 )(val111 < 0);
    p8118 = & x7117[11];
    p_count9119 = 0;
    *p8118 = (char)0;
    if (places5115 > 11UL) {
      places5115 = (U32___0 )11;
    }
    while (val4114) {
      p8118 --;
      p_count9119 ++;
      *p8118 = (char )(val4114 % 10UL + 48UL);
      val4114 /= 10UL;
    }
    if (! p_count9119) {
      p8118 --;
      p_count9119 ++;
      *p8118 = (char )'0';
    }
    if (sign6116) {
      p8118 --;
      p_count9119 ++;
      *p8118 = (char )'-';
    }
    while ((U32___0 )p_count9119 < places5115) {
      p8118 --;
      p_count9119 ++;
      *p8118 = (char )' ';
    }
    str139 = (char const *)p8118;
    while (*str139) {
      if ((int const )*str139 != 10) {
        c216 = (int )*str139;
        if (c216 >= 0) {
          if (c216 < 128) {
            if (display_x >= 0) {
              if (display_x < 16) {
                if (display_y >= 0) {
                  if (display_y < 8) {
                    b218 = & (*(display_buffer + display_y))[display_x * 6];
                    f219 = font[c216];
                    i217 = 0;
                    while (i217 < 5) {
                      *b218 = (U8___0 )*f219;
                      b218 ++;
                      f219 ++;
                      i217 ++;
                    }
                  }
                }
              }
            }
          }
        }
        goto Lret_display_char___18;
        Lret_display_char___18:
        display_x ++;
      } else {
        display_x = 0;
        display_y ++;
      }
      str139 ++;
    }
    goto Lret_display_string___18;
    Lret_display_string___18: ;
    goto Lret_display_unsigned_worker___10;
    Lret_display_unsigned_worker___10: ;
    goto Lret_display_int___2;
    Lret_display_int___2:
    display_tick = 0;
    nxt_lcd_update();
    goto Lret_display_update;
    Lret_display_update: ;
    goto Lret_ecrobot_status_monitor;
    Lret_ecrobot_status_monitor:
    systick_wait_ms((U32___4 )500U);
  }
}
}
extern int create_task() ;
void main(void)
{


  {
   create_task("TaskMainOSEK_Task_ts1", "TaskMainOSEK_Task_ts1", 3, 4, 0.147);
   create_task("TaskMainOSEK_Task_ts2", "TaskMainOSEK_Task_ts2", 2, 40, 0.029);
   create_task("TaskMainOSEK_Task_Background", "TaskMainOSEK_Task_Background", 1, 100, 54.259);
  return;
}
}

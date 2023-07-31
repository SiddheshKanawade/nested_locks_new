# 1 "objectfollower.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "objectfollower.c"



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
typedef unsigned int AT91_REG___1;
struct motor_struct {
   int current_count ;
   int target_count ;
   int speed_percent ;
   U32___1 last ;
};
typedef unsigned char UINT8;
typedef UINT8 StatusType;
typedef UINT8 ResourceType;
typedef unsigned char U8___1;
typedef signed char S8___0;
typedef unsigned long U32___2;
typedef int data_t;
struct __anonstruct_object_data_t_973126069 {
   int position ;
   int size ;
};
typedef struct __anonstruct_object_data_t_973126069 object_data_t;
void nxt_avr_init(void) ;
void nxt_avr_1kHz_update(void) ;
void nxt_avr_set_motor(U32 n , int power_percent , int brake ) ;
void nxt_avr_power_down(void) ;
U32 buttons_get(void) ;
U32 battery_voltage(void) ;
U32 sensor_adc(U32 n ) ;
void nxt_avr_set_input_power(U32 n , U32 power_type ) ;
extern int twi_init(void) ;
extern void twi_start_write(U32 dev_addr , U8 const *data , U32 nBytes ) ;
extern void twi_start_read(U32 dev_addr , U8 *data , U32 nBytes ) ;
extern int twi_status(void) ;
int nxt_motor_get_count(unsigned long n ) ;
void nxt_motor_set_count(unsigned long n , int count ) ;
void nxt_motor_command(unsigned long n , int cmd , int target_count , int speed_percent ) ;
void nxt_motor_init(void) ;
void nxt_motor_1kHz_process(void) ;
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
unsigned char volatile dirty = (U8___0 volatile )0;
unsigned char volatile page = (U8___0 volatile )0;
U8___0 const volatile *dataM = (U8___0 const volatile *)((U8___0 *)0);
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
static U32___1 nxt_motor_initialised ;
static U32___1 interrupts_this_period ;
extern void nxt_motor_isr_entry(void) ;
extern StatusType TerminateTask(void) ;
extern StatusType GetResource(ResourceType resid ) ;
extern StatusType ReleaseResource(ResourceType resid ) ;
extern int send_nxtcam_command(U8___1 port_id , U8___1 command ) ;
extern int request(U8___1 port_id ) ;
extern int getbiggestrect(U8___1 pcolorid , int minarea ) ;
extern int getX(U8___1 rectindex ) ;
extern int getArea(U8___1 rectindex ) ;
extern data_t median_filter(data_t datum ) ;
extern int fisqrt(int val ) ;
extern ResourceType dataMutex ;
static int sizeLCD ;
static int areaLCD ;
static int xLCD ;
static int speedLCD ;
static int devspeedLCD ;
static int diradjLCD ;
static int lmotLCD ;
static int rmotLCD ;
object_data_t objData = {0, 0};
void TaskMainAcquisitionTask(void) ;
static S8___0 tracking_enabled = (S8___0 )-1;
void TaskMainAcquisitionTask(void)
{
  int rectindex ;
  int area ;
  int size ;
  int x ;
  int tmp ;

  {
  if ((int )tracking_enabled != 0) {
    tmp = send_nxtcam_command((U8___1 )1, (U8___1 )69);
    tracking_enabled = (S8___0 )tmp;
  } else {
    request((U8___1 )1);
    rectindex = getbiggestrect((U8___1 )0, -1);
    if (rectindex >= 0) {
      area = getArea((U8___1 )rectindex);
      area = median_filter(area);
      size = fisqrt(area);
      x = getX((U8___1 )rectindex);
      GetResource((ResourceType )dataMutex);
      objData.position = x;
      objData.size = size;
      ReleaseResource((ResourceType )dataMutex);
      sizeLCD = size;
      areaLCD = area;
      xLCD = x;
    }
  }
  TerminateTask();
  return;
}
}
static int integral = 0;
static int prevError = 0;
static int integral___0 = 0;
static int prevError___0 = 0;
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
  GetResource((ResourceType )dataMutex);
  temp20 = objData;
  ReleaseResource((ResourceType )dataMutex);
  ret_getData21 = temp20;
  goto Lret_getData;
  Lret_getData:
  data = ret_getData21;
  size = data.size;
  position = data.position;
  if (size > 0) {
    if (position > 0) {
      d10 = size;
      error11 = 50 - d10;
      integral += error11;
      derivative12 = error11 - prevError;
      out13 = (int )((1.5 * (double )error11 + (double )0) + (double )0);
      prevError = error11;
      ret_speedPIDController14 = out13;
      goto Lret_speedPIDController;
      Lret_speedPIDController:
      tmp = ret_speedPIDController14;
      speed_deviation = tmp;
      devspeedLCD = speed_deviation;
      new_speed = 50 + speed_deviation;
      if (new_speed > 100) {
        new_speed = 100;
      } else {
        new_speed = new_speed;
      }
      d15 = position;
      error16 = 83 - d15;
      integral___0 += error16;
      derivative17 = error16 - prevError___0;
      out18 = (int )((0.2 * (double )error16 + (double )0) + (double )0);
      prevError___0 = error16;
      ret_directionPIDController19 = out18;
      goto Lret_directionPIDController;
      Lret_directionPIDController:
      direction_adjustment = ret_directionPIDController19;
      speedLCD = new_speed;
      diradjLCD = direction_adjustment;
      leftMotorValue = new_speed - direction_adjustment;
      if (leftMotorValue > 100) {
        leftMotorValue = 100;
      } else {
        leftMotorValue = leftMotorValue;
      }
      rightMotorValue = new_speed + direction_adjustment;
      if (rightMotorValue > 100) {
        rightMotorValue = 100;
      } else {
        rightMotorValue = rightMotorValue;
      }
    } else {
      rightMotorValue = 65;
      leftMotorValue = -65;
      speedLCD = 0;
      diradjLCD = 0;
      devspeedLCD = 0;
    }
  } else {
    rightMotorValue = 65;
    leftMotorValue = -65;
    speedLCD = 0;
    diradjLCD = 0;
    devspeedLCD = 0;
  }
  lmotLCD = leftMotorValue;
  rmotLCD = rightMotorValue;
  n22 = (U32___2 )1;
  speed_percent23 = leftMotorValue;
  brake24 = 0;
  if (n22 < 3UL) {
    if (speed_percent23 > 100) {
      speed_percent23 = 100;
    }
    if (speed_percent23 < -100) {
      speed_percent23 = -100;
    }
    {
    motor[n22].speed_percent = speed_percent23;
    n28 = n22;
    power_percent29 = speed_percent23;
    brake30 = brake24;
    {
    if (n28 < 3UL) {
      io_to_avr.output_percent[n28] = (S8 )power_percent29;
      if (brake30) {
        io_to_avr.output_mode = (U8 )((int )io_to_avr.output_mode | (1 << n28));
      } else {
        io_to_avr.output_mode = (U8 )((int )io_to_avr.output_mode & ~ (1 << n28));
      }
    }
    goto Lret_nxt_avr_set_motor;
    }
    Lret_nxt_avr_set_motor: ;
    }
  }
  goto Lret_nxt_motor_set_speed;
  Lret_nxt_motor_set_speed:
  n25 = (U32___2 )0;
  speed_percent26 = rightMotorValue;
  brake27 = 0;
  if (n25 < 3UL) {
    if (speed_percent26 > 100) {
      speed_percent26 = 100;
    }
    if (speed_percent26 < -100) {
      speed_percent26 = -100;
    }
    {
    motor[n25].speed_percent = speed_percent26;
    n31 = n25;
    power_percent32 = speed_percent26;
    brake33 = brake27;
    {
    if (n31 < 3UL) {
      io_to_avr.output_percent[n31] = (S8 )power_percent32;
      if (brake33) {
        io_to_avr.output_mode = (U8 )((int )io_to_avr.output_mode | (1 << n31));
      } else {
        io_to_avr.output_mode = (U8 )((int )io_to_avr.output_mode & ~ (1 << n31));
      }
    }
    goto Lret_nxt_avr_set_motor___0;
    }
    Lret_nxt_avr_set_motor___0: ;
    }
  }
  goto Lret_nxt_motor_set_speed___0;
  Lret_nxt_motor_set_speed___0:
  TerminateTask();
  return;
}
}
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
  message1 = (char *)((void *)0);
  line2 = (U8___1 )0;
  tmp3 = line2;
  line2 = (U8___1 )((int )line2 + 1);
  x11 = 0;
  y12 = (int )tmp3;
  display_x = x11;
  display_y = y12;
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
  message1 = (char *)"size:";
  str27 = (char const *)message1;
  while (*str27) {
    if ((int const )*str27 != 10) {
      c115 = (int )*str27;
      if (c115 >= 0) {
        if (c115 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b117 = & (*(display_buffer + display_y))[display_x * 6];
                  f118 = font[c115];
                  i116 = 0;
                  while (i116 < 5) {
                    *b117 = (U8___0 )*f118;
                    b117 ++;
                    f118 ++;
                    i116 ++;
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
    str27 ++;
  }
  goto Lret_display_string;
  Lret_display_string:
  val35 = sizeLCD;
  places36 = (U32___2 )4;
  if (val35 < 0) {
    tmp37 = - val35;
  } else {
    tmp37 = val35;
  }
  val59 = (U32___0 )tmp37;
  places60 = places36;
  sign61 = (U32___0 )(val35 < 0);
  p63 = & x62[11];
  p_count64 = 0;
  *p63 = (char)0;
  if (places60 > 11UL) {
    places60 = (U32___0 )11;
  }
  while (val59) {
    p63 --;
    p_count64 ++;
    *p63 = (char )(val59 % 10UL + 48UL);
    val59 /= 10UL;
  }
  if (! p_count64) {
    p63 --;
    p_count64 ++;
    *p63 = (char )'0';
  }
  if (sign61) {
    p63 --;
    p_count64 ++;
    *p63 = (char )'-';
  }
  while ((U32___0 )p_count64 < places60) {
    p63 --;
    p_count64 ++;
    *p63 = (char )' ';
  }
  str765 = (char const *)p63;
  while (*str765) {
    if ((int const )*str765 != 10) {
      c119 = (int )*str765;
      if (c119 >= 0) {
        if (c119 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b121 = & (*(display_buffer + display_y))[display_x * 6];
                  f122 = font[c119];
                  i120 = 0;
                  while (i120 < 5) {
                    *b121 = (U8___0 )*f122;
                    b121 ++;
                    f122 ++;
                    i120 ++;
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
    str765 ++;
  }
  goto Lret_display_string___7;
  Lret_display_string___7: ;
  goto Lret_display_unsigned_worker;
  Lret_display_unsigned_worker: ;
  goto Lret_display_int;
  Lret_display_int:
  tmp___04 = line2;
  line2 = (U8___1 )((int )line2 + 1);
  x13 = 0;
  y14 = (int )tmp___04;
  display_x = x13;
  display_y = y14;
  goto Lret_display_goto_xy___0;
  Lret_display_goto_xy___0:
  message1 = (char *)"area:";
  str28 = (char const *)message1;
  while (*str28) {
    if ((int const )*str28 != 10) {
      c123 = (int )*str28;
      if (c123 >= 0) {
        if (c123 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b125 = & (*(display_buffer + display_y))[display_x * 6];
                  f126 = font[c123];
                  i124 = 0;
                  while (i124 < 5) {
                    *b125 = (U8___0 )*f126;
                    b125 ++;
                    f126 ++;
                    i124 ++;
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
    str28 ++;
  }
  goto Lret_display_string___0;
  Lret_display_string___0:
  val38 = areaLCD;
  places39 = (U32___2 )5;
  if (val38 < 0) {
    tmp40 = - val38;
  } else {
    tmp40 = val38;
  }
  val66 = (U32___0 )tmp40;
  places67 = places39;
  sign68 = (U32___0 )(val38 < 0);
  p70 = & x69[11];
  p_count71 = 0;
  *p70 = (char)0;
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
  str772 = (char const *)p70;
  while (*str772) {
    if ((int const )*str772 != 10) {
      c127 = (int )*str772;
      if (c127 >= 0) {
        if (c127 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b129 = & (*(display_buffer + display_y))[display_x * 6];
                  f130 = font[c127];
                  i128 = 0;
                  while (i128 < 5) {
                    *b129 = (U8___0 )*f130;
                    b129 ++;
                    f130 ++;
                    i128 ++;
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
    str772 ++;
  }
  goto Lret_display_string___8;
  Lret_display_string___8: ;
  goto Lret_display_unsigned_worker___0;
  Lret_display_unsigned_worker___0: ;
  goto Lret_display_int___0;
  Lret_display_int___0:
  tmp___15 = line2;
  line2 = (U8___1 )((int )line2 + 1);
  x15 = 0;
  y16 = (int )tmp___15;
  display_x = x15;
  display_y = y16;
  goto Lret_display_goto_xy___1;
  Lret_display_goto_xy___1:
  message1 = (char *)"pos:";
  str29 = (char const *)message1;
  while (*str29) {
    if ((int const )*str29 != 10) {
      c131 = (int )*str29;
      if (c131 >= 0) {
        if (c131 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b133 = & (*(display_buffer + display_y))[display_x * 6];
                  f134 = font[c131];
                  i132 = 0;
                  while (i132 < 5) {
                    *b133 = (U8___0 )*f134;
                    b133 ++;
                    f134 ++;
                    i132 ++;
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
    str29 ++;
  }
  goto Lret_display_string___1;
  Lret_display_string___1:
  val41 = xLCD;
  places42 = (U32___2 )4;
  if (val41 < 0) {
    tmp43 = - val41;
  } else {
    tmp43 = val41;
  }
  val73 = (U32___0 )tmp43;
  places74 = places42;
  sign75 = (U32___0 )(val41 < 0);
  p77 = & x76[11];
  p_count78 = 0;
  *p77 = (char)0;
  if (places74 > 11UL) {
    places74 = (U32___0 )11;
  }
  while (val73) {
    p77 --;
    p_count78 ++;
    *p77 = (char )(val73 % 10UL + 48UL);
    val73 /= 10UL;
  }
  if (! p_count78) {
    p77 --;
    p_count78 ++;
    *p77 = (char )'0';
  }
  if (sign75) {
    p77 --;
    p_count78 ++;
    *p77 = (char )'-';
  }
  while ((U32___0 )p_count78 < places74) {
    p77 --;
    p_count78 ++;
    *p77 = (char )' ';
  }
  str779 = (char const *)p77;
  while (*str779) {
    if ((int const )*str779 != 10) {
      c135 = (int )*str779;
      if (c135 >= 0) {
        if (c135 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b137 = & (*(display_buffer + display_y))[display_x * 6];
                  f138 = font[c135];
                  i136 = 0;
                  while (i136 < 5) {
                    *b137 = (U8___0 )*f138;
                    b137 ++;
                    f138 ++;
                    i136 ++;
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
    str779 ++;
  }
  goto Lret_display_string___9;
  Lret_display_string___9: ;
  goto Lret_display_unsigned_worker___1;
  Lret_display_unsigned_worker___1: ;
  goto Lret_display_int___1;
  Lret_display_int___1:
  tmp___26 = line2;
  line2 = (U8___1 )((int )line2 + 1);
  x17 = 0;
  y18 = (int )tmp___26;
  display_x = x17;
  display_y = y18;
  goto Lret_display_goto_xy___2;
  Lret_display_goto_xy___2:
  message1 = (char *)"speed:";
  str30 = (char const *)message1;
  while (*str30) {
    if ((int const )*str30 != 10) {
      c139 = (int )*str30;
      if (c139 >= 0) {
        if (c139 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b141 = & (*(display_buffer + display_y))[display_x * 6];
                  f142 = font[c139];
                  i140 = 0;
                  while (i140 < 5) {
                    *b141 = (U8___0 )*f142;
                    b141 ++;
                    f142 ++;
                    i140 ++;
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
    str30 ++;
  }
  goto Lret_display_string___2;
  Lret_display_string___2:
  val44 = speedLCD;
  places45 = (U32___2 )4;
  if (val44 < 0) {
    tmp46 = - val44;
  } else {
    tmp46 = val44;
  }
  val80 = (U32___0 )tmp46;
  places81 = places45;
  sign82 = (U32___0 )(val44 < 0);
  p84 = & x83[11];
  p_count85 = 0;
  *p84 = (char)0;
  if (places81 > 11UL) {
    places81 = (U32___0 )11;
  }
  while (val80) {
    p84 --;
    p_count85 ++;
    *p84 = (char )(val80 % 10UL + 48UL);
    val80 /= 10UL;
  }
  if (! p_count85) {
    p84 --;
    p_count85 ++;
    *p84 = (char )'0';
  }
  if (sign82) {
    p84 --;
    p_count85 ++;
    *p84 = (char )'-';
  }
  while ((U32___0 )p_count85 < places81) {
    p84 --;
    p_count85 ++;
    *p84 = (char )' ';
  }
  str786 = (char const *)p84;
  while (*str786) {
    if ((int const )*str786 != 10) {
      c143 = (int )*str786;
      if (c143 >= 0) {
        if (c143 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b145 = & (*(display_buffer + display_y))[display_x * 6];
                  f146 = font[c143];
                  i144 = 0;
                  while (i144 < 5) {
                    *b145 = (U8___0 )*f146;
                    b145 ++;
                    f146 ++;
                    i144 ++;
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
    str786 ++;
  }
  goto Lret_display_string___10;
  Lret_display_string___10: ;
  goto Lret_display_unsigned_worker___2;
  Lret_display_unsigned_worker___2: ;
  goto Lret_display_int___2;
  Lret_display_int___2:
  tmp___37 = line2;
  line2 = (U8___1 )((int )line2 + 1);
  x19 = 0;
  y20 = (int )tmp___37;
  display_x = x19;
  display_y = y20;
  goto Lret_display_goto_xy___3;
  Lret_display_goto_xy___3:
  message1 = (char *)"dev speed:";
  str31 = (char const *)message1;
  while (*str31) {
    if ((int const )*str31 != 10) {
      c147 = (int )*str31;
      if (c147 >= 0) {
        if (c147 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b149 = & (*(display_buffer + display_y))[display_x * 6];
                  f150 = font[c147];
                  i148 = 0;
                  while (i148 < 5) {
                    *b149 = (U8___0 )*f150;
                    b149 ++;
                    f150 ++;
                    i148 ++;
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
    str31 ++;
  }
  goto Lret_display_string___3;
  Lret_display_string___3:
  val47 = devspeedLCD;
  places48 = (U32___2 )4;
  if (val47 < 0) {
    tmp49 = - val47;
  } else {
    tmp49 = val47;
  }
  val87 = (U32___0 )tmp49;
  places88 = places48;
  sign89 = (U32___0 )(val47 < 0);
  p91 = & x90[11];
  p_count92 = 0;
  *p91 = (char)0;
  if (places88 > 11UL) {
    places88 = (U32___0 )11;
  }
  while (val87) {
    p91 --;
    p_count92 ++;
    *p91 = (char )(val87 % 10UL + 48UL);
    val87 /= 10UL;
  }
  if (! p_count92) {
    p91 --;
    p_count92 ++;
    *p91 = (char )'0';
  }
  if (sign89) {
    p91 --;
    p_count92 ++;
    *p91 = (char )'-';
  }
  while ((U32___0 )p_count92 < places88) {
    p91 --;
    p_count92 ++;
    *p91 = (char )' ';
  }
  str793 = (char const *)p91;
  while (*str793) {
    if ((int const )*str793 != 10) {
      c151 = (int )*str793;
      if (c151 >= 0) {
        if (c151 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b153 = & (*(display_buffer + display_y))[display_x * 6];
                  f154 = font[c151];
                  i152 = 0;
                  while (i152 < 5) {
                    *b153 = (U8___0 )*f154;
                    b153 ++;
                    f154 ++;
                    i152 ++;
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
    str793 ++;
  }
  goto Lret_display_string___11;
  Lret_display_string___11: ;
  goto Lret_display_unsigned_worker___3;
  Lret_display_unsigned_worker___3: ;
  goto Lret_display_int___3;
  Lret_display_int___3:
  tmp___48 = line2;
  line2 = (U8___1 )((int )line2 + 1);
  x21 = 0;
  y22 = (int )tmp___48;
  display_x = x21;
  display_y = y22;
  goto Lret_display_goto_xy___4;
  Lret_display_goto_xy___4:
  message1 = (char *)"dir dev:";
  str32 = (char const *)message1;
  while (*str32) {
    if ((int const )*str32 != 10) {
      c155 = (int )*str32;
      if (c155 >= 0) {
        if (c155 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b157 = & (*(display_buffer + display_y))[display_x * 6];
                  f158 = font[c155];
                  i156 = 0;
                  while (i156 < 5) {
                    *b157 = (U8___0 )*f158;
                    b157 ++;
                    f158 ++;
                    i156 ++;
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
    str32 ++;
  }
  goto Lret_display_string___4;
  Lret_display_string___4:
  val50 = diradjLCD;
  places51 = (U32___2 )4;
  if (val50 < 0) {
    tmp52 = - val50;
  } else {
    tmp52 = val50;
  }
  val94 = (U32___0 )tmp52;
  places95 = places51;
  sign96 = (U32___0 )(val50 < 0);
  p98 = & x97[11];
  p_count99 = 0;
  *p98 = (char)0;
  if (places95 > 11UL) {
    places95 = (U32___0 )11;
  }
  while (val94) {
    p98 --;
    p_count99 ++;
    *p98 = (char )(val94 % 10UL + 48UL);
    val94 /= 10UL;
  }
  if (! p_count99) {
    p98 --;
    p_count99 ++;
    *p98 = (char )'0';
  }
  if (sign96) {
    p98 --;
    p_count99 ++;
    *p98 = (char )'-';
  }
  while ((U32___0 )p_count99 < places95) {
    p98 --;
    p_count99 ++;
    *p98 = (char )' ';
  }
  str7100 = (char const *)p98;
  while (*str7100) {
    if ((int const )*str7100 != 10) {
      c159 = (int )*str7100;
      if (c159 >= 0) {
        if (c159 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b161 = & (*(display_buffer + display_y))[display_x * 6];
                  f162 = font[c159];
                  i160 = 0;
                  while (i160 < 5) {
                    *b161 = (U8___0 )*f162;
                    b161 ++;
                    f162 ++;
                    i160 ++;
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
    str7100 ++;
  }
  goto Lret_display_string___12;
  Lret_display_string___12: ;
  goto Lret_display_unsigned_worker___4;
  Lret_display_unsigned_worker___4: ;
  goto Lret_display_int___4;
  Lret_display_int___4:
  tmp___59 = line2;
  line2 = (U8___1 )((int )line2 + 1);
  x23 = 0;
  y24 = (int )tmp___59;
  display_x = x23;
  display_y = y24;
  goto Lret_display_goto_xy___5;
  Lret_display_goto_xy___5:
  message1 = (char *)"left motor:";
  str33 = (char const *)message1;
  while (*str33) {
    if ((int const )*str33 != 10) {
      c163 = (int )*str33;
      if (c163 >= 0) {
        if (c163 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b165 = & (*(display_buffer + display_y))[display_x * 6];
                  f166 = font[c163];
                  i164 = 0;
                  while (i164 < 5) {
                    *b165 = (U8___0 )*f166;
                    b165 ++;
                    f166 ++;
                    i164 ++;
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
    str33 ++;
  }
  goto Lret_display_string___5;
  Lret_display_string___5:
  val53 = lmotLCD;
  places54 = (U32___2 )4;
  if (val53 < 0) {
    tmp55 = - val53;
  } else {
    tmp55 = val53;
  }
  val101 = (U32___0 )tmp55;
  places102 = places54;
  sign103 = (U32___0 )(val53 < 0);
  p105 = & x104[11];
  p_count106 = 0;
  *p105 = (char)0;
  if (places102 > 11UL) {
    places102 = (U32___0 )11;
  }
  while (val101) {
    p105 --;
    p_count106 ++;
    *p105 = (char )(val101 % 10UL + 48UL);
    val101 /= 10UL;
  }
  if (! p_count106) {
    p105 --;
    p_count106 ++;
    *p105 = (char )'0';
  }
  if (sign103) {
    p105 --;
    p_count106 ++;
    *p105 = (char )'-';
  }
  while ((U32___0 )p_count106 < places102) {
    p105 --;
    p_count106 ++;
    *p105 = (char )' ';
  }
  str7107 = (char const *)p105;
  while (*str7107) {
    if ((int const )*str7107 != 10) {
      c167 = (int )*str7107;
      if (c167 >= 0) {
        if (c167 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b169 = & (*(display_buffer + display_y))[display_x * 6];
                  f170 = font[c167];
                  i168 = 0;
                  while (i168 < 5) {
                    *b169 = (U8___0 )*f170;
                    b169 ++;
                    f170 ++;
                    i168 ++;
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
    str7107 ++;
  }
  goto Lret_display_string___13;
  Lret_display_string___13: ;
  goto Lret_display_unsigned_worker___5;
  Lret_display_unsigned_worker___5: ;
  goto Lret_display_int___5;
  Lret_display_int___5:
  tmp___610 = line2;
  line2 = (U8___1 )((int )line2 + 1);
  x25 = 0;
  y26 = (int )tmp___610;
  display_x = x25;
  display_y = y26;
  goto Lret_display_goto_xy___6;
  Lret_display_goto_xy___6:
  message1 = (char *)"right motor:";
  str34 = (char const *)message1;
  while (*str34) {
    if ((int const )*str34 != 10) {
      c171 = (int )*str34;
      if (c171 >= 0) {
        if (c171 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b173 = & (*(display_buffer + display_y))[display_x * 6];
                  f174 = font[c171];
                  i172 = 0;
                  while (i172 < 5) {
                    *b173 = (U8___0 )*f174;
                    b173 ++;
                    f174 ++;
                    i172 ++;
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
    str34 ++;
  }
  goto Lret_display_string___6;
  Lret_display_string___6:
  val56 = rmotLCD;
  places57 = (U32___2 )4;
  if (val56 < 0) {
    tmp58 = - val56;
  } else {
    tmp58 = val56;
  }
  val108 = (U32___0 )tmp58;
  places109 = places57;
  sign110 = (U32___0 )(val56 < 0);
  p112 = & x111[11];
  p_count113 = 0;
  *p112 = (char)0;
  if (places109 > 11UL) {
    places109 = (U32___0 )11;
  }
  while (val108) {
    p112 --;
    p_count113 ++;
    *p112 = (char )(val108 % 10UL + 48UL);
    val108 /= 10UL;
  }
  if (! p_count113) {
    p112 --;
    p_count113 ++;
    *p112 = (char )'0';
  }
  if (sign110) {
    p112 --;
    p_count113 ++;
    *p112 = (char )'-';
  }
  while ((U32___0 )p_count113 < places109) {
    p112 --;
    p_count113 ++;
    *p112 = (char )' ';
  }
  str7114 = (char const *)p112;
  while (*str7114) {
    if ((int const )*str7114 != 10) {
      c175 = (int )*str7114;
      if (c175 >= 0) {
        if (c175 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b177 = & (*(display_buffer + display_y))[display_x * 6];
                  f178 = font[c175];
                  i176 = 0;
                  while (i176 < 5) {
                    *b177 = (U8___0 )*f178;
                    b177 ++;
                    f178 ++;
                    i176 ++;
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
    str7114 ++;
  }
  goto Lret_display_string___14;
  Lret_display_string___14: ;
  goto Lret_display_unsigned_worker___6;
  Lret_display_unsigned_worker___6: ;
  goto Lret_display_int___6;
  Lret_display_int___6:
  display_tick = 0;
  nxt_spi_refresh();
  goto Lret_nxt_lcd_update;
  Lret_nxt_lcd_update: ;
  goto Lret_display_update;
  Lret_display_update: ;
  goto Lret_display_values;
  Lret_display_values:
  TerminateTask();
  return;
}
}
# 1862 "objectfollower.c"
extern int create_block() ;
extern int create_task() ;
void main(void)
{


  {
  create_task("TaskMainAcquisitionTask", "TaskMainAcquisitionTask", 3, 30, 2.15);
  create_task("TaskMainControlTask", "TaskMainControlTask", 2, 50, 0.14);
  create_task("TaskMainDisplayTask", "TaskMainDisplayTask", 1, 100, 0.14);
  create_block(488, "TaskMainAcquisitionTask", "dataMutex", 1, 3, 0.007);

  create_block(542, "TaskMainControlTask", "dataMutex", 1, 2, 0.006);

  return;
}
}

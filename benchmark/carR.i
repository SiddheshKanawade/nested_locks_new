# 1 "car/carR.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "car/carR.c"



typedef unsigned char U8;
typedef unsigned long U32;
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
typedef unsigned int AT91_REG;
typedef unsigned long size_t;
struct __anonstruct_display_array_740464799 {
   Object hdr ;
   U8 displayN[9][100] ;
} __attribute__((__packed__)) ;
typedef unsigned char U8___0;
typedef signed char S8___0;
typedef unsigned short U16___0;
typedef unsigned long U32___0;
typedef unsigned long size_t___0;
struct __anonstruct_to_avr_432250394 {
   U8___0 power ;
   U8___0 pwm_frequency ;
   S8___0 output_percent[4] ;
   U8___0 output_mode ;
   U8___0 input_power ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_to_avr_432250394 to_avr;
struct __anonstruct_from_avr_708559676 {
   U16___0 adc_value[4] ;
   U16___0 buttonsVal ;
   U16___0 extra ;
   U8___0 csum ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_from_avr_708559676 from_avr;
struct __anonstruct_nxt_avr_stats_680423455 {
   U32___0 good_rx ;
   U32___0 bad_rx ;
   U32___0 resets ;
   U32___0 still_busy ;
   U32___0 not_ok ;
};
typedef unsigned long U32___1;
typedef unsigned int AT91_REG___0;
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
typedef signed char S8___1;
typedef unsigned short U16___1;
typedef short S16___0;
typedef unsigned long U32___2;
typedef long S32___0;
typedef char CHAR;
typedef unsigned int UINT;
typedef int SINT;
struct __anonstruct_nxt_inputs_83380041 {
   U32___2 battery_state ;
   U8___1 buttons_state ;
};
typedef struct __anonstruct_nxt_inputs_83380041 nxt_inputs;
struct __anonstruct_riff_705856829 {
   U32___2 chunkID ;
   U32___2 chunkSize ;
   U32___2 format ;
} __attribute__((__packed__)) ;
struct __anonstruct_fmt_307472724 {
   U32___2 chunkID ;
   U32___2 chunkSize ;
   U16___1 audioFormat ;
   U16___1 numChannels ;
   U32___2 sampleRate ;
   U32___2 byteRate ;
   U16___1 blockAlign ;
   U16___1 bitsPerSample ;
   U16___1 dummy ;
} __attribute__((__packed__)) ;
struct __anonstruct_data_325997328 {
   U32___2 chunkID ;
   U32___2 chunkSize ;
   U8___1 data[] ;
} __attribute__((__packed__)) ;
struct __anonstruct_WAV_537237497 {
   struct __anonstruct_riff_705856829 riff ;
   struct __anonstruct_fmt_307472724 fmt ;
   struct __anonstruct_data_325997328 data ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_WAV_537237497 WAV;
struct __anonstruct_riff_705856830 {
   U32___2 chunkID ;
   U32___2 chunkSize ;
   U32___2 format ;
} __attribute__((__packed__)) ;
struct __anonstruct_fmt_947264284 {
   U32___2 chunkID ;
   U32___2 chunkSize ;
   U16___1 audioFormat ;
   U16___1 numChannels ;
   U32___2 sampleRate ;
   U32___2 byteRate ;
   U16___1 blockAlign ;
   U16___1 bitsPerSample ;
} __attribute__((__packed__)) ;
struct __anonstruct_data_947264285 {
   U32___2 chunkID ;
   U32___2 chunkSize ;
   U8___1 data[] ;
} __attribute__((__packed__)) ;
struct __anonstruct_WAV_ND_96246176 {
   struct __anonstruct_riff_705856830 riff ;
   struct __anonstruct_fmt_947264284 fmt ;
   struct __anonstruct_data_947264285 data ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_WAV_ND_96246176 WAV_ND;
struct __anonstruct_riff_947264286 {
   U32___2 chunkID ;
   U32___2 chunkSize ;
   U32___2 format ;
} __attribute__((__packed__)) ;
struct __anonstruct_fmt_947264287 {
   U32___2 chunkID ;
   U32___2 chunkSize ;
   U16___1 audioFormat ;
   U16___1 numChannels ;
   U32___2 sampleRate ;
   U32___2 byteRate ;
   U16___1 blockAlign ;
   U16___1 bitsPerSample ;
   U16___1 dummy ;
} __attribute__((__packed__)) ;
struct __anonstruct_data_138372828 {
   U32___2 chunkID ;
   U32___2 chunkSize ;
   U32___2 numSamples ;
   U32___2 data_chunkID ;
   U32___2 data_chunkSize ;
   U8___1 data[] ;
} __attribute__((__packed__)) ;
struct __anonstruct_WAV_FACT_192223680 {
   struct __anonstruct_riff_947264286 riff ;
   struct __anonstruct_fmt_947264287 fmt ;
   struct __anonstruct_data_138372828 data ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_WAV_FACT_192223680 WAV_FACT;
struct __anonstruct_riff_947264288 {
   U32___2 chunkID ;
   U32___2 chunkSize ;
   U32___2 format ;
} __attribute__((__packed__)) ;
struct __anonstruct_fmt_947264289 {
   U32___2 chunkID ;
   U32___2 chunkSize ;
   U16___1 audioFormat ;
   U16___1 numChannels ;
   U32___2 sampleRate ;
   U32___2 byteRate ;
   U16___1 blockAlign ;
   U16___1 bitsPerSample ;
   U16___1 dummy ;
} __attribute__((__packed__)) ;
struct __anonstruct_data_947264290 {
   U32___2 chunkID ;
   U32___2 chunkSize ;
   U8___1 data[] ;
} __attribute__((__packed__)) ;
struct __anonstruct_WAV_NL_607842622 {
   struct __anonstruct_riff_947264288 riff ;
   struct __anonstruct_fmt_947264289 fmt ;
   struct __anonstruct_data_947264290 data ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_WAV_NL_607842622 WAV_NL;
struct __anonstruct_fileHeader_706858178 {
   U16___1 type ;
   U32___2 size ;
   U16___1 reserved1 ;
   U16___1 reserved2 ;
   U32___2 offset ;
} __attribute__((__packed__)) ;
struct __anonstruct_infoHeader_110306387 {
   U32___2 size ;
   S32___0 width ;
   S32___0 height ;
   U16___1 planes ;
   U16___1 bits ;
   U32___2 compression ;
   U32___2 imagesize ;
   S32___0 xresolution ;
   S32___0 yresolution ;
   U32___2 ncolours ;
   U32___2 importantcolours ;
} __attribute__((__packed__)) ;
struct __anonstruct_rgb_846263947 {
   U8___1 blue ;
   U8___1 green ;
   U8___1 red ;
   U8___1 reserved ;
} __attribute__((__packed__)) ;
struct __anonstruct_BMP_292543852 {
   struct __anonstruct_fileHeader_706858178 fileHeader ;
   struct __anonstruct_infoHeader_110306387 infoHeader ;
   struct __anonstruct_rgb_846263947 rgb ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_BMP_292543852 BMP;
struct __anonstruct_NXTCOLORSENSOR_T_371327434 {
   U16___1 color ;
   S16___0 rgb[3] ;
   U16___1 light ;
   U8___1 mode ;
   U8___1 mode_state ;
   U8___1 port_in_use ;
};
typedef struct __anonstruct_NXTCOLORSENSOR_T_371327434 NXTCOLORSENSOR_T;
struct sMotorResource_t {
   S32___0 sTurnDistance ;
   S32___0 sSonarDistance ;
   S32___0 sRightMotor ;
   S32___0 sLeftMotor ;
   S32___0 sCalibratedDistance ;
};
void display_init(void) ;
void display_update(void) ;
void display_force_update(void) ;
void display_clear(U32 updateToo ) ;
void display_goto_xy(int x , int y ) ;
void display_char(int c ) ;
void display_string(char const *str ) ;
void display_int(int val , U32 places ) ;
void display_hex(U32 val , U32 places ) ;
void display_unsigned(U32 val , U32 places ) ;
void display_bitmap_copy(U8 const *data , U32 width , U32 depth , U32 x , U32 y ) ;
void display_test(void) ;
U8 *display_get_buffer(void) ;
void display_set_auto_update(int mode___0 ) ;
int display_tick ;
int display_auto_update ;
void nxt_lcd_init(U8 const *disp ) ;
void nxt_lcd_power_up(void) ;
void nxt_lcd_power_down(void) ;
void nxt_lcd_update(void) ;
void nxt_lcd_force_update(void) ;
extern unsigned long systick_get_ms(void) ;
extern void systick_wait_ms(unsigned long ms ) ;
void nxt_spi_init(void) ;
void nxt_spi_write(U32 CD , U8 const *dataM___0 , U32 nBytes ) ;
void nxt_spi_set_display(U8 const *disp ) ;
void nxt_spi_refresh(void) ;
extern int interrupts_get_and_disable(void) ;
extern void interrupts_enable(void) ;
extern void aic_set_vector(unsigned long vector , unsigned long mode , unsigned long isr ) ;
extern void aic_mask_on(unsigned long vector ) ;
extern void aic_mask_off(unsigned long vector ) ;
U8 const *displayM = (U8 const *)((U8 *)0);
unsigned char dirty = (U8 )0;
unsigned char page = (U8 )0;
U8 const *dataM = (U8 const *)((U8 *)0);
U8 mode = (U8 )255;
extern void spi_isr_entry(void) ;
int nxt_motor_get_count(unsigned long n ) ;
void nxt_motor_set_count(unsigned long n , int count ) ;
void nxt_motor_set_speed(unsigned long n , int speed_percent , int brake ) ;
void nxt_motor_command(unsigned long n , int cmd , int target_count , int speed_percent ) ;
void nxt_motor_init(void) ;
void nxt_motor_1kHz_process(void) ;
void nxt_avr_init(void) ;
void nxt_avr_1kHz_update(void) ;
void nxt_avr_set_motor(unsigned long n , int power_percent , int brake ) ;
void nxt_avr_power_down(void) ;
unsigned long buttons_get(void) ;
unsigned long battery_voltage(void) ;
unsigned long sensor_adc(unsigned long n ) ;
void nxt_avr_set_input_power(unsigned long n , unsigned long power_type ) ;
extern __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1), __leaf__)) memset)(void *__s ,
                                                                                               int __c ,
                                                                                               unsigned long __n ) ;
extern __attribute__((__nothrow__)) unsigned long ( __attribute__((__nonnull__(1),
__leaf__)) strlen)(char const *__s ) __attribute__((__pure__)) ;
static U8 *display = (U8 *)0;
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
extern int twi_init(void) ;
extern void twi_start_write(U32___0 dev_addr , U8___0 const *data , U32___0 nBytes ) ;
extern void twi_start_read(U32___0 dev_addr , U8___0 *data , U32___0 nBytes ) ;
extern int twi_status(void) ;
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
static U8___0 data_to_avr[9] ;
static from_avr data_from_avr[2] ;
static from_avr *io_from_avr ;
static U32___0 from_buf ;
static U16___0 prev_buttons ;
static U16___0 button_state ;
static U16___0 debounce_state ;
static U16___0 debounce_cnt ;
static struct __anonstruct_nxt_avr_stats_680423455 nxt_avr_stats ;
static U32___0 update_count ;
static U32___0 link_state = (U32___0 )0;
static struct motor_struct motor[3] ;
static U32___1 nxt_motor_initialised ;
static U32___1 interrupts_this_period ;
extern void nxt_motor_isr_entry(void) ;
extern __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) rand)(void) ;
extern StatusType TerminateTask(void) ;
extern StatusType GetResource(ResourceType resid ) ;
extern StatusType ReleaseResource(ResourceType resid ) ;
U8___1 ecrobot_get_button_state(void) ;
void ecrobot_init_nxtstate(void) ;
void ecrobot_poll_nxtstate(void) ;
void ecrobot_setDeviceInitialized(void) ;
void ecrobot_initDeviceStatus(void) ;
extern void set_digi0(int ) ;
extern void unset_digi0(int ) ;
extern void i2c_disable(int port ) ;
extern void i2c_enable(int port ) ;
extern int i2c_busy(int port ) ;
extern int i2c_start_transaction(int port , U32___2 address , int internal_address ,
                                 int n_internal_address_bytes , U8___1 *data , U32___2 nbytes ,
                                 int write ) ;
extern void sound_freq_vol(U32___2 freq , U32___2 ms , int vol ) ;
extern void sound_play_sample(U8___1 *data , U32___2 length , U32___2 freq , int vol ) ;
extern int sound_get_time() ;
extern void ecrobot_init_bt_slave(CHAR const *pin ) ;
extern SINT ecrobot_get_bt_status(void) ;
extern U32___2 ecrobot_send_bt_packet(U8___1 *buf , U32___2 bufLen ) ;
extern U32___2 ecrobot_read_bt_packet(U8___1 *buf , U32___2 bufLen ) ;
S32___0 ecrobot_get_motor_rev(U8___1 port_id ) ;
void ecrobot_set_motor_speed(U8___1 port_id , S8___1 speed ) ;
void ecrobot_set_motor_mode_speed(U8___1 port_id , S32___0 mode___0 , S8___1 speed ) ;
U16___1 ecrobot_get_light_sensor(U32___2 port_id ) ;
void ecrobot_set_light_sensor_active(U32___2 port_id ) ;
void ecrobot_set_light_sensor_inactive(U32___2 port_id ) ;
U8___1 ecrobot_get_touch_sensor(U8___1 port_id ) ;
U16___1 ecrobot_get_sound_sensor(U8___1 port_id ) ;
void ecrobot_init_i2c(U8___1 port_id , U8___1 type ) ;
U8___1 ecrobot_wait_i2c_ready(U8___1 port_id , U32___2 wait ) ;
SINT ecrobot_send_i2c(U8___1 port_id , U32___2 address , SINT i2c_reg , U8___1 *buf ,
                      U32___2 len ) ;
SINT ecrobot_read_i2c(U8___1 port_id , U32___2 address , SINT i2c_reg , U8___1 *buf ,
                      U32___2 len ) ;
void ecrobot_term_i2c(U8___1 port_id ) ;
void ecrobot_init_sonar_sensor(U8___1 port_id ) ;
S32___0 ecrobot_get_sonar_sensor(U8___1 port_id ) ;
void ecrobot_term_sonar_sensor(U8___1 port_id ) ;
void ecrobot_init_nxtcolorsensor(U8___1 port_id , U8___1 mode___0 ) ;
void ecrobot_process_bg_nxtcolorsensor(void) ;
void ecrobot_set_nxtcolorsensor(U8___1 port_id , U8___1 mode___0 ) ;
U8___1 ecrobot_get_nxtcolorsensor_mode(U8___1 port_id ) ;
U16___1 ecrobot_get_nxtcolorsensor_id(U8___1 port_id ) ;
void ecrobot_get_nxtcolorsensor_rgb(U8___1 port_id , S16___0 *rgb ) ;
U16___1 ecrobot_get_nxtcolorsensor_light(U8___1 port_id ) ;
void ecrobot_term_nxtcolorsensor(U8___1 port_id ) ;
void ecrobot_set_RCX_power_source(U8___1 port_id ) ;
void ecrobot_term_RCX_power_source(U8___1 port_id ) ;
S16___0 ecrobot_get_RCX_sensor(U8___1 port_id ) ;
U8___1 ecrobot_get_RCX_touch_sensor(U8___1 port_id ) ;
U16___1 ecrobot_get_battery_voltage(void) ;
U32___2 ecrobot_get_systick_ms(void) ;
U8___1 ecrobot_is_ENTER_button_pressed(void) ;
U8___1 ecrobot_is_RUN_button_pressed(void) ;
SINT ecrobot_bmp2lcd(CHAR const *file , U8___1 *lcd , S32___0 width , S32___0 height ) ;
void ecrobot_show_int(S32___0 var ) ;
void ecrobot_debug1(UINT var1 , UINT var2 , UINT var3 ) ;
void ecrobot_debug2(UINT var1 , UINT var2 , UINT var3 ) ;
void ecrobot_status_monitor(CHAR const *target_name ) ;
void ecrobot_adc_data_monitor(CHAR const *target_name ) ;
void ecrobot_bt_data_logger(S8___1 data1 , S8___1 data2 ) ;
void ecrobot_bt_adc_data_logger(S8___1 data1 , S8___1 data2 , S16___0 adc1 , S16___0 adc2 ,
                                S16___0 adc3 , S16___0 adc4 ) ;
void ecrobot_sint_var_monitor(SINT *vars ) ;
SINT ecrobot_sound_tone(U32___2 freq , U32___2 ms , U32___2 vol ) ;
SINT ecrobot_sound_wav(CHAR const *file , U32___2 length , S32___0 freq , U32___2 vol ) ;
extern void colorsensor_init(int , unsigned char ) ;
extern void colorsensor_term(int ) ;
extern int colorsensor_light_get(int ) ;
extern void colorsensor_light_full(int port ) ;
extern int colorsensor_color_get(int ) ;
extern void colorsensor_rgb_get(int , short * ) ;
static unsigned char deviceStatus = (U8___1 )2;
static S32___0 distance_state[4] = { (S32___0 )-1, (S32___0 )-1, (S32___0 )-1, (S32___0 )-1};
static U8___1 data[4] = { (U8___1 )0};
U8___1 const NXT_COLORSENSOR_PROTOCOLS[7] = { (U8___1 const )176, (U8___1 const )112, (U8___1 const )240, (U8___1 const )8,
        (U8___1 const )176, (U8___1 const )136, (U8___1 const )136};
static NXTCOLORSENSOR_T sensor_data[4] ;
static nxt_inputs ecrobot_inputs ;
static U8___1 buttons_states[20] ;
static SINT buttons_i ;
extern int restart_NXT() ;
extern int shutdown_NXT() ;
extern int exec_NXT_BIOS() ;
static S16___0 adc[4] ;
extern ResourceType SonarSensor ;
int generate_random_number(void)
{
  int iRandom ;
  int tmp ;

  {
  tmp = rand();
  iRandom = tmp % 10;
  return (iRandom);
}
}
int iSonarDistance = 0;
struct sMotorResource_t sMotorResource ;
static U8___1 bt_receive_buf[32] ;
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
  GetResource((ResourceType )SonarSensor);
  updateToo15 = (U32___2 )0;
  memset((void *)display_buffer, 0, (size_t )800);
  if (updateToo15) {
    display_tick = 0;
    nxt_lcd_update();
    goto Lret_display_update___3;
    Lret_display_update___3: ;
  }
  goto Lret_display_clear;
  Lret_display_clear:
  {
  x17 = 0;
  y18 = 1;
  {
  display_x = x17;
  display_y = y18;
  goto Lret_display_goto_xy;
  }
  Lret_display_goto_xy: ;
  str5 = "BT_receive";
  }
  while (*str5) {
    if ((int const )*str5 != 10) {
      c7 = (int )*str5;
      if (c7 >= 0) {
        if (c7 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b9 = & (*(display_buffer + display_y))[display_x * 6];
                  f10 = font[c7];
                  i8 = 0;
                  while (i8 < 5) {
                    *b9 = (U8 )*f10;
                    b9 ++;
                    f10 ++;
                    i8 ++;
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
    str5 ++;
  }
  goto Lret_display_string;
  Lret_display_string:
  display_tick = 0;
  nxt_lcd_update();
  goto Lret_display_update;
  Lret_display_update:
  tmp3 = rand();
  iRandom2 = tmp3 % 10;
  ret_generate_random_number4 = iRandom2;
  goto Lret_generate_random_number;
  Lret_generate_random_number:
  iRandom = ret_generate_random_number4;
  if (iRandom % 2 == 0) {
    ecrobot_read_bt_packet(bt_receive_buf, (U32___2 )32);
    if ((int )bt_receive_buf[0] == 1) {
      updateToo16 = (U32___2 )0;
      memset((void *)display_buffer, 0, (size_t )800);
      if (updateToo16) {
        display_tick = 0;
        nxt_lcd_update();
        goto Lret_display_update___4;
        Lret_display_update___4: ;
      }
      goto Lret_display_clear___0;
      Lret_display_clear___0:
      {
      x19 = 0;
      y20 = 1;
      {
      display_x = x19;
      display_y = y20;
      goto Lret_display_goto_xy___0;
      }
      Lret_display_goto_xy___0: ;
      str6 = "msg received";
      }
      while (*str6) {
        if ((int const )*str6 != 10) {
          c11 = (int )*str6;
          if (c11 >= 0) {
            if (c11 < 128) {
              if (display_x >= 0) {
                if (display_x < 16) {
                  if (display_y >= 0) {
                    if (display_y < 8) {
                      b13 = & (*(display_buffer + display_y))[display_x * 6];
                      f14 = font[c11];
                      i12 = 0;
                      while (i12 < 5) {
                        *b13 = (U8 )*f14;
                        b13 ++;
                        f14 ++;
                        i12 ++;
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
        str6 ++;
      }
      goto Lret_display_string___0;
      Lret_display_string___0:
      display_tick = 0;
      nxt_lcd_update();
      goto Lret_display_update___0;
      Lret_display_update___0:
      sMotorResource.sSonarDistance = ecrobot_get_sonar_sensor((U8___1 )1);
      if (sMotorResource.sTurnDistance == 0L) {
        sMotorResource.sTurnDistance = ecrobot_get_sonar_sensor((U8___1 )1);
      }
      if ((int )bt_receive_buf[1] != 50) {
        {
        sMotorResource.sLeftMotor = (S32___0 )bt_receive_buf[1];
        x21 = 0;
        y22 = 2;
        {
        display_x = x21;
        display_y = y22;
        goto Lret_display_goto_xy___1;
        }
        Lret_display_goto_xy___1: ;
        display_int((int )bt_receive_buf[1], (U32___2 )50);
        display_tick = 0;
        nxt_lcd_update();
        }
        goto Lret_display_update___1;
        Lret_display_update___1: ;
      }
      if ((int )bt_receive_buf[2] != 50) {
        {
        sMotorResource.sRightMotor = (S32___0 )bt_receive_buf[2];
        x23 = 0;
        y24 = 3;
        {
        display_x = x23;
        display_y = y24;
        goto Lret_display_goto_xy___2;
        }
        Lret_display_goto_xy___2: ;
        display_int((int )bt_receive_buf[2], (U32___2 )50);
        display_tick = 0;
        nxt_lcd_update();
        }
        goto Lret_display_update___2;
        Lret_display_update___2: ;
      }
    }
  }
  ReleaseResource((ResourceType )SonarSensor);
  TerminateTask();
  return;
}
}
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
  tmp4 = rand();
  iRandom3 = tmp4 % 10;
  ret_generate_random_number5 = iRandom3;
  goto Lret_generate_random_number;
  Lret_generate_random_number:
  {
  tmp = ret_generate_random_number5;
  iRandom = tmp;
  x11 = 0;
  y12 = 3;
  {
  display_x = x11;
  display_y = y12;
  goto Lret_display_goto_xy;
  }
  Lret_display_goto_xy: ;
  str6 = "Sonar";
  }
  while (*str6) {
    if ((int const )*str6 != 10) {
      c7 = (int )*str6;
      if (c7 >= 0) {
        if (c7 < 128) {
          if (display_x >= 0) {
            if (display_x < 16) {
              if (display_y >= 0) {
                if (display_y < 8) {
                  b9 = & (*(display_buffer + display_y))[display_x * 6];
                  f10 = font[c7];
                  i8 = 0;
                  while (i8 < 5) {
                    *b9 = (U8 )*f10;
                    b9 ++;
                    f10 ++;
                    i8 ++;
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
    str6 ++;
  }
  goto Lret_display_string;
  Lret_display_string:
  display_tick = 0;
  nxt_lcd_update();
  goto Lret_display_update;
  Lret_display_update:
  GetResource((ResourceType )SonarSensor);
  if (iRandom % 2 == 0) {
    sMotorResource.sSonarDistance = ecrobot_get_sonar_sensor((U8___1 )1);
  }
  ReleaseResource((ResourceType )SonarSensor);
  TerminateTask();
  return;
}
}
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
  {
  GetResource((ResourceType )SonarSensor);
  iRandom = 0;
  bt_send_buf[0] = (U8___1 )1;
  x20 = 0;
  y21 = 1;
  {
  display_x = x20;
  display_y = y21;
  goto Lret_display_goto_xy;
  }
  Lret_display_goto_xy: ;
  display_int((int )sMotorResource.sSonarDistance, (U32___2 )0);
  x22 = 0;
  y23 = 2;
  {
  display_x = x22;
  display_y = y23;
  goto Lret_display_goto_xy___0;
  }
  Lret_display_goto_xy___0: ;
  display_int((int )sMotorResource.sTurnDistance, (U32___2 )0);
  display_tick = 0;
  nxt_lcd_update();
  }
  goto Lret_display_update;
  Lret_display_update:
  tmp6 = rand();
  iRandom5 = tmp6 % 10;
  ret_generate_random_number7 = iRandom5;
  goto Lret_generate_random_number;
  Lret_generate_random_number:
  {
  iRandom = ret_generate_random_number7;
  x24 = 0;
  y25 = 4;
  {
  display_x = x24;
  display_y = y25;
  goto Lret_display_goto_xy___1;
  }
  Lret_display_goto_xy___1: ;
  display_int(iRandom, (U32___2 )50);
  display_tick = 0;
  nxt_lcd_update();
  }
  goto Lret_display_update___0;
  Lret_display_update___0: ;
  if (iRandom % 2 == 0) {
    if (sMotorResource.sSonarDistance <= 225L) {
      sLeftMotor = (S32___0 )0;
      sRightMotor = (S32___0 )0;
    } else
    if (sMotorResource.sTurnDistance - sMotorResource.sSonarDistance == 0L) {
      sLeftMotor = (S32___0 )0;
      sRightMotor = (S32___0 )0;
    } else
    if (sMotorResource.sSonarDistance >= 255L) {
      bt_send_buf[0] = (U8___1 )0;
      ecrobot_send_bt_packet(bt_send_buf, (U32___2 )32);
      sLeftMotor = sMotorResource.sLeftMotor;
      sRightMotor = sMotorResource.sRightMotor;
    } else {
      sLeftMotor = sMotorResource.sLeftMotor;
      sRightMotor = sMotorResource.sRightMotor;
    }
  }
  n8 = (U32___2 )0;
  speed_percent9 = (int )sLeftMotor;
  brake10 = 1;
  if (n8 < 3UL) {
    if (speed_percent9 > 100) {
      speed_percent9 = 100;
    }
    if (speed_percent9 < -100) {
      speed_percent9 = -100;
    }
    motor[n8].speed_percent = speed_percent9;
    n14 = n8;
    power_percent15 = speed_percent9;
    brake16 = brake10;
    if (n14 < 3UL) {
      io_to_avr.output_percent[n14] = (S8___0 )power_percent15;
      if (brake16) {
        io_to_avr.output_mode = (U8___0 )((int )io_to_avr.output_mode | (1 << n14));
      } else {
        io_to_avr.output_mode = (U8___0 )((int )io_to_avr.output_mode & ~ (1 << n14));
      }
    }
    goto Lret_nxt_avr_set_motor;
    Lret_nxt_avr_set_motor: ;
  }
  goto Lret_nxt_motor_set_speed;
  Lret_nxt_motor_set_speed:
  n11 = (U32___2 )1;
  speed_percent12 = (int )sRightMotor;
  brake13 = 1;
  if (n11 < 3UL) {
    if (speed_percent12 > 100) {
      speed_percent12 = 100;
    }
    if (speed_percent12 < -100) {
      speed_percent12 = -100;
    }
    motor[n11].speed_percent = speed_percent12;
    n17 = n11;
    power_percent18 = speed_percent12;
    brake19 = brake13;
    if (n17 < 3UL) {
      io_to_avr.output_percent[n17] = (S8___0 )power_percent18;
      if (brake19) {
        io_to_avr.output_mode = (U8___0 )((int )io_to_avr.output_mode | (1 << n17));
      } else {
        io_to_avr.output_mode = (U8___0 )((int )io_to_avr.output_mode & ~ (1 << n17));
      }
    }
    goto Lret_nxt_avr_set_motor___0;
    Lret_nxt_avr_set_motor___0: ;
  }
  goto Lret_nxt_motor_set_speed___0;
  Lret_nxt_motor_set_speed___0:
  systick_wait_ms((U32___2 )100);
  ReleaseResource((ResourceType )SonarSensor);
  TerminateTask();
  return;
}
}
void TaskMainIdleTask(void) ;
static SINT bt_status = 4;
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
  while (1) {
    ecrobot_init_bt_slave("1234");
    tmp = ecrobot_get_bt_status();
    if (tmp == 4) {
      updateToo13 = (U32___2 )0;
      memset((void *)display_buffer, 0, (size_t )800);
      if (updateToo13) {
        display_tick = 0;
        nxt_lcd_update();
        goto Lret_display_update___1;
        Lret_display_update___1: ;
      }
      goto Lret_display_clear;
      Lret_display_clear:
      {
      x15 = 0;
      y16 = 0;
      {
      display_x = x15;
      display_y = y16;
      goto Lret_display_goto_xy;
      }
      Lret_display_goto_xy: ;
      str3 = "Not initialized";
      }
      while (*str3) {
        if ((int const )*str3 != 10) {
          c5 = (int )*str3;
          if (c5 >= 0) {
            if (c5 < 128) {
              if (display_x >= 0) {
                if (display_x < 16) {
                  if (display_y >= 0) {
                    if (display_y < 8) {
                      b7 = & (*(display_buffer + display_y))[display_x * 6];
                      f8 = font[c5];
                      i6 = 0;
                      while (i6 < 5) {
                        *b7 = (U8 )*f8;
                        b7 ++;
                        f8 ++;
                        i6 ++;
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
      goto Lret_display_update;
      Lret_display_update: ;
    }
    tmp___0 = ecrobot_get_bt_status();
    if (tmp___0 == 7) {
      if (bt_status != 7) {
        updateToo14 = (U32___2 )0;
        memset((void *)display_buffer, 0, (size_t )800);
        if (updateToo14) {
          display_tick = 0;
          nxt_lcd_update();
          goto Lret_display_update___2;
          Lret_display_update___2: ;
        }
        goto Lret_display_clear___0;
        Lret_display_clear___0:
        {
        x17 = 0;
        y18 = 0;
        {
        display_x = x17;
        display_y = y18;
        goto Lret_display_goto_xy___0;
        }
        Lret_display_goto_xy___0: ;
        str4 = "[BT]";
        }
        while (*str4) {
          if ((int const )*str4 != 10) {
            c9 = (int )*str4;
            if (c9 >= 0) {
              if (c9 < 128) {
                if (display_x >= 0) {
                  if (display_x < 16) {
                    if (display_y >= 0) {
                      if (display_y < 8) {
                        b11 = & (*(display_buffer + display_y))[display_x * 6];
                        f12 = font[c9];
                        i10 = 0;
                        while (i10 < 5) {
                          *b11 = (U8 )*f12;
                          b11 ++;
                          f12 ++;
                          i10 ++;
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
          str4 ++;
        }
        goto Lret_display_string___0;
        Lret_display_string___0:
        display_tick = 0;
        nxt_lcd_update();
        goto Lret_display_update___0;
        Lret_display_update___0: ;
      }
    }
    bt_status = ecrobot_get_bt_status();
  }
}
}
extern int create_task() ;
void main(void)
{
  {
  create_task("TaskMainIdleTask", "TaskMainIdleTask", 1, 25, 1.965);
  create_task("TaskMainMotorControlTask", "TaskMainMotorControlTask", 3, 50, 2.108);
  create_task("TaskMainBluetooth_Receive", "TaskMainBluetooth_Receive", 2, 35, 0.372);
  create_task("TaskMainGetCurrentSonarSensor","TaskMainGetCurrentSonarSensor", 4, 26, 0.107);

  create_block(1032, "TaskMainMotorControlTask", "SonarSensor", 1, 3, 0.378);
  create_block(743, "TaskMainBluetooth_Receive", "SonarSensor", 1, 2, 0.108);
  create_block(993, "TaskMainGetCurrentSonarSensor", "SonarSensor", 1, 4, 0.009);
  return;
}
}

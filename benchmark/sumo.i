# 1 "sumo/sumo.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "sumo/sumo.c"


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
typedef unsigned int volatile AT91_REG;
typedef unsigned long size_t;
struct __anonstruct_display_array_740464799 {
   Object hdr ;
   U8 displayN[9][100] ;
} __attribute__((__packed__)) ;
typedef unsigned char U8___0;
typedef unsigned short U16___0;
typedef unsigned long U32___0;
typedef unsigned int AT91_REG___0;
struct i2c_pin_pair {
   U32___0 scl ;
   U32___0 sda ;
};
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
   U8___0 *dataN ;
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
typedef unsigned short U16___1;
typedef short S16___0;
typedef unsigned long U32___1;
typedef long S32___0;
typedef char CHAR;
typedef unsigned int UINT;
typedef int SINT;
struct __anonstruct_nxt_inputs_83380041 {
   U32___1 battery_state ;
   U8___1 buttons_state ;
};
typedef struct __anonstruct_nxt_inputs_83380041 nxt_inputs;
struct __anonstruct_riff_705856829 {
   U32___1 chunkID ;
   U32___1 chunkSize ;
   U32___1 format ;
} __attribute__((__packed__)) ;
struct __anonstruct_fmt_307472724 {
   U32___1 chunkID ;
   U32___1 chunkSize ;
   U16___1 audioFormat ;
   U16___1 numChannels ;
   U32___1 sampleRate ;
   U32___1 byteRate ;
   U16___1 blockAlign ;
   U16___1 bitsPerSample ;
   U16___1 dummy ;
} __attribute__((__packed__)) ;
struct __anonstruct_data_325997328 {
   U32___1 chunkID ;
   U32___1 chunkSize ;
   U8___1 data[] ;
} __attribute__((__packed__)) ;
struct __anonstruct_WAV_365060792 {
   struct __anonstruct_riff_705856829 riff ;
   struct __anonstruct_fmt_307472724 fmt ;
   struct __anonstruct_data_325997328 data ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_WAV_365060792 WAV;
struct __anonstruct_riff_717123104 {
   U32___1 chunkID ;
   U32___1 chunkSize ;
   U32___1 format ;
} __attribute__((__packed__)) ;
struct __anonstruct_fmt_947264284 {
   U32___1 chunkID ;
   U32___1 chunkSize ;
   U16___1 audioFormat ;
   U16___1 numChannels ;
   U32___1 sampleRate ;
   U32___1 byteRate ;
   U16___1 blockAlign ;
   U16___1 bitsPerSample ;
} __attribute__((__packed__)) ;
struct __anonstruct_data_947264285 {
   U32___1 chunkID ;
   U32___1 chunkSize ;
   U8___1 data[] ;
} __attribute__((__packed__)) ;
struct __anonstruct_WAV_ND_717123103 {
   struct __anonstruct_riff_717123104 riff ;
   struct __anonstruct_fmt_947264284 fmt ;
   struct __anonstruct_data_947264285 data ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_WAV_ND_717123103 WAV_ND;
struct __anonstruct_riff_947264286 {
   U32___1 chunkID ;
   U32___1 chunkSize ;
   U32___1 format ;
} __attribute__((__packed__)) ;
struct __anonstruct_fmt_947264287 {
   U32___1 chunkID ;
   U32___1 chunkSize ;
   U16___1 audioFormat ;
   U16___1 numChannels ;
   U32___1 sampleRate ;
   U32___1 byteRate ;
   U16___1 blockAlign ;
   U16___1 bitsPerSample ;
   U16___1 dummy ;
} __attribute__((__packed__)) ;
struct __anonstruct_data_138372828 {
   U32___1 chunkID ;
   U32___1 chunkSize ;
   U32___1 numSamples ;
   U32___1 data_chunkID ;
   U32___1 data_chunkSize ;
   U8___1 data[] ;
} __attribute__((__packed__)) ;
struct __anonstruct_WAV_FACT_433279507 {
   struct __anonstruct_riff_947264286 riff ;
   struct __anonstruct_fmt_947264287 fmt ;
   struct __anonstruct_data_138372828 data ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_WAV_FACT_433279507 WAV_FACT;
struct __anonstruct_riff_947264288 {
   U32___1 chunkID ;
   U32___1 chunkSize ;
   U32___1 format ;
} __attribute__((__packed__)) ;
struct __anonstruct_fmt_947264289 {
   U32___1 chunkID ;
   U32___1 chunkSize ;
   U16___1 audioFormat ;
   U16___1 numChannels ;
   U32___1 sampleRate ;
   U32___1 byteRate ;
   U16___1 blockAlign ;
   U16___1 bitsPerSample ;
   U16___1 dummy ;
} __attribute__((__packed__)) ;
struct __anonstruct_data_947264290 {
   U32___1 chunkID ;
   U32___1 chunkSize ;
   U8___1 data[] ;
} __attribute__((__packed__)) ;
struct __anonstruct_WAV_NL_649910766 {
   struct __anonstruct_riff_947264288 riff ;
   struct __anonstruct_fmt_947264289 fmt ;
   struct __anonstruct_data_947264290 data ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_WAV_NL_649910766 WAV_NL;
struct __anonstruct_fileHeader_706858178 {
   U16___1 type ;
   U32___1 size ;
   U16___1 reserved1 ;
   U16___1 reserved2 ;
   U32___1 offset ;
} __attribute__((__packed__)) ;
struct __anonstruct_infoHeader_110306387 {
   U32___1 size ;
   S32___0 width ;
   S32___0 height ;
   U16___1 planes ;
   U16___1 bits ;
   U32___1 compression ;
   U32___1 imagesize ;
   S32___0 xresolution ;
   S32___0 yresolution ;
   U32___1 ncolours ;
   U32___1 importantcolours ;
} __attribute__((__packed__)) ;
struct __anonstruct_rgb_846263947 {
   U8___1 blue ;
   U8___1 green ;
   U8___1 red ;
   U8___1 reserved ;
} __attribute__((__packed__)) ;
struct __anonstruct_BMP_621040705 {
   struct __anonstruct_fileHeader_706858178 fileHeader ;
   struct __anonstruct_infoHeader_110306387 infoHeader ;
   struct __anonstruct_rgb_846263947 rgb ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_BMP_621040705 BMP;
struct __anonstruct_NXTCOLORSENSOR_T_371327434 {
   U16___1 color ;
   S16___0 rgb[3] ;
   U16___1 light ;
   U8___1 volatile mode ;
   U8___1 volatile mode_state ;
   U8___1 volatile port_in_use ;
};
typedef struct __anonstruct_NXTCOLORSENSOR_T_371327434 NXTCOLORSENSOR_T;
typedef unsigned char U8___2;
typedef signed char S8___1;
typedef unsigned short U16___2;
typedef unsigned long U32___2;
typedef unsigned long size_t___0;
struct __anonstruct_to_avr_432250394 {
   U8___2 power ;
   U8___2 pwm_frequency ;
   S8___1 output_percent[4] ;
   U8___2 output_mode ;
   U8___2 input_power ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_to_avr_432250394 to_avr;
struct __anonstruct_from_avr_708559676 {
   U16___2 adc_value[4] ;
   U16___2 buttonsVal ;
   U16___2 extra ;
   U8___2 csum ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_from_avr_708559676 from_avr;
struct __anonstruct_nxt_avr_stats_680423455 {
   U32___2 good_rx ;
   U32___2 bad_rx ;
   U32___2 resets ;
   U32___2 still_busy ;
   U32___2 not_ok ;
};
typedef unsigned long U32___3;
typedef unsigned int AT91_REG___1;
struct motor_struct {
   int current_count ;
   int target_count ;
   int speed_percent ;
   U32___3 last ;
};
typedef unsigned char UINT8;
typedef UINT8 StatusType;
typedef UINT8 ResourceType;
typedef unsigned char U8___3;
typedef unsigned short U16___3;
typedef unsigned long U32___4;
typedef long S32___1;
struct dc_t {
   U32___4 duration ;
   S32___1 speed_left ;
   S32___1 speed_right ;
   int priority ;
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
extern void systick_wait_ms(U32 ms ) ;
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
unsigned char volatile dirty = (U8 volatile )0;
unsigned char volatile page = (U8 volatile )0;
U8 const volatile *dataM = (U8 const volatile *)((U8 *)0);
U8 mode = (U8 )255;
extern void spi_isr_entry(void) ;
# 1077 "sumo/sumo.c"
int display_x ;
int display_y ;
# 1446 "sumo/sumo.c"
void i2c_disable(int port ) ;
void i2c_enable(int port ) ;
void i2c_init(void) ;
int i2c_busy(int port ) ;
int i2c_start_transaction(int port , U32___0 address , int internal_address , int n_internal_address_bytes ,
                          U8___0 *data , U32___0 nbytes , int write ) ;
static struct i2c_pin_pair const i2c_pin[4] = { {(U32___0 )(1 << 23), (U32___0 )(1 << 18)},
        {(U32___0 )(1 << 28), (U32___0 )(1 << 19)},
        {(U32___0 )(1 << 29), (U32___0 )(1 << 20)},
        {(U32___0 )(1 << 30), (U32___0 )(1 << 2)}};
static struct i2c_port_struct i2c_port[4] ;
static U32___0 i2c_int_count ;
extern void i2c_timer_isr_entry(void) ;
# 2245 "sumo/sumo.c"
static S32___0 distance_state[4] = { (S32___0 )-1, (S32___0 )-1, (S32___0 )-1, (S32___0 )-1};
# 2285 "sumo/sumo.c"
U8___1 const NXT_COLORSENSOR_PROTOCOLS[7] = { (U8___1 const )176, (U8___1 const )112, (U8___1 const )240, (U8___1 const )8,
        (U8___1 const )176, (U8___1 const )136, (U8___1 const )136};

static NXTCOLORSENSOR_T sensor_data[4] ;
# 3845 "sumo/sumo.c"
static to_avr io_to_avr ;
static U8___2 data_to_avr[9] ;
static from_avr data_from_avr[2] ;
static from_avr *io_from_avr ;
static U32___2 from_buf ;
static U16___2 prev_buttons ;
static U16___2 button_state ;
static U16___2 debounce_state ;
static U16___2 debounce_cnt ;
# 4109 "sumo/sumo.c"
static struct motor_struct motor[3] ;
static U32___3 nxt_motor_initialised ;
static U32___3 interrupts_this_period ;
# 4202 "sumo/sumo.c"
extern void nxt_motor_isr_entry(void) ;
# 4251 "sumo/sumo.c"
extern __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) rand)(void) ;
extern StatusType TerminateTask(void) ;
extern StatusType GetResource(ResourceType resid ) ;
extern StatusType ReleaseResource(ResourceType resid ) ;
extern ResourceType DrivingControlResource ;
struct dc_t dc = {(U32___4 )0, (S32___1 )0, (S32___1 )0, 5};
U32___4 SeekStarted ;
S32___1 LastSonarValue ;
int InSetupPhase ;
U32___4 SetupStarted ;
void TaskMainMotorcontrolTask(void)
{
  U32___3 n1 ;
  int speed_percent2 ;
  int brake3 ;
  U32___3 n4 ;
  int speed_percent5 ;
  int brake6 ;
  U32___2 n7 ;
  int power_percent8 ;
  int brake9 ;
  U32___2 n10 ;
  int power_percent11 ;
  int brake12 ;

  {
  if (InSetupPhase) {
    TerminateTask();
  }
  GetResource(DrivingControlResource);
  if (dc.duration > 0UL) {
    dc.duration -= 50UL;
  } else {
    dc.priority = 5;
    dc.duration = (U32___4 )0;
    dc.speed_left = (S32___1 )0;
    dc.speed_right = (S32___1 )0;
  }
  n1 = (U32___4 )1;
  speed_percent2 = (int )(- dc.speed_left);
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
      io_to_avr.output_percent[n7] = (S8___1 )power_percent8;
      if (brake9) {
        io_to_avr.output_mode = (U8___2 )((int )io_to_avr.output_mode | (1 << n7));
      } else {
        io_to_avr.output_mode = (U8___2 )((int )io_to_avr.output_mode & ~ (1 << n7));
      }
    }
    goto Lret_nxt_avr_set_motor;
    Lret_nxt_avr_set_motor: ;
  }
  goto Lret_nxt_motor_set_speed;
  Lret_nxt_motor_set_speed:
  n4 = (U32___4 )0;
  speed_percent5 = (int )(- dc.speed_right);
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
      io_to_avr.output_percent[n10] = (S8___1 )power_percent11;
      if (brake12) {
        io_to_avr.output_mode = (U8___2 )((int )io_to_avr.output_mode | (1 << n10));
      } else {
        io_to_avr.output_mode = (U8___2 )((int )io_to_avr.output_mode & ~ (1 << n10));
      }
    }
    goto Lret_nxt_avr_set_motor___0;
    Lret_nxt_avr_set_motor___0: ;
  }
  goto Lret_nxt_motor_set_speed___0;
  Lret_nxt_motor_set_speed___0:
  ReleaseResource(DrivingControlResource);
  TerminateTask();
  return;
}
}
void TaskMainColorSensorTask(void)
{
  U16___3 color ;
  U16___3 tmp ;
  int priority3 ;
  int speed_left4 ;
  int speed_right5 ;
  int duration6 ;
  U8___1 port_id7 ;
  unsigned short ret_ecrobot_get_nxtcolorsensor_light8 ;
  int port_id9 ;
  NXTCOLORSENSOR_T *sd10 ;
  U8___1 mode11 ;
  int tmp12 ;
  int tmp___013 ;

  {
  if (InSetupPhase) {
    TerminateTask();
  }
  port_id9 = 0;
  while (port_id9 < 4) {
    sd10 = & sensor_data[port_id9];
    if (sd10->port_in_use) {
      mode11 = (U8___1 )sd10->mode;
      if ((int )mode11 == 6) {
        sd10->port_in_use = (U8___1 volatile )0;
        colorsensor_init(port_id9, (unsigned char)136);
        goto Lret_ecrobot_process_bg_nxtcolorsensor;
      } else
      if ((int )mode11 != (int )sd10->mode_state) {
        sd10->color = (U16___1 )99;
        sd10->rgb[0] = (S16___0 )0;
        sd10->rgb[1] = (S16___0 )0;
        sd10->rgb[2] = (S16___0 )0;
        sd10->light = (U16___1 )0;
        sd10->mode_state = (U8___1 volatile )mode11;
        colorsensor_init(port_id9, (unsigned char)136);
        colorsensor_init(port_id9, (unsigned char )NXT_COLORSENSOR_PROTOCOLS[mode11]);
      }
      if ((int )mode11 == 0) {
        tmp12 = colorsensor_color_get(port_id9);
        sd10->color = (U16___1 )tmp12;
        colorsensor_rgb_get(port_id9, sd10->rgb);
      } else {
        tmp___013 = colorsensor_light_get(port_id9);
        sd10->light = (U16___1 )tmp___013;
        if ((int )mode11 == 4) {
          colorsensor_light_full(port_id9);
        }
      }
    }
    port_id9 ++;
  }
  goto Lret_ecrobot_process_bg_nxtcolorsensor;
  Lret_ecrobot_process_bg_nxtcolorsensor:
  port_id7 = (U8___3 )0;
  ret_ecrobot_get_nxtcolorsensor_light8 = sensor_data[port_id7].light;
  goto Lret_ecrobot_get_nxtcolorsensor_light;
  Lret_ecrobot_get_nxtcolorsensor_light:
  tmp = ret_ecrobot_get_nxtcolorsensor_light8;
  color = tmp;
  if ((int )color < 300) {
    GetResource(DrivingControlResource);
    priority3 = 50;
    speed_left4 = -100;
    speed_right5 = -100;
    duration6 = 1250;
    GetResource(DrivingControlResource);
    if (dc.priority != 20) {
      SeekStarted = (U32___4 )0;
    }
    if (priority3 >= dc.priority) {
      dc.priority = priority3;
      dc.speed_left = (S32___1 )speed_left4;
      dc.speed_right = (S32___1 )speed_right5;
      dc.duration = (U32___4 )duration6;
    }
    ReleaseResource(DrivingControlResource);
    goto Lret_change_driving_command;
    Lret_change_driving_command:
    ReleaseResource(DrivingControlResource);
  }
  TerminateTask();
  return;
}
}
extern int copysign() ;
void TaskMainSonarSensorTask(void)
{
  int duration ;
  S32___1 distance ;
  S32___1 tmp ;
  int seek_delay_1 ;
  int seek_delay_2 ;
  int seek_delay_3 ;
  int seek_delay_4 ;
  int speed_left ;
  int speed_right ;
  int modifier ;
  int tmp___0 ;
  int tmp___1 ;
  U32___4 current_sys_tick ;
  U32___4 tmp___2 ;
  U32___4 delta ;
  int priority16 ;
  int speed_left17 ;
  int speed_right18 ;
  int duration19 ;
  int priority20 ;
  int speed_left21 ;
  int speed_right22 ;
  int duration23 ;
  int priority24 ;
  int speed_left25 ;
  int speed_right26 ;
  int duration27 ;
  int priority28 ;
  int speed_left29 ;
  int speed_right30 ;
  int duration31 ;
  int priority32 ;
  int speed_left33 ;
  int speed_right34 ;
  int duration35 ;
  int priority36 ;
  int speed_left37 ;
  int speed_right38 ;
  int duration39 ;
  U8___1 port_id40 ;
  int tmp41 ;
  long ret_ecrobot_get_sonar_sensor42 ;
  int port43 ;
  U32___0 address44 ;
  int internal_address45 ;
  int n_internal_address_bytes46 ;
  U8___0 *data47 ;
  U32___0 nbytes48 ;
  int write49 ;
  struct i2c_port_struct *p50 ;
  struct i2c_partial_transaction *pt51 ;
  int tmp52 ;
  int tmp___053 ;

  {
  if (InSetupPhase) {
    TerminateTask();
  }
  duration = 3000;
  port_id40 = (U8___3 )1;
  tmp41 = i2c_busy((int )port_id40);
  if (tmp41 == 0) {

    port43 = (int )port_id40;
    address44 = (U32___1 )1;
    internal_address45 = 66;
    n_internal_address_bytes46 = 1;

    nbytes48 = (U32___1 )1;
    write49 = 0;
    if (port43 < 0) {
      goto Lret_i2c_start_transaction;
    } else
    if (port43 >= 4) {
      goto Lret_i2c_start_transaction;
    }
    tmp52 = i2c_busy(port43);
    if (tmp52) {
      goto Lret_i2c_start_transaction;
    }
    p50 = & i2c_port[port43];
    p50->pt_num = (U32___0 )0;
    p50->pt_begun = (U32___0 )0;
    pt51 = p50->partial_transaction;
    p50->current_pt = pt51;
    memset((void *)pt51, 0, sizeof(p50->partial_transaction));
    if (n_internal_address_bytes46 > 0) {
      p50->addr_int[0] = (U8___0 )(address44 << 1);
      p50->addr_int[1] = (U8___0 )internal_address45;
      pt51->start = (U8___0 )1;
      if (write49) {
        pt51->stop = (U8___0 )0;
      } else {
        pt51->stop = (U8___0 )1;
      }
      pt51->tx = (U8___0 )1;
      pt51->data = p50->addr_int;
      pt51->nbytes = (U16___0 )2;
      pt51 ++;
    }
    if (n_internal_address_bytes46 == 0) {
      goto _L___2;
    } else
    if (! write49) {
      _L___2:
      if (n_internal_address_bytes46 > 0) {
        pt51->start = (U8___0 )0;
      } else {
        pt51->start = (U8___0 )1;
      }
      pt51->restart = (U8___0 )(! pt51->start);
      pt51->stop = (U8___0 )0;
      pt51->tx = (U8___0 )1;
      if (write49) {
        tmp___053 = 0;
      } else {
        tmp___053 = 1;
      }
      p50->addr = (U8___0 )((address44 << 1) | (unsigned long )tmp___053);
      pt51->data = & p50->addr;
      pt51->nbytes = (U16___0 )1;
      pt51 ++;
    }
    pt51->start = (U8___0 )0;
    pt51->stop = (U8___0 )1;
    if (write49) {
      pt51->tx = (U8___0 )1;
    } else {
      pt51->tx = (U8___0 )0;
    }
    pt51->data = data47;
    pt51->nbytes = (U16___0 )nbytes48;
    pt51->last_pt = (U8___0 )1;
    p50->state = (i2c_port_state )2;
    goto Lret_i2c_start_transaction;
    Lret_i2c_start_transaction: ;
  }
  ret_ecrobot_get_sonar_sensor42 = distance_state[port_id40];
  goto Lret_ecrobot_get_sonar_sensor;
  Lret_ecrobot_get_sonar_sensor:
  tmp = ret_ecrobot_get_sonar_sensor42;
  distance = tmp;
  if (LastSonarValue == 0L) {
    LastSonarValue = (S32___1 )255;
  }
  if (distance == 255L) {
    if (LastSonarValue < 20L) {
      priority16 = 30;
      speed_left17 = 100;
      speed_right18 = 100;
      duration19 = 150;
      GetResource(DrivingControlResource);
      if (dc.priority != 20) {
        SeekStarted = (U32___4 )0;
      }
      if (priority16 >= dc.priority) {
        dc.priority = priority16;
        dc.speed_left = (S32___1 )speed_left17;
        dc.speed_right = (S32___1 )speed_right18;
        dc.duration = (U32___4 )duration19;
      }
      ReleaseResource(DrivingControlResource);
      goto Lret_change_driving_command;
      Lret_change_driving_command: ;
    } else {
      LastSonarValue = distance;
    }
  } else {
    LastSonarValue = distance;
  }
  seek_delay_1 = 1000;
  seek_delay_2 = seek_delay_1 * 2;
  seek_delay_3 = seek_delay_2 * 2;
  seek_delay_4 = seek_delay_3 + 2000;
  if (distance > 70L) {
    if (SeekStarted == 0UL) {
      SeekStarted = systick_get_ms();
      tmp___0 = rand();
      tmp___1 = copysign(1, tmp___0 - 1073741823);
      modifier = tmp___1;
      speed_left = -70 * modifier;
      speed_right = 70 * modifier;
      priority20 = 20;
      speed_left21 = speed_left;
      speed_right22 = speed_right;
      duration23 = duration;
      GetResource(DrivingControlResource);
      if (dc.priority != 20) {
        SeekStarted = (U32___4 )0;
      }
      if (priority20 >= dc.priority) {
        dc.priority = priority20;
        dc.speed_left = (S32___1 )speed_left21;
        dc.speed_right = (S32___1 )speed_right22;
        dc.duration = (U32___4 )duration23;
      }
      ReleaseResource(DrivingControlResource);
      goto Lret_change_driving_command___0;
      Lret_change_driving_command___0: ;
    } else {
      tmp___2 = systick_get_ms();
      current_sys_tick = tmp___2;
      delta = current_sys_tick - SeekStarted;
      if (delta > (U32___4 )seek_delay_1) {
        if (delta <= (U32___4 )(seek_delay_1 + 100)) {
          GetResource(DrivingControlResource);
          speed_left = (int )(dc.speed_left * -1L);
          speed_right = (int )(dc.speed_right * -1L);
          ReleaseResource(DrivingControlResource);
          priority24 = 20;
          speed_left25 = speed_left;
          speed_right26 = speed_right;
          duration27 = duration;
          GetResource(DrivingControlResource);
          if (dc.priority != 20) {
            SeekStarted = (U32___4 )0;
          }
          if (priority24 >= dc.priority) {
            dc.priority = priority24;
            dc.speed_left = (S32___1 )speed_left25;
            dc.speed_right = (S32___1 )speed_right26;
            dc.duration = (U32___4 )duration27;
          }
          ReleaseResource(DrivingControlResource);
          goto Lret_change_driving_command___1;
          Lret_change_driving_command___1: ;
        } else {
          goto _L___1;
        }
      } else
      _L___1:
      if (delta > (U32___4 )seek_delay_2) {
        if (delta <= (U32___4 )(seek_delay_2 + 100)) {
          GetResource(DrivingControlResource);
          speed_left = (int )(dc.speed_left * -1L);
          speed_right = (int )(dc.speed_right * -1L);
          ReleaseResource(DrivingControlResource);
          priority28 = 20;
          speed_left29 = speed_left;
          speed_right30 = speed_right;
          duration31 = duration;
          GetResource(DrivingControlResource);
          if (dc.priority != 20) {
            SeekStarted = (U32___4 )0;
          }
          if (priority28 >= dc.priority) {
            dc.priority = priority28;
            dc.speed_left = (S32___1 )speed_left29;
            dc.speed_right = (S32___1 )speed_right30;
            dc.duration = (U32___4 )duration31;
          }
          ReleaseResource(DrivingControlResource);
          goto Lret_change_driving_command___2;
          Lret_change_driving_command___2: ;
        } else {
          goto _L___0;
        }
      } else
      _L___0:
      if (delta > (U32___4 )seek_delay_3) {
        if (delta <= (U32___4 )seek_delay_4) {
          speed_left = 100;
          speed_right = 100;
          priority32 = 20;
          speed_left33 = speed_left;
          speed_right34 = speed_right;
          duration35 = duration;
          GetResource(DrivingControlResource);
          if (dc.priority != 20) {
            SeekStarted = (U32___4 )0;
          }
          if (priority32 >= dc.priority) {
            dc.priority = priority32;
            dc.speed_left = (S32___1 )speed_left33;
            dc.speed_right = (S32___1 )speed_right34;
            dc.duration = (U32___4 )duration35;
          }
          ReleaseResource(DrivingControlResource);
          goto Lret_change_driving_command___3;
          Lret_change_driving_command___3: ;
        } else {
          goto _L;
        }
      } else
      _L:
      if (delta > (U32___4 )seek_delay_4) {
        SeekStarted = (U32___4 )0;
      }
    }
  } else {
    priority36 = 30;
    speed_left37 = 100;
    speed_right38 = 100;
    duration39 = 150;
    GetResource(DrivingControlResource);
    if (dc.priority != 20) {
      SeekStarted = (U32___4 )0;
    }
    if (priority36 >= dc.priority) {
      dc.priority = priority36;
      dc.speed_left = (S32___1 )speed_left37;
      dc.speed_right = (S32___1 )speed_right38;
      dc.duration = (U32___4 )duration39;
    }
    ReleaseResource(DrivingControlResource);
    goto Lret_change_driving_command___4;
    Lret_change_driving_command___4: ;
  }
  TerminateTask();
  return;
}
}
void TaskMainDisplayTask(void)
{
  U32___4 tmp ;
  U16___3 color ;
  U16___3 tmp___0 ;
  S32___1 sonar ;
  S32___1 tmp___1 ;
  U8___1 port_id6 ;
  int tmp7 ;
  long ret_ecrobot_get_sonar_sensor8 ;
  U8___1 port_id9 ;
  unsigned short ret_ecrobot_get_nxtcolorsensor_light10 ;
  int port11 ;
  U32___0 address12 ;
  int internal_address13 ;
  int n_internal_address_bytes14 ;
  U8___0 *data15 ;
  U32___0 nbytes16 ;
  int write17 ;
  struct i2c_port_struct *p18 ;
  struct i2c_partial_transaction *pt19 ;
  int tmp20 ;
  int tmp___021 ;
  int x22 ;
  int y23 ;
  int x24 ;
  int y25 ;
  int x26 ;
  int y27 ;
  int x28 ;
  int y29 ;
  int x30 ;
  int y31 ;
  int x32 ;
  int y33 ;
  int x34 ;
  int y35 ;
  char const *str36 ;
  char const *str37 ;
  char const *str38 ;
  char const *str39 ;
  char const *str40 ;
  char const *str41 ;
  char const *str42 ;
  char const *str43 ;
  char const *str44 ;
  char const *str45 ;
  char const *str46 ;
  char const *str47 ;
  char const *str48 ;
  int val49 ;
  U32 places50 ;
  int tmp51 ;
  int val52 ;
  U32 places53 ;
  int tmp54 ;
  int val55 ;
  U32 places56 ;
  int tmp57 ;
  int val58 ;
  U32 places59 ;
  int tmp60 ;
  int val61 ;
  U32 places62 ;
  int tmp63 ;
  int val64 ;
  U32 places65 ;
  int tmp66 ;
  int val67 ;
  U32 places68 ;
  int tmp69 ;
  int val70 ;
  U32 places71 ;
  int tmp72 ;

  {
  if (InSetupPhase) {
    TerminateTask();
  }
  display_clear((U32___4 )0);
  GetResource(DrivingControlResource);
  x22 = 0;
  y23 = 0;
  display_x = x22;
  display_y = y23;
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
  str36 = "PRIO: ";
  while (*str36) {
    if ((int const )*str36 != 10) {
      display_char((int )*str36);
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str36 ++;
  }
  goto Lret_display_string;
  Lret_display_string: ;
  switch (dc.priority) {
  case 5:
  str37 = "IDLE";
  while (*str37) {
    if ((int const )*str37 != 10) {
      display_char((int )*str37);
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str37 ++;
  }
  goto Lret_display_string___0;
  Lret_display_string___0: ;
  break;
  case 20:
  str38 = "SEEK";
  while (*str38) {
    if ((int const )*str38 != 10) {
      display_char((int )*str38);
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str38 ++;
  }
  goto Lret_display_string___1;
  Lret_display_string___1: ;
  break;
  case 30:
  str39 = "FOLLOW";
  while (*str39) {
    if ((int const )*str39 != 10) {
      display_char((int )*str39);
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str39 ++;
  }
  goto Lret_display_string___2;
  Lret_display_string___2: ;
  break;
  case 50:
  str40 = "COLOR";
  while (*str40) {
    if ((int const )*str40 != 10) {
      display_char((int )*str40);
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str40 ++;
  }
  goto Lret_display_string___3;
  Lret_display_string___3: ;
  break;
  default:
  str41 = "WTF: ";
  while (*str41) {
    if ((int const )*str41 != 10) {
      display_char((int )*str41);
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str41 ++;
  }
  goto Lret_display_string___4;
  Lret_display_string___4:
  {
  val49 = dc.priority;
  places50 = (U32___4 )3;
  {
  if (val49 < 0) {
    tmp51 = - val49;
  } else {
    tmp51 = val49;
  }
  display_unsigned_worker((U32 )tmp51, places50, (U32 )(val49 < 0));
  goto Lret_display_int;
  }
  Lret_display_int: ;
  }
  break;
  }
  x24 = 0;
  y25 = 1;
  display_x = x24;
  display_y = y25;
  goto Lret_display_goto_xy___0;
  Lret_display_goto_xy___0:
  str42 = "SPEED L/R: ";
  while (*str42) {
    if ((int const )*str42 != 10) {
      display_char((int )*str42);
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str42 ++;
  }
  goto Lret_display_string___5;
  Lret_display_string___5:
  x26 = 0;
  y27 = 2;
  display_x = x26;
  display_y = y27;
  goto Lret_display_goto_xy___1;
  Lret_display_goto_xy___1:
  {
  val52 = (int )dc.speed_left;
  places53 = (U32___4 )4;
  {
  if (val52 < 0) {
    tmp54 = - val52;
  } else {
    tmp54 = val52;
  }
  display_unsigned_worker((U32 )tmp54, places53, (U32 )(val52 < 0));
  goto Lret_display_int___0;
  }
  Lret_display_int___0: ;
  str43 = "/";
  }
  while (*str43) {
    if ((int const )*str43 != 10) {
      display_char((int )*str43);
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str43 ++;
  }
  goto Lret_display_string___6;
  Lret_display_string___6:
  {
  val55 = (int )dc.speed_right;
  places56 = (U32___4 )4;
  {
  if (val55 < 0) {
    tmp57 = - val55;
  } else {
    tmp57 = val55;
  }
  display_unsigned_worker((U32 )tmp57, places56, (U32 )(val55 < 0));
  goto Lret_display_int___1;
  }
  Lret_display_int___1: ;
  x28 = 0;
  y29 = 3;
  display_x = x28;
  display_y = y29;
  }
  goto Lret_display_goto_xy___2;
  Lret_display_goto_xy___2:
  str44 = "DURATION: ";
  while (*str44) {
    if ((int const )*str44 != 10) {
      display_char((int )*str44);
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str44 ++;
  }
  goto Lret_display_string___7;
  Lret_display_string___7:
  {
  val58 = (int )dc.duration;
  places59 = (U32___4 )0;
  {
  if (val58 < 0) {
    tmp60 = - val58;
  } else {
    tmp60 = val58;
  }
  display_unsigned_worker((U32 )tmp60, places59, (U32 )(val58 < 0));
  goto Lret_display_int___2;
  }
  Lret_display_int___2: ;
  ReleaseResource(DrivingControlResource);
  x30 = 0;
  y31 = 4;
  display_x = x30;
  display_y = y31;
  }
  goto Lret_display_goto_xy___3;
  Lret_display_goto_xy___3:
  str45 = "SYSTEM: ";
  while (*str45) {
    if ((int const )*str45 != 10) {
      display_char((int )*str45);
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str45 ++;
  }
  goto Lret_display_string___8;
  Lret_display_string___8:
  {
  tmp = systick_get_ms();
  val61 = (int )tmp;
  places62 = (U32___4 )0;
  {
  if (val61 < 0) {
    tmp63 = - val61;
  } else {
    tmp63 = val61;
  }
  display_unsigned_worker((U32 )tmp63, places62, (U32 )(val61 < 0));
  goto Lret_display_int___3;
  }
  Lret_display_int___3: ;
  port_id9 = (U8___3 )0;
  ret_ecrobot_get_nxtcolorsensor_light10 = sensor_data[port_id9].light;
  }
  goto Lret_ecrobot_get_nxtcolorsensor_light;
  Lret_ecrobot_get_nxtcolorsensor_light:
  tmp___0 = ret_ecrobot_get_nxtcolorsensor_light10;
  color = tmp___0;
  x32 = 0;
  y33 = 5;
  display_x = x32;
  display_y = y33;
  goto Lret_display_goto_xy___4;
  Lret_display_goto_xy___4:
  str46 = "COLOR: ";
  while (*str46) {
    if ((int const )*str46 != 10) {
      display_char((int )*str46);
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str46 ++;
  }
  goto Lret_display_string___9;
  Lret_display_string___9:
  {
  val64 = (int )color;
  places65 = (U32___4 )0;
  {
  if (val64 < 0) {
    tmp66 = - val64;
  } else {
    tmp66 = val64;
  }
  display_unsigned_worker((U32 )tmp66, places65, (U32 )(val64 < 0));
  goto Lret_display_int___4;
  }
  Lret_display_int___4: ;
  port_id6 = (U8___3 )1;
  tmp7 = i2c_busy((int )port_id6);
  }
  if (tmp7 == 0) {

    port11 = (int )port_id6;
    address12 = (U32___1 )1;
    internal_address13 = 66;
    n_internal_address_bytes14 = 1;

    nbytes16 = (U32___1 )1;
    write17 = 0;
    if (port11 < 0) {
      goto Lret_i2c_start_transaction;
    } else
    if (port11 >= 4) {
      goto Lret_i2c_start_transaction;
    }
    tmp20 = i2c_busy(port11);
    if (tmp20) {
      goto Lret_i2c_start_transaction;
    }
    p18 = & i2c_port[port11];
    p18->pt_num = (U32___0 )0;
    p18->pt_begun = (U32___0 )0;
    pt19 = p18->partial_transaction;
    p18->current_pt = pt19;
    memset((void *)pt19, 0, sizeof(p18->partial_transaction));
    if (n_internal_address_bytes14 > 0) {
      p18->addr_int[0] = (U8___0 )(address12 << 1);
      p18->addr_int[1] = (U8___0 )internal_address13;
      pt19->start = (U8___0 )1;
      if (write17) {
        pt19->stop = (U8___0 )0;
      } else {
        pt19->stop = (U8___0 )1;
      }
      pt19->tx = (U8___0 )1;
      pt19->data = p18->addr_int;
      pt19->nbytes = (U16___0 )2;
      pt19 ++;
    }
    if (n_internal_address_bytes14 == 0) {
      goto _L;
    } else
    if (! write17) {
      _L:
      if (n_internal_address_bytes14 > 0) {
        pt19->start = (U8___0 )0;
      } else {
        pt19->start = (U8___0 )1;
      }
      pt19->restart = (U8___0 )(! pt19->start);
      pt19->stop = (U8___0 )0;
      pt19->tx = (U8___0 )1;
      if (write17) {
        tmp___021 = 0;
      } else {
        tmp___021 = 1;
      }
      p18->addr = (U8___0 )((address12 << 1) | (unsigned long )tmp___021);
      pt19->data = & p18->addr;
      pt19->nbytes = (U16___0 )1;
      pt19 ++;
    }
    pt19->start = (U8___0 )0;
    pt19->stop = (U8___0 )1;
    if (write17) {
      pt19->tx = (U8___0 )1;
    } else {
      pt19->tx = (U8___0 )0;
    }
    pt19->data = data15;
    pt19->nbytes = (U16___0 )nbytes16;
    pt19->last_pt = (U8___0 )1;
    p18->state = (i2c_port_state )2;
    goto Lret_i2c_start_transaction;
    Lret_i2c_start_transaction: ;
  }
  ret_ecrobot_get_sonar_sensor8 = distance_state[port_id6];
  goto Lret_ecrobot_get_sonar_sensor;
  Lret_ecrobot_get_sonar_sensor:
  tmp___1 = ret_ecrobot_get_sonar_sensor8;
  sonar = tmp___1;
  x34 = 0;
  y35 = 6;
  display_x = x34;
  display_y = y35;
  goto Lret_display_goto_xy___5;
  Lret_display_goto_xy___5:
  str47 = "SONAR: ";
  while (*str47) {
    if ((int const )*str47 != 10) {
      display_char((int )*str47);
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str47 ++;
  }
  goto Lret_display_string___10;
  Lret_display_string___10:
  {
  val67 = (int )sonar;
  places68 = (U32___4 )0;
  {
  if (val67 < 0) {
    tmp69 = - val67;
  } else {
    tmp69 = val67;
  }
  display_unsigned_worker((U32 )tmp69, places68, (U32 )(val67 < 0));
  goto Lret_display_int___5;
  }
  Lret_display_int___5: ;
  str48 = " / ";
  }
  while (*str48) {
    if ((int const )*str48 != 10) {
      display_char((int )*str48);
      display_x ++;
    } else {
      display_x = 0;
      display_y ++;
    }
    str48 ++;
  }
  goto Lret_display_string___11;
  Lret_display_string___11:
  {
  val70 = (int )LastSonarValue;
  places71 = (U32___4 )0;
  {
  if (val70 < 0) {
    tmp72 = - val70;
  } else {
    tmp72 = val70;
  }
  display_unsigned_worker((U32 )tmp72, places71, (U32 )(val70 < 0));
  goto Lret_display_int___6;
  }
  Lret_display_int___6: ;
  display_update();
  TerminateTask();
  }
  return;
}
}
extern int create_block() ;
extern int create_task() ;
void main(void)
{

  {
  create_task("TaskMainDisplayTask", "TaskMainDisplayTask", 10, 250, 0.411);
  create_task("TaskMainColorSensorTask", "TaskMainColorSensorTask", 2, 100, 0.068);
  create_task("TaskMainSonarSensorTask", "TaskMainSonarSensorTask", 5, 100, 0.114);
  create_task("TaskMainMotorControlTask", "TaskMainMotorControlTask", 1, 50, 0.074);
  create_block(4280, 4300, "TaskMainMotorControlTask", "DrivingControlResource", 1, 1, 0.071);
# 5285 "sumo/sumo.c"
  return;
}
}

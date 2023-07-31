# 1 "nxtgt/nxtgt.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "nxtgt/nxtgt.c"


typedef unsigned char U8;
typedef signed char S8;
typedef unsigned short U16;
typedef short S16;
typedef unsigned long U32;
typedef long S32;
typedef char CHAR;
typedef unsigned int UINT;
typedef int SINT;
struct __anonstruct_nxt_inputs_83380041 {
   U32 battery_state ;
   U8 buttons_state ;
};
typedef struct __anonstruct_nxt_inputs_83380041 nxt_inputs;
struct __anonstruct_riff_705856829 {
   U32 chunkID ;
   U32 chunkSize ;
   U32 format ;
} __attribute__((__packed__)) ;
struct __anonstruct_fmt_307472724 {
   U32 chunkID ;
   U32 chunkSize ;
   U16 audioFormat ;
   U16 numChannels ;
   U32 sampleRate ;
   U32 byteRate ;
   U16 blockAlign ;
   U16 bitsPerSample ;
   U16 dummy ;
} __attribute__((__packed__)) ;
struct __anonstruct_data_325997328 {
   U32 chunkID ;
   U32 chunkSize ;
   U8 data[] ;
} __attribute__((__packed__)) ;
struct __anonstruct_WAV_598957458 {
   struct __anonstruct_riff_705856829 riff ;
   struct __anonstruct_fmt_307472724 fmt ;
   struct __anonstruct_data_325997328 data ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_WAV_598957458 WAV;
struct __anonstruct_riff_705856830 {
   U32 chunkID ;
   U32 chunkSize ;
   U32 format ;
} __attribute__((__packed__)) ;
struct __anonstruct_fmt_947264284 {
   U32 chunkID ;
   U32 chunkSize ;
   U16 audioFormat ;
   U16 numChannels ;
   U32 sampleRate ;
   U32 byteRate ;
   U16 blockAlign ;
   U16 bitsPerSample ;
} __attribute__((__packed__)) ;
struct __anonstruct_data_947264285 {
   U32 chunkID ;
   U32 chunkSize ;
   U8 data[] ;
} __attribute__((__packed__)) ;
struct __anonstruct_WAV_ND_702454393 {
   struct __anonstruct_riff_705856830 riff ;
   struct __anonstruct_fmt_947264284 fmt ;
   struct __anonstruct_data_947264285 data ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_WAV_ND_702454393 WAV_ND;
struct __anonstruct_riff_947264286 {
   U32 chunkID ;
   U32 chunkSize ;
   U32 format ;
} __attribute__((__packed__)) ;
struct __anonstruct_fmt_947264287 {
   U32 chunkID ;
   U32 chunkSize ;
   U16 audioFormat ;
   U16 numChannels ;
   U32 sampleRate ;
   U32 byteRate ;
   U16 blockAlign ;
   U16 bitsPerSample ;
   U16 dummy ;
} __attribute__((__packed__)) ;
struct __anonstruct_data_138372828 {
   U32 chunkID ;
   U32 chunkSize ;
   U32 numSamples ;
   U32 data_chunkID ;
   U32 data_chunkSize ;
   U8 data[] ;
} __attribute__((__packed__)) ;
struct __anonstruct_WAV_FACT_625136910 {
   struct __anonstruct_riff_947264286 riff ;
   struct __anonstruct_fmt_947264287 fmt ;
   struct __anonstruct_data_138372828 data ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_WAV_FACT_625136910 WAV_FACT;
struct __anonstruct_riff_947264288 {
   U32 chunkID ;
   U32 chunkSize ;
   U32 format ;
} __attribute__((__packed__)) ;
struct __anonstruct_fmt_947264289 {
   U32 chunkID ;
   U32 chunkSize ;
   U16 audioFormat ;
   U16 numChannels ;
   U32 sampleRate ;
   U32 byteRate ;
   U16 blockAlign ;
   U16 bitsPerSample ;
   U16 dummy ;
} __attribute__((__packed__)) ;
struct __anonstruct_data_947264290 {
   U32 chunkID ;
   U32 chunkSize ;
   U8 data[] ;
} __attribute__((__packed__)) ;
struct __anonstruct_WAV_NL_291571574 {
   struct __anonstruct_riff_947264288 riff ;
   struct __anonstruct_fmt_947264289 fmt ;
   struct __anonstruct_data_947264290 data ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_WAV_NL_291571574 WAV_NL;
struct __anonstruct_fileHeader_706858178 {
   U16 type ;
   U32 size ;
   U16 reserved1 ;
   U16 reserved2 ;
   U32 offset ;
} __attribute__((__packed__)) ;
struct __anonstruct_infoHeader_110306387 {
   U32 size ;
   S32 width ;
   S32 height ;
   U16 planes ;
   U16 bits ;
   U32 compression ;
   U32 imagesize ;
   S32 xresolution ;
   S32 yresolution ;
   U32 ncolours ;
   U32 importantcolours ;
} __attribute__((__packed__)) ;
struct __anonstruct_rgb_846263947 {
   U8 blue ;
   U8 green ;
   U8 red ;
   U8 reserved ;
} __attribute__((__packed__)) ;
struct __anonstruct_BMP_229848695 {
   struct __anonstruct_fileHeader_706858178 fileHeader ;
   struct __anonstruct_infoHeader_110306387 infoHeader ;
   struct __anonstruct_rgb_846263947 rgb ;
} __attribute__((__packed__)) ;
typedef struct __anonstruct_BMP_229848695 BMP;
struct __anonstruct_NXTCOLORSENSOR_T_371327434 {
   U16 color ;
   S16 rgb[3] ;
   U16 light ;
   U8 volatile mode ;
   U8 volatile mode_state ;
   U8 volatile port_in_use ;
};
typedef struct __anonstruct_NXTCOLORSENSOR_T_371327434 NXTCOLORSENSOR_T;
typedef unsigned char UINT8;
typedef UINT8 StatusType;
typedef unsigned char U8___0;
typedef signed char S8___0;
typedef short S16___0;
typedef unsigned long U32___0;
typedef long S32___0;
typedef char CHAR___0;
typedef int SINT___0;
typedef unsigned long size_t___0;
extern __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1), __leaf__)) memset)(void *__s ,
                                                                                               int __c ,
                                                                                               unsigned long __n ) ;
extern __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2), __leaf__)) strncpy)(char * __restrict __dest ,
                                                                                                  char const * __restrict __src ,
                                                                                                  unsigned long __n ) ;
extern void show_bd_addr(unsigned char *bdaddr ) ;
extern void show_bd_addr_err(void) ;
extern void add_status_info(int status ) ;
U8 ecrobot_get_button_state(void) ;
void ecrobot_init_nxtstate(void) ;
void ecrobot_poll_nxtstate(void) ;
void ecrobot_setDeviceInitialized(void) ;
void ecrobot_initDeviceStatus(void) ;
extern unsigned long systick_get_ms(void) ;
extern void systick_wait_ms(unsigned long ms ) ;
extern U32 buttons_get(void) ;
extern U32 battery_voltage(void) ;
extern U32 sensor_adc(U32 n ) ;
extern void nxt_avr_set_input_power(U32 n , U32 power_type ) ;
extern int nxt_motor_get_count(unsigned long n ) ;
extern void nxt_motor_set_count(unsigned long n , int count ) ;
extern void nxt_motor_set_speed(unsigned long n , int speed_percent , int brake ) ;
extern void set_digi0(int ) ;
extern void unset_digi0(int ) ;
extern void display_update(void) ;
extern void display_clear(U32 updateToo ) ;
extern void display_goto_xy(int x , int y ) ;
extern void display_string(char const *str ) ;
extern void display_int(int val , U32 places ) ;
extern void display_unsigned(U32 val , U32 places ) ;
extern void i2c_disable(int port ) ;
extern void i2c_enable(int port ) ;
extern int i2c_busy(int port ) ;
extern int i2c_start_transaction(int port , U32 address , int internal_address , int n_internal_address_bytes ,
                                 U8 *data , U32 nbytes , int write ) ;
extern void bt_clear_arm7_cmd(void) ;
extern void bt_set_arm7_cmd(void) ;
extern void bt_send(unsigned char *buf , unsigned long len ) ;
extern void bt_receive(unsigned char *buf ) ;
extern void bt_reset(void) ;
extern unsigned long bt_write(unsigned char *buf , unsigned long off , unsigned long len ) ;
extern unsigned long bt_read(unsigned char *buf , unsigned long off , unsigned long len ) ;
extern unsigned long bt_pending(void) ;
extern void sound_freq_vol(U32 freq , U32 ms , int vol ) ;
extern void sound_play_sample(U8 *data , U32 length , U32 freq , int vol ) ;
extern int sound_get_time() ;
void ecrobot_init_bt_master(unsigned char const *bd_addr , char const *pin ) ;
void ecrobot_init_bt_slave(char const *pin ) ;
void ecrobot_init_bt_connection(void) ;
void ecrobot_term_bt_connection(void) ;
int ecrobot_get_bt_status(void) ;
unsigned char ecrobot_get_bt_device_address(unsigned char *bd_addr ) ;
unsigned char ecrobot_get_bt_device_name(char *bd_name ) ;
short ecrobot_get_bt_signal_strength(void) ;
unsigned char ecrobot_set_bt_device_name(char const *bd_name ) ;
unsigned char ecrobot_set_bt_factory_settings(void) ;
unsigned long ecrobot_send_bt_packet(unsigned char *buf , unsigned long bufLen ) ;
unsigned long ecrobot_read_bt_packet(unsigned char *buf , unsigned long bufLen ) ;
unsigned long ecrobot_send_bt(void const *buf , unsigned long off , unsigned long len ) ;
unsigned long ecrobot_read_bt(void *buf , unsigned long off , unsigned long len ) ;
S32 ecrobot_get_motor_rev(U8 port_id ) ;
void ecrobot_set_motor_speed(U8 port_id , S8 speed ) ;
void ecrobot_set_motor_mode_speed(U8 port_id , S32 mode , S8 speed ) ;
U16 ecrobot_get_light_sensor(U32 port_id ) ;
void ecrobot_set_light_sensor_active(U32 port_id ) ;
void ecrobot_set_light_sensor_inactive(U32 port_id ) ;
unsigned char ecrobot_get_touch_sensor(U8 port_id ) ;
U16 ecrobot_get_sound_sensor(U8 port_id ) ;
void ecrobot_init_i2c(U8 port_id , U8 type ) ;
U8 ecrobot_wait_i2c_ready(U8 port_id , U32 wait ) ;
SINT ecrobot_send_i2c(U8 port_id , U32 address , SINT i2c_reg , U8 *buf , U32 len ) ;
SINT ecrobot_read_i2c(U8 port_id , U32 address , SINT i2c_reg , U8 *buf , U32 len ) ;
void ecrobot_term_i2c(U8 port_id ) ;
void ecrobot_init_sonar_sensor(U8 port_id ) ;
long ecrobot_get_sonar_sensor(U8 port_id ) ;
void ecrobot_term_sonar_sensor(U8 port_id ) ;
void ecrobot_init_nxtcolorsensor(U8 port_id , U8 mode ) ;
void ecrobot_process_bg_nxtcolorsensor(void) ;
void ecrobot_set_nxtcolorsensor(U8 port_id , U8 mode ) ;
U8 ecrobot_get_nxtcolorsensor_mode(U8 port_id ) ;
U16 ecrobot_get_nxtcolorsensor_id(U8 port_id ) ;
void ecrobot_get_nxtcolorsensor_rgb(U8 port_id , S16 *rgb ) ;
U16 ecrobot_get_nxtcolorsensor_light(U8 port_id ) ;
void ecrobot_term_nxtcolorsensor(U8 port_id ) ;
void ecrobot_set_RCX_power_source(U8 port_id ) ;
void ecrobot_term_RCX_power_source(U8 port_id ) ;
S16 ecrobot_get_RCX_sensor(U8 port_id ) ;
U8 ecrobot_get_RCX_touch_sensor(U8 port_id ) ;
U16 ecrobot_get_battery_voltage(void) ;
U32 ecrobot_get_systick_ms(void) ;
U8 ecrobot_is_ENTER_button_pressed(void) ;
U8 ecrobot_is_RUN_button_pressed(void) ;
SINT ecrobot_bmp2lcd(CHAR const *file , U8 *lcd , S32 width , S32 height ) ;
void ecrobot_show_int(S32 var ) ;
void ecrobot_debug1(UINT var1 , UINT var2 , UINT var3 ) ;
void ecrobot_debug2(UINT var1 , UINT var2 , UINT var3 ) ;
void ecrobot_status_monitor(CHAR const *target_name ) ;
void ecrobot_adc_data_monitor(CHAR const *target_name ) ;
void ecrobot_bt_data_logger(S8 data1 , S8 data2 ) ;
void ecrobot_bt_adc_data_logger(S8 data1 , S8 data2 , S16 adc1 , S16 adc2 , S16 adc3 ,
                                S16 adc4 ) ;
void ecrobot_sint_var_monitor(SINT *vars ) ;
SINT ecrobot_sound_tone(U32 freq , U32 ms , U32 vol ) ;
SINT ecrobot_sound_wav(CHAR const *file , U32 length , S32 freq , U32 vol ) ;
extern void colorsensor_init(int , unsigned char ) ;
extern void colorsensor_term(int ) ;
extern int colorsensor_light_get(int ) ;
extern void colorsensor_light_full(int port ) ;
extern int colorsensor_color_get(int ) ;
extern void colorsensor_rgb_get(int , short * ) ;
static unsigned char volatile deviceStatus = (U8 volatile )2;
static S32 distance_state[4] = { (S32 )-1, (S32 )-1, (S32 )-1, (S32 )-1};
static U8 data[4] = { (U8 )0};
U8 const NXT_COLORSENSOR_PROTOCOLS[7] = { (U8 const )176, (U8 const )112, (U8 const )240, (U8 const )8,
        (U8 const )176, (U8 const )136, (U8 const )136};
static NXTCOLORSENSOR_T sensor_data[4] ;

static nxt_inputs ecrobot_inputs ;
static U8 buttons_states[20] ;
static SINT buttons_i ;
extern int restart_NXT() ;
extern int shutdown_NXT() ;
extern int exec_NXT_BIOS() ;
extern StatusType TerminateTask(void) ;
static void send_bt_command(U8___0 *cmd , U32___0 bufLen ) ;
static U32___0 read_bt_command(U8___0 *cmd , U32___0 bufLen ) ;
static U8___0 open_bt_stream(void) ;
static U8___0 close_bt_stream(void) ;
static SINT___0 connect_bt_master(U8___0 const *bd_addr , CHAR___0 const *pin ) ;
static SINT___0 connect_bt_slave(CHAR___0 const *pin ) ;
static unsigned char volatile bt_status = (U8___0 volatile )4;
static U8___0 volatile handle ;
static U8___0 sendBuf[256] ;
static U8___0 receiveBuf[128] ;
static S8___0 EDC_flag ;
S32___0 FrictionComp(S32___0 ratio , S32___0 offset ) ;
void TaskMainTaskInitialize(void)
{ {
  nxt_motor_set_speed((U32___0 )0, 0, 1);
  nxt_motor_set_speed((U32___0 )2, 0, 1);
  nxt_motor_set_speed((U32___0 )1, 0, 1);
  nxt_motor_set_count((U32___0 )0, 0);
  nxt_motor_set_count((U32___0 )2, 0);
  nxt_motor_set_count((U32___0 )1, 0);
  EDC_flag = (S8___0 )1;
  TerminateTask();
  return;
}}
void TaskMainTaskControl(void) ;
static U8___0 touch_sensor_state = (U8___0 )0;
static U8___0 bt_receive_buf[32] ;
void TaskMainTaskControl(void)
{
  S32___0 analog_stick_left ;
  S32___0 analog_stick_right ;
  S32___0 steering_angle ;
  S32___0 steering_err ;
  S32___0 steering_speed ;
  S32___0 diff_gain ;
  U8___0 touch_sensor ;
  int tmp ;
  S32___0 tmp___0 ;
  S32___0 tmp___1 ;
  S32___0 tmp___2 ;
  S32___0 tmp___3 ;
  S32___0 tmp___4 ;
  S32___0 tmp___5 ;
  S32___0 tmp___6 ;
  U8___0 *buf16 ;
  U32___0 bufLen17 ;
  SINT___0 i18 ;
  U32___0 len19 ;
  U8 port_id20 ;
  U32 tmp21 ;
  unsigned char ret_ecrobot_get_touch_sensor22 ;
  {
  buf16 = bt_receive_buf;
  bufLen17 = (U32___0 )32;
  if ((int volatile )bt_status == (int volatile )7) {
    if (bufLen17 <= 126UL) {
      bt_receive(& receiveBuf[0]);
      len19 = (U32___0 )receiveBuf[0];
      if (len19 > 0UL) {
        if (len19 <= bufLen17) {
          i18 = 0;
          while ((U32___0 )i18 < len19) {
            *(buf16 + i18) = receiveBuf[i18 + 2];
            i18 ++;
          }
          goto Lret_ecrobot_read_bt_packet;
        }
      }
    }
  }
  goto Lret_ecrobot_read_bt_packet;
  Lret_ecrobot_read_bt_packet:
  analog_stick_left = - ((S32___0 )*((S8___0 *)(& bt_receive_buf[0])));
  analog_stick_right = (S32___0 )*((S8___0 *)(& bt_receive_buf[1]));
  port_id20 = (U8___0 )3;
  tmp21 = sensor_adc((U32 )port_id20);
  ret_ecrobot_get_touch_sensor22 = (U8 )(tmp21 < 512UL);
  goto Lret_ecrobot_get_touch_sensor;
  Lret_ecrobot_get_touch_sensor:
  touch_sensor = ret_ecrobot_get_touch_sensor22;
  if ((int )touch_sensor == 1) {
    if ((int )touch_sensor_state == 0) {
      EDC_flag = (S8___0 )(~ ((int )EDC_flag) + 1);
    }
  }
  touch_sensor_state = touch_sensor;
  tmp = nxt_motor_get_count((U32___0 )0);
  steering_angle = (S32___0 )tmp;
  steering_err = (40L * analog_stick_right) / 100L - steering_angle;
  steering_speed = 2L * steering_err;
  tmp___0 = FrictionComp(steering_speed, (S32___0 )10);
  nxt_motor_set_speed((U32___0 )0, (int )tmp___0, 1);
  diff_gain = (S32___0 )10;
  if (steering_angle > 2L) {
    if ((int )EDC_flag == -1) {
      diff_gain = (S32___0 )((1.0F - ((float )steering_angle * 0.7F) / (float )40) * (float )10);
    }
    tmp___1 = FrictionComp((analog_stick_left * diff_gain) / 10L, (S32___0 )10);
    nxt_motor_set_speed((U32___0 )2, (int )tmp___1, 1);
    tmp___2 = FrictionComp(analog_stick_left, (S32___0 )10);
    nxt_motor_set_speed((U32___0 )1, (int )tmp___2, 1);
  } else
  if (steering_angle < -2L) {
    if ((int )EDC_flag == -1) {
      diff_gain = (S32___0 )((1.0F + ((float )steering_angle * 0.7F) / (float )40) * (float )10);
    }
    tmp___3 = FrictionComp(analog_stick_left, (S32___0 )10);
    nxt_motor_set_speed((U32___0 )2, (int )tmp___3, 1);
    tmp___4 = FrictionComp((analog_stick_left * diff_gain) / 10L, (S32___0 )10);
    nxt_motor_set_speed((U32___0 )1, (int )tmp___4, 1);
  } else {
    tmp___5 = FrictionComp(analog_stick_left, (S32___0 )10);
    nxt_motor_set_speed((U32___0 )2, (int )tmp___5, 1);
    tmp___6 = FrictionComp(analog_stick_left, (S32___0 )10);
    nxt_motor_set_speed((U32___0 )1, (int )tmp___6, 1);
  }
  ecrobot_bt_data_logger((S8___0 )analog_stick_left, (S8___0 )analog_stick_right);
  TerminateTask();
  return;
}
}
void TaskMainTaskSonar(void)
{
  S32___0 sonar ;

  {
  sonar = ecrobot_get_sonar_sensor((U8___0 )1);
  TerminateTask();
  return;
}
}
void TaskMainTaskLCD(void)
{
  CHAR const *target_name1 ;
  U32 tmp2 ;
  int tmp___03 ;
  int tmp___14 ;
  int tmp___25 ;
  U32 tmp___36 ;
  U32 tmp___47 ;
  U32 tmp___58 ;
  U32 tmp___69 ;
  SINT tmp___710 ;
  S32 tmp___811 ;
  {
  {
  target_name1 = "NXT GT";
  {
  display_clear((U32 )0);
  display_goto_xy(0, 0);
  display_string(target_name1);
  display_goto_xy(0, 1);
  display_string("TIME:");
  tmp2 = systick_get_ms();
  display_unsigned(tmp2 / 1000UL, (U32 )0);
  display_goto_xy(0, 2);
  display_string("BATT:");
  display_unsigned(ecrobot_inputs.battery_state / 100UL, (U32 )0);
  display_goto_xy(0, 3);
  display_string("REV: ");
  tmp___03 = nxt_motor_get_count((U32 )0);
  display_int(tmp___03, (U32 )0);
  tmp___14 = nxt_motor_get_count((U32 )1);
  display_int(tmp___14, (U32 )6);
  display_goto_xy(0, 4);
  display_string("     ");
  tmp___25 = nxt_motor_get_count((U32 )2);
  display_int(tmp___25, (U32 )0);
  display_goto_xy(0, 5);
  display_string("ADC: ");
  tmp___36 = sensor_adc((U32 )0);
  display_unsigned(tmp___36, (U32 )0);
  tmp___47 = sensor_adc((U32 )1);
  display_unsigned(tmp___47, (U32 )5);
  display_goto_xy(0, 6);
  display_string("     ");
  tmp___58 = sensor_adc((U32 )2);
  display_unsigned(tmp___58, (U32 )0);
  tmp___69 = sensor_adc((U32 )3);
  display_unsigned(tmp___69, (U32 )5);
  display_goto_xy(0, 7);
  display_string("BT/DST: ");
  tmp___710 = ecrobot_get_bt_status();
  if (tmp___710 == 7) {
    display_unsigned((U32 )1, (U32 )0);
  } else {
    display_unsigned((U32 )0, (U32 )0);
  }
  tmp___811 = getDistance();
  display_int((int )tmp___811, (U32 )5);
  display_update();
  goto Lret_ecrobot_status_monitor;
  }
  Lret_ecrobot_status_monitor: ;
  TerminateTask();
  }
  return;
}
}
S32___0 FrictionComp(S32___0 ratio , S32___0 offset )
{
  {
  if (ratio > 0L) {
    return (((100L - offset) * ratio) / 100L + offset);
  } else
  if (ratio < 0L) {
    return (((100L - offset) * ratio) / 100L - offset);
  } else {
    return (ratio);
  }
}
}
extern int create_task() ;
void main(void)
{
  {
  create_task("TaskMainTaskInitialize", "TaskMainTaskInitialize", 4, 800, 0.009);
  create_task("TaskMainTaskControl", "TaskMainTaskControl", 3, 10, 0.082);
  create_task("TaskMainTaskSonar", "TaskMainTaskSonar", 2, 50, 0.009);
  create_task("TaskMainTaskLCD", "TaskMainTaskLCD", 1, 500, 0.020);
  return;
}
}

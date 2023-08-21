# 1 "./sumo.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./sumo.cil.c"
# 3 "sumo/sumo.c"
typedef unsigned char U8;
# 4 "sumo/sumo.c"
typedef unsigned long U32;
# 45 "sumo/sumo.c"
typedef unsigned char U8___0;
# 46 "sumo/sumo.c"
typedef unsigned short U16___0;
# 47 "sumo/sumo.c"
typedef unsigned long U32___0;
# 53 "sumo/sumo.c"
struct i2c_partial_transaction {
   U8___0 start : 1 ;
   U8___0 restart : 1 ;
   U8___0 stop : 1 ;
   U8___0 tx : 1 ;
   U8___0 last_pt : 1 ;
   U16___0 nbytes ;
   U8___0 *data ;
};
# 62 "sumo/sumo.c"
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
# 80 "sumo/sumo.c"
typedef enum __anonenum_i2c_port_state_506411302 i2c_port_state;
# 81 "sumo/sumo.c"
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
# 102 "sumo/sumo.c"
typedef unsigned char U8___1;
# 104 "sumo/sumo.c"
typedef unsigned short U16___1;
# 105 "sumo/sumo.c"
typedef short S16___0;
# 106 "sumo/sumo.c"
typedef unsigned long U32___1;
# 107 "sumo/sumo.c"
typedef long S32___0;
# 258 "sumo/sumo.c"
struct __anonstruct_NXTCOLORSENSOR_T_371327434 {
   U16___1 color ;
   S16___0 rgb[3] ;
   U16___1 light ;
   U8___1 volatile mode ;
   U8___1 volatile mode_state ;
   U8___1 volatile port_in_use ;
};
# 266 "sumo/sumo.c"
typedef struct __anonstruct_NXTCOLORSENSOR_T_371327434 NXTCOLORSENSOR_T;
# 267 "sumo/sumo.c"
typedef unsigned char U8___2;
# 268 "sumo/sumo.c"
typedef signed char S8___1;
# 270 "sumo/sumo.c"
typedef unsigned long U32___2;
# 272 "sumo/sumo.c"
struct __anonstruct_to_avr_432250394 {
   U8___2 power ;
   U8___2 pwm_frequency ;
   S8___1 output_percent[4] ;
   U8___2 output_mode ;
   U8___2 input_power ;
} __attribute__((__packed__)) ;
# 279 "sumo/sumo.c"
typedef struct __anonstruct_to_avr_432250394 to_avr;
# 294 "sumo/sumo.c"
typedef unsigned long U32___3;
# 296 "sumo/sumo.c"
struct motor_struct {
   int current_count ;
   int target_count ;
   int speed_percent ;
   U32___3 last ;
};
# 302 "sumo/sumo.c"
typedef unsigned char UINT8;
# 303 "sumo/sumo.c"
typedef UINT8 StatusType;
# 304 "sumo/sumo.c"
typedef UINT8 ResourceType;
# 305 "sumo/sumo.c"
typedef unsigned char U8___3;
# 306 "sumo/sumo.c"
typedef unsigned short U16___3;
# 307 "sumo/sumo.c"
typedef unsigned long U32___4;
# 308 "sumo/sumo.c"
typedef long S32___1;
# 309 "sumo/sumo.c"
struct dc_t {
   U32___4 duration ;
   S32___1 speed_left ;
   S32___1 speed_right ;
   int priority ;
};
# 316 "sumo/sumo.c"
extern void display_update(void) ;
# 318 "sumo/sumo.c"
extern void display_clear(U32 updateToo ) ;
# 320 "sumo/sumo.c"
extern void display_char(int c ) ;
# 329 "sumo/sumo.c"
int display_tick ;
# 330 "sumo/sumo.c"
int display_auto_update ;
# 336 "sumo/sumo.c"
extern unsigned long systick_get_ms(void) ;
# 347 "sumo/sumo.c"
U8 const *displayM = (U8 const *)((U8 *)0);
# 348 "sumo/sumo.c"
unsigned char volatile dirty = (U8 volatile )0;
# 349 "sumo/sumo.c"
unsigned char volatile page = (U8 volatile )0;
# 350 "sumo/sumo.c"
U8 const volatile *dataM = (U8 const volatile *)((U8 *)0);
# 351 "sumo/sumo.c"
U8 mode = (U8 )255;
# 1077 "sumo/sumo.c"
int display_x ;
# 1078 "sumo/sumo.c"
int display_y ;
# 1449 "sumo/sumo.c"
extern int i2c_busy(int port ) ;
# 1456 "sumo/sumo.c"
static struct i2c_port_struct i2c_port[4] ;
# 2245 "sumo/sumo.c"
static S32___0 distance_state[4] = { (S32___0 )-1, (S32___0 )-1, (S32___0 )-1, (S32___0 )-1};
# 2285 "sumo/sumo.c"
U8___1 const NXT_COLORSENSOR_PROTOCOLS[7] = { (U8___1 const )176, (U8___1 const )112, (U8___1 const )240, (U8___1 const )8,
        (U8___1 const )176, (U8___1 const )136, (U8___1 const )136};
# 2288 "sumo/sumo.c"
static NXTCOLORSENSOR_T sensor_data[4] ;
# 3845 "sumo/sumo.c"
static to_avr io_to_avr ;
# 4109 "sumo/sumo.c"
static struct motor_struct motor[3] ;
# 4251 "sumo/sumo.c"
extern __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) rand)(void) ;
# 4252 "sumo/sumo.c"
extern StatusType TerminateTask(void) ;
# 4253 "sumo/sumo.c"
extern StatusType GetResource(ResourceType resid ) ;
# 4254 "sumo/sumo.c"
extern StatusType ReleaseResource(ResourceType resid ) ;
# 4255 "sumo/sumo.c"
extern ResourceType DrivingControlResource ;
# 4256 "sumo/sumo.c"
struct dc_t dc = {(U32___4 )0, (S32___1 )0, (S32___1 )0, 5};
# 4257 "sumo/sumo.c"
U32___4 SeekStarted ;
# 4258 "sumo/sumo.c"
S32___1 LastSonarValue ;
# 4259 "sumo/sumo.c"
int InSetupPhase ;
# 4260 "sumo/sumo.c"
U32___4 SetupStarted ;
# 4261 "sumo/sumo.c"
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
# 4277 "sumo/sumo.c"
  if (InSetupPhase) {
# 4278 "sumo/sumo.c"
    TerminateTask();
  }
# 4280 "sumo/sumo.c"
  GetResource(DrivingControlResource);
# 4281 "sumo/sumo.c"
  if (dc.duration > 0UL) {
# 4282 "sumo/sumo.c"
    dc.duration -= 50UL;
  } else {
# 4284 "sumo/sumo.c"
    dc.priority = 5;
# 4285 "sumo/sumo.c"
    dc.duration = (U32___4 )0;
# 4286 "sumo/sumo.c"
    dc.speed_left = (S32___1 )0;
# 4287 "sumo/sumo.c"
    dc.speed_right = (S32___1 )0;
  }
# 4289 "sumo/sumo.c"
  n1 = (U32___4 )1;
# 4290 "sumo/sumo.c"
  speed_percent2 = (int )(- dc.speed_left);
# 4291 "sumo/sumo.c"
  brake3 = 1;
# 4292 "sumo/sumo.c"
  if (n1 < 3UL) {
# 4293 "sumo/sumo.c"
    if (speed_percent2 > 100) {
# 4294 "sumo/sumo.c"
      speed_percent2 = 100;
    }
# 4296 "sumo/sumo.c"
    if (speed_percent2 < -100) {
# 4297 "sumo/sumo.c"
      speed_percent2 = -100;
    }
# 4299 "sumo/sumo.c"
    motor[n1].speed_percent = speed_percent2;
# 4300 "sumo/sumo.c"
    n7 = n1;
# 4301 "sumo/sumo.c"
    power_percent8 = speed_percent2;
# 4302 "sumo/sumo.c"
    brake9 = brake3;
# 4303 "sumo/sumo.c"
    if (n7 < 3UL) {
# 4304 "sumo/sumo.c"
      io_to_avr.output_percent[n7] = (S8___1 )power_percent8;
# 4305 "sumo/sumo.c"
      if (brake9) {
# 4306 "sumo/sumo.c"
        io_to_avr.output_mode = (U8___2 )((int )io_to_avr.output_mode | (1 << n7));
      } else {
# 4308 "sumo/sumo.c"
        io_to_avr.output_mode = (U8___2 )((int )io_to_avr.output_mode & ~ (1 << n7));
      }
    }
# 4311 "sumo/sumo.c"
    goto Lret_nxt_avr_set_motor;
    Lret_nxt_avr_set_motor: ;
  }
# 4314 "sumo/sumo.c"
  goto Lret_nxt_motor_set_speed;
  Lret_nxt_motor_set_speed:
# 4316 "sumo/sumo.c"
  n4 = (U32___4 )0;
# 4317 "sumo/sumo.c"
  speed_percent5 = (int )(- dc.speed_right);
# 4318 "sumo/sumo.c"
  brake6 = 1;
# 4319 "sumo/sumo.c"
  if (n4 < 3UL) {
# 4320 "sumo/sumo.c"
    if (speed_percent5 > 100) {
# 4321 "sumo/sumo.c"
      speed_percent5 = 100;
    }
# 4323 "sumo/sumo.c"
    if (speed_percent5 < -100) {
# 4324 "sumo/sumo.c"
      speed_percent5 = -100;
    }
# 4326 "sumo/sumo.c"
    motor[n4].speed_percent = speed_percent5;
# 4327 "sumo/sumo.c"
    n10 = n4;
# 4328 "sumo/sumo.c"
    power_percent11 = speed_percent5;
# 4329 "sumo/sumo.c"
    brake12 = brake6;
# 4330 "sumo/sumo.c"
    if (n10 < 3UL) {
# 4331 "sumo/sumo.c"
      io_to_avr.output_percent[n10] = (S8___1 )power_percent11;
# 4332 "sumo/sumo.c"
      if (brake12) {
# 4333 "sumo/sumo.c"
        io_to_avr.output_mode = (U8___2 )((int )io_to_avr.output_mode | (1 << n10));
      } else {
# 4335 "sumo/sumo.c"
        io_to_avr.output_mode = (U8___2 )((int )io_to_avr.output_mode & ~ (1 << n10));
      }
    }
# 4338 "sumo/sumo.c"
    goto Lret_nxt_avr_set_motor___0;
    Lret_nxt_avr_set_motor___0: ;
  }
# 4341 "sumo/sumo.c"
  goto Lret_nxt_motor_set_speed___0;
  Lret_nxt_motor_set_speed___0:
# 4343 "sumo/sumo.c"
  ReleaseResource(DrivingControlResource);
# 4344 "sumo/sumo.c"
  TerminateTask();
# 4345 "sumo/sumo.c"
  return;
}
}
# 4375 "sumo/sumo.c"
extern int ( colorsensor_init)() ;
# 4389 "sumo/sumo.c"
extern int ( colorsensor_color_get)() ;
# 4391 "sumo/sumo.c"
extern int ( colorsensor_rgb_get)() ;
# 4393 "sumo/sumo.c"
extern int ( colorsensor_light_get)() ;
# 4396 "sumo/sumo.c"
extern int ( colorsensor_light_full)() ;
# 4348 "sumo/sumo.c"
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
# 4365 "sumo/sumo.c"
  if (InSetupPhase) {
# 4366 "sumo/sumo.c"
    TerminateTask();
  }
# 4368 "sumo/sumo.c"
  port_id9 = 0;
# 4369 "sumo/sumo.c"
  while (port_id9 < 4) {
# 4370 "sumo/sumo.c"
    sd10 = & sensor_data[port_id9];
# 4371 "sumo/sumo.c"
    if (sd10->port_in_use) {
# 4372 "sumo/sumo.c"
      mode11 = (U8___1 )sd10->mode;
# 4373 "sumo/sumo.c"
      if ((int )mode11 == 6) {
# 4374 "sumo/sumo.c"
        sd10->port_in_use = (U8___1 volatile )0;
# 4375 "sumo/sumo.c"
        colorsensor_init(port_id9, 136);
# 4376 "sumo/sumo.c"
        goto Lret_ecrobot_process_bg_nxtcolorsensor;
      } else
# 4378 "sumo/sumo.c"
      if ((int )mode11 != (int )sd10->mode_state) {
# 4379 "sumo/sumo.c"
        sd10->color = (U16___1 )99;
# 4380 "sumo/sumo.c"
        sd10->rgb[0] = (S16___0 )0;
# 4381 "sumo/sumo.c"
        sd10->rgb[1] = (S16___0 )0;
# 4382 "sumo/sumo.c"
        sd10->rgb[2] = (S16___0 )0;
# 4383 "sumo/sumo.c"
        sd10->light = (U16___1 )0;
# 4384 "sumo/sumo.c"
        sd10->mode_state = (U8___1 volatile )mode11;
# 4385 "sumo/sumo.c"
        colorsensor_init(port_id9, 136);
# 4386 "sumo/sumo.c"
        colorsensor_init(port_id9, (int )((unsigned char )NXT_COLORSENSOR_PROTOCOLS[mode11]));
      }
# 4388 "sumo/sumo.c"
      if ((int )mode11 == 0) {
# 4389 "sumo/sumo.c"
        tmp12 = colorsensor_color_get(port_id9);
# 4390 "sumo/sumo.c"
        sd10->color = (U16___1 )tmp12;
# 4391 "sumo/sumo.c"
        colorsensor_rgb_get(port_id9, sd10->rgb);
      } else {
# 4393 "sumo/sumo.c"
        tmp___013 = colorsensor_light_get(port_id9);
# 4394 "sumo/sumo.c"
        sd10->light = (U16___1 )tmp___013;
# 4395 "sumo/sumo.c"
        if ((int )mode11 == 4) {
# 4396 "sumo/sumo.c"
          colorsensor_light_full(port_id9);
        }
      }
    }
# 4400 "sumo/sumo.c"
    port_id9 ++;
  }
# 4402 "sumo/sumo.c"
  goto Lret_ecrobot_process_bg_nxtcolorsensor;
  Lret_ecrobot_process_bg_nxtcolorsensor:
# 4404 "sumo/sumo.c"
  port_id7 = (U8___3 )0;
# 4405 "sumo/sumo.c"
  ret_ecrobot_get_nxtcolorsensor_light8 = sensor_data[port_id7].light;
# 4406 "sumo/sumo.c"
  goto Lret_ecrobot_get_nxtcolorsensor_light;
  Lret_ecrobot_get_nxtcolorsensor_light:
# 4408 "sumo/sumo.c"
  tmp = ret_ecrobot_get_nxtcolorsensor_light8;
# 4409 "sumo/sumo.c"
  color = tmp;
# 4410 "sumo/sumo.c"
  if ((int )color < 300) {
# 4411 "sumo/sumo.c"
    GetResource(DrivingControlResource);
# 4412 "sumo/sumo.c"
    priority3 = 50;
# 4413 "sumo/sumo.c"
    speed_left4 = -100;
# 4414 "sumo/sumo.c"
    speed_right5 = -100;
# 4415 "sumo/sumo.c"
    duration6 = 1250;
# 4416 "sumo/sumo.c"
    GetResource(DrivingControlResource);
# 4417 "sumo/sumo.c"
    if (dc.priority != 20) {
# 4418 "sumo/sumo.c"
      SeekStarted = (U32___4 )0;
    }
# 4420 "sumo/sumo.c"
    if (priority3 >= dc.priority) {
# 4421 "sumo/sumo.c"
      dc.priority = priority3;
# 4422 "sumo/sumo.c"
      dc.speed_left = (S32___1 )speed_left4;
# 4423 "sumo/sumo.c"
      dc.speed_right = (S32___1 )speed_right5;
# 4424 "sumo/sumo.c"
      dc.duration = (U32___4 )duration6;
    }
# 4426 "sumo/sumo.c"
    ReleaseResource(DrivingControlResource);
# 4427 "sumo/sumo.c"
    goto Lret_change_driving_command;
    Lret_change_driving_command:
# 4429 "sumo/sumo.c"
    ReleaseResource(DrivingControlResource);
  }
# 4431 "sumo/sumo.c"
  TerminateTask();
# 4432 "sumo/sumo.c"
  return;
}
}
# 4435 "sumo/sumo.c"
extern int copysign() ;
# 4523 "sumo/sumo.c"
extern int ( memset)() ;
# 4436 "sumo/sumo.c"
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
# 4493 "sumo/sumo.c"
  if (InSetupPhase) {
# 4494 "sumo/sumo.c"
    TerminateTask();
  }
# 4496 "sumo/sumo.c"
  duration = 3000;
# 4497 "sumo/sumo.c"
  port_id40 = (U8___3 )1;
# 4498 "sumo/sumo.c"
  tmp41 = i2c_busy((int )port_id40);
# 4499 "sumo/sumo.c"
  if (tmp41 == 0) {
# 4501 "sumo/sumo.c"
    port43 = (int )port_id40;
# 4502 "sumo/sumo.c"
    address44 = (U32___1 )1;
# 4503 "sumo/sumo.c"
    internal_address45 = 66;
# 4504 "sumo/sumo.c"
    n_internal_address_bytes46 = 1;
# 4506 "sumo/sumo.c"
    nbytes48 = (U32___1 )1;
# 4507 "sumo/sumo.c"
    write49 = 0;
# 4508 "sumo/sumo.c"
    if (port43 < 0) {
# 4509 "sumo/sumo.c"
      goto Lret_i2c_start_transaction;
    } else
# 4511 "sumo/sumo.c"
    if (port43 >= 4) {
# 4512 "sumo/sumo.c"
      goto Lret_i2c_start_transaction;
    }
# 4514 "sumo/sumo.c"
    tmp52 = i2c_busy(port43);
# 4515 "sumo/sumo.c"
    if (tmp52) {
# 4516 "sumo/sumo.c"
      goto Lret_i2c_start_transaction;
    }
# 4518 "sumo/sumo.c"
    p50 = & i2c_port[port43];
# 4519 "sumo/sumo.c"
    p50->pt_num = (U32___0 )0;
# 4520 "sumo/sumo.c"
    p50->pt_begun = (U32___0 )0;
# 4521 "sumo/sumo.c"
    pt51 = p50->partial_transaction;
# 4522 "sumo/sumo.c"
    p50->current_pt = pt51;
# 4523 "sumo/sumo.c"
    memset((void *)pt51, 0, sizeof(p50->partial_transaction));
# 4524 "sumo/sumo.c"
    if (n_internal_address_bytes46 > 0) {
# 4525 "sumo/sumo.c"
      p50->addr_int[0] = (U8___0 )(address44 << 1);
# 4526 "sumo/sumo.c"
      p50->addr_int[1] = (U8___0 )internal_address45;
# 4527 "sumo/sumo.c"
      pt51->start = (U8___0 )1;
# 4528 "sumo/sumo.c"
      if (write49) {
# 4529 "sumo/sumo.c"
        pt51->stop = (U8___0 )0;
      } else {
# 4531 "sumo/sumo.c"
        pt51->stop = (U8___0 )1;
      }
# 4533 "sumo/sumo.c"
      pt51->tx = (U8___0 )1;
# 4534 "sumo/sumo.c"
      pt51->data = p50->addr_int;
# 4535 "sumo/sumo.c"
      pt51->nbytes = (U16___0 )2;
# 4536 "sumo/sumo.c"
      pt51 ++;
    }
# 4538 "sumo/sumo.c"
    if (n_internal_address_bytes46 == 0) {
# 4539 "sumo/sumo.c"
      goto _L___2;
    } else
# 4541 "sumo/sumo.c"
    if (! write49) {
      _L___2:
# 4543 "sumo/sumo.c"
      if (n_internal_address_bytes46 > 0) {
# 4544 "sumo/sumo.c"
        pt51->start = (U8___0 )0;
      } else {
# 4546 "sumo/sumo.c"
        pt51->start = (U8___0 )1;
      }
# 4548 "sumo/sumo.c"
      pt51->restart = (U8___0 )(! pt51->start);
# 4549 "sumo/sumo.c"
      pt51->stop = (U8___0 )0;
# 4550 "sumo/sumo.c"
      pt51->tx = (U8___0 )1;
# 4551 "sumo/sumo.c"
      if (write49) {
# 4552 "sumo/sumo.c"
        tmp___053 = 0;
      } else {
# 4554 "sumo/sumo.c"
        tmp___053 = 1;
      }
# 4556 "sumo/sumo.c"
      p50->addr = (U8___0 )((address44 << 1) | (unsigned long )tmp___053);
# 4557 "sumo/sumo.c"
      pt51->data = & p50->addr;
# 4558 "sumo/sumo.c"
      pt51->nbytes = (U16___0 )1;
# 4559 "sumo/sumo.c"
      pt51 ++;
    }
# 4561 "sumo/sumo.c"
    pt51->start = (U8___0 )0;
# 4562 "sumo/sumo.c"
    pt51->stop = (U8___0 )1;
# 4563 "sumo/sumo.c"
    if (write49) {
# 4564 "sumo/sumo.c"
      pt51->tx = (U8___0 )1;
    } else {
# 4566 "sumo/sumo.c"
      pt51->tx = (U8___0 )0;
    }
# 4568 "sumo/sumo.c"
    pt51->data = data47;
# 4569 "sumo/sumo.c"
    pt51->nbytes = (U16___0 )nbytes48;
# 4570 "sumo/sumo.c"
    pt51->last_pt = (U8___0 )1;
# 4571 "sumo/sumo.c"
    p50->state = (i2c_port_state )2;
# 4572 "sumo/sumo.c"
    goto Lret_i2c_start_transaction;
    Lret_i2c_start_transaction: ;
  }
# 4575 "sumo/sumo.c"
  ret_ecrobot_get_sonar_sensor42 = distance_state[port_id40];
# 4576 "sumo/sumo.c"
  goto Lret_ecrobot_get_sonar_sensor;
  Lret_ecrobot_get_sonar_sensor:
# 4578 "sumo/sumo.c"
  tmp = ret_ecrobot_get_sonar_sensor42;
# 4579 "sumo/sumo.c"
  distance = tmp;
# 4580 "sumo/sumo.c"
  if (LastSonarValue == 0L) {
# 4581 "sumo/sumo.c"
    LastSonarValue = (S32___1 )255;
  }
# 4583 "sumo/sumo.c"
  if (distance == 255L) {
# 4584 "sumo/sumo.c"
    if (LastSonarValue < 20L) {
# 4585 "sumo/sumo.c"
      priority16 = 30;
# 4586 "sumo/sumo.c"
      speed_left17 = 100;
# 4587 "sumo/sumo.c"
      speed_right18 = 100;
# 4588 "sumo/sumo.c"
      duration19 = 150;
# 4589 "sumo/sumo.c"
      GetResource(DrivingControlResource);
# 4590 "sumo/sumo.c"
      if (dc.priority != 20) {
# 4591 "sumo/sumo.c"
        SeekStarted = (U32___4 )0;
      }
# 4593 "sumo/sumo.c"
      if (priority16 >= dc.priority) {
# 4594 "sumo/sumo.c"
        dc.priority = priority16;
# 4595 "sumo/sumo.c"
        dc.speed_left = (S32___1 )speed_left17;
# 4596 "sumo/sumo.c"
        dc.speed_right = (S32___1 )speed_right18;
# 4597 "sumo/sumo.c"
        dc.duration = (U32___4 )duration19;
      }
# 4599 "sumo/sumo.c"
      ReleaseResource(DrivingControlResource);
# 4600 "sumo/sumo.c"
      goto Lret_change_driving_command;
      Lret_change_driving_command: ;
    } else {
# 4603 "sumo/sumo.c"
      LastSonarValue = distance;
    }
  } else {
# 4606 "sumo/sumo.c"
    LastSonarValue = distance;
  }
# 4608 "sumo/sumo.c"
  seek_delay_1 = 1000;
# 4609 "sumo/sumo.c"
  seek_delay_2 = seek_delay_1 * 2;
# 4610 "sumo/sumo.c"
  seek_delay_3 = seek_delay_2 * 2;
# 4611 "sumo/sumo.c"
  seek_delay_4 = seek_delay_3 + 2000;
# 4612 "sumo/sumo.c"
  if (distance > 70L) {
# 4613 "sumo/sumo.c"
    if (SeekStarted == 0UL) {
# 4614 "sumo/sumo.c"
      SeekStarted = systick_get_ms();
# 4615 "sumo/sumo.c"
      tmp___0 = rand();
# 4616 "sumo/sumo.c"
      tmp___1 = copysign(1, tmp___0 - 1073741823);
# 4617 "sumo/sumo.c"
      modifier = tmp___1;
# 4618 "sumo/sumo.c"
      speed_left = -70 * modifier;
# 4619 "sumo/sumo.c"
      speed_right = 70 * modifier;
# 4620 "sumo/sumo.c"
      priority20 = 20;
# 4621 "sumo/sumo.c"
      speed_left21 = speed_left;
# 4622 "sumo/sumo.c"
      speed_right22 = speed_right;
# 4623 "sumo/sumo.c"
      duration23 = duration;
# 4624 "sumo/sumo.c"
      GetResource(DrivingControlResource);
# 4625 "sumo/sumo.c"
      if (dc.priority != 20) {
# 4626 "sumo/sumo.c"
        SeekStarted = (U32___4 )0;
      }
# 4628 "sumo/sumo.c"
      if (priority20 >= dc.priority) {
# 4629 "sumo/sumo.c"
        dc.priority = priority20;
# 4630 "sumo/sumo.c"
        dc.speed_left = (S32___1 )speed_left21;
# 4631 "sumo/sumo.c"
        dc.speed_right = (S32___1 )speed_right22;
# 4632 "sumo/sumo.c"
        dc.duration = (U32___4 )duration23;
      }
# 4634 "sumo/sumo.c"
      ReleaseResource(DrivingControlResource);
# 4635 "sumo/sumo.c"
      goto Lret_change_driving_command___0;
      Lret_change_driving_command___0: ;
    } else {
# 4638 "sumo/sumo.c"
      tmp___2 = systick_get_ms();
# 4639 "sumo/sumo.c"
      current_sys_tick = tmp___2;
# 4640 "sumo/sumo.c"
      delta = current_sys_tick - SeekStarted;
# 4641 "sumo/sumo.c"
      if (delta > (U32___4 )seek_delay_1) {
# 4642 "sumo/sumo.c"
        if (delta <= (U32___4 )(seek_delay_1 + 100)) {
# 4643 "sumo/sumo.c"
          GetResource(DrivingControlResource);
# 4644 "sumo/sumo.c"
          speed_left = (int )(dc.speed_left * -1L);
# 4645 "sumo/sumo.c"
          speed_right = (int )(dc.speed_right * -1L);
# 4646 "sumo/sumo.c"
          ReleaseResource(DrivingControlResource);
# 4647 "sumo/sumo.c"
          priority24 = 20;
# 4648 "sumo/sumo.c"
          speed_left25 = speed_left;
# 4649 "sumo/sumo.c"
          speed_right26 = speed_right;
# 4650 "sumo/sumo.c"
          duration27 = duration;
# 4651 "sumo/sumo.c"
          GetResource(DrivingControlResource);
# 4652 "sumo/sumo.c"
          if (dc.priority != 20) {
# 4653 "sumo/sumo.c"
            SeekStarted = (U32___4 )0;
          }
# 4655 "sumo/sumo.c"
          if (priority24 >= dc.priority) {
# 4656 "sumo/sumo.c"
            dc.priority = priority24;
# 4657 "sumo/sumo.c"
            dc.speed_left = (S32___1 )speed_left25;
# 4658 "sumo/sumo.c"
            dc.speed_right = (S32___1 )speed_right26;
# 4659 "sumo/sumo.c"
            dc.duration = (U32___4 )duration27;
          }
# 4661 "sumo/sumo.c"
          ReleaseResource(DrivingControlResource);
# 4662 "sumo/sumo.c"
          goto Lret_change_driving_command___1;
          Lret_change_driving_command___1: ;
        } else {
# 4665 "sumo/sumo.c"
          goto _L___1;
        }
      } else
      _L___1:
# 4669 "sumo/sumo.c"
      if (delta > (U32___4 )seek_delay_2) {
# 4670 "sumo/sumo.c"
        if (delta <= (U32___4 )(seek_delay_2 + 100)) {
# 4671 "sumo/sumo.c"
          GetResource(DrivingControlResource);
# 4672 "sumo/sumo.c"
          speed_left = (int )(dc.speed_left * -1L);
# 4673 "sumo/sumo.c"
          speed_right = (int )(dc.speed_right * -1L);
# 4674 "sumo/sumo.c"
          ReleaseResource(DrivingControlResource);
# 4675 "sumo/sumo.c"
          priority28 = 20;
# 4676 "sumo/sumo.c"
          speed_left29 = speed_left;
# 4677 "sumo/sumo.c"
          speed_right30 = speed_right;
# 4678 "sumo/sumo.c"
          duration31 = duration;
# 4679 "sumo/sumo.c"
          GetResource(DrivingControlResource);
# 4680 "sumo/sumo.c"
          if (dc.priority != 20) {
# 4681 "sumo/sumo.c"
            SeekStarted = (U32___4 )0;
          }
# 4683 "sumo/sumo.c"
          if (priority28 >= dc.priority) {
# 4684 "sumo/sumo.c"
            dc.priority = priority28;
# 4685 "sumo/sumo.c"
            dc.speed_left = (S32___1 )speed_left29;
# 4686 "sumo/sumo.c"
            dc.speed_right = (S32___1 )speed_right30;
# 4687 "sumo/sumo.c"
            dc.duration = (U32___4 )duration31;
          }
# 4689 "sumo/sumo.c"
          ReleaseResource(DrivingControlResource);
# 4690 "sumo/sumo.c"
          goto Lret_change_driving_command___2;
          Lret_change_driving_command___2: ;
        } else {
# 4693 "sumo/sumo.c"
          goto _L___0;
        }
      } else
      _L___0:
# 4697 "sumo/sumo.c"
      if (delta > (U32___4 )seek_delay_3) {
# 4698 "sumo/sumo.c"
        if (delta <= (U32___4 )seek_delay_4) {
# 4699 "sumo/sumo.c"
          speed_left = 100;
# 4700 "sumo/sumo.c"
          speed_right = 100;
# 4701 "sumo/sumo.c"
          priority32 = 20;
# 4702 "sumo/sumo.c"
          speed_left33 = speed_left;
# 4703 "sumo/sumo.c"
          speed_right34 = speed_right;
# 4704 "sumo/sumo.c"
          duration35 = duration;
# 4705 "sumo/sumo.c"
          GetResource(DrivingControlResource);
# 4706 "sumo/sumo.c"
          if (dc.priority != 20) {
# 4707 "sumo/sumo.c"
            SeekStarted = (U32___4 )0;
          }
# 4709 "sumo/sumo.c"
          if (priority32 >= dc.priority) {
# 4710 "sumo/sumo.c"
            dc.priority = priority32;
# 4711 "sumo/sumo.c"
            dc.speed_left = (S32___1 )speed_left33;
# 4712 "sumo/sumo.c"
            dc.speed_right = (S32___1 )speed_right34;
# 4713 "sumo/sumo.c"
            dc.duration = (U32___4 )duration35;
          }
# 4715 "sumo/sumo.c"
          ReleaseResource(DrivingControlResource);
# 4716 "sumo/sumo.c"
          goto Lret_change_driving_command___3;
          Lret_change_driving_command___3: ;
        } else {
# 4719 "sumo/sumo.c"
          goto _L;
        }
      } else
      _L:
# 4723 "sumo/sumo.c"
      if (delta > (U32___4 )seek_delay_4) {
# 4724 "sumo/sumo.c"
        SeekStarted = (U32___4 )0;
      }
    }
  } else {
# 4728 "sumo/sumo.c"
    priority36 = 30;
# 4729 "sumo/sumo.c"
    speed_left37 = 100;
# 4730 "sumo/sumo.c"
    speed_right38 = 100;
# 4731 "sumo/sumo.c"
    duration39 = 150;
# 4732 "sumo/sumo.c"
    GetResource(DrivingControlResource);
# 4733 "sumo/sumo.c"
    if (dc.priority != 20) {
# 4734 "sumo/sumo.c"
      SeekStarted = (U32___4 )0;
    }
# 4736 "sumo/sumo.c"
    if (priority36 >= dc.priority) {
# 4737 "sumo/sumo.c"
      dc.priority = priority36;
# 4738 "sumo/sumo.c"
      dc.speed_left = (S32___1 )speed_left37;
# 4739 "sumo/sumo.c"
      dc.speed_right = (S32___1 )speed_right38;
# 4740 "sumo/sumo.c"
      dc.duration = (U32___4 )duration39;
    }
# 4742 "sumo/sumo.c"
    ReleaseResource(DrivingControlResource);
# 4743 "sumo/sumo.c"
    goto Lret_change_driving_command___4;
    Lret_change_driving_command___4: ;
  }
# 4746 "sumo/sumo.c"
  TerminateTask();
# 4747 "sumo/sumo.c"
  return;
}
}
# 4934 "sumo/sumo.c"
extern int ( display_unsigned_worker)() ;
# 4750 "sumo/sumo.c"
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
# 4826 "sumo/sumo.c"
  if (InSetupPhase) {
# 4827 "sumo/sumo.c"
    TerminateTask();
  }
# 4829 "sumo/sumo.c"
  display_clear((U32___4 )0);
# 4830 "sumo/sumo.c"
  GetResource(DrivingControlResource);
# 4831 "sumo/sumo.c"
  x22 = 0;
# 4832 "sumo/sumo.c"
  y23 = 0;
# 4833 "sumo/sumo.c"
  display_x = x22;
# 4834 "sumo/sumo.c"
  display_y = y23;
# 4835 "sumo/sumo.c"
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
# 4837 "sumo/sumo.c"
  str36 = "PRIO: ";
# 4838 "sumo/sumo.c"
  while (*str36) {
# 4839 "sumo/sumo.c"
    if ((int const )*str36 != 10) {
# 4840 "sumo/sumo.c"
      display_char((int )*str36);
# 4841 "sumo/sumo.c"
      display_x ++;
    } else {
# 4843 "sumo/sumo.c"
      display_x = 0;
# 4844 "sumo/sumo.c"
      display_y ++;
    }
# 4846 "sumo/sumo.c"
    str36 ++;
  }
# 4848 "sumo/sumo.c"
  goto Lret_display_string;
  Lret_display_string: ;
# 4850 "sumo/sumo.c"
  switch (dc.priority) {
  case 5:
# 4852 "sumo/sumo.c"
  str37 = "IDLE";
# 4853 "sumo/sumo.c"
  while (*str37) {
# 4854 "sumo/sumo.c"
    if ((int const )*str37 != 10) {
# 4855 "sumo/sumo.c"
      display_char((int )*str37);
# 4856 "sumo/sumo.c"
      display_x ++;
    } else {
# 4858 "sumo/sumo.c"
      display_x = 0;
# 4859 "sumo/sumo.c"
      display_y ++;
    }
# 4861 "sumo/sumo.c"
    str37 ++;
  }
# 4863 "sumo/sumo.c"
  goto Lret_display_string___0;
  Lret_display_string___0: ;
# 4865 "sumo/sumo.c"
  break;
  case 20:
# 4867 "sumo/sumo.c"
  str38 = "SEEK";
# 4868 "sumo/sumo.c"
  while (*str38) {
# 4869 "sumo/sumo.c"
    if ((int const )*str38 != 10) {
# 4870 "sumo/sumo.c"
      display_char((int )*str38);
# 4871 "sumo/sumo.c"
      display_x ++;
    } else {
# 4873 "sumo/sumo.c"
      display_x = 0;
# 4874 "sumo/sumo.c"
      display_y ++;
    }
# 4876 "sumo/sumo.c"
    str38 ++;
  }
# 4878 "sumo/sumo.c"
  goto Lret_display_string___1;
  Lret_display_string___1: ;
# 4880 "sumo/sumo.c"
  break;
  case 30:
# 4882 "sumo/sumo.c"
  str39 = "FOLLOW";
# 4883 "sumo/sumo.c"
  while (*str39) {
# 4884 "sumo/sumo.c"
    if ((int const )*str39 != 10) {
# 4885 "sumo/sumo.c"
      display_char((int )*str39);
# 4886 "sumo/sumo.c"
      display_x ++;
    } else {
# 4888 "sumo/sumo.c"
      display_x = 0;
# 4889 "sumo/sumo.c"
      display_y ++;
    }
# 4891 "sumo/sumo.c"
    str39 ++;
  }
# 4893 "sumo/sumo.c"
  goto Lret_display_string___2;
  Lret_display_string___2: ;
# 4895 "sumo/sumo.c"
  break;
  case 50:
# 4897 "sumo/sumo.c"
  str40 = "COLOR";
# 4898 "sumo/sumo.c"
  while (*str40) {
# 4899 "sumo/sumo.c"
    if ((int const )*str40 != 10) {
# 4900 "sumo/sumo.c"
      display_char((int )*str40);
# 4901 "sumo/sumo.c"
      display_x ++;
    } else {
# 4903 "sumo/sumo.c"
      display_x = 0;
# 4904 "sumo/sumo.c"
      display_y ++;
    }
# 4906 "sumo/sumo.c"
    str40 ++;
  }
# 4908 "sumo/sumo.c"
  goto Lret_display_string___3;
  Lret_display_string___3: ;
# 4910 "sumo/sumo.c"
  break;
  default:
# 4912 "sumo/sumo.c"
  str41 = "WTF: ";
# 4913 "sumo/sumo.c"
  while (*str41) {
# 4914 "sumo/sumo.c"
    if ((int const )*str41 != 10) {
# 4915 "sumo/sumo.c"
      display_char((int )*str41);
# 4916 "sumo/sumo.c"
      display_x ++;
    } else {
# 4918 "sumo/sumo.c"
      display_x = 0;
# 4919 "sumo/sumo.c"
      display_y ++;
    }
# 4921 "sumo/sumo.c"
    str41 ++;
  }
# 4923 "sumo/sumo.c"
  goto Lret_display_string___4;
  Lret_display_string___4:
# 4926 "sumo/sumo.c"
  val49 = dc.priority;
# 4927 "sumo/sumo.c"
  places50 = (U32___4 )3;
# 4929 "sumo/sumo.c"
  if (val49 < 0) {
# 4930 "sumo/sumo.c"
    tmp51 = - val49;
  } else {
# 4932 "sumo/sumo.c"
    tmp51 = val49;
  }
# 4934 "sumo/sumo.c"
  display_unsigned_worker((U32 )tmp51, places50, (U32 )(val49 < 0));
# 4935 "sumo/sumo.c"
  goto Lret_display_int;
  Lret_display_int: ;
# 4939 "sumo/sumo.c"
  break;
  }
# 4941 "sumo/sumo.c"
  x24 = 0;
# 4942 "sumo/sumo.c"
  y25 = 1;
# 4943 "sumo/sumo.c"
  display_x = x24;
# 4944 "sumo/sumo.c"
  display_y = y25;
# 4945 "sumo/sumo.c"
  goto Lret_display_goto_xy___0;
  Lret_display_goto_xy___0:
# 4947 "sumo/sumo.c"
  str42 = "SPEED L/R: ";
# 4948 "sumo/sumo.c"
  while (*str42) {
# 4949 "sumo/sumo.c"
    if ((int const )*str42 != 10) {
# 4950 "sumo/sumo.c"
      display_char((int )*str42);
# 4951 "sumo/sumo.c"
      display_x ++;
    } else {
# 4953 "sumo/sumo.c"
      display_x = 0;
# 4954 "sumo/sumo.c"
      display_y ++;
    }
# 4956 "sumo/sumo.c"
    str42 ++;
  }
# 4958 "sumo/sumo.c"
  goto Lret_display_string___5;
  Lret_display_string___5:
# 4960 "sumo/sumo.c"
  x26 = 0;
# 4961 "sumo/sumo.c"
  y27 = 2;
# 4962 "sumo/sumo.c"
  display_x = x26;
# 4963 "sumo/sumo.c"
  display_y = y27;
# 4964 "sumo/sumo.c"
  goto Lret_display_goto_xy___1;
  Lret_display_goto_xy___1:
# 4967 "sumo/sumo.c"
  val52 = (int )dc.speed_left;
# 4968 "sumo/sumo.c"
  places53 = (U32___4 )4;
# 4970 "sumo/sumo.c"
  if (val52 < 0) {
# 4971 "sumo/sumo.c"
    tmp54 = - val52;
  } else {
# 4973 "sumo/sumo.c"
    tmp54 = val52;
  }
# 4975 "sumo/sumo.c"
  display_unsigned_worker((U32 )tmp54, places53, (U32 )(val52 < 0));
# 4976 "sumo/sumo.c"
  goto Lret_display_int___0;
  Lret_display_int___0:
# 4979 "sumo/sumo.c"
  str43 = "/";
# 4981 "sumo/sumo.c"
  while (*str43) {
# 4982 "sumo/sumo.c"
    if ((int const )*str43 != 10) {
# 4983 "sumo/sumo.c"
      display_char((int )*str43);
# 4984 "sumo/sumo.c"
      display_x ++;
    } else {
# 4986 "sumo/sumo.c"
      display_x = 0;
# 4987 "sumo/sumo.c"
      display_y ++;
    }
# 4989 "sumo/sumo.c"
    str43 ++;
  }
# 4991 "sumo/sumo.c"
  goto Lret_display_string___6;
  Lret_display_string___6:
# 4994 "sumo/sumo.c"
  val55 = (int )dc.speed_right;
# 4995 "sumo/sumo.c"
  places56 = (U32___4 )4;
# 4997 "sumo/sumo.c"
  if (val55 < 0) {
# 4998 "sumo/sumo.c"
    tmp57 = - val55;
  } else {
# 5000 "sumo/sumo.c"
    tmp57 = val55;
  }
# 5002 "sumo/sumo.c"
  display_unsigned_worker((U32 )tmp57, places56, (U32 )(val55 < 0));
# 5003 "sumo/sumo.c"
  goto Lret_display_int___1;
  Lret_display_int___1:
# 5006 "sumo/sumo.c"
  x28 = 0;
# 5007 "sumo/sumo.c"
  y29 = 3;
# 5008 "sumo/sumo.c"
  display_x = x28;
# 5009 "sumo/sumo.c"
  display_y = y29;
# 5011 "sumo/sumo.c"
  goto Lret_display_goto_xy___2;
  Lret_display_goto_xy___2:
# 5013 "sumo/sumo.c"
  str44 = "DURATION: ";
# 5014 "sumo/sumo.c"
  while (*str44) {
# 5015 "sumo/sumo.c"
    if ((int const )*str44 != 10) {
# 5016 "sumo/sumo.c"
      display_char((int )*str44);
# 5017 "sumo/sumo.c"
      display_x ++;
    } else {
# 5019 "sumo/sumo.c"
      display_x = 0;
# 5020 "sumo/sumo.c"
      display_y ++;
    }
# 5022 "sumo/sumo.c"
    str44 ++;
  }
# 5024 "sumo/sumo.c"
  goto Lret_display_string___7;
  Lret_display_string___7:
# 5027 "sumo/sumo.c"
  val58 = (int )dc.duration;
# 5028 "sumo/sumo.c"
  places59 = (U32___4 )0;
# 5030 "sumo/sumo.c"
  if (val58 < 0) {
# 5031 "sumo/sumo.c"
    tmp60 = - val58;
  } else {
# 5033 "sumo/sumo.c"
    tmp60 = val58;
  }
# 5035 "sumo/sumo.c"
  display_unsigned_worker((U32 )tmp60, places59, (U32 )(val58 < 0));
# 5036 "sumo/sumo.c"
  goto Lret_display_int___2;
  Lret_display_int___2:
# 5039 "sumo/sumo.c"
  ReleaseResource(DrivingControlResource);
# 5040 "sumo/sumo.c"
  x30 = 0;
# 5041 "sumo/sumo.c"
  y31 = 4;
# 5042 "sumo/sumo.c"
  display_x = x30;
# 5043 "sumo/sumo.c"
  display_y = y31;
# 5045 "sumo/sumo.c"
  goto Lret_display_goto_xy___3;
  Lret_display_goto_xy___3:
# 5047 "sumo/sumo.c"
  str45 = "SYSTEM: ";
# 5048 "sumo/sumo.c"
  while (*str45) {
# 5049 "sumo/sumo.c"
    if ((int const )*str45 != 10) {
# 5050 "sumo/sumo.c"
      display_char((int )*str45);
# 5051 "sumo/sumo.c"
      display_x ++;
    } else {
# 5053 "sumo/sumo.c"
      display_x = 0;
# 5054 "sumo/sumo.c"
      display_y ++;
    }
# 5056 "sumo/sumo.c"
    str45 ++;
  }
# 5058 "sumo/sumo.c"
  goto Lret_display_string___8;
  Lret_display_string___8:
# 5061 "sumo/sumo.c"
  tmp = systick_get_ms();
# 5062 "sumo/sumo.c"
  val61 = (int )tmp;
# 5063 "sumo/sumo.c"
  places62 = (U32___4 )0;
# 5065 "sumo/sumo.c"
  if (val61 < 0) {
# 5066 "sumo/sumo.c"
    tmp63 = - val61;
  } else {
# 5068 "sumo/sumo.c"
    tmp63 = val61;
  }
# 5070 "sumo/sumo.c"
  display_unsigned_worker((U32 )tmp63, places62, (U32 )(val61 < 0));
# 5071 "sumo/sumo.c"
  goto Lret_display_int___3;
  Lret_display_int___3:
# 5074 "sumo/sumo.c"
  port_id9 = (U8___3 )0;
# 5075 "sumo/sumo.c"
  ret_ecrobot_get_nxtcolorsensor_light10 = sensor_data[port_id9].light;
# 5077 "sumo/sumo.c"
  goto Lret_ecrobot_get_nxtcolorsensor_light;
  Lret_ecrobot_get_nxtcolorsensor_light:
# 5079 "sumo/sumo.c"
  tmp___0 = ret_ecrobot_get_nxtcolorsensor_light10;
# 5080 "sumo/sumo.c"
  color = tmp___0;
# 5081 "sumo/sumo.c"
  x32 = 0;
# 5082 "sumo/sumo.c"
  y33 = 5;
# 5083 "sumo/sumo.c"
  display_x = x32;
# 5084 "sumo/sumo.c"
  display_y = y33;
# 5085 "sumo/sumo.c"
  goto Lret_display_goto_xy___4;
  Lret_display_goto_xy___4:
# 5087 "sumo/sumo.c"
  str46 = "COLOR: ";
# 5088 "sumo/sumo.c"
  while (*str46) {
# 5089 "sumo/sumo.c"
    if ((int const )*str46 != 10) {
# 5090 "sumo/sumo.c"
      display_char((int )*str46);
# 5091 "sumo/sumo.c"
      display_x ++;
    } else {
# 5093 "sumo/sumo.c"
      display_x = 0;
# 5094 "sumo/sumo.c"
      display_y ++;
    }
# 5096 "sumo/sumo.c"
    str46 ++;
  }
# 5098 "sumo/sumo.c"
  goto Lret_display_string___9;
  Lret_display_string___9:
# 5101 "sumo/sumo.c"
  val64 = (int )color;
# 5102 "sumo/sumo.c"
  places65 = (U32___4 )0;
# 5104 "sumo/sumo.c"
  if (val64 < 0) {
# 5105 "sumo/sumo.c"
    tmp66 = - val64;
  } else {
# 5107 "sumo/sumo.c"
    tmp66 = val64;
  }
# 5109 "sumo/sumo.c"
  display_unsigned_worker((U32 )tmp66, places65, (U32 )(val64 < 0));
# 5110 "sumo/sumo.c"
  goto Lret_display_int___4;
  Lret_display_int___4:
# 5113 "sumo/sumo.c"
  port_id6 = (U8___3 )1;
# 5114 "sumo/sumo.c"
  tmp7 = i2c_busy((int )port_id6);
# 5116 "sumo/sumo.c"
  if (tmp7 == 0) {
# 5118 "sumo/sumo.c"
    port11 = (int )port_id6;
# 5119 "sumo/sumo.c"
    address12 = (U32___1 )1;
# 5120 "sumo/sumo.c"
    internal_address13 = 66;
# 5121 "sumo/sumo.c"
    n_internal_address_bytes14 = 1;
# 5123 "sumo/sumo.c"
    nbytes16 = (U32___1 )1;
# 5124 "sumo/sumo.c"
    write17 = 0;
# 5125 "sumo/sumo.c"
    if (port11 < 0) {
# 5126 "sumo/sumo.c"
      goto Lret_i2c_start_transaction;
    } else
# 5128 "sumo/sumo.c"
    if (port11 >= 4) {
# 5129 "sumo/sumo.c"
      goto Lret_i2c_start_transaction;
    }
# 5131 "sumo/sumo.c"
    tmp20 = i2c_busy(port11);
# 5132 "sumo/sumo.c"
    if (tmp20) {
# 5133 "sumo/sumo.c"
      goto Lret_i2c_start_transaction;
    }
# 5135 "sumo/sumo.c"
    p18 = & i2c_port[port11];
# 5136 "sumo/sumo.c"
    p18->pt_num = (U32___0 )0;
# 5137 "sumo/sumo.c"
    p18->pt_begun = (U32___0 )0;
# 5138 "sumo/sumo.c"
    pt19 = p18->partial_transaction;
# 5139 "sumo/sumo.c"
    p18->current_pt = pt19;
# 5140 "sumo/sumo.c"
    memset((void *)pt19, 0, sizeof(p18->partial_transaction));
# 5141 "sumo/sumo.c"
    if (n_internal_address_bytes14 > 0) {
# 5142 "sumo/sumo.c"
      p18->addr_int[0] = (U8___0 )(address12 << 1);
# 5143 "sumo/sumo.c"
      p18->addr_int[1] = (U8___0 )internal_address13;
# 5144 "sumo/sumo.c"
      pt19->start = (U8___0 )1;
# 5145 "sumo/sumo.c"
      if (write17) {
# 5146 "sumo/sumo.c"
        pt19->stop = (U8___0 )0;
      } else {
# 5148 "sumo/sumo.c"
        pt19->stop = (U8___0 )1;
      }
# 5150 "sumo/sumo.c"
      pt19->tx = (U8___0 )1;
# 5151 "sumo/sumo.c"
      pt19->data = p18->addr_int;
# 5152 "sumo/sumo.c"
      pt19->nbytes = (U16___0 )2;
# 5153 "sumo/sumo.c"
      pt19 ++;
    }
# 5155 "sumo/sumo.c"
    if (n_internal_address_bytes14 == 0) {
# 5156 "sumo/sumo.c"
      goto _L;
    } else
# 5158 "sumo/sumo.c"
    if (! write17) {
      _L:
# 5160 "sumo/sumo.c"
      if (n_internal_address_bytes14 > 0) {
# 5161 "sumo/sumo.c"
        pt19->start = (U8___0 )0;
      } else {
# 5163 "sumo/sumo.c"
        pt19->start = (U8___0 )1;
      }
# 5165 "sumo/sumo.c"
      pt19->restart = (U8___0 )(! pt19->start);
# 5166 "sumo/sumo.c"
      pt19->stop = (U8___0 )0;
# 5167 "sumo/sumo.c"
      pt19->tx = (U8___0 )1;
# 5168 "sumo/sumo.c"
      if (write17) {
# 5169 "sumo/sumo.c"
        tmp___021 = 0;
      } else {
# 5171 "sumo/sumo.c"
        tmp___021 = 1;
      }
# 5173 "sumo/sumo.c"
      p18->addr = (U8___0 )((address12 << 1) | (unsigned long )tmp___021);
# 5174 "sumo/sumo.c"
      pt19->data = & p18->addr;
# 5175 "sumo/sumo.c"
      pt19->nbytes = (U16___0 )1;
# 5176 "sumo/sumo.c"
      pt19 ++;
    }
# 5178 "sumo/sumo.c"
    pt19->start = (U8___0 )0;
# 5179 "sumo/sumo.c"
    pt19->stop = (U8___0 )1;
# 5180 "sumo/sumo.c"
    if (write17) {
# 5181 "sumo/sumo.c"
      pt19->tx = (U8___0 )1;
    } else {
# 5183 "sumo/sumo.c"
      pt19->tx = (U8___0 )0;
    }
# 5185 "sumo/sumo.c"
    pt19->data = data15;
# 5186 "sumo/sumo.c"
    pt19->nbytes = (U16___0 )nbytes16;
# 5187 "sumo/sumo.c"
    pt19->last_pt = (U8___0 )1;
# 5188 "sumo/sumo.c"
    p18->state = (i2c_port_state )2;
# 5189 "sumo/sumo.c"
    goto Lret_i2c_start_transaction;
    Lret_i2c_start_transaction: ;
  }
# 5192 "sumo/sumo.c"
  ret_ecrobot_get_sonar_sensor8 = distance_state[port_id6];
# 5193 "sumo/sumo.c"
  goto Lret_ecrobot_get_sonar_sensor;
  Lret_ecrobot_get_sonar_sensor:
# 5195 "sumo/sumo.c"
  tmp___1 = ret_ecrobot_get_sonar_sensor8;
# 5196 "sumo/sumo.c"
  sonar = tmp___1;
# 5197 "sumo/sumo.c"
  x34 = 0;
# 5198 "sumo/sumo.c"
  y35 = 6;
# 5199 "sumo/sumo.c"
  display_x = x34;
# 5200 "sumo/sumo.c"
  display_y = y35;
# 5201 "sumo/sumo.c"
  goto Lret_display_goto_xy___5;
  Lret_display_goto_xy___5:
# 5203 "sumo/sumo.c"
  str47 = "SONAR: ";
# 5204 "sumo/sumo.c"
  while (*str47) {
# 5205 "sumo/sumo.c"
    if ((int const )*str47 != 10) {
# 5206 "sumo/sumo.c"
      display_char((int )*str47);
# 5207 "sumo/sumo.c"
      display_x ++;
    } else {
# 5209 "sumo/sumo.c"
      display_x = 0;
# 5210 "sumo/sumo.c"
      display_y ++;
    }
# 5212 "sumo/sumo.c"
    str47 ++;
  }
# 5214 "sumo/sumo.c"
  goto Lret_display_string___10;
  Lret_display_string___10:
# 5217 "sumo/sumo.c"
  val67 = (int )sonar;
# 5218 "sumo/sumo.c"
  places68 = (U32___4 )0;
# 5220 "sumo/sumo.c"
  if (val67 < 0) {
# 5221 "sumo/sumo.c"
    tmp69 = - val67;
  } else {
# 5223 "sumo/sumo.c"
    tmp69 = val67;
  }
# 5225 "sumo/sumo.c"
  display_unsigned_worker((U32 )tmp69, places68, (U32 )(val67 < 0));
# 5226 "sumo/sumo.c"
  goto Lret_display_int___5;
  Lret_display_int___5:
# 5229 "sumo/sumo.c"
  str48 = " / ";
# 5231 "sumo/sumo.c"
  while (*str48) {
# 5232 "sumo/sumo.c"
    if ((int const )*str48 != 10) {
# 5233 "sumo/sumo.c"
      display_char((int )*str48);
# 5234 "sumo/sumo.c"
      display_x ++;
    } else {
# 5236 "sumo/sumo.c"
      display_x = 0;
# 5237 "sumo/sumo.c"
      display_y ++;
    }
# 5239 "sumo/sumo.c"
    str48 ++;
  }
# 5241 "sumo/sumo.c"
  goto Lret_display_string___11;
  Lret_display_string___11:
# 5244 "sumo/sumo.c"
  val70 = (int )LastSonarValue;
# 5245 "sumo/sumo.c"
  places71 = (U32___4 )0;
# 5247 "sumo/sumo.c"
  if (val70 < 0) {
# 5248 "sumo/sumo.c"
    tmp72 = - val70;
  } else {
# 5250 "sumo/sumo.c"
    tmp72 = val70;
  }
# 5252 "sumo/sumo.c"
  display_unsigned_worker((U32 )tmp72, places71, (U32 )(val70 < 0));
# 5253 "sumo/sumo.c"
  goto Lret_display_int___6;
  Lret_display_int___6:
# 5256 "sumo/sumo.c"
  display_update();
# 5257 "sumo/sumo.c"
  TerminateTask();
# 5259 "sumo/sumo.c"
  return;
}
}
# 5262 "sumo/sumo.c"
extern int create_block() ;
# 5263 "sumo/sumo.c"
extern int create_task() ;
# 5264 "sumo/sumo.c"
void main(void)
{


  {
# 5268 "sumo/sumo.c"
  create_task("TaskMainDisplayTask", "TaskMainDisplayTask", 10, 250, 0.411);
# 5269 "sumo/sumo.c"
  create_task("TaskMainColorSensorTask", "TaskMainColorSensorTask", 2, 100, 0.068);
# 5270 "sumo/sumo.c"
  create_task("TaskMainSonarSensorTask", "TaskMainSonarSensorTask", 5, 100, 0.114);
# 5271 "sumo/sumo.c"
  create_task("TaskMainMotorControlTask", "TaskMainMotorControlTask", 1, 50, 0.074);
# 5272 "sumo/sumo.c"
  create_block(4280, 4300, "TaskMainMotorControlTask", "DrivingControlResource", 1,
               1, 0.071);
# 5285 "sumo/sumo.c"
  return;
}
}

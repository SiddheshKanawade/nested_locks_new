# 1 "biped_robot/biped_robot.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "biped_robot/biped_robot.c"



typedef unsigned char U8;
typedef unsigned short U16;
typedef short S16;
enum __anonenum_motionCmd_t_622667461 {
    NEUTRAL = 0,
    STAND_UP = 1,
    FORWARD = 2,
    RIGHT_TURN = 3,
    LEFT_TURN = 4
} ;
typedef enum __anonenum_motionCmd_t_622667461 motionCmd_t;
struct __anonstruct_motion_t_763372307 {
   S16 angle[1][10] ;
   U16 wait ;
};
typedef struct __anonstruct_motion_t_763372307 motion_t;
struct __anonstruct_motionTable_t_630939579 {
   motion_t *pMotion ;
   int steps ;
};
typedef struct __anonstruct_motionTable_t_630939579 motionTable_t;
typedef unsigned char UINT8___0;
typedef UINT8___0 StatusType___0;
typedef UINT8___0 TaskType___0;
typedef UINT8___0 ResourceType___0;
typedef UINT8___0 CounterType___0;
typedef unsigned char U8___0;
typedef signed char S8___0;
typedef unsigned long U32___0;
typedef enum __anonenum_motionCmd_t_622667461 motionCmd_t___0;
enum __anonenum_motionCmd_t_763372308 {
    NEUTRAL___1 = 0,
    STAND_UP___1 = 1,
    FORWARD___1 = 2,
    RIGHT_TURN___1 = 3,
    LEFT_TURN___1 = 4
} ;
typedef enum __anonenum_motionCmd_t_763372308 motionCmd_t___1;
extern void ecrobot_init_bt_slave(char const *pin ) ;
extern void ecrobot_term_bt_connection(void) ;
extern unsigned long ecrobot_read_bt_packet(unsigned char *buf , unsigned long bufLen ) ;
extern void ecrobot_init_i2c(unsigned char port_id , unsigned char type ) ;
extern void ecrobot_term_i2c(unsigned char port_id ) ;
extern void ecrobot_status_monitor(char const *target_name ) ;
void ecrobot_device_initialize(void) ;
void ecrobot_device_terminate(void) ;
void user_1ms_isr_type2(void) ;
extern unsigned char TerminateTask(void) ;
extern unsigned char ChainTask(unsigned char tskid ) ;
extern unsigned char GetTaskID(unsigned char *p_tskid ) ;
extern unsigned char GetResource(unsigned char resid ) ;
extern unsigned char ReleaseResource(unsigned char resid ) ;
extern void ShutdownOS(unsigned char ercd ) ;
extern unsigned char SignalCounter(unsigned char cntid ) ;
extern void check_sleepers(void) ;
extern void sleep(unsigned int duration ) ;
extern U8 const NXTe_CH[4] ;
extern void init_NXTe(U8 port_id ) ;
extern void sync_NXTeServo(U8 port_id , U8 nxte_ch ) ;
extern void load_NXTeServo(U8 port_id , U8 nxte_ch , U16 servo_ch_bit ) ;
extern U16 read_NXTeMotion(U8 port_id , U8 nxte_ch ) ;
extern void set_NXTeDelay(U8 port_id , U8 nxte_ch , U8 servo_ch , U8 delay ) ;
extern void set_NXTeAngle(U8 port_id , U8 nxte_ch , U8 servo_ch , S16 angle ) ;
void initServo(U8 port_id ) ;
int setServo(U8 port_id , motion_t *motion ) ;
void setMotion(U8 port_id , motionCmd_t cmd ) ;
motion_t const PRM_NEUTRAL[1] = { {{{(S16 )1000, (S16 )1000, (S16 )1000, (S16 )1000, (S16 )1000, (S16 )1000, (S16 )1000,
        (S16 )1000, (S16 )1000, (S16 )1000}}, (U16 )0}};
motion_t const PRM_STAND_UP[1] = { {{{(S16 )1000, (S16 )1000, (S16 )800, (S16 )1200, (S16 )800, (S16 )1200, (S16 )800,
        (S16 )1200, (S16 )1000, (S16 )1000}}, (U16 )500}};
motion_t const PRM_FORWARD[9] =
  { {{{(S16 )950, (S16 )950, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )850, (S16 )-1,
        (S16 )-1, (S16 )1050}}, (U16 )200},
        {{{(S16 )-1, (S16 )-1, (S16 )300, (S16 )-1, (S16 )400, (S16 )-1, (S16 )900, (S16 )-1,
        (S16 )1050, (S16 )1100}}, (U16 )100},
        {{{(S16 )-1, (S16 )-1, (S16 )200, (S16 )1100, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1350,
        (S16 )850, (S16 )900}}, (U16 )200},
        {{{(S16 )-1, (S16 )-1, (S16 )800, (S16 )-1, (S16 )800, (S16 )-1, (S16 )850, (S16 )-1,
        (S16 )-1, (S16 )-1}}, (U16 )0},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )1600, (S16 )-1, (S16 )1500, (S16 )-1,
        (S16 )-1, (S16 )-1, (S16 )-1}}, (U16 )200},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1200,
        (S16 )-1, (S16 )-1}}, (U16 )0},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )700, (S16 )-1,
        (S16 )1100, (S16 )1150}}, (U16 )100},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )1200, (S16 )-1, (S16 )1200, (S16 )-1,
        (S16 )-1, (S16 )1000, (S16 )1050}}, (U16 )200},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )850, (S16 )-1,
        (S16 )-1, (S16 )-1}}, (U16 )100}};
motion_t const PRM_RIGHT_TURN[9] =
  { {{{(S16 )1050, (S16 )1050, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )850,
        (S16 )-1, (S16 )-1, (S16 )1050}}, (U16 )200},
        {{{(S16 )-1, (S16 )-1, (S16 )300, (S16 )-1, (S16 )400, (S16 )-1, (S16 )900, (S16 )-1,
        (S16 )1050, (S16 )1100}}, (U16 )100},
        {{{(S16 )-1, (S16 )-1, (S16 )200, (S16 )1100, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1350,
        (S16 )850, (S16 )900}}, (U16 )200},
        {{{(S16 )-1, (S16 )-1, (S16 )800, (S16 )-1, (S16 )800, (S16 )-1, (S16 )850, (S16 )-1,
        (S16 )-1, (S16 )-1}}, (U16 )0},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )1600, (S16 )-1, (S16 )1500, (S16 )-1,
        (S16 )-1, (S16 )-1, (S16 )-1}}, (U16 )200},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1200,
        (S16 )-1, (S16 )-1}}, (U16 )0},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )700, (S16 )-1,
        (S16 )1100, (S16 )1150}}, (U16 )100},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )1200, (S16 )-1, (S16 )1200, (S16 )-1,
        (S16 )-1, (S16 )1000, (S16 )1050}}, (U16 )200},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )850, (S16 )-1,
        (S16 )-1, (S16 )-1}}, (U16 )100}};
motion_t const PRM_LEFT_TURN[9] =
  { {{{(S16 )950, (S16 )950, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1150,
        (S16 )950, (S16 )-1}}, (U16 )200},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )1700, (S16 )-1, (S16 )1600, (S16 )-1,
        (S16 )1100, (S16 )900, (S16 )950}}, (U16 )100},
        {{{(S16 )-1, (S16 )-1, (S16 )900, (S16 )1800, (S16 )-1, (S16 )-1, (S16 )650,
        (S16 )-1, (S16 )1100, (S16 )1150}}, (U16 )200},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )1200, (S16 )-1, (S16 )1200, (S16 )-1,
        (S16 )1150, (S16 )-1, (S16 )-1}}, (U16 )0},
        {{{(S16 )-1, (S16 )-1, (S16 )400, (S16 )-1, (S16 )500, (S16 )-1, (S16 )-1, (S16 )-1,
        (S16 )-1, (S16 )-1}}, (U16 )200},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )800, (S16 )-1,
        (S16 )-1, (S16 )-1}}, (U16 )0},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1300,
        (S16 )850, (S16 )900}}, (U16 )100},
        {{{(S16 )-1, (S16 )-1, (S16 )800, (S16 )-1, (S16 )800, (S16 )-1, (S16 )-1, (S16 )-1,
        (S16 )950, (S16 )1000}}, (U16 )200},
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1150,
        (S16 )-1, (S16 )-1}}, (U16 )100}};
motionTable_t const motionTable[5] = { {(motion_t *)(PRM_NEUTRAL), (int )(sizeof(PRM_NEUTRAL) / sizeof(motion_t ))},
        {(motion_t *)(PRM_STAND_UP),
      (int )(sizeof(PRM_STAND_UP) / sizeof(motion_t ))},
        {(motion_t *)(PRM_FORWARD), (int )(sizeof(PRM_FORWARD) / sizeof(motion_t ))},
        {(motion_t *)(PRM_RIGHT_TURN),
      (int )(sizeof(PRM_RIGHT_TURN) / sizeof(motion_t ))},
        {(motion_t *)(PRM_LEFT_TURN), (int )(sizeof(PRM_LEFT_TURN) / sizeof(motion_t ))}};
# 194 "biped_robot/biped_robot.c"
extern ResourceType___0 ResourceCommand ;
extern CounterType___0 const SysTimerCnt ;
static motionCmd_t___1 motionCmd ;
# 230 "biped_robot/biped_robot.c"
void TaskMainTask_Init(void)
{


  {
  return;
}
}
void TaskMainTask_Commander(void)
{
  U8___0 bt_receive_buf[32] ;
  U32___0 tmp ;
  S8___0 in13 ;
  S8___0 in24 ;
  motionCmd_t___1 cmd5 ;
  motionCmd_t___1 ret_getMotionCommand6 ;

  {
  tmp = ecrobot_read_bt_packet(bt_receive_buf, (U32___0 )32);
  if (tmp) {
    GetResource(ResourceCommand);
    in13 = (S8___0 )(- ((int )*((S8___0 *)(& bt_receive_buf[0]))));
    in24 = *((S8___0 *)(& bt_receive_buf[1]));
    cmd5 = (motionCmd_t___1 )1;
    if ((int )in13 == 0) {
      if ((int )in24 > 0) {
        cmd5 = (motionCmd_t___1 )3;
      } else
      if ((int )in24 < 0) {
        cmd5 = (motionCmd_t___1 )4;
      }
    } else
    if ((int )in13 > 0) {
      if ((int )in24 == 0) {
        cmd5 = (motionCmd_t___1 )2;
      }
    }
    ret_getMotionCommand6 = cmd5;
    goto Lret_getMotionCommand;
    Lret_getMotionCommand:
    motionCmd = ret_getMotionCommand6;
    ReleaseResource(ResourceCommand);
  }
  TerminateTask();
  return;
}
}
void TaskMainTask_Display(void)
{


  {
  ecrobot_status_monitor("BIPED ROBOT");
  TerminateTask();
  return;
}
}
void TaskMainTask_MotionControl(void)
{
  motionCmd_t___1 cmd ;
  TaskType___0 t ;
  U8 port_id3 ;
  motionCmd_t cmd4 ;
  int i5 ;
  int tmp6 ;

  {
  {
  GetResource(ResourceCommand);
  cmd = motionCmd;
  ReleaseResource(ResourceCommand);
  port_id3 = (U8___0 )2;
  cmd4 = (motionCmd_t___0 )cmd;
  {
  if ((unsigned long )cmd4 >= sizeof(motionTable)) {
    goto Lret_setMotion;
  }
  i5 = 0;
  while (i5 < (int )motionTable[cmd4].steps) {
    tmp6 = setServo(port_id3, (motion_t *)(motionTable[cmd4].pMotion + i5));
    if (tmp6 == 0) {
      i5 --;
      if (i5 < 0) {
        i5 = 0;
      }
    }
    i5 ++;
  }
  goto Lret_setMotion;
  }
  Lret_setMotion: ;
  GetTaskID(& t);
  ChainTask(t);
  }
  return;
}
}
extern int create_task() ;
extern int create_block() ;
void main(void)
{
  {
  create_task("TaskMainTask_Commander", "TaskMainTask_Commander", 3, 5, 0.025);
  create_task("TaskMainTask_Display", "TaskMainTask_Display", 2, 500, 0.01);
  create_task("TaskMainTask_MotionControl", "TaskMainTask_MotionControl", 1, 999, 0.052);
  create_block(298, "TaskMainTask_Display", "motionCommand", 1, 2, 0.011);
  create_block(250, "TaskMainTask_Commander", "motionCommand", 1, 3, 0.021);
  return;
}
}

# 1 "./ardupilot.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./ardupilot.cil.c"
# 5 "ardupilot/ardupilot.c"
typedef unsigned short __uint16_t;
# 6 "ardupilot/ardupilot.c"
typedef int __int32_t;
# 7 "ardupilot/ardupilot.c"
typedef unsigned int __uint32_t;
# 8 "ardupilot/ardupilot.c"
typedef __int32_t int32_t;
# 10 "ardupilot/ardupilot.c"
typedef __uint16_t uint16_t;
# 11 "ardupilot/ardupilot.c"
typedef __uint32_t uint32_t;
# 13 "ardupilot/ardupilot.c"
typedef int32_t __po_hi_int32_t;
# 14 "ardupilot/ardupilot.c"
typedef uint16_t __po_hi_uint16_t;
# 15 "ardupilot/ardupilot.c"
typedef uint32_t __po_hi_uint32_t;
# 16 "ardupilot/ardupilot.c"
typedef __po_hi_int32_t __po_hi_port_id_t;
# 28 "ardupilot/ardupilot.c"
typedef float base_types__float;
# 29 "ardupilot/ardupilot.c"
typedef int base_types__integer;
# 30 "ardupilot/ardupilot.c"
struct __anonstruct_ardupilot_software__gps_position_i_992385987 {
   base_types__float latitude ;
   base_types__float longitude ;
   base_types__integer altitude ;
};
# 37 "ardupilot/ardupilot.c"
typedef struct __anonstruct_ardupilot_software__gps_position_i_992385987 ardupilot_software__gps_position_i;
# 38 "ardupilot/ardupilot.c"
enum __anonenum___po_hi_entity_t_376935921 {
    process_ardupilot_prs_gps_k_entity = 0,
    process_ardupilot_prs_mgmt_k_entity = 1,
    process_ardupilot_prs_throttle_k_entity = 2,
    process_ardupilot_prs_yaw_k_entity = 3,
    invalid_entity = -1
} ;
# 47 "ardupilot/ardupilot.c"
typedef enum __anonenum___po_hi_entity_t_376935921 __po_hi_entity_t;
# 48 "ardupilot/ardupilot.c"
enum __anonenum___po_hi_task_id_52239547 {
    process_ardupilot_prs_gps_k = 0,
    process_ardupilot_prs_mgmt_k = 1,
    process_ardupilot_prs_throttle_k = 2,
    process_ardupilot_prs_yaw_k = 3,
    invalid_task_id = -1
} ;
# 57 "ardupilot/ardupilot.c"
typedef enum __anonenum___po_hi_task_id_52239547 __po_hi_task_id;
# 58 "ardupilot/ardupilot.c"
enum __anonenum___po_hi_port_t_180433783 {
    prs_gps_global_gps_pos = 0,
    prs_mgmt_global_gps_pos = 1,
    prs_mgmt_global_speed = 2,
    prs_mgmt_global_angle = 3,
    prs_throttle_global_speed = 4,
    prs_yaw_global_angle = 5,
    invalid_port_t = -1
} ;
# 69 "ardupilot/ardupilot.c"
typedef enum __anonenum___po_hi_port_t_180433783 __po_hi_port_t;
# 70 "ardupilot/ardupilot.c"
enum __anonenum___po_hi_local_port_t_225976243 {
    prs_gps_local_gps_pos = 0,
    prs_mgmt_local_gps_pos = 0,
    prs_mgmt_local_speed = 1,
    prs_mgmt_local_angle = 2,
    prs_throttle_local_speed = 0,
    prs_yaw_local_angle = 0,
    invalid_local_port_t = -1
} ;
# 81 "ardupilot/ardupilot.c"
typedef enum __anonenum___po_hi_local_port_t_225976243 __po_hi_local_port_t;
# 82 "ardupilot/ardupilot.c"
struct __anonstruct_prs_gps_global_gps_pos_264840508 {
   ardupilot_software__gps_position_i prs_gps_global_gps_pos ;
};
# 87 "ardupilot/ardupilot.c"
struct __anonstruct_prs_mgmt_global_gps_pos_264840509 {
   ardupilot_software__gps_position_i prs_mgmt_global_gps_pos ;
};
# 92 "ardupilot/ardupilot.c"
struct __anonstruct_prs_mgmt_global_speed_143697260 {
   base_types__integer prs_mgmt_global_speed ;
};
# 97 "ardupilot/ardupilot.c"
struct __anonstruct_prs_mgmt_global_angle_143697261 {
   base_types__integer prs_mgmt_global_angle ;
};
# 102 "ardupilot/ardupilot.c"
struct __anonstruct_prs_throttle_global_speed_143697262 {
   base_types__integer prs_throttle_global_speed ;
};
# 107 "ardupilot/ardupilot.c"
struct __anonstruct_prs_yaw_global_angle_143697263 {
   base_types__integer prs_yaw_global_angle ;
};
# 112 "ardupilot/ardupilot.c"
union __anonunion_vars_32314306 {
   struct __anonstruct_prs_gps_global_gps_pos_264840508 prs_gps_global_gps_pos ;
   struct __anonstruct_prs_mgmt_global_gps_pos_264840509 prs_mgmt_global_gps_pos ;
   struct __anonstruct_prs_mgmt_global_speed_143697260 prs_mgmt_global_speed ;
   struct __anonstruct_prs_mgmt_global_angle_143697261 prs_mgmt_global_angle ;
   struct __anonstruct_prs_throttle_global_speed_143697262 prs_throttle_global_speed ;
   struct __anonstruct_prs_yaw_global_angle_143697263 prs_yaw_global_angle ;
};
# 122 "ardupilot/ardupilot.c"
struct __anonstruct___po_hi_request_t_838549377 {
   __po_hi_port_t port ;
   union __anonunion_vars_32314306 vars ;
};
# 128 "ardupilot/ardupilot.c"
typedef struct __anonstruct___po_hi_request_t_838549377 __po_hi_request_t;
# 151 "ardupilot/ardupilot.c"
struct __po_hi_sem_t ;
# 152 "ardupilot/ardupilot.c"
typedef struct __po_hi_sem_t __po_hi_sem_t;
# 153 "ardupilot/ardupilot.c"
struct __po_hi_sem_t {

};
# 172 "ardupilot/ardupilot.c"
void *prs_gps_job(void) ;
# 173 "ardupilot/ardupilot.c"
void prs_mgmt_deliver(__po_hi_request_t *request ) ;
# 174 "ardupilot/ardupilot.c"
void *prs_mgmt_job(void) ;
# 175 "ardupilot/ardupilot.c"
void prs_throttle_deliver(__po_hi_request_t *request ) ;
# 176 "ardupilot/ardupilot.c"
void *prs_throttle_job(void) ;
# 177 "ardupilot/ardupilot.c"
void prs_yaw_deliver(__po_hi_request_t *request ) ;
# 178 "ardupilot/ardupilot.c"
void *prs_yaw_job(void) ;
# 179 "ardupilot/ardupilot.c"
void __po_hi_main_deliver(__po_hi_request_t *request ) ;
# 188 "ardupilot/ardupilot.c"
extern int __po_hi_gqueue_next_value(__po_hi_task_id id , __po_hi_local_port_t port ) ;
# 189 "ardupilot/ardupilot.c"
extern int __po_hi_gqueue_get_count(__po_hi_task_id id , __po_hi_local_port_t port ) ;
# 197 "ardupilot/ardupilot.c"
extern __po_hi_port_id_t __po_hi_gqueue_store_in(__po_hi_task_id id , __po_hi_local_port_t port ,
                                                 __po_hi_request_t *request ) ;
# 207 "ardupilot/ardupilot.c"
extern __po_hi_port_id_t __po_hi_gqueue_get_port_size(__po_hi_task_id const id ,
                                                      __po_hi_local_port_t const port ) ;
# 208 "ardupilot/ardupilot.c"
extern __po_hi_port_id_t __po_hi_gqueue_used_size(__po_hi_task_id id , __po_hi_local_port_t port ) ;
# 212 "ardupilot/ardupilot.c"
extern void __po_hi_request_valid(__po_hi_request_t *OBJ ) ;
# 214 "ardupilot/ardupilot.c"
extern void ardupilot_software__spg_gps_simulation(ardupilot_software__gps_position_i *gps_pos ) ;
# 215 "ardupilot/ardupilot.c"
extern void ardupilot_software__spg_flt_mgmt_simulation(ardupilot_software__gps_position_i gps_pos ,
                                                        base_types__integer *speed ,
                                                        base_types__integer *angle ) ;
# 218 "ardupilot/ardupilot.c"
extern void ardupilot_software__spg_throttle_simulation(base_types__integer speed ) ;
# 219 "ardupilot/ardupilot.c"
extern void ardupilot_software__spg_yaw_simulation(base_types__integer angle ) ;
# 220 "ardupilot/ardupilot.c"
extern int __po_hi_wait_for_next_period(__po_hi_task_id task ) ;
# 221 "ardupilot/ardupilot.c"
extern int __po_hi_compute_next_period(__po_hi_task_id task ) ;
# 222 "ardupilot/ardupilot.c"
extern int __po_hi_wait_initialization(void) ;
# 223 "ardupilot/ardupilot.c"
extern __attribute__((__nothrow__, __noreturn__)) void ( __attribute__((__leaf__)) __assert_fail)(char const *__assertion ,
                                                                                                   char const *__file ,
                                                                                                   unsigned int __line ,
                                                                                                   char const *__function ) ;
# 232 "ardupilot/ardupilot.c"
extern int __po_hi_sem_wait_gqueue(__po_hi_sem_t *array , __po_hi_task_id id ) ;
# 233 "ardupilot/ardupilot.c"
extern int __po_hi_sem_mutex_wait_gqueue(__po_hi_sem_t *array , __po_hi_task_id id ) ;
# 235 "ardupilot/ardupilot.c"
extern int __po_hi_sem_mutex_release_gqueue(__po_hi_sem_t *array , __po_hi_task_id id ) ;
# 240 "ardupilot/ardupilot.c"
__po_hi_request_t **__po_hi_gqueues[4] ;
# 241 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_gqueues_nb_ports[4] ;
# 242 "ardupilot/ardupilot.c"
__po_hi_port_id_t *__po_hi_gqueues_sizes[4] ;
# 243 "ardupilot/ardupilot.c"
__po_hi_port_id_t *__po_hi_gqueues_used_size[4] ;
# 244 "ardupilot/ardupilot.c"
__po_hi_port_id_t *__po_hi_gqueues_offsets[4] ;
# 245 "ardupilot/ardupilot.c"
__po_hi_port_id_t *__po_hi_gqueues_woffsets[4] ;
# 246 "ardupilot/ardupilot.c"
__po_hi_port_id_t *__po_hi_gqueues_n_destinations[4] ;
# 247 "ardupilot/ardupilot.c"
__po_hi_port_t **__po_hi_gqueues_destinations[4] ;
# 248 "ardupilot/ardupilot.c"
__po_hi_uint32_t __po_hi_gqueues_total_fifo_size[4] ;
# 249 "ardupilot/ardupilot.c"
__po_hi_request_t **__po_hi_gqueues_most_recent_values[4] ;
# 250 "ardupilot/ardupilot.c"
__po_hi_port_id_t *__po_hi_gqueues_first[4] ;
# 251 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_gqueues_global_size[4] ;
# 252 "ardupilot/ardupilot.c"
__po_hi_local_port_t *__po_hi_gqueues_global_history[4] ;
# 253 "ardupilot/ardupilot.c"
__po_hi_uint32_t __po_hi_gqueues_global_history_offset[4] ;
# 254 "ardupilot/ardupilot.c"
__po_hi_uint32_t __po_hi_gqueues_global_history_woffset[4] ;
# 255 "ardupilot/ardupilot.c"
__po_hi_port_id_t *__po_hi_gqueues_port_is_empty[4] ;
# 256 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_gqueues_queue_is_empty[4] ;
# 257 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_gqueues_n_empty[4] ;
# 258 "ardupilot/ardupilot.c"
__po_hi_sem_t __po_hi_gqueues_semaphores[4] ;
# 901 "ardupilot/ardupilot.c"
__po_hi_port_t __po_hi_prs_gps_gps_pos_local_destinations[1] = { (__po_hi_port_t )1};
# 902 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_gps_woffsets[1] ;
# 903 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_gps_offsets[1] ;
# 904 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_gps_used_size[1] ;
# 905 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_gps_empties[1] ;
# 906 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_gps_first[1] ;
# 907 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_gps_recent[1] ;
# 908 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_gps_queue[0] ;
# 909 "ardupilot/ardupilot.c"
__po_hi_uint16_t __po_hi_prs_gps_total_fifo_size = (__po_hi_uint16_t )0;
# 910 "ardupilot/ardupilot.c"
__po_hi_local_port_t __po_hi_prs_gps_history[0] ;
# 911 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_gps_n_dest[1] = { 1};
# 912 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_gps_fifo_size[1] = { -2};
# 913 "ardupilot/ardupilot.c"
__po_hi_port_t *__po_hi_prs_gps_destinations[1] = { __po_hi_prs_gps_gps_pos_local_destinations};
# 914 "ardupilot/ardupilot.c"
__po_hi_request_t global_var ;
# 915 "ardupilot/ardupilot.c"
__po_hi_request_t global_req ;
# 916 "ardupilot/ardupilot.c"
base_types__integer speed_use ;
# 917 "ardupilot/ardupilot.c"
base_types__integer angle_use ;
# 918 "ardupilot/ardupilot.c"
static ardupilot_software__gps_position_i gps_pos_request_var ;
# 919 "ardupilot/ardupilot.c"
extern int __po_hi_send_output() ;
# 920 "ardupilot/ardupilot.c"
void *prs_gps_job(void)
{
  __po_hi_request_t *gps_pos_request ;
  __po_hi_int32_t error ;
  __po_hi_task_id id3 ;
  __po_hi_local_port_t port4 ;
  __po_hi_request_t *request5 ;
  __po_hi_request_t *ptr6 ;

  {
# 930 "ardupilot/ardupilot.c"
  __po_hi_wait_initialization();
# 931 "ardupilot/ardupilot.c"
  __po_hi_compute_next_period((__po_hi_task_id )0);
# 932 "ardupilot/ardupilot.c"
  __po_hi_wait_for_next_period((__po_hi_task_id )0);
# 933 "ardupilot/ardupilot.c"
  while (1) {
# 935 "ardupilot/ardupilot.c"
    ardupilot_software__spg_gps_simulation(& gps_pos_request_var);
# 938 "ardupilot/ardupilot.c"
    gps_pos_request = & global_var;
# 939 "ardupilot/ardupilot.c"
    gps_pos_request->vars.prs_gps_global_gps_pos.prs_gps_global_gps_pos = gps_pos_request_var;
# 940 "ardupilot/ardupilot.c"
    gps_pos_request->port = (__po_hi_port_t )0;
# 941 "ardupilot/ardupilot.c"
    id3 = (__po_hi_task_id )0;
# 942 "ardupilot/ardupilot.c"
    port4 = (__po_hi_local_port_t )0;
# 943 "ardupilot/ardupilot.c"
    request5 = gps_pos_request;
# 945 "ardupilot/ardupilot.c"
    __po_hi_request_valid(request5);
# 946 "ardupilot/ardupilot.c"
    request5->port = ptr6->port;
# 947 "ardupilot/ardupilot.c"
    *(__po_hi_gqueues_most_recent_values[id3] + (int )port4) = request5;
# 948 "ardupilot/ardupilot.c"
    goto Lret___po_hi_gqueue_store_out;
    Lret___po_hi_gqueue_store_out:
# 951 "ardupilot/ardupilot.c"
    error = __po_hi_send_output(0, 0);
# 952 "ardupilot/ardupilot.c"
    __po_hi_wait_for_next_period((__po_hi_task_id )0);
  }
}
}
# 957 "ardupilot/ardupilot.c"
__po_hi_port_t __po_hi_prs_mgmt_speed_local_destinations[1] = { (__po_hi_port_t )4};
# 958 "ardupilot/ardupilot.c"
__po_hi_port_t __po_hi_prs_mgmt_angle_local_destinations[1] = { (__po_hi_port_t )5};
# 959 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_mgmt_woffsets[3] ;
# 960 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_mgmt_offsets[3] ;
# 961 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_mgmt_used_size[3] ;
# 962 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_mgmt_empties[3] ;
# 963 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_mgmt_first[3] ;
# 964 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_mgmt_recent[3] ;
# 965 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_mgmt_queue[0] ;
# 966 "ardupilot/ardupilot.c"
__po_hi_uint16_t __po_hi_prs_mgmt_total_fifo_size = (__po_hi_uint16_t )0;
# 967 "ardupilot/ardupilot.c"
__po_hi_local_port_t __po_hi_prs_mgmt_history[0] ;
# 968 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_mgmt_n_dest[3] = { 0, 1, 1};
# 969 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_mgmt_fifo_size[3] = { -1, -2, -2};
# 970 "ardupilot/ardupilot.c"
__po_hi_port_t *__po_hi_prs_mgmt_destinations[3] = { (__po_hi_port_t *)((void *)0), __po_hi_prs_mgmt_speed_local_destinations, __po_hi_prs_mgmt_angle_local_destinations};
# 971 "ardupilot/ardupilot.c"
void prs_mgmt_deliver(__po_hi_request_t *request )
{


  {
# 976 "ardupilot/ardupilot.c"
  request = & global_var;
# 977 "ardupilot/ardupilot.c"
  switch ((int )request->port) {
  case 1:
# 979 "ardupilot/ardupilot.c"
  __po_hi_gqueue_store_in((__po_hi_task_id )1, (__po_hi_local_port_t )0, request);
# 980 "ardupilot/ardupilot.c"
  break;
  default:
# 982 "ardupilot/ardupilot.c"
  break;
  }
# 984 "ardupilot/ardupilot.c"
  return;
}
}
# 987 "ardupilot/ardupilot.c"
static base_types__integer speed_request_var ;
# 988 "ardupilot/ardupilot.c"
static base_types__integer angle_request_var ;
# 991 "ardupilot/ardupilot.c"
void *prs_mgmt_job(void)
{
  __po_hi_request_t *gps_pos_request ;
  __po_hi_request_t *speed_request ;
  __po_hi_request_t *angle_request ;
  __po_hi_int32_t error ;
  int tmp ;
  __po_hi_task_id id6 ;
  __po_hi_local_port_t port7 ;
  __po_hi_request_t **request8 ;
  int result9 ;
  int tmp10 ;
  int rel11 ;
  int tmp___112 ;
  __po_hi_port_id_t tmp___313 ;
  int res_sem14 ;
  int tmp___415 ;
  __po_hi_port_id_t tmp___616 ;
  __po_hi_port_id_t tmp___717 ;
  __po_hi_port_id_t tmp___818 ;
  int res19 ;
  int tmp___920 ;
  __po_hi_task_id id21 ;
  __po_hi_local_port_t port22 ;
  __po_hi_request_t *request23 ;
  __po_hi_request_t *ptr24 ;
  __po_hi_task_id id25 ;
  __po_hi_local_port_t port26 ;
  __po_hi_request_t *request27 ;
  __po_hi_request_t *ptr28 ;

  {
# 1023 "ardupilot/ardupilot.c"
  __po_hi_wait_initialization();
# 1024 "ardupilot/ardupilot.c"
  __po_hi_compute_next_period((__po_hi_task_id )1);
# 1025 "ardupilot/ardupilot.c"
  __po_hi_wait_for_next_period((__po_hi_task_id )1);
# 1026 "ardupilot/ardupilot.c"
  while (1) {
# 1027 "ardupilot/ardupilot.c"
    tmp = __po_hi_gqueue_get_count((__po_hi_task_id )1, (__po_hi_local_port_t )0);
# 1028 "ardupilot/ardupilot.c"
    if (tmp) {
# 1029 "ardupilot/ardupilot.c"
      id6 = (__po_hi_task_id )1;
# 1030 "ardupilot/ardupilot.c"
      port7 = (__po_hi_local_port_t )0;
# 1031 "ardupilot/ardupilot.c"
      request8 = & gps_pos_request;
# 1032 "ardupilot/ardupilot.c"
      tmp10 = __po_hi_sem_mutex_wait_gqueue(__po_hi_gqueues_semaphores, id6);
# 1033 "ardupilot/ardupilot.c"
      result9 = tmp10;
# 1034 "ardupilot/ardupilot.c"
      if (! (result9 == 1)) {
# 1035 "ardupilot/ardupilot.c"
        __assert_fail("result == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      891U, "__po_hi_gqueue_get_value");
      }
# 1038 "ardupilot/ardupilot.c"
      tmp___313 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id6, (__po_hi_local_port_t const )port7);
# 1039 "ardupilot/ardupilot.c"
      if (tmp___313 == -2) {
# 1040 "ardupilot/ardupilot.c"
        tmp___112 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id6);
# 1041 "ardupilot/ardupilot.c"
        rel11 = tmp___112;
# 1042 "ardupilot/ardupilot.c"
        if (! (rel11 == 1)) {
# 1043 "ardupilot/ardupilot.c"
          __assert_fail("rel == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                        905U, "__po_hi_gqueue_get_value");
        }
# 1046 "ardupilot/ardupilot.c"
        goto Lret___po_hi_gqueue_get_value;
      }
# 1048 "ardupilot/ardupilot.c"
      tmp___616 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id6, (__po_hi_local_port_t const )port7);
# 1049 "ardupilot/ardupilot.c"
      if (tmp___616 != -1) {
# 1050 "ardupilot/ardupilot.c"
        while (*(__po_hi_gqueues_port_is_empty[id6] + (int )port7) == 1) {
# 1051 "ardupilot/ardupilot.c"
          tmp___415 = __po_hi_sem_wait_gqueue(__po_hi_gqueues_semaphores, id6);
# 1052 "ardupilot/ardupilot.c"
          res_sem14 = tmp___415;
# 1053 "ardupilot/ardupilot.c"
          if (! (res_sem14 == 1)) {
# 1054 "ardupilot/ardupilot.c"
            __assert_fail("res_sem == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                          919U, "__po_hi_gqueue_get_value");
          }
        }
      }
# 1059 "ardupilot/ardupilot.c"
      tmp___717 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id6, (__po_hi_local_port_t const )port7);
# 1060 "ardupilot/ardupilot.c"
      if (tmp___717 == -1) {
# 1061 "ardupilot/ardupilot.c"
        tmp___818 = __po_hi_gqueue_used_size(id6, port7);
# 1062 "ardupilot/ardupilot.c"
        if (tmp___818 == 0) {
# 1063 "ardupilot/ardupilot.c"
          *request8 = *(__po_hi_gqueues_most_recent_values[id6] + (int )port7);
        } else {
# 1065 "ardupilot/ardupilot.c"
          *request8 = *((__po_hi_gqueues[id6] + *(__po_hi_gqueues_first[id6] + (int )port7)) + *(__po_hi_gqueues_offsets[id6] + (int )port7));
        }
      } else {
# 1068 "ardupilot/ardupilot.c"
        *request8 = *((__po_hi_gqueues[id6] + *(__po_hi_gqueues_first[id6] + (int )port7)) + *(__po_hi_gqueues_offsets[id6] + (int )port7));
      }
# 1070 "ardupilot/ardupilot.c"
      tmp___920 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id6);
# 1071 "ardupilot/ardupilot.c"
      res19 = tmp___920;
# 1072 "ardupilot/ardupilot.c"
      if (! (res19 == 1)) {
# 1073 "ardupilot/ardupilot.c"
        __assert_fail("res == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      960U, "__po_hi_gqueue_get_value");
      }
# 1076 "ardupilot/ardupilot.c"
      __po_hi_request_valid(*request8);
# 1077 "ardupilot/ardupilot.c"
      goto Lret___po_hi_gqueue_get_value;
      Lret___po_hi_gqueue_get_value:
# 1079 "ardupilot/ardupilot.c"
      __po_hi_gqueue_next_value((__po_hi_task_id )1, (__po_hi_local_port_t )0);
    }
# 1082 "ardupilot/ardupilot.c"
    ardupilot_software__spg_flt_mgmt_simulation(gps_pos_request->vars.prs_mgmt_global_gps_pos.prs_mgmt_global_gps_pos,
                                                & speed_request_var, & angle_request_var);
# 1084 "ardupilot/ardupilot.c"
    speed_request = & global_var;
# 1085 "ardupilot/ardupilot.c"
    speed_request->vars.prs_mgmt_global_speed.prs_mgmt_global_speed = speed_request_var;
# 1086 "ardupilot/ardupilot.c"
    speed_request->port = (__po_hi_port_t )2;
# 1087 "ardupilot/ardupilot.c"
    id21 = (__po_hi_task_id )1;
# 1088 "ardupilot/ardupilot.c"
    port22 = (__po_hi_local_port_t )1;
# 1089 "ardupilot/ardupilot.c"
    request23 = speed_request;
# 1091 "ardupilot/ardupilot.c"
    __po_hi_request_valid(request23);
# 1092 "ardupilot/ardupilot.c"
    request23->port = ptr24->port;
# 1093 "ardupilot/ardupilot.c"
    *(__po_hi_gqueues_most_recent_values[id21] + (int )port22) = request23;
# 1094 "ardupilot/ardupilot.c"
    goto Lret___po_hi_gqueue_store_out;
    Lret___po_hi_gqueue_store_out:
# 1097 "ardupilot/ardupilot.c"
    angle_request = & global_var;
# 1098 "ardupilot/ardupilot.c"
    angle_request->vars.prs_mgmt_global_angle.prs_mgmt_global_angle = angle_request_var;
# 1099 "ardupilot/ardupilot.c"
    angle_request->port = (__po_hi_port_t )3;
# 1100 "ardupilot/ardupilot.c"
    id25 = (__po_hi_task_id )1;
# 1101 "ardupilot/ardupilot.c"
    port26 = (__po_hi_local_port_t )2;
# 1102 "ardupilot/ardupilot.c"
    request27 = angle_request;
# 1104 "ardupilot/ardupilot.c"
    __po_hi_request_valid(request27);
# 1105 "ardupilot/ardupilot.c"
    request27->port = ptr28->port;
# 1106 "ardupilot/ardupilot.c"
    *(__po_hi_gqueues_most_recent_values[id25] + (int )port26) = request27;
# 1107 "ardupilot/ardupilot.c"
    goto Lret___po_hi_gqueue_store_out___0;
    Lret___po_hi_gqueue_store_out___0:
# 1110 "ardupilot/ardupilot.c"
    error = __po_hi_send_output(1, 2);
# 1111 "ardupilot/ardupilot.c"
    error = __po_hi_send_output(1, 3);
# 1112 "ardupilot/ardupilot.c"
    __po_hi_wait_for_next_period((__po_hi_task_id )1);
  }
}
}
# 1117 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_throttle_woffsets[1] ;
# 1118 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_throttle_offsets[1] ;
# 1119 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_throttle_used_size[1] ;
# 1120 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_throttle_empties[1] ;
# 1121 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_throttle_first[1] ;
# 1122 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_throttle_recent[1] ;
# 1123 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_throttle_queue[0] ;
# 1124 "ardupilot/ardupilot.c"
__po_hi_uint16_t __po_hi_prs_throttle_total_fifo_size = (__po_hi_uint16_t )0;
# 1125 "ardupilot/ardupilot.c"
__po_hi_local_port_t __po_hi_prs_throttle_history[0] ;
# 1126 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_throttle_n_dest[1] = { 0};
# 1127 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_throttle_fifo_size[1] = { -1};
# 1128 "ardupilot/ardupilot.c"
__po_hi_port_t *__po_hi_prs_throttle_destinations[1] = { (__po_hi_port_t *)((void *)0)};
# 1129 "ardupilot/ardupilot.c"
void prs_throttle_deliver(__po_hi_request_t *request )
{


  {
# 1134 "ardupilot/ardupilot.c"
  request = & global_var;
# 1135 "ardupilot/ardupilot.c"
  switch ((int )request->port) {
  case 4:
# 1137 "ardupilot/ardupilot.c"
  __po_hi_gqueue_store_in((__po_hi_task_id )2, (__po_hi_local_port_t )0, request);
# 1138 "ardupilot/ardupilot.c"
  break;
  default:
# 1140 "ardupilot/ardupilot.c"
  break;
  }
# 1142 "ardupilot/ardupilot.c"
  return;
}
}
# 1145 "ardupilot/ardupilot.c"
void *prs_throttle_job(void)
{
  __po_hi_request_t *speed_request ;
  __po_hi_request_t *gps_pos_request ;
  int tmp ;
  __po_hi_task_id id3 ;
  __po_hi_local_port_t port4 ;
  __po_hi_request_t **request5 ;
  int result6 ;
  int tmp7 ;
  int rel8 ;
  int tmp___19 ;
  __po_hi_port_id_t tmp___310 ;
  int res_sem11 ;
  int tmp___412 ;
  __po_hi_port_id_t tmp___613 ;
  __po_hi_port_id_t tmp___714 ;
  __po_hi_port_id_t tmp___815 ;
  int res16 ;
  int tmp___917 ;

  {
# 1167 "ardupilot/ardupilot.c"
  speed_request = & global_var;
# 1168 "ardupilot/ardupilot.c"
  __po_hi_wait_initialization();
# 1169 "ardupilot/ardupilot.c"
  __po_hi_compute_next_period((__po_hi_task_id )2);
# 1170 "ardupilot/ardupilot.c"
  __po_hi_wait_for_next_period((__po_hi_task_id )2);
# 1171 "ardupilot/ardupilot.c"
  while (1) {
# 1172 "ardupilot/ardupilot.c"
    tmp = __po_hi_gqueue_get_count((__po_hi_task_id )2, (__po_hi_local_port_t )0);
# 1173 "ardupilot/ardupilot.c"
    if (tmp) {
# 1174 "ardupilot/ardupilot.c"
      id3 = (__po_hi_task_id )2;
# 1175 "ardupilot/ardupilot.c"
      port4 = (__po_hi_local_port_t )0;
# 1176 "ardupilot/ardupilot.c"
      request5 = & speed_request;
# 1177 "ardupilot/ardupilot.c"
      tmp7 = __po_hi_sem_mutex_wait_gqueue(__po_hi_gqueues_semaphores, id3);
# 1178 "ardupilot/ardupilot.c"
      result6 = tmp7;
# 1179 "ardupilot/ardupilot.c"
      if (! (result6 == 1)) {
# 1180 "ardupilot/ardupilot.c"
        __assert_fail("result == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      891U, "__po_hi_gqueue_get_value");
      }
# 1183 "ardupilot/ardupilot.c"
      tmp___310 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id3, (__po_hi_local_port_t const )port4);
# 1184 "ardupilot/ardupilot.c"
      if (tmp___310 == -2) {
# 1185 "ardupilot/ardupilot.c"
        tmp___19 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id3);
# 1186 "ardupilot/ardupilot.c"
        rel8 = tmp___19;
# 1187 "ardupilot/ardupilot.c"
        if (! (rel8 == 1)) {
# 1188 "ardupilot/ardupilot.c"
          __assert_fail("rel == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                        905U, "__po_hi_gqueue_get_value");
        }
# 1191 "ardupilot/ardupilot.c"
        goto Lret___po_hi_gqueue_get_value;
      }
# 1193 "ardupilot/ardupilot.c"
      tmp___613 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id3, (__po_hi_local_port_t const )port4);
# 1194 "ardupilot/ardupilot.c"
      if (tmp___613 != -1) {
# 1195 "ardupilot/ardupilot.c"
        while (*(__po_hi_gqueues_port_is_empty[id3] + (int )port4) == 1) {
# 1196 "ardupilot/ardupilot.c"
          tmp___412 = __po_hi_sem_wait_gqueue(__po_hi_gqueues_semaphores, id3);
# 1197 "ardupilot/ardupilot.c"
          res_sem11 = tmp___412;
# 1198 "ardupilot/ardupilot.c"
          if (! (res_sem11 == 1)) {
# 1199 "ardupilot/ardupilot.c"
            __assert_fail("res_sem == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                          919U, "__po_hi_gqueue_get_value");
          }
        }
      }
# 1204 "ardupilot/ardupilot.c"
      tmp___714 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id3, (__po_hi_local_port_t const )port4);
# 1205 "ardupilot/ardupilot.c"
      if (tmp___714 == -1) {
# 1206 "ardupilot/ardupilot.c"
        tmp___815 = __po_hi_gqueue_used_size(id3, port4);
# 1207 "ardupilot/ardupilot.c"
        if (tmp___815 == 0) {
# 1208 "ardupilot/ardupilot.c"
          *request5 = *(__po_hi_gqueues_most_recent_values[id3] + (int )port4);
        } else {
# 1210 "ardupilot/ardupilot.c"
          *request5 = *((__po_hi_gqueues[id3] + *(__po_hi_gqueues_first[id3] + (int )port4)) + *(__po_hi_gqueues_offsets[id3] + (int )port4));
        }
      } else {
# 1213 "ardupilot/ardupilot.c"
        *request5 = *((__po_hi_gqueues[id3] + *(__po_hi_gqueues_first[id3] + (int )port4)) + *(__po_hi_gqueues_offsets[id3] + (int )port4));
      }
# 1215 "ardupilot/ardupilot.c"
      tmp___917 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id3);
# 1216 "ardupilot/ardupilot.c"
      res16 = tmp___917;
# 1217 "ardupilot/ardupilot.c"
      if (! (res16 == 1)) {
# 1218 "ardupilot/ardupilot.c"
        __assert_fail("res == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      960U, "__po_hi_gqueue_get_value");
      }
# 1221 "ardupilot/ardupilot.c"
      __po_hi_request_valid(*request5);
# 1222 "ardupilot/ardupilot.c"
      goto Lret___po_hi_gqueue_get_value;
      Lret___po_hi_gqueue_get_value:
# 1224 "ardupilot/ardupilot.c"
      __po_hi_gqueue_next_value((__po_hi_task_id )2, (__po_hi_local_port_t )0);
    }
# 1227 "ardupilot/ardupilot.c"
    gps_pos_request = & global_var;
# 1228 "ardupilot/ardupilot.c"
    gps_pos_request->vars.prs_gps_global_gps_pos.prs_gps_global_gps_pos = gps_pos_request_var;
# 1231 "ardupilot/ardupilot.c"
    ardupilot_software__spg_throttle_simulation(speed_request->vars.prs_throttle_global_speed.prs_throttle_global_speed);
# 1232 "ardupilot/ardupilot.c"
    __po_hi_wait_for_next_period((__po_hi_task_id )2);
  }
}
}
# 1236 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_yaw_woffsets[1] ;
# 1237 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_yaw_offsets[1] ;
# 1238 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_yaw_used_size[1] ;
# 1239 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_yaw_empties[1] ;
# 1240 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_yaw_first[1] ;
# 1241 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_yaw_recent[1] ;
# 1242 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_yaw_queue[0] ;
# 1243 "ardupilot/ardupilot.c"
__po_hi_uint16_t __po_hi_prs_yaw_total_fifo_size = (__po_hi_uint16_t )0;
# 1244 "ardupilot/ardupilot.c"
__po_hi_local_port_t __po_hi_prs_yaw_history[0] ;
# 1245 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_yaw_n_dest[1] = { 0};
# 1246 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_yaw_fifo_size[1] = { -1};
# 1247 "ardupilot/ardupilot.c"
__po_hi_port_t *__po_hi_prs_yaw_destinations[1] = { (__po_hi_port_t *)((void *)0)};
# 1248 "ardupilot/ardupilot.c"
void prs_yaw_deliver(__po_hi_request_t *request )
{
  __po_hi_port_t p2 ;

  {
# 1253 "ardupilot/ardupilot.c"
  p2 = request->port;
# 1254 "ardupilot/ardupilot.c"
  switch ((int )request->port) {
  case 5:
# 1256 "ardupilot/ardupilot.c"
  __po_hi_gqueue_store_in((__po_hi_task_id )3, (__po_hi_local_port_t )0, request);
# 1257 "ardupilot/ardupilot.c"
  break;
  default:
# 1259 "ardupilot/ardupilot.c"
  break;
  }
# 1261 "ardupilot/ardupilot.c"
  return;
}
}
# 1264 "ardupilot/ardupilot.c"
void *prs_yaw_job(void)
{
  __po_hi_request_t *angle_request ;
  __po_hi_request_t *gps_pos_request ;
  int tmp ;
  __po_hi_task_id id3 ;
  __po_hi_local_port_t port4 ;
  __po_hi_request_t **request5 ;
  int result6 ;
  int tmp7 ;
  int rel8 ;
  int tmp___19 ;
  __po_hi_port_id_t tmp___310 ;
  int res_sem11 ;
  int tmp___412 ;
  __po_hi_port_id_t tmp___613 ;
  __po_hi_port_id_t tmp___714 ;
  __po_hi_port_id_t tmp___815 ;
  int res16 ;
  int tmp___917 ;

  {
# 1286 "ardupilot/ardupilot.c"
  angle_request = & global_var;
# 1287 "ardupilot/ardupilot.c"
  __po_hi_wait_initialization();
# 1288 "ardupilot/ardupilot.c"
  __po_hi_compute_next_period((__po_hi_task_id )3);
# 1289 "ardupilot/ardupilot.c"
  __po_hi_wait_for_next_period((__po_hi_task_id )3);
# 1290 "ardupilot/ardupilot.c"
  while (1) {
# 1291 "ardupilot/ardupilot.c"
    tmp = __po_hi_gqueue_get_count((__po_hi_task_id )3, (__po_hi_local_port_t )0);
# 1292 "ardupilot/ardupilot.c"
    if (tmp) {
# 1293 "ardupilot/ardupilot.c"
      id3 = (__po_hi_task_id )3;
# 1294 "ardupilot/ardupilot.c"
      port4 = (__po_hi_local_port_t )0;
# 1295 "ardupilot/ardupilot.c"
      request5 = & angle_request;
# 1297 "ardupilot/ardupilot.c"
      tmp7 = __po_hi_sem_mutex_wait_gqueue(__po_hi_gqueues_semaphores, id3);
# 1298 "ardupilot/ardupilot.c"
      result6 = tmp7;
# 1299 "ardupilot/ardupilot.c"
      if (! (result6 == 1)) {
# 1300 "ardupilot/ardupilot.c"
        __assert_fail("result == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      891U, "__po_hi_gqueue_get_value");
      }
# 1303 "ardupilot/ardupilot.c"
      tmp___310 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id3, (__po_hi_local_port_t const )port4);
# 1304 "ardupilot/ardupilot.c"
      if (tmp___310 == -2) {
# 1305 "ardupilot/ardupilot.c"
        tmp___19 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id3);
# 1306 "ardupilot/ardupilot.c"
        rel8 = tmp___19;
# 1307 "ardupilot/ardupilot.c"
        if (! (rel8 == 1)) {
# 1308 "ardupilot/ardupilot.c"
          __assert_fail("rel == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                        905U, "__po_hi_gqueue_get_value");
        }
# 1311 "ardupilot/ardupilot.c"
        goto Lret___po_hi_gqueue_get_value;
      }
# 1313 "ardupilot/ardupilot.c"
      tmp___613 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id3, (__po_hi_local_port_t const )port4);
# 1314 "ardupilot/ardupilot.c"
      if (tmp___613 != -1) {
# 1315 "ardupilot/ardupilot.c"
        while (*(__po_hi_gqueues_port_is_empty[id3] + (int )port4) == 1) {
# 1316 "ardupilot/ardupilot.c"
          tmp___412 = __po_hi_sem_wait_gqueue(__po_hi_gqueues_semaphores, id3);
# 1317 "ardupilot/ardupilot.c"
          res_sem11 = tmp___412;
# 1318 "ardupilot/ardupilot.c"
          if (! (res_sem11 == 1)) {
# 1319 "ardupilot/ardupilot.c"
            __assert_fail("res_sem == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                          919U, "__po_hi_gqueue_get_value");
          }
        }
      }
# 1324 "ardupilot/ardupilot.c"
      tmp___714 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id3, (__po_hi_local_port_t const )port4);
# 1325 "ardupilot/ardupilot.c"
      if (tmp___714 == -1) {
# 1326 "ardupilot/ardupilot.c"
        tmp___815 = __po_hi_gqueue_used_size(id3, port4);
# 1327 "ardupilot/ardupilot.c"
        if (tmp___815 == 0) {
# 1328 "ardupilot/ardupilot.c"
          *request5 = *(__po_hi_gqueues_most_recent_values[id3] + (int )port4);
        } else {
# 1330 "ardupilot/ardupilot.c"
          *request5 = *((__po_hi_gqueues[id3] + *(__po_hi_gqueues_first[id3] + (int )port4)) + *(__po_hi_gqueues_offsets[id3] + (int )port4));
        }
      } else {
# 1333 "ardupilot/ardupilot.c"
        *request5 = *((__po_hi_gqueues[id3] + *(__po_hi_gqueues_first[id3] + (int )port4)) + *(__po_hi_gqueues_offsets[id3] + (int )port4));
      }
# 1335 "ardupilot/ardupilot.c"
      tmp___917 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id3);
# 1336 "ardupilot/ardupilot.c"
      res16 = tmp___917;
# 1337 "ardupilot/ardupilot.c"
      if (! (res16 == 1)) {
# 1338 "ardupilot/ardupilot.c"
        __assert_fail("res == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      960U, "__po_hi_gqueue_get_value");
      }
# 1341 "ardupilot/ardupilot.c"
      __po_hi_request_valid(*request5);
# 1342 "ardupilot/ardupilot.c"
      goto Lret___po_hi_gqueue_get_value;
      Lret___po_hi_gqueue_get_value:
# 1344 "ardupilot/ardupilot.c"
      __po_hi_gqueue_next_value((__po_hi_task_id )3, (__po_hi_local_port_t )0);
    }
# 1346 "ardupilot/ardupilot.c"
    gps_pos_request = & global_var;
# 1347 "ardupilot/ardupilot.c"
    gps_pos_request->vars.prs_gps_global_gps_pos.prs_gps_global_gps_pos = gps_pos_request_var;
# 1349 "ardupilot/ardupilot.c"
    ardupilot_software__spg_yaw_simulation(angle_request->vars.prs_yaw_global_angle.prs_yaw_global_angle);
# 1350 "ardupilot/ardupilot.c"
    __po_hi_wait_for_next_period((__po_hi_task_id )3);
  }
}
}
# 1354 "ardupilot/ardupilot.c"
extern int __po_hi_get_entity_from_global_port() ;
# 1355 "ardupilot/ardupilot.c"
void __po_hi_main_deliver(__po_hi_request_t *request )
{
  __po_hi_entity_t entity ;
  __po_hi_port_t p1 ;
  int tmp ;

  {
# 1362 "ardupilot/ardupilot.c"
  request = & global_var;
# 1363 "ardupilot/ardupilot.c"
  p1 = request->port;
# 1364 "ardupilot/ardupilot.c"
  tmp = __po_hi_get_entity_from_global_port((int )request->port);
# 1365 "ardupilot/ardupilot.c"
  entity = (__po_hi_entity_t )tmp;
# 1366 "ardupilot/ardupilot.c"
  switch ((int )entity) {
  case 1:
# 1368 "ardupilot/ardupilot.c"
  prs_mgmt_deliver(request);
# 1369 "ardupilot/ardupilot.c"
  break;
  case 2:
# 1371 "ardupilot/ardupilot.c"
  prs_throttle_deliver(request);
# 1372 "ardupilot/ardupilot.c"
  break;
  case 3:
# 1374 "ardupilot/ardupilot.c"
  prs_yaw_deliver(request);
# 1375 "ardupilot/ardupilot.c"
  break;
  default:
# 1377 "ardupilot/ardupilot.c"
  break;
  }
# 1379 "ardupilot/ardupilot.c"
  return;
}
}
# 1382 "ardupilot/ardupilot.c"
extern int create_task() ;
# 1383 "ardupilot/ardupilot.c"
void main(void)
{


  {
# 1386 "ardupilot/ardupilot.c"
  create_task("prs_throttle_job", "prs_throttle_job", 2, 1000, 5.0);
# 1387 "ardupilot/ardupilot.c"
  create_task("prs_gps_job", "prs_gps_job", 4, 1000, 5.0);
# 1388 "ardupilot/ardupilot.c"
  create_task("prs_mgmt_job", "prs_mgmt_job", 3, 1000, 5.0);
# 1389 "ardupilot/ardupilot.c"
  create_task("prs_yaw_job", "prs_yaw_job", 1, 1000, 5.0);
# 1390 "ardupilot/ardupilot.c"
  return;
}
}

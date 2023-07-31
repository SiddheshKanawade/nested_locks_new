/* Generated by CIL v. 1.7.3 */
/* print_CIL_Input is true */

#line 5 "ardupilot/ardupilot.c"
typedef unsigned short __uint16_t;
#line 6 "ardupilot/ardupilot.c"
typedef int __int32_t;
#line 7 "ardupilot/ardupilot.c"
typedef unsigned int __uint32_t;
#line 8 "ardupilot/ardupilot.c"
typedef __int32_t int32_t;
#line 10 "ardupilot/ardupilot.c"
typedef __uint16_t uint16_t;
#line 11 "ardupilot/ardupilot.c"
typedef __uint32_t uint32_t;
#line 13 "ardupilot/ardupilot.c"
typedef int32_t __po_hi_int32_t;
#line 14 "ardupilot/ardupilot.c"
typedef uint16_t __po_hi_uint16_t;
#line 15 "ardupilot/ardupilot.c"
typedef uint32_t __po_hi_uint32_t;
#line 16 "ardupilot/ardupilot.c"
typedef __po_hi_int32_t __po_hi_port_id_t;
#line 28 "ardupilot/ardupilot.c"
typedef float base_types__float;
#line 29 "ardupilot/ardupilot.c"
typedef int base_types__integer;
#line 30 "ardupilot/ardupilot.c"
struct __anonstruct_ardupilot_software__gps_position_i_992385987 {
   base_types__float latitude ;
   base_types__float longitude ;
   base_types__integer altitude ;
};
#line 37 "ardupilot/ardupilot.c"
typedef struct __anonstruct_ardupilot_software__gps_position_i_992385987 ardupilot_software__gps_position_i;
#line 38
enum __anonenum___po_hi_entity_t_376935921 {
    process_ardupilot_prs_gps_k_entity = 0,
    process_ardupilot_prs_mgmt_k_entity = 1,
    process_ardupilot_prs_throttle_k_entity = 2,
    process_ardupilot_prs_yaw_k_entity = 3,
    invalid_entity = -1
} ;
#line 47 "ardupilot/ardupilot.c"
typedef enum __anonenum___po_hi_entity_t_376935921 __po_hi_entity_t;
#line 48
enum __anonenum___po_hi_task_id_52239547 {
    process_ardupilot_prs_gps_k = 0,
    process_ardupilot_prs_mgmt_k = 1,
    process_ardupilot_prs_throttle_k = 2,
    process_ardupilot_prs_yaw_k = 3,
    invalid_task_id = -1
} ;
#line 57 "ardupilot/ardupilot.c"
typedef enum __anonenum___po_hi_task_id_52239547 __po_hi_task_id;
#line 58
enum __anonenum___po_hi_port_t_180433783 {
    prs_gps_global_gps_pos = 0,
    prs_mgmt_global_gps_pos = 1,
    prs_mgmt_global_speed = 2,
    prs_mgmt_global_angle = 3,
    prs_throttle_global_speed = 4,
    prs_yaw_global_angle = 5,
    invalid_port_t = -1
} ;
#line 69 "ardupilot/ardupilot.c"
typedef enum __anonenum___po_hi_port_t_180433783 __po_hi_port_t;
#line 70
enum __anonenum___po_hi_local_port_t_225976243 {
    prs_gps_local_gps_pos = 0,
    prs_mgmt_local_gps_pos = 0,
    prs_mgmt_local_speed = 1,
    prs_mgmt_local_angle = 2,
    prs_throttle_local_speed = 0,
    prs_yaw_local_angle = 0,
    invalid_local_port_t = -1
} ;
#line 81 "ardupilot/ardupilot.c"
typedef enum __anonenum___po_hi_local_port_t_225976243 __po_hi_local_port_t;
#line 82 "ardupilot/ardupilot.c"
struct __anonstruct_prs_gps_global_gps_pos_264840508 {
   ardupilot_software__gps_position_i prs_gps_global_gps_pos ;
};
#line 87 "ardupilot/ardupilot.c"
struct __anonstruct_prs_mgmt_global_gps_pos_264840509 {
   ardupilot_software__gps_position_i prs_mgmt_global_gps_pos ;
};
#line 92 "ardupilot/ardupilot.c"
struct __anonstruct_prs_mgmt_global_speed_143697260 {
   base_types__integer prs_mgmt_global_speed ;
};
#line 97 "ardupilot/ardupilot.c"
struct __anonstruct_prs_mgmt_global_angle_143697261 {
   base_types__integer prs_mgmt_global_angle ;
};
#line 102 "ardupilot/ardupilot.c"
struct __anonstruct_prs_throttle_global_speed_143697262 {
   base_types__integer prs_throttle_global_speed ;
};
#line 107 "ardupilot/ardupilot.c"
struct __anonstruct_prs_yaw_global_angle_143697263 {
   base_types__integer prs_yaw_global_angle ;
};
#line 112 "ardupilot/ardupilot.c"
union __anonunion_vars_32314306 {
   struct __anonstruct_prs_gps_global_gps_pos_264840508 prs_gps_global_gps_pos ;
   struct __anonstruct_prs_mgmt_global_gps_pos_264840509 prs_mgmt_global_gps_pos ;
   struct __anonstruct_prs_mgmt_global_speed_143697260 prs_mgmt_global_speed ;
   struct __anonstruct_prs_mgmt_global_angle_143697261 prs_mgmt_global_angle ;
   struct __anonstruct_prs_throttle_global_speed_143697262 prs_throttle_global_speed ;
   struct __anonstruct_prs_yaw_global_angle_143697263 prs_yaw_global_angle ;
};
#line 122 "ardupilot/ardupilot.c"
struct __anonstruct___po_hi_request_t_838549377 {
   __po_hi_port_t port ;
   union __anonunion_vars_32314306 vars ;
};
#line 128 "ardupilot/ardupilot.c"
typedef struct __anonstruct___po_hi_request_t_838549377 __po_hi_request_t;
#line 151
struct __po_hi_sem_t ;
#line 152 "ardupilot/ardupilot.c"
typedef struct __po_hi_sem_t __po_hi_sem_t;
#line 153 "ardupilot/ardupilot.c"
struct __po_hi_sem_t {

};
#line 172
void *prs_gps_job(void) ;
#line 173
void prs_mgmt_deliver(__po_hi_request_t *request ) ;
#line 174
void *prs_mgmt_job(void) ;
#line 175
void prs_throttle_deliver(__po_hi_request_t *request ) ;
#line 176
void *prs_throttle_job(void) ;
#line 177
void prs_yaw_deliver(__po_hi_request_t *request ) ;
#line 178
void *prs_yaw_job(void) ;
#line 179
void __po_hi_main_deliver(__po_hi_request_t *request ) ;
#line 188
extern int __po_hi_gqueue_next_value(__po_hi_task_id id , __po_hi_local_port_t port ) ;
#line 189
extern int __po_hi_gqueue_get_count(__po_hi_task_id id , __po_hi_local_port_t port ) ;
#line 197
extern __po_hi_port_id_t __po_hi_gqueue_store_in(__po_hi_task_id id , __po_hi_local_port_t port ,
                                                 __po_hi_request_t *request ) ;
#line 207
extern __po_hi_port_id_t __po_hi_gqueue_get_port_size(__po_hi_task_id const   id ,
                                                      __po_hi_local_port_t const   port ) ;
#line 208
extern __po_hi_port_id_t __po_hi_gqueue_used_size(__po_hi_task_id id , __po_hi_local_port_t port ) ;
#line 212
extern void __po_hi_request_valid(__po_hi_request_t *OBJ ) ;
#line 214
extern void ardupilot_software__spg_gps_simulation(ardupilot_software__gps_position_i *gps_pos ) ;
#line 215
extern void ardupilot_software__spg_flt_mgmt_simulation(ardupilot_software__gps_position_i gps_pos ,
                                                        base_types__integer *speed ,
                                                        base_types__integer *angle ) ;
#line 218
extern void ardupilot_software__spg_throttle_simulation(base_types__integer speed ) ;
#line 219
extern void ardupilot_software__spg_yaw_simulation(base_types__integer angle ) ;
#line 220
extern int __po_hi_wait_for_next_period(__po_hi_task_id task ) ;
#line 221
extern int __po_hi_compute_next_period(__po_hi_task_id task ) ;
#line 222
extern int __po_hi_wait_initialization(void) ;
#line 223
extern  __attribute__((__nothrow__, __noreturn__)) void ( __attribute__((__leaf__)) __assert_fail)(char const   *__assertion ,
                                                                                                   char const   *__file ,
                                                                                                   unsigned int __line ,
                                                                                                   char const   *__function ) ;
#line 232
extern int __po_hi_sem_wait_gqueue(__po_hi_sem_t *array , __po_hi_task_id id ) ;
#line 233
extern int __po_hi_sem_mutex_wait_gqueue(__po_hi_sem_t *array , __po_hi_task_id id ) ;
#line 235
extern int __po_hi_sem_mutex_release_gqueue(__po_hi_sem_t *array , __po_hi_task_id id ) ;
#line 240 "ardupilot/ardupilot.c"
__po_hi_request_t **__po_hi_gqueues[4]  ;
#line 241 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_gqueues_nb_ports[4]  ;
#line 242 "ardupilot/ardupilot.c"
__po_hi_port_id_t *__po_hi_gqueues_sizes[4]  ;
#line 243 "ardupilot/ardupilot.c"
__po_hi_port_id_t *__po_hi_gqueues_used_size[4]  ;
#line 244 "ardupilot/ardupilot.c"
__po_hi_port_id_t *__po_hi_gqueues_offsets[4]  ;
#line 245 "ardupilot/ardupilot.c"
__po_hi_port_id_t *__po_hi_gqueues_woffsets[4]  ;
#line 246 "ardupilot/ardupilot.c"
__po_hi_port_id_t *__po_hi_gqueues_n_destinations[4]  ;
#line 247 "ardupilot/ardupilot.c"
__po_hi_port_t **__po_hi_gqueues_destinations[4]  ;
#line 248 "ardupilot/ardupilot.c"
__po_hi_uint32_t __po_hi_gqueues_total_fifo_size[4]  ;
#line 249 "ardupilot/ardupilot.c"
__po_hi_request_t **__po_hi_gqueues_most_recent_values[4]  ;
#line 250 "ardupilot/ardupilot.c"
__po_hi_port_id_t *__po_hi_gqueues_first[4]  ;
#line 251 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_gqueues_global_size[4]  ;
#line 252 "ardupilot/ardupilot.c"
__po_hi_local_port_t *__po_hi_gqueues_global_history[4]  ;
#line 253 "ardupilot/ardupilot.c"
__po_hi_uint32_t __po_hi_gqueues_global_history_offset[4]  ;
#line 254 "ardupilot/ardupilot.c"
__po_hi_uint32_t __po_hi_gqueues_global_history_woffset[4]  ;
#line 255 "ardupilot/ardupilot.c"
__po_hi_port_id_t *__po_hi_gqueues_port_is_empty[4]  ;
#line 256 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_gqueues_queue_is_empty[4]  ;
#line 257 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_gqueues_n_empty[4]  ;
#line 258 "ardupilot/ardupilot.c"
__po_hi_sem_t __po_hi_gqueues_semaphores[4]  ;
#line 901 "ardupilot/ardupilot.c"
__po_hi_port_t __po_hi_prs_gps_gps_pos_local_destinations[1]  = {      (__po_hi_port_t )1};
#line 902 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_gps_woffsets[1]  ;
#line 903 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_gps_offsets[1]  ;
#line 904 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_gps_used_size[1]  ;
#line 905 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_gps_empties[1]  ;
#line 906 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_gps_first[1]  ;
#line 907 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_gps_recent[1]  ;
#line 908 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_gps_queue[0]  ;
#line 909 "ardupilot/ardupilot.c"
__po_hi_uint16_t __po_hi_prs_gps_total_fifo_size  =    (__po_hi_uint16_t )0;
#line 910 "ardupilot/ardupilot.c"
__po_hi_local_port_t __po_hi_prs_gps_history[0]  ;
#line 911 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_gps_n_dest[1]  = {      1};
#line 912 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_gps_fifo_size[1]  = {      -2};
#line 913 "ardupilot/ardupilot.c"
__po_hi_port_t *__po_hi_prs_gps_destinations[1]  = {      __po_hi_prs_gps_gps_pos_local_destinations};
#line 914 "ardupilot/ardupilot.c"
__po_hi_request_t global_var  ;
#line 915 "ardupilot/ardupilot.c"
__po_hi_request_t global_req  ;
#line 916 "ardupilot/ardupilot.c"
base_types__integer speed_use  ;
#line 917 "ardupilot/ardupilot.c"
base_types__integer angle_use  ;
#line 918 "ardupilot/ardupilot.c"
static ardupilot_software__gps_position_i gps_pos_request_var  ;
#line 919
extern int __po_hi_send_output() ;
#line 920 "ardupilot/ardupilot.c"
void *prs_gps_job(void) 
{ 
  __po_hi_request_t *gps_pos_request ;
  __po_hi_int32_t error ;
  __po_hi_task_id id3 ;
  __po_hi_local_port_t port4 ;
  __po_hi_request_t *request5 ;
  __po_hi_request_t *ptr6 ;

  {
#line 930
  __po_hi_wait_initialization();
#line 931
  __po_hi_compute_next_period((__po_hi_task_id )0);
#line 932
  __po_hi_wait_for_next_period((__po_hi_task_id )0);
#line 933
  while (1) {
#line 935
    ardupilot_software__spg_gps_simulation(& gps_pos_request_var);
#line 938
    gps_pos_request = & global_var;
#line 939
    gps_pos_request->vars.prs_gps_global_gps_pos.prs_gps_global_gps_pos = gps_pos_request_var;
#line 940
    gps_pos_request->port = (__po_hi_port_t )0;
#line 941
    id3 = (__po_hi_task_id )0;
#line 942
    port4 = (__po_hi_local_port_t )0;
#line 943
    request5 = gps_pos_request;
#line 945
    __po_hi_request_valid(request5);
#line 946
    request5->port = ptr6->port;
#line 947
    *(__po_hi_gqueues_most_recent_values[id3] + (int )port4) = request5;
#line 948
    goto Lret___po_hi_gqueue_store_out;
    Lret___po_hi_gqueue_store_out: 
#line 951
    error = __po_hi_send_output(0, 0);
#line 952
    __po_hi_wait_for_next_period((__po_hi_task_id )0);
  }
}
}
#line 957 "ardupilot/ardupilot.c"
__po_hi_port_t __po_hi_prs_mgmt_speed_local_destinations[1]  = {      (__po_hi_port_t )4};
#line 958 "ardupilot/ardupilot.c"
__po_hi_port_t __po_hi_prs_mgmt_angle_local_destinations[1]  = {      (__po_hi_port_t )5};
#line 959 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_mgmt_woffsets[3]  ;
#line 960 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_mgmt_offsets[3]  ;
#line 961 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_mgmt_used_size[3]  ;
#line 962 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_mgmt_empties[3]  ;
#line 963 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_mgmt_first[3]  ;
#line 964 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_mgmt_recent[3]  ;
#line 965 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_mgmt_queue[0]  ;
#line 966 "ardupilot/ardupilot.c"
__po_hi_uint16_t __po_hi_prs_mgmt_total_fifo_size  =    (__po_hi_uint16_t )0;
#line 967 "ardupilot/ardupilot.c"
__po_hi_local_port_t __po_hi_prs_mgmt_history[0]  ;
#line 968 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_mgmt_n_dest[3]  = {      0,      1,      1};
#line 969 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_mgmt_fifo_size[3]  = {      -1,      -2,      -2};
#line 970 "ardupilot/ardupilot.c"
__po_hi_port_t *__po_hi_prs_mgmt_destinations[3]  = {      (__po_hi_port_t *)((void *)0),      __po_hi_prs_mgmt_speed_local_destinations,      __po_hi_prs_mgmt_angle_local_destinations};
#line 971 "ardupilot/ardupilot.c"
void prs_mgmt_deliver(__po_hi_request_t *request ) 
{ 


  {
#line 976
  request = & global_var;
#line 977
  switch ((int )request->port) {
  case 1: 
#line 979
  __po_hi_gqueue_store_in((__po_hi_task_id )1, (__po_hi_local_port_t )0, request);
#line 980
  break;
  default: 
#line 982
  break;
  }
#line 984
  return;
}
}
#line 987 "ardupilot/ardupilot.c"
static base_types__integer speed_request_var  ;
#line 988 "ardupilot/ardupilot.c"
static base_types__integer angle_request_var  ;
#line 991 "ardupilot/ardupilot.c"
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
#line 1023
  __po_hi_wait_initialization();
#line 1024
  __po_hi_compute_next_period((__po_hi_task_id )1);
#line 1025
  __po_hi_wait_for_next_period((__po_hi_task_id )1);
#line 1026
  while (1) {
#line 1027
    tmp = __po_hi_gqueue_get_count((__po_hi_task_id )1, (__po_hi_local_port_t )0);
#line 1028
    if (tmp) {
#line 1029
      id6 = (__po_hi_task_id )1;
#line 1030
      port7 = (__po_hi_local_port_t )0;
#line 1031
      request8 = & gps_pos_request;
#line 1032
      tmp10 = __po_hi_sem_mutex_wait_gqueue(__po_hi_gqueues_semaphores, id6);
#line 1033
      result9 = tmp10;
#line 1034
      if (! (result9 == 1)) {
#line 1035
        __assert_fail("result == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      891U, "__po_hi_gqueue_get_value");
      }
#line 1038
      tmp___313 = __po_hi_gqueue_get_port_size((__po_hi_task_id const   )id6, (__po_hi_local_port_t const   )port7);
#line 1039
      if (tmp___313 == -2) {
#line 1040
        tmp___112 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id6);
#line 1041
        rel11 = tmp___112;
#line 1042
        if (! (rel11 == 1)) {
#line 1043
          __assert_fail("rel == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                        905U, "__po_hi_gqueue_get_value");
        }
#line 1046
        goto Lret___po_hi_gqueue_get_value;
      }
#line 1048
      tmp___616 = __po_hi_gqueue_get_port_size((__po_hi_task_id const   )id6, (__po_hi_local_port_t const   )port7);
#line 1049
      if (tmp___616 != -1) {
#line 1050
        while (*(__po_hi_gqueues_port_is_empty[id6] + (int )port7) == 1) {
#line 1051
          tmp___415 = __po_hi_sem_wait_gqueue(__po_hi_gqueues_semaphores, id6);
#line 1052
          res_sem14 = tmp___415;
#line 1053
          if (! (res_sem14 == 1)) {
#line 1054
            __assert_fail("res_sem == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                          919U, "__po_hi_gqueue_get_value");
          }
        }
      }
#line 1059
      tmp___717 = __po_hi_gqueue_get_port_size((__po_hi_task_id const   )id6, (__po_hi_local_port_t const   )port7);
#line 1060
      if (tmp___717 == -1) {
#line 1061
        tmp___818 = __po_hi_gqueue_used_size(id6, port7);
#line 1062
        if (tmp___818 == 0) {
#line 1063
          *request8 = *(__po_hi_gqueues_most_recent_values[id6] + (int )port7);
        } else {
#line 1065
          *request8 = *((__po_hi_gqueues[id6] + *(__po_hi_gqueues_first[id6] + (int )port7)) + *(__po_hi_gqueues_offsets[id6] + (int )port7));
        }
      } else {
#line 1068
        *request8 = *((__po_hi_gqueues[id6] + *(__po_hi_gqueues_first[id6] + (int )port7)) + *(__po_hi_gqueues_offsets[id6] + (int )port7));
      }
#line 1070
      tmp___920 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id6);
#line 1071
      res19 = tmp___920;
#line 1072
      if (! (res19 == 1)) {
#line 1073
        __assert_fail("res == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      960U, "__po_hi_gqueue_get_value");
      }
#line 1076
      __po_hi_request_valid(*request8);
#line 1077
      goto Lret___po_hi_gqueue_get_value;
      Lret___po_hi_gqueue_get_value: 
#line 1079
      __po_hi_gqueue_next_value((__po_hi_task_id )1, (__po_hi_local_port_t )0);
    }
#line 1082
    ardupilot_software__spg_flt_mgmt_simulation(gps_pos_request->vars.prs_mgmt_global_gps_pos.prs_mgmt_global_gps_pos,
                                                & speed_request_var, & angle_request_var);
#line 1084
    speed_request = & global_var;
#line 1085
    speed_request->vars.prs_mgmt_global_speed.prs_mgmt_global_speed = speed_request_var;
#line 1086
    speed_request->port = (__po_hi_port_t )2;
#line 1087
    id21 = (__po_hi_task_id )1;
#line 1088
    port22 = (__po_hi_local_port_t )1;
#line 1089
    request23 = speed_request;
#line 1091
    __po_hi_request_valid(request23);
#line 1092
    request23->port = ptr24->port;
#line 1093
    *(__po_hi_gqueues_most_recent_values[id21] + (int )port22) = request23;
#line 1094
    goto Lret___po_hi_gqueue_store_out;
    Lret___po_hi_gqueue_store_out: 
#line 1097
    angle_request = & global_var;
#line 1098
    angle_request->vars.prs_mgmt_global_angle.prs_mgmt_global_angle = angle_request_var;
#line 1099
    angle_request->port = (__po_hi_port_t )3;
#line 1100
    id25 = (__po_hi_task_id )1;
#line 1101
    port26 = (__po_hi_local_port_t )2;
#line 1102
    request27 = angle_request;
#line 1104
    __po_hi_request_valid(request27);
#line 1105
    request27->port = ptr28->port;
#line 1106
    *(__po_hi_gqueues_most_recent_values[id25] + (int )port26) = request27;
#line 1107
    goto Lret___po_hi_gqueue_store_out___0;
    Lret___po_hi_gqueue_store_out___0: 
#line 1110
    error = __po_hi_send_output(1, 2);
#line 1111
    error = __po_hi_send_output(1, 3);
#line 1112
    __po_hi_wait_for_next_period((__po_hi_task_id )1);
  }
}
}
#line 1117 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_throttle_woffsets[1]  ;
#line 1118 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_throttle_offsets[1]  ;
#line 1119 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_throttle_used_size[1]  ;
#line 1120 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_throttle_empties[1]  ;
#line 1121 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_throttle_first[1]  ;
#line 1122 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_throttle_recent[1]  ;
#line 1123 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_throttle_queue[0]  ;
#line 1124 "ardupilot/ardupilot.c"
__po_hi_uint16_t __po_hi_prs_throttle_total_fifo_size  =    (__po_hi_uint16_t )0;
#line 1125 "ardupilot/ardupilot.c"
__po_hi_local_port_t __po_hi_prs_throttle_history[0]  ;
#line 1126 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_throttle_n_dest[1]  = {      0};
#line 1127 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_throttle_fifo_size[1]  = {      -1};
#line 1128 "ardupilot/ardupilot.c"
__po_hi_port_t *__po_hi_prs_throttle_destinations[1]  = {      (__po_hi_port_t *)((void *)0)};
#line 1129 "ardupilot/ardupilot.c"
void prs_throttle_deliver(__po_hi_request_t *request ) 
{ 


  {
#line 1134
  request = & global_var;
#line 1135
  switch ((int )request->port) {
  case 4: 
#line 1137
  __po_hi_gqueue_store_in((__po_hi_task_id )2, (__po_hi_local_port_t )0, request);
#line 1138
  break;
  default: 
#line 1140
  break;
  }
#line 1142
  return;
}
}
#line 1145 "ardupilot/ardupilot.c"
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
#line 1167
  speed_request = & global_var;
#line 1168
  __po_hi_wait_initialization();
#line 1169
  __po_hi_compute_next_period((__po_hi_task_id )2);
#line 1170
  __po_hi_wait_for_next_period((__po_hi_task_id )2);
#line 1171
  while (1) {
#line 1172
    tmp = __po_hi_gqueue_get_count((__po_hi_task_id )2, (__po_hi_local_port_t )0);
#line 1173
    if (tmp) {
#line 1174
      id3 = (__po_hi_task_id )2;
#line 1175
      port4 = (__po_hi_local_port_t )0;
#line 1176
      request5 = & speed_request;
#line 1177
      tmp7 = __po_hi_sem_mutex_wait_gqueue(__po_hi_gqueues_semaphores, id3);
#line 1178
      result6 = tmp7;
#line 1179
      if (! (result6 == 1)) {
#line 1180
        __assert_fail("result == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      891U, "__po_hi_gqueue_get_value");
      }
#line 1183
      tmp___310 = __po_hi_gqueue_get_port_size((__po_hi_task_id const   )id3, (__po_hi_local_port_t const   )port4);
#line 1184
      if (tmp___310 == -2) {
#line 1185
        tmp___19 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id3);
#line 1186
        rel8 = tmp___19;
#line 1187
        if (! (rel8 == 1)) {
#line 1188
          __assert_fail("rel == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                        905U, "__po_hi_gqueue_get_value");
        }
#line 1191
        goto Lret___po_hi_gqueue_get_value;
      }
#line 1193
      tmp___613 = __po_hi_gqueue_get_port_size((__po_hi_task_id const   )id3, (__po_hi_local_port_t const   )port4);
#line 1194
      if (tmp___613 != -1) {
#line 1195
        while (*(__po_hi_gqueues_port_is_empty[id3] + (int )port4) == 1) {
#line 1196
          tmp___412 = __po_hi_sem_wait_gqueue(__po_hi_gqueues_semaphores, id3);
#line 1197
          res_sem11 = tmp___412;
#line 1198
          if (! (res_sem11 == 1)) {
#line 1199
            __assert_fail("res_sem == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                          919U, "__po_hi_gqueue_get_value");
          }
        }
      }
#line 1204
      tmp___714 = __po_hi_gqueue_get_port_size((__po_hi_task_id const   )id3, (__po_hi_local_port_t const   )port4);
#line 1205
      if (tmp___714 == -1) {
#line 1206
        tmp___815 = __po_hi_gqueue_used_size(id3, port4);
#line 1207
        if (tmp___815 == 0) {
#line 1208
          *request5 = *(__po_hi_gqueues_most_recent_values[id3] + (int )port4);
        } else {
#line 1210
          *request5 = *((__po_hi_gqueues[id3] + *(__po_hi_gqueues_first[id3] + (int )port4)) + *(__po_hi_gqueues_offsets[id3] + (int )port4));
        }
      } else {
#line 1213
        *request5 = *((__po_hi_gqueues[id3] + *(__po_hi_gqueues_first[id3] + (int )port4)) + *(__po_hi_gqueues_offsets[id3] + (int )port4));
      }
#line 1215
      tmp___917 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id3);
#line 1216
      res16 = tmp___917;
#line 1217
      if (! (res16 == 1)) {
#line 1218
        __assert_fail("res == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      960U, "__po_hi_gqueue_get_value");
      }
#line 1221
      __po_hi_request_valid(*request5);
#line 1222
      goto Lret___po_hi_gqueue_get_value;
      Lret___po_hi_gqueue_get_value: 
#line 1224
      __po_hi_gqueue_next_value((__po_hi_task_id )2, (__po_hi_local_port_t )0);
    }
#line 1227
    gps_pos_request = & global_var;
#line 1228
    gps_pos_request->vars.prs_gps_global_gps_pos.prs_gps_global_gps_pos = gps_pos_request_var;
#line 1231
    ardupilot_software__spg_throttle_simulation(speed_request->vars.prs_throttle_global_speed.prs_throttle_global_speed);
#line 1232
    __po_hi_wait_for_next_period((__po_hi_task_id )2);
  }
}
}
#line 1236 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_yaw_woffsets[1]  ;
#line 1237 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_yaw_offsets[1]  ;
#line 1238 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_yaw_used_size[1]  ;
#line 1239 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_yaw_empties[1]  ;
#line 1240 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_yaw_first[1]  ;
#line 1241 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_yaw_recent[1]  ;
#line 1242 "ardupilot/ardupilot.c"
__po_hi_request_t *__po_hi_prs_yaw_queue[0]  ;
#line 1243 "ardupilot/ardupilot.c"
__po_hi_uint16_t __po_hi_prs_yaw_total_fifo_size  =    (__po_hi_uint16_t )0;
#line 1244 "ardupilot/ardupilot.c"
__po_hi_local_port_t __po_hi_prs_yaw_history[0]  ;
#line 1245 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_yaw_n_dest[1]  = {      0};
#line 1246 "ardupilot/ardupilot.c"
__po_hi_port_id_t __po_hi_prs_yaw_fifo_size[1]  = {      -1};
#line 1247 "ardupilot/ardupilot.c"
__po_hi_port_t *__po_hi_prs_yaw_destinations[1]  = {      (__po_hi_port_t *)((void *)0)};
#line 1248 "ardupilot/ardupilot.c"
void prs_yaw_deliver(__po_hi_request_t *request ) 
{ 
  __po_hi_port_t p2 ;

  {
#line 1253
  p2 = request->port;
#line 1254
  switch ((int )request->port) {
  case 5: 
#line 1256
  __po_hi_gqueue_store_in((__po_hi_task_id )3, (__po_hi_local_port_t )0, request);
#line 1257
  break;
  default: 
#line 1259
  break;
  }
#line 1261
  return;
}
}
#line 1264 "ardupilot/ardupilot.c"
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
#line 1286
  angle_request = & global_var;
#line 1287
  __po_hi_wait_initialization();
#line 1288
  __po_hi_compute_next_period((__po_hi_task_id )3);
#line 1289
  __po_hi_wait_for_next_period((__po_hi_task_id )3);
#line 1290
  while (1) {
#line 1291
    tmp = __po_hi_gqueue_get_count((__po_hi_task_id )3, (__po_hi_local_port_t )0);
#line 1292
    if (tmp) {
#line 1293
      id3 = (__po_hi_task_id )3;
#line 1294
      port4 = (__po_hi_local_port_t )0;
#line 1295
      request5 = & angle_request;
#line 1297
      tmp7 = __po_hi_sem_mutex_wait_gqueue(__po_hi_gqueues_semaphores, id3);
#line 1298
      result6 = tmp7;
#line 1299
      if (! (result6 == 1)) {
#line 1300
        __assert_fail("result == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      891U, "__po_hi_gqueue_get_value");
      }
#line 1303
      tmp___310 = __po_hi_gqueue_get_port_size((__po_hi_task_id const   )id3, (__po_hi_local_port_t const   )port4);
#line 1304
      if (tmp___310 == -2) {
#line 1305
        tmp___19 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id3);
#line 1306
        rel8 = tmp___19;
#line 1307
        if (! (rel8 == 1)) {
#line 1308
          __assert_fail("rel == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                        905U, "__po_hi_gqueue_get_value");
        }
#line 1311
        goto Lret___po_hi_gqueue_get_value;
      }
#line 1313
      tmp___613 = __po_hi_gqueue_get_port_size((__po_hi_task_id const   )id3, (__po_hi_local_port_t const   )port4);
#line 1314
      if (tmp___613 != -1) {
#line 1315
        while (*(__po_hi_gqueues_port_is_empty[id3] + (int )port4) == 1) {
#line 1316
          tmp___412 = __po_hi_sem_wait_gqueue(__po_hi_gqueues_semaphores, id3);
#line 1317
          res_sem11 = tmp___412;
#line 1318
          if (! (res_sem11 == 1)) {
#line 1319
            __assert_fail("res_sem == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                          919U, "__po_hi_gqueue_get_value");
          }
        }
      }
#line 1324
      tmp___714 = __po_hi_gqueue_get_port_size((__po_hi_task_id const   )id3, (__po_hi_local_port_t const   )port4);
#line 1325
      if (tmp___714 == -1) {
#line 1326
        tmp___815 = __po_hi_gqueue_used_size(id3, port4);
#line 1327
        if (tmp___815 == 0) {
#line 1328
          *request5 = *(__po_hi_gqueues_most_recent_values[id3] + (int )port4);
        } else {
#line 1330
          *request5 = *((__po_hi_gqueues[id3] + *(__po_hi_gqueues_first[id3] + (int )port4)) + *(__po_hi_gqueues_offsets[id3] + (int )port4));
        }
      } else {
#line 1333
        *request5 = *((__po_hi_gqueues[id3] + *(__po_hi_gqueues_first[id3] + (int )port4)) + *(__po_hi_gqueues_offsets[id3] + (int )port4));
      }
#line 1335
      tmp___917 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id3);
#line 1336
      res16 = tmp___917;
#line 1337
      if (! (res16 == 1)) {
#line 1338
        __assert_fail("res == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      960U, "__po_hi_gqueue_get_value");
      }
#line 1341
      __po_hi_request_valid(*request5);
#line 1342
      goto Lret___po_hi_gqueue_get_value;
      Lret___po_hi_gqueue_get_value: 
#line 1344
      __po_hi_gqueue_next_value((__po_hi_task_id )3, (__po_hi_local_port_t )0);
    }
#line 1346
    gps_pos_request = & global_var;
#line 1347
    gps_pos_request->vars.prs_gps_global_gps_pos.prs_gps_global_gps_pos = gps_pos_request_var;
#line 1349
    ardupilot_software__spg_yaw_simulation(angle_request->vars.prs_yaw_global_angle.prs_yaw_global_angle);
#line 1350
    __po_hi_wait_for_next_period((__po_hi_task_id )3);
  }
}
}
#line 1354
extern int __po_hi_get_entity_from_global_port() ;
#line 1355 "ardupilot/ardupilot.c"
void __po_hi_main_deliver(__po_hi_request_t *request ) 
{ 
  __po_hi_entity_t entity ;
  __po_hi_port_t p1 ;
  int tmp ;

  {
#line 1362
  request = & global_var;
#line 1363
  p1 = request->port;
#line 1364
  tmp = __po_hi_get_entity_from_global_port((int )request->port);
#line 1365
  entity = (__po_hi_entity_t )tmp;
#line 1366
  switch ((int )entity) {
  case 1: 
#line 1368
  prs_mgmt_deliver(request);
#line 1369
  break;
  case 2: 
#line 1371
  prs_throttle_deliver(request);
#line 1372
  break;
  case 3: 
#line 1374
  prs_yaw_deliver(request);
#line 1375
  break;
  default: 
#line 1377
  break;
  }
#line 1379
  return;
}
}
#line 1382
extern int create_task() ;
#line 1383 "ardupilot/ardupilot.c"
void main(void) 
{ 


  {
#line 1386
  create_task("prs_throttle_job", "prs_throttle_job", 2, 1000, 5.0);
#line 1387
  create_task("prs_gps_job", "prs_gps_job", 4, 1000, 5.0);
#line 1388
  create_task("prs_mgmt_job", "prs_mgmt_job", 3, 1000, 5.0);
#line 1389
  create_task("prs_yaw_job", "prs_yaw_job", 1, 1000, 5.0);
#line 1390
  return;
}
}
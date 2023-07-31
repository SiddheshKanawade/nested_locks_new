# 1 "ardupilot/ardupilot.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "ardupilot/ardupilot.c"



typedef unsigned char __uint8_t;
typedef unsigned short __uint16_t;
typedef int __int32_t;
typedef unsigned int __uint32_t;
typedef __int32_t int32_t;
typedef __uint8_t uint8_t;
typedef __uint16_t uint16_t;
typedef __uint32_t uint32_t;
typedef _Bool __po_hi_bool_t;
typedef int32_t __po_hi_int32_t;
typedef uint16_t __po_hi_uint16_t;
typedef uint32_t __po_hi_uint32_t;
typedef __po_hi_int32_t __po_hi_port_id_t;


struct __anonstruct___po_hi_ba_automata_state_t_681732735 {
   __po_hi_int32_t nb_transitions ;
   __po_hi_int32_t *nb_dispatch_triggers_of_each_transition ;
   __po_hi_int32_t *dispatch_triggers_of_all_transitions ;
   __po_hi_int32_t nb_of_all_dispatch_events ;
};


typedef struct __anonstruct___po_hi_ba_automata_state_t_681732735 __po_hi_ba_automata_state_t;
typedef float base_types__float;
typedef int base_types__integer;
struct __anonstruct_ardupilot_software__gps_position_i_992385987 {
   base_types__float latitude ;
   base_types__float longitude ;
   base_types__integer altitude ;
};


typedef struct __anonstruct_ardupilot_software__gps_position_i_992385987 ardupilot_software__gps_position_i;
enum __anonenum___po_hi_entity_t_376935921 {
    process_ardupilot_prs_gps_k_entity = 0,
    process_ardupilot_prs_mgmt_k_entity = 1,
    process_ardupilot_prs_throttle_k_entity = 2,
    process_ardupilot_prs_yaw_k_entity = 3,
    invalid_entity = -1
} ;


typedef enum __anonenum___po_hi_entity_t_376935921 __po_hi_entity_t;
enum __anonenum___po_hi_task_id_52239547 {
    process_ardupilot_prs_gps_k = 0,
    process_ardupilot_prs_mgmt_k = 1,
    process_ardupilot_prs_throttle_k = 2,
    process_ardupilot_prs_yaw_k = 3,
    invalid_task_id = -1
} ;


typedef enum __anonenum___po_hi_task_id_52239547 __po_hi_task_id;
enum __anonenum___po_hi_port_t_180433783 {
    prs_gps_global_gps_pos = 0,
    prs_mgmt_global_gps_pos = 1,
    prs_mgmt_global_speed = 2,
    prs_mgmt_global_angle = 3,
    prs_throttle_global_speed = 4,
    prs_yaw_global_angle = 5,
    invalid_port_t = -1
} ;


typedef enum __anonenum___po_hi_port_t_180433783 __po_hi_port_t;
enum __anonenum___po_hi_local_port_t_225976243 {
    prs_gps_local_gps_pos = 0,
    prs_mgmt_local_gps_pos = 0,
    prs_mgmt_local_speed = 1,
    prs_mgmt_local_angle = 2,
    prs_throttle_local_speed = 0,
    prs_yaw_local_angle = 0,
    invalid_local_port_t = -1
} ;


typedef enum __anonenum___po_hi_local_port_t_225976243 __po_hi_local_port_t;
struct __anonstruct_prs_gps_global_gps_pos_264840508 {
   ardupilot_software__gps_position_i prs_gps_global_gps_pos ;
};


struct __anonstruct_prs_mgmt_global_gps_pos_264840509 {
   ardupilot_software__gps_position_i prs_mgmt_global_gps_pos ;
};


struct __anonstruct_prs_mgmt_global_speed_143697260 {
   base_types__integer prs_mgmt_global_speed ;
};


struct __anonstruct_prs_mgmt_global_angle_143697261 {
   base_types__integer prs_mgmt_global_angle ;
};


struct __anonstruct_prs_throttle_global_speed_143697262 {
   base_types__integer prs_throttle_global_speed ;
};


struct __anonstruct_prs_yaw_global_angle_143697263 {
   base_types__integer prs_yaw_global_angle ;
};


union __anonunion_vars_32314306 {
   struct __anonstruct_prs_gps_global_gps_pos_264840508 prs_gps_global_gps_pos ;
   struct __anonstruct_prs_mgmt_global_gps_pos_264840509 prs_mgmt_global_gps_pos ;
   struct __anonstruct_prs_mgmt_global_speed_143697260 prs_mgmt_global_speed ;
   struct __anonstruct_prs_mgmt_global_angle_143697261 prs_mgmt_global_angle ;
   struct __anonstruct_prs_throttle_global_speed_143697262 prs_throttle_global_speed ;
   struct __anonstruct_prs_yaw_global_angle_143697263 prs_yaw_global_angle ;
};


struct __anonstruct___po_hi_request_t_838549377 {
   __po_hi_port_t port ;
   union __anonunion_vars_32314306 vars ;
};


typedef struct __anonstruct___po_hi_request_t_838549377 __po_hi_request_t;
typedef unsigned long size_t;


enum __anonenum___po_hi_protected_protocol_t_165357506 {
    __PO_HI_PROTECTED_REGULAR = 1,
    __PO_HI_MUTEX_REGULAR = 1,
    __PO_HI_PROTECTED_PIP = 2,
    __PO_HI_MUTEX_PIP = 2,
    __PO_HI_PROTECTED_PCP = 3,
    __PO_HI_MUTEX_PCP = 3,
    __PO_HI_PROTECTED_IPCP = 4,
    __PO_HI_MUTEX_IPCP = 4,
    __PO_HI_PROTECTED_INVALID = 1
} ;

typedef enum __anonenum___po_hi_protected_protocol_t_165357506 __po_hi_protected_protocol_t;
typedef __po_hi_protected_protocol_t __po_hi_mutex_protocol_t;
struct __anonstruct___po_hi_mutex_t_570143648 {
   __po_hi_mutex_protocol_t protocol ;
   int priority ;
};
typedef struct __anonstruct___po_hi_mutex_t_570143648 __po_hi_mutex_t;
struct __po_hi_sem_t ;
typedef struct __po_hi_sem_t __po_hi_sem_t;
struct __po_hi_sem_t {

};
union objpool_item_t_ ;
typedef union objpool_item_t_ objpool_item_t;
union objpool_item_t_ {
   objpool_item_t *next ;
   __po_hi_request_t data ;
};
struct objpool_request_t_ {
   objpool_item_t *items ;
   objpool_item_t *head ;
   size_t num ;
   int count ;
   __po_hi_mutex_t lock ;
};
typedef struct objpool_request_t_ objpool_request_t;


void *prs_gps_job(void) ;
void prs_mgmt_deliver(__po_hi_request_t *request ) ;
void *prs_mgmt_job(void) ;
void prs_throttle_deliver(__po_hi_request_t *request ) ;
void *prs_throttle_job(void) ;
void prs_yaw_deliver(__po_hi_request_t *request ) ;
void *prs_yaw_job(void) ;
void __po_hi_main_deliver(__po_hi_request_t *request ) ;
void __po_hi_gqueue_init(__po_hi_task_id id , __po_hi_port_id_t nb_ports , __po_hi_request_t **queue ,
                         __po_hi_port_id_t *sizes , __po_hi_port_id_t *first , __po_hi_port_id_t *offsets ,
                         __po_hi_port_id_t *woffsets , __po_hi_port_id_t *n_dest ,
                         __po_hi_port_t **destinations , __po_hi_port_id_t *used_size ,
                         __po_hi_local_port_t *history , __po_hi_request_t **recent ,
                         __po_hi_port_id_t *empties , __po_hi_uint32_t total_fifo_size ) ;
void __po_hi_gqueue_store_out(__po_hi_task_id id , __po_hi_local_port_t port , __po_hi_request_t *request ) ;
int __po_hi_gqueue_get_value(__po_hi_task_id id , __po_hi_local_port_t port , __po_hi_request_t **request ) ;
int __po_hi_gqueue_next_value(__po_hi_task_id id , __po_hi_local_port_t port ) ;
int __po_hi_gqueue_get_count(__po_hi_task_id id , __po_hi_local_port_t port ) ;
__po_hi_bool_t __po_hi_gqueue_compute_index_transition_to_execute(__po_hi_task_id id ,
                                                                  __po_hi_ba_automata_state_t *next_complete_state ,
                                                                  int *initial_sizes_of_dispatch_triggers_of_all_transitions ,
                                                                  __po_hi_int32_t *index_transition_to_execute ) ;
void __po_hi_gqueue_wait_for_specific_incoming_events(__po_hi_task_id id , __po_hi_ba_automata_state_t *next_complete_state ,
                                                      __po_hi_int32_t *index_transition_to_execute ) ;
void __po_hi_gqueue_wait_for_incoming_event(__po_hi_task_id id , __po_hi_local_port_t *port ) ;
__po_hi_port_id_t __po_hi_gqueue_store_in(__po_hi_task_id id , __po_hi_local_port_t port ,
                                          __po_hi_request_t *request ) ;
__po_hi_request_t *__po_hi_gqueue_get_most_recent_value(__po_hi_task_id const task_id ,
                                                        __po_hi_local_port_t const local_port ) ;
void __po_hi_gqueue_set_most_recent_value(__po_hi_task_id task_id , __po_hi_local_port_t local_port ,
                                          __po_hi_request_t *request ) ;
__po_hi_port_t __po_hi_gqueue_get_destination(__po_hi_task_id const task_id , __po_hi_local_port_t const local_port ,
                                              uint8_t const destination_number ) ;
__po_hi_port_id_t __po_hi_gqueue_get_destinations_number(__po_hi_task_id const task_id ,
                                                         __po_hi_local_port_t const local_port ) ;
__po_hi_port_id_t __po_hi_gqueue_get_port_size(__po_hi_task_id const id , __po_hi_local_port_t const port ) ;
__po_hi_port_id_t __po_hi_gqueue_used_size(__po_hi_task_id id , __po_hi_local_port_t port ) ;
__po_hi_port_id_t po_hi_gqueues_queue_is_empty(__po_hi_task_id id ) ;
__po_hi_request_t *__po_hi_get_request(void) ;
_Bool __po_hi_free_request(__po_hi_request_t *OBJ ) ;
void __po_hi_request_valid(__po_hi_request_t *OBJ ) ;
void __po_hi_gqueue_init_global(void) ;
extern void ardupilot_software__spg_gps_simulation(ardupilot_software__gps_position_i *gps_pos ) ;
extern void ardupilot_software__spg_flt_mgmt_simulation(ardupilot_software__gps_position_i gps_pos ,
                                                        base_types__integer *speed ,
                                                        base_types__integer *angle ) ;
extern void ardupilot_software__spg_throttle_simulation(base_types__integer speed ) ;
extern void ardupilot_software__spg_yaw_simulation(base_types__integer angle ) ;
extern int __po_hi_wait_for_next_period(__po_hi_task_id task ) ;
extern int __po_hi_compute_next_period(__po_hi_task_id task ) ;
extern int __po_hi_wait_initialization(void) ;
extern __attribute__((__nothrow__, __noreturn__)) void ( __attribute__((__leaf__)) __assert_fail)(char const *__assertion ,
                                                                                                   char const *__file ,
                                                                                                   unsigned int __line ,
                                                                                                   char const *__function ) ;
extern int __po_hi_mutex_init(__po_hi_mutex_t *mutex , __po_hi_mutex_protocol_t const protocol ,
                              int const priority ) ;
extern int __po_hi_mutex_lock(__po_hi_mutex_t *mutex ) ;
extern int __po_hi_mutex_unlock(__po_hi_mutex_t *mutex ) ;
extern int __po_hi_sem_init_gqueue(__po_hi_sem_t *array , __po_hi_task_id id ) ;
extern int __po_hi_sem_wait_gqueue(__po_hi_sem_t *array , __po_hi_task_id id ) ;
extern int __po_hi_sem_mutex_wait_gqueue(__po_hi_sem_t *array , __po_hi_task_id id ) ;
extern int __po_hi_sem_release_gqueue(__po_hi_sem_t *array , __po_hi_task_id id ) ;
extern int __po_hi_sem_mutex_release_gqueue(__po_hi_sem_t *array , __po_hi_task_id id ) ;
extern __attribute__((__nothrow__)) void *( __attribute__((__leaf__)) calloc)(size_t __nmemb ,
                                                                               size_t __size ) __attribute__((__malloc__)) ;
extern __attribute__((__nothrow__)) void ( __attribute__((__leaf__)) free)(void *__ptr ) ;
extern __attribute__((__nothrow__, __noreturn__)) void ( __attribute__((__leaf__)) exit)(int __status ) ;
__po_hi_request_t **__po_hi_gqueues[4] ;
__po_hi_port_id_t __po_hi_gqueues_nb_ports[4] ;
__po_hi_port_id_t *__po_hi_gqueues_sizes[4] ;
__po_hi_port_id_t *__po_hi_gqueues_used_size[4] ;
__po_hi_port_id_t *__po_hi_gqueues_offsets[4] ;
__po_hi_port_id_t *__po_hi_gqueues_woffsets[4] ;
__po_hi_port_id_t *__po_hi_gqueues_n_destinations[4] ;
__po_hi_port_t **__po_hi_gqueues_destinations[4] ;
__po_hi_uint32_t __po_hi_gqueues_total_fifo_size[4] ;
__po_hi_request_t **__po_hi_gqueues_most_recent_values[4] ;
__po_hi_port_id_t *__po_hi_gqueues_first[4] ;
__po_hi_port_id_t __po_hi_gqueues_global_size[4] ;
__po_hi_local_port_t *__po_hi_gqueues_global_history[4] ;
__po_hi_uint32_t __po_hi_gqueues_global_history_offset[4] ;
__po_hi_uint32_t __po_hi_gqueues_global_history_woffset[4] ;
__po_hi_port_id_t *__po_hi_gqueues_port_is_empty[4] ;
__po_hi_port_id_t __po_hi_gqueues_queue_is_empty[4] ;
__po_hi_port_id_t __po_hi_gqueues_n_empty[4] ;
__po_hi_sem_t __po_hi_gqueues_semaphores[4] ;
objpool_request_t *objpool_request_t_create(size_t const num ) ;
void objpool_request_t_destroy(objpool_request_t *P ) ;
_Bool objpool_request_t_free(__po_hi_request_t *OBJ , objpool_request_t *P ) ;
__po_hi_request_t *objpool_request_t_get(objpool_request_t *P ) ;
void objpool_request_t_is_request_valid(__po_hi_request_t *OBJ , objpool_request_t *P ) ;
# 901 "ardupilot/ardupilot.c"
__po_hi_port_t __po_hi_prs_gps_gps_pos_local_destinations[1] = { (__po_hi_port_t )1};
__po_hi_port_id_t __po_hi_prs_gps_woffsets[1] ;
__po_hi_port_id_t __po_hi_prs_gps_offsets[1] ;
__po_hi_port_id_t __po_hi_prs_gps_used_size[1] ;
__po_hi_port_id_t __po_hi_prs_gps_empties[1] ;
__po_hi_port_id_t __po_hi_prs_gps_first[1] ;
__po_hi_request_t *__po_hi_prs_gps_recent[1] ;
__po_hi_request_t *__po_hi_prs_gps_queue[0] ;
__po_hi_uint16_t __po_hi_prs_gps_total_fifo_size = (__po_hi_uint16_t )0;
__po_hi_local_port_t __po_hi_prs_gps_history[0] ;
__po_hi_port_id_t __po_hi_prs_gps_n_dest[1] = { 1};
__po_hi_port_id_t __po_hi_prs_gps_fifo_size[1] = { -2};
__po_hi_port_t *__po_hi_prs_gps_destinations[1] = { __po_hi_prs_gps_gps_pos_local_destinations};
__po_hi_request_t global_var ;
__po_hi_request_t global_req ;
base_types__integer speed_use ;
base_types__integer angle_use ;
static ardupilot_software__gps_position_i gps_pos_request_var ;
extern int __po_hi_send_output() ;
void *prs_gps_job(void)
{
  __po_hi_request_t *gps_pos_request ;
  __po_hi_int32_t error ;
  __po_hi_task_id id3 ;
  __po_hi_local_port_t port4 ;
  __po_hi_request_t *request5 ;
  __po_hi_request_t *ptr6 ;

  {
  __po_hi_wait_initialization();
  __po_hi_compute_next_period((__po_hi_task_id )0);
  __po_hi_wait_for_next_period((__po_hi_task_id )0);
  while (1) {
    {
    ardupilot_software__spg_gps_simulation(& gps_pos_request_var);
    {
    }
    gps_pos_request = & global_var;
    gps_pos_request->vars.prs_gps_global_gps_pos.prs_gps_global_gps_pos = gps_pos_request_var;
    gps_pos_request->port = (__po_hi_port_t )0;
    id3 = (__po_hi_task_id )0;
    port4 = (__po_hi_local_port_t )0;
    request5 = gps_pos_request;
    {
    __po_hi_request_valid(request5);
    request5->port = ptr6->port;
    *(__po_hi_gqueues_most_recent_values[id3] + (int )port4) = request5;
    goto Lret___po_hi_gqueue_store_out;
    }
    Lret___po_hi_gqueue_store_out: ;
    error = __po_hi_send_output(0, 0);
    __po_hi_wait_for_next_period((__po_hi_task_id )0);
    }
  }
}
}
__po_hi_port_t __po_hi_prs_mgmt_speed_local_destinations[1] = { (__po_hi_port_t )4};
__po_hi_port_t __po_hi_prs_mgmt_angle_local_destinations[1] = { (__po_hi_port_t )5};
__po_hi_port_id_t __po_hi_prs_mgmt_woffsets[3] ;
__po_hi_port_id_t __po_hi_prs_mgmt_offsets[3] ;
__po_hi_port_id_t __po_hi_prs_mgmt_used_size[3] ;
__po_hi_port_id_t __po_hi_prs_mgmt_empties[3] ;
__po_hi_port_id_t __po_hi_prs_mgmt_first[3] ;
__po_hi_request_t *__po_hi_prs_mgmt_recent[3] ;
__po_hi_request_t *__po_hi_prs_mgmt_queue[0] ;
__po_hi_uint16_t __po_hi_prs_mgmt_total_fifo_size = (__po_hi_uint16_t )0;
__po_hi_local_port_t __po_hi_prs_mgmt_history[0] ;
__po_hi_port_id_t __po_hi_prs_mgmt_n_dest[3] = { 0, 1, 1};
__po_hi_port_id_t __po_hi_prs_mgmt_fifo_size[3] = { -1, -2, -2};
__po_hi_port_t *__po_hi_prs_mgmt_destinations[3] = { (__po_hi_port_t *)((void *)0), __po_hi_prs_mgmt_speed_local_destinations, __po_hi_prs_mgmt_angle_local_destinations};
void prs_mgmt_deliver(__po_hi_request_t *request )
{


  {
  request = & global_var;
  switch ((int )request->port) {
  case 1:
  __po_hi_gqueue_store_in((__po_hi_task_id )1, (__po_hi_local_port_t )0, request);
  break;
  default:
  break;
  }
  return;
}
}
static base_types__integer speed_request_var ;
static base_types__integer angle_request_var ;


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
  __po_hi_wait_initialization();
  __po_hi_compute_next_period((__po_hi_task_id )1);
  __po_hi_wait_for_next_period((__po_hi_task_id )1);
  while (1) {
    tmp = __po_hi_gqueue_get_count((__po_hi_task_id )1, (__po_hi_local_port_t )0);
    if (tmp) {
      id6 = (__po_hi_task_id )1;
      port7 = (__po_hi_local_port_t )0;
      request8 = & gps_pos_request;
      tmp10 = __po_hi_sem_mutex_wait_gqueue(__po_hi_gqueues_semaphores, id6);
      result9 = tmp10;
      if (! (result9 == 1)) {
        __assert_fail("result == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      891U, "__po_hi_gqueue_get_value");
      }
      tmp___313 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id6, (__po_hi_local_port_t const )port7);
      if (tmp___313 == -2) {
        tmp___112 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id6);
        rel11 = tmp___112;
        if (! (rel11 == 1)) {
          __assert_fail("rel == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                        905U, "__po_hi_gqueue_get_value");
        }
        goto Lret___po_hi_gqueue_get_value;
      }
      tmp___616 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id6, (__po_hi_local_port_t const )port7);
      if (tmp___616 != -1) {
        while (*(__po_hi_gqueues_port_is_empty[id6] + (int )port7) == 1) {
          tmp___415 = __po_hi_sem_wait_gqueue(__po_hi_gqueues_semaphores, id6);
          res_sem14 = tmp___415;
          if (! (res_sem14 == 1)) {
            __assert_fail("res_sem == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                          919U, "__po_hi_gqueue_get_value");
          }
        }
      }
      tmp___717 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id6, (__po_hi_local_port_t const )port7);
      if (tmp___717 == -1) {
        tmp___818 = __po_hi_gqueue_used_size(id6, port7);
        if (tmp___818 == 0) {
          *request8 = *(__po_hi_gqueues_most_recent_values[id6] + (int )port7);
        } else {
          *request8 = *((__po_hi_gqueues[id6] + *(__po_hi_gqueues_first[id6] + (int )port7)) + *(__po_hi_gqueues_offsets[id6] + (int )port7));
        }
      } else {
        *request8 = *((__po_hi_gqueues[id6] + *(__po_hi_gqueues_first[id6] + (int )port7)) + *(__po_hi_gqueues_offsets[id6] + (int )port7));
      }
      tmp___920 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id6);
      res19 = tmp___920;
      if (! (res19 == 1)) {
        __assert_fail("res == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      960U, "__po_hi_gqueue_get_value");
      }
      __po_hi_request_valid(*request8);
      goto Lret___po_hi_gqueue_get_value;
      Lret___po_hi_gqueue_get_value:
      __po_hi_gqueue_next_value((__po_hi_task_id )1, (__po_hi_local_port_t )0);
    }
    {
    ardupilot_software__spg_flt_mgmt_simulation(gps_pos_request->vars.prs_mgmt_global_gps_pos.prs_mgmt_global_gps_pos,
                                                & speed_request_var, & angle_request_var);
    speed_request = & global_var;
    speed_request->vars.prs_mgmt_global_speed.prs_mgmt_global_speed = speed_request_var;
    speed_request->port = (__po_hi_port_t )2;
    id21 = (__po_hi_task_id )1;
    port22 = (__po_hi_local_port_t )1;
    request23 = speed_request;
    {
    __po_hi_request_valid(request23);
    request23->port = ptr24->port;
    *(__po_hi_gqueues_most_recent_values[id21] + (int )port22) = request23;
    goto Lret___po_hi_gqueue_store_out;
    }
    Lret___po_hi_gqueue_store_out: ;
    angle_request = & global_var;
    angle_request->vars.prs_mgmt_global_angle.prs_mgmt_global_angle = angle_request_var;
    angle_request->port = (__po_hi_port_t )3;
    id25 = (__po_hi_task_id )1;
    port26 = (__po_hi_local_port_t )2;
    request27 = angle_request;
    {
    __po_hi_request_valid(request27);
    request27->port = ptr28->port;
    *(__po_hi_gqueues_most_recent_values[id25] + (int )port26) = request27;
    goto Lret___po_hi_gqueue_store_out___0;
    }
    Lret___po_hi_gqueue_store_out___0: ;
    error = __po_hi_send_output(1, 2);
    error = __po_hi_send_output(1, 3);
    __po_hi_wait_for_next_period((__po_hi_task_id )1);
    }
  }
}
}
__po_hi_port_id_t __po_hi_prs_throttle_woffsets[1] ;
__po_hi_port_id_t __po_hi_prs_throttle_offsets[1] ;
__po_hi_port_id_t __po_hi_prs_throttle_used_size[1] ;
__po_hi_port_id_t __po_hi_prs_throttle_empties[1] ;
__po_hi_port_id_t __po_hi_prs_throttle_first[1] ;
__po_hi_request_t *__po_hi_prs_throttle_recent[1] ;
__po_hi_request_t *__po_hi_prs_throttle_queue[0] ;
__po_hi_uint16_t __po_hi_prs_throttle_total_fifo_size = (__po_hi_uint16_t )0;
__po_hi_local_port_t __po_hi_prs_throttle_history[0] ;
__po_hi_port_id_t __po_hi_prs_throttle_n_dest[1] = { 0};
__po_hi_port_id_t __po_hi_prs_throttle_fifo_size[1] = { -1};
__po_hi_port_t *__po_hi_prs_throttle_destinations[1] = { (__po_hi_port_t *)((void *)0)};
void prs_throttle_deliver(__po_hi_request_t *request )
{


  {
  request = & global_var;
  switch ((int )request->port) {
  case 4:
  __po_hi_gqueue_store_in((__po_hi_task_id )2, (__po_hi_local_port_t )0, request);
  break;
  default:
  break;
  }
  return;
}
}
void *prs_throttle_job(void)
{
  __po_hi_request_t *speed_request ;
  __po_hi_request_t *gps_pos_request;
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
  speed_request = & global_var;
  __po_hi_wait_initialization();
  __po_hi_compute_next_period((__po_hi_task_id )2);
  __po_hi_wait_for_next_period((__po_hi_task_id )2);
  while (1) {
    tmp = __po_hi_gqueue_get_count((__po_hi_task_id )2, (__po_hi_local_port_t )0);
    if (tmp) {
      id3 = (__po_hi_task_id )2;
      port4 = (__po_hi_local_port_t )0;
      request5 = & speed_request;
      tmp7 = __po_hi_sem_mutex_wait_gqueue(__po_hi_gqueues_semaphores, id3);
      result6 = tmp7;
      if (! (result6 == 1)) {
        __assert_fail("result == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      891U, "__po_hi_gqueue_get_value");
      }
      tmp___310 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id3, (__po_hi_local_port_t const )port4);
      if (tmp___310 == -2) {
        tmp___19 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id3);
        rel8 = tmp___19;
        if (! (rel8 == 1)) {
          __assert_fail("rel == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                        905U, "__po_hi_gqueue_get_value");
        }
        goto Lret___po_hi_gqueue_get_value;
      }
      tmp___613 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id3, (__po_hi_local_port_t const )port4);
      if (tmp___613 != -1) {
        while (*(__po_hi_gqueues_port_is_empty[id3] + (int )port4) == 1) {
          tmp___412 = __po_hi_sem_wait_gqueue(__po_hi_gqueues_semaphores, id3);
          res_sem11 = tmp___412;
          if (! (res_sem11 == 1)) {
            __assert_fail("res_sem == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                          919U, "__po_hi_gqueue_get_value");
          }
        }
      }
      tmp___714 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id3, (__po_hi_local_port_t const )port4);
      if (tmp___714 == -1) {
        tmp___815 = __po_hi_gqueue_used_size(id3, port4);
        if (tmp___815 == 0) {
          *request5 = *(__po_hi_gqueues_most_recent_values[id3] + (int )port4);
        } else {
          *request5 = *((__po_hi_gqueues[id3] + *(__po_hi_gqueues_first[id3] + (int )port4)) + *(__po_hi_gqueues_offsets[id3] + (int )port4));
        }
      } else {
        *request5 = *((__po_hi_gqueues[id3] + *(__po_hi_gqueues_first[id3] + (int )port4)) + *(__po_hi_gqueues_offsets[id3] + (int )port4));
      }
      tmp___917 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id3);
      res16 = tmp___917;
      if (! (res16 == 1)) {
        __assert_fail("res == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      960U, "__po_hi_gqueue_get_value");
      }
      __po_hi_request_valid(*request5);
      goto Lret___po_hi_gqueue_get_value;
      Lret___po_hi_gqueue_get_value:
      __po_hi_gqueue_next_value((__po_hi_task_id )2, (__po_hi_local_port_t )0);
    }

    gps_pos_request = & global_var;
    gps_pos_request->vars.prs_gps_global_gps_pos.prs_gps_global_gps_pos = gps_pos_request_var;


    ardupilot_software__spg_throttle_simulation(speed_request->vars.prs_throttle_global_speed.prs_throttle_global_speed);
    __po_hi_wait_for_next_period((__po_hi_task_id )2);
  }
}
}
__po_hi_port_id_t __po_hi_prs_yaw_woffsets[1] ;
__po_hi_port_id_t __po_hi_prs_yaw_offsets[1] ;
__po_hi_port_id_t __po_hi_prs_yaw_used_size[1] ;
__po_hi_port_id_t __po_hi_prs_yaw_empties[1] ;
__po_hi_port_id_t __po_hi_prs_yaw_first[1] ;
__po_hi_request_t *__po_hi_prs_yaw_recent[1] ;
__po_hi_request_t *__po_hi_prs_yaw_queue[0] ;
__po_hi_uint16_t __po_hi_prs_yaw_total_fifo_size = (__po_hi_uint16_t )0;
__po_hi_local_port_t __po_hi_prs_yaw_history[0] ;
__po_hi_port_id_t __po_hi_prs_yaw_n_dest[1] = { 0};
__po_hi_port_id_t __po_hi_prs_yaw_fifo_size[1] = { -1};
__po_hi_port_t *__po_hi_prs_yaw_destinations[1] = { (__po_hi_port_t *)((void *)0)};
void prs_yaw_deliver(__po_hi_request_t *request )
{
  __po_hi_port_t p2 ;

  {
  p2 = request->port;
  switch ((int )request->port) {
  case 5:
  __po_hi_gqueue_store_in((__po_hi_task_id )3, (__po_hi_local_port_t )0, request);
  break;
  default:
  break;
  }
  return;
}
}
void *prs_yaw_job(void)
{
  __po_hi_request_t *angle_request ;
  __po_hi_request_t *gps_pos_request;
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
  angle_request = & global_var;
  __po_hi_wait_initialization();
  __po_hi_compute_next_period((__po_hi_task_id )3);
  __po_hi_wait_for_next_period((__po_hi_task_id )3);
  while (1) {
    tmp = __po_hi_gqueue_get_count((__po_hi_task_id )3, (__po_hi_local_port_t )0);
    if (tmp) {
      id3 = (__po_hi_task_id )3;
      port4 = (__po_hi_local_port_t )0;
      request5 = & angle_request;

      tmp7 = __po_hi_sem_mutex_wait_gqueue(__po_hi_gqueues_semaphores, id3);
      result6 = tmp7;
      if (! (result6 == 1)) {
        __assert_fail("result == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      891U, "__po_hi_gqueue_get_value");
      }
      tmp___310 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id3, (__po_hi_local_port_t const )port4);
      if (tmp___310 == -2) {
        tmp___19 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id3);
        rel8 = tmp___19;
        if (! (rel8 == 1)) {
          __assert_fail("rel == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                        905U, "__po_hi_gqueue_get_value");
        }
        goto Lret___po_hi_gqueue_get_value;
      }
      tmp___613 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id3, (__po_hi_local_port_t const )port4);
      if (tmp___613 != -1) {
        while (*(__po_hi_gqueues_port_is_empty[id3] + (int )port4) == 1) {
          tmp___412 = __po_hi_sem_wait_gqueue(__po_hi_gqueues_semaphores, id3);
          res_sem11 = tmp___412;
          if (! (res_sem11 == 1)) {
            __assert_fail("res_sem == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                          919U, "__po_hi_gqueue_get_value");
          }
        }
      }
      tmp___714 = __po_hi_gqueue_get_port_size((__po_hi_task_id const )id3, (__po_hi_local_port_t const )port4);
      if (tmp___714 == -1) {
        tmp___815 = __po_hi_gqueue_used_size(id3, port4);
        if (tmp___815 == 0) {
          *request5 = *(__po_hi_gqueues_most_recent_values[id3] + (int )port4);
        } else {
          *request5 = *((__po_hi_gqueues[id3] + *(__po_hi_gqueues_first[id3] + (int )port4)) + *(__po_hi_gqueues_offsets[id3] + (int )port4));
        }
      } else {
        *request5 = *((__po_hi_gqueues[id3] + *(__po_hi_gqueues_first[id3] + (int )port4)) + *(__po_hi_gqueues_offsets[id3] + (int )port4));
      }
      tmp___917 = __po_hi_sem_mutex_release_gqueue(__po_hi_gqueues_semaphores, id3);
      res16 = tmp___917;
      if (! (res16 == 1)) {
        __assert_fail("res == __PO_HI_SUCCESS", "/home/se-lab/osek_inline/ardupilot_map_impl/headers/po_hi_gqueue.c",
                      960U, "__po_hi_gqueue_get_value");
      }
      __po_hi_request_valid(*request5);
      goto Lret___po_hi_gqueue_get_value;
      Lret___po_hi_gqueue_get_value:
      __po_hi_gqueue_next_value((__po_hi_task_id )3, (__po_hi_local_port_t )0);
    }
    gps_pos_request = & global_var;
    gps_pos_request->vars.prs_gps_global_gps_pos.prs_gps_global_gps_pos = gps_pos_request_var;

    ardupilot_software__spg_yaw_simulation(angle_request->vars.prs_yaw_global_angle.prs_yaw_global_angle);
    __po_hi_wait_for_next_period((__po_hi_task_id )3);
  }
}
}
extern int __po_hi_get_entity_from_global_port() ;
void __po_hi_main_deliver(__po_hi_request_t *request )
{
  __po_hi_entity_t entity ;
  __po_hi_port_t p1 ;
  int tmp ;

  {
  request = & global_var;
  p1 = request->port;
  tmp = __po_hi_get_entity_from_global_port((int )request->port);
  entity = (__po_hi_entity_t )tmp;
  switch ((int )entity) {
  case 1:
  prs_mgmt_deliver(request);
  break;
  case 2:
  prs_throttle_deliver(request);
  break;
  case 3:
  prs_yaw_deliver(request);
  break;
  default:
  break;
  }
  return;
}
}
extern int create_task() ;
void main(void)
{
  {
  create_task("prs_throttle_job", "prs_throttle_job", 2, 1000, 5.0);
  create_task("prs_gps_job", "prs_gps_job", 4, 1000, 5.0);
  create_task("prs_mgmt_job", "prs_mgmt_job", 3, 1000, 5.0);
  create_task("prs_yaw_job", "prs_yaw_job", 1, 1000, 5.0);
  return;
}
}

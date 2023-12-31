#include <activity.h>
#include <po_hi_task.h>
#include <po_hi_main.h>
//#include <po_hi_time.h>
/**************************************************** */
/*  This file was automatically generated by Ocarina  */
/*  Working Copy from rd2e9f13e */
/*  Do NOT hand-modify this file, as your             */
/*  changes will be lost when you re-run Ocarina      */
/**************************************************** */
extern void flt_mgmt_init (void);

/*!
 * \fn __PO_HI_MAIN_TYPE __PO_HI_MAIN_NAME (void)
 * \brief Main function executed by the system
 *
 * Full function name and return types are available  in the PolyORB-HI-C 
 * runtime header files.
 */
__PO_HI_MAIN_TYPE __PO_HI_MAIN_NAME (void)
{
  
/*!
 * \var period
 * \brief Variable for task period
 *
 * This variable is used to store the valueof the period of a task when we 
 * create it. The value put in the variable is set according to AADL model 
 * description
 */
  __po_hi_time_t period;

  __po_hi_initialize_early ();
  
/*!
 * Initialize the runtime
 */
  __po_hi_initialize ();
  flt_mgmt_init ();
  
/*!
 * Store the period time for task prs_gps
 */
  __po_hi_milliseconds (&(period), 1000);
  
/*!
 * \brief Making Periodic Task prs_gps
 *
 * Make a periodic task according to AADL model requirements. The first 
 * parameter is the task identifier defined in deployment.h 
 * (process_ardupilot_prs_gps_k) the second is the period defined in the 
 * AADL model. Third is the task priority ( 0), fourth is the stack size ( 0
 *  bytes) and last is the subprogram executed by the task
 */
  __po_hi_create_periodic_task (process_ardupilot_prs_gps_k, &(period), __PO_HI_DEFAULT_PRIORITY, 0, 0, prs_gps_job);
  
/*!
 * Store the period time for task prs_mgmt
 */
  __po_hi_milliseconds (&(period), 1000);
  
/*!
 * \brief Making Periodic Task prs_mgmt
 *
 * Make a periodic task according to AADL model requirements. The first 
 * parameter is the task identifier defined in deployment.h 
 * (process_ardupilot_prs_mgmt_k) the second is the period defined in the 
 * AADL model. Third is the task priority ( 0), fourth is the stack size ( 0
 *  bytes) and last is the subprogram executed by the task
 */
  __po_hi_create_periodic_task (process_ardupilot_prs_mgmt_k, &(period), __PO_HI_DEFAULT_PRIORITY, 0, 0, prs_mgmt_job);
  
/*!
 * Store the period time for task prs_throttle
 */
  __po_hi_milliseconds (&(period), 1000);
  
/*!
 * \brief Making Periodic Task prs_throttle
 *
 * Make a periodic task according to AADL model requirements. The first 
 * parameter is the task identifier defined in deployment.h 
 * (process_ardupilot_prs_throttle_k) the second is the period defined in 
 * the AADL model. Third is the task priority ( 0), fourth is the stack size
 *  ( 0 bytes) and last is the subprogram executed by the task
 */
  __po_hi_create_periodic_task (process_ardupilot_prs_throttle_k, &(period), __PO_HI_DEFAULT_PRIORITY, 0, 0, prs_throttle_job);
  
/*!
 * Store the period time for task prs_yaw
 */
  __po_hi_milliseconds (&(period), 1000);
  
/*!
 * \brief Making Periodic Task prs_yaw
 *
 * Make a periodic task according to AADL model requirements. The first 
 * parameter is the task identifier defined in deployment.h 
 * (process_ardupilot_prs_yaw_k) the second is the period defined in the 
 * AADL model. Third is the task priority ( 0), fourth is the stack size ( 0
 *  bytes) and last is the subprogram executed by the task
 */
  __po_hi_create_periodic_task (process_ardupilot_prs_yaw_k, &(period), __PO_HI_DEFAULT_PRIORITY, 0, 0, prs_yaw_job);
  
/*!
 * Waiting for other tasks initialization
 */
  __po_hi_wait_initialization ();
  
/*!
 * Used to switch the main task to sleep all the time
 */
  __po_hi_wait_for_tasks ();
  
/*!
 * Return Statement
 */
  return (__PO_HI_MAIN_RETURN);
}



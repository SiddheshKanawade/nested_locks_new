/*Example: Simple and generic avionics mission computer task set and architecture

Specification: 16_bit processor, task inputs/outputs are performed on a single
MIL_STD_1553B databus_

Tasks: Totally 15 tasks, 5 of them are aperiodic but, are interpreted as
periodic with their deadlines as their respective periods_ All the periods
and computation time (considered as WCET) are given in milliseconds (ms)_ */

/*________________________________________________*/

 // Task name1: Weapon_release
   // Priority: 1
   // Period: 10
   // WCET: 5
   // Inputs (2):
   int AG_Time_to_Go_to_Release; 
   int AG_Weapon_Release_Interval; 
   int AG_Delivery_Mode_Selected; 
   int SMS_Bomb_Button_Depressed; 
   // Outputs (1):
   int SMS_Release_Signal;
   
   // Functionality:
   void weapon_release(){
   int temp;
   temp = AG_Time_to_Go_to_Release; 
   temp = AG_Weapon_Release_Interval; 
   temp = AG_Delivery_Mode_Selected; 
   temp = SMS_Bomb_Button_Depressed; 

   SMS_Release_Signal = temp;
   }

/*_________________________________________________*/
   
 // Task name2: Radar_tracking
   // Priority: 2
   // Period: 40
   // WCET: 2
   // Inputs (4):
   int Radar_Mode; 
   int Radar_Contact_Table; 
   int Radar_Target_Position; 
   int MPD_Contact_Number_to_Track; 
   // Outputs (3)
   int Radar_Mode;
   int Radar_Contact_Number_to_Track; 
   int Radar_Status;

   //Functionality: 
   void radar_control()
   {
     int temp1, temp2, temp3, temp4;
     temp1 = Radar_Mode; 
     temp2 =  Radar_Contact_Table; 
     temp3 = Radar_Target_Position; 
     temp4 = MPD_Contact_Number_to_Track;

     Radar_Mode = temp1;
     Radar_Contact_Number_to_Track = temp4;
     Radar_Status = temp2;
     }
     
/*________________________________________________*/

 // Task name3: Target_tracking
   // Priority: 3
   // Period: 40
   // WCET: 4
   // Inputs (6):
   int NAV_Aircraft_Position; 
   int AG_Target_Location; 
   int AG_HUD_Target_Designation_Selected; 
   int HOTAS_TDC_HUD_Reticle_Delta;
   int AG_Radar_Target_Designation_Selected; 
  // int Radar_Target_Position; 
   // Outputs (3):
  // int AG_Target_Location;
   int HUD_Target_Reticle; 
   int HUD_Reticle_Position;

   //Functionality: 
   void target_tracking()
   {
     int temp1, temp2;
     temp1 = NAV_Aircraft_Position; 
     temp1 = AG_Target_Location; 
     temp1 = AG_HUD_Target_Designation_Selected; 
     temp2 = HOTAS_TDC_HUD_Reticle_Delta;
     temp2 = AG_Radar_Target_Designation_Selected; 
     temp2 = Radar_Target_Position;

     AG_Target_Location = temp1;
     HUD_Target_Reticle = temp2; 
     HUD_Reticle_Position = temp2;
   }

/*___________________________________________*/

 // Task name4: Target_sweetening
   // Priority: 4
   // Period: 40
   // WCET: 2
   // Inputs (6):
  // int NAV_Aircraft_Position;
   int HOTAS_HUD_Designation_Selected; 
  // int HUD_Reticle_Position;
   int HOTAS_Radar_Target_Designation_Selected; 
  // int Radar_Target_Position; 
   int HOTAS_Undesignate_Selected;
   // Outputs (5):
  // int AG_Target_Location;
  // int HUD_Target_Reticle; 
  // int HUD_Reticle_Position; 
  // int AG_Radar_Target_Designation_Selected; 
  // int AG_HUD_Target_Designation_Selected;

   // Functionality:
   void target_sweetening()
   {
     int temp1, temp2;
     temp1 = NAV_Aircraft_Position;
     temp2 = HOTAS_HUD_Designation_Selected; 
     temp1 = HUD_Reticle_Position;
     temp2 = HOTAS_Radar_Target_Designation_Selected; 
     temp1 = Radar_Target_Position; 
     temp2 = HOTAS_Undesignate_Selected;

     AG_Target_Location = temp1;
     HUD_Target_Reticle = temp1;
     HUD_Reticle_Position = temp1; 
     AG_Radar_Target_Designation_Selected = temp2; 
     AG_HUD_Target_Designation_Selected = temp2;   
   }
   
/*________________________________________________*/

  // Task name5: HOTAS_bomb_button
   // Priority: 5
   // Period: 40
   // WCET: 1
   // Inputs (4):
   int DP_Keyset_RWR_Program_Message; 
   int DP_Keyset_Weapon_Program_Message; 
   int DP_Keyset_Target_Designation_Message; 
   int DP_Keyset_Delivery_Mode_Toggle_Message;
   // Outputs (8):
   int Keyset_Waypoint_Table; 
   int Keyset_Waypoint_Offset;
   int Keyset_Waypoint_Steering_Selected; 
   int Keyset_Quantity_Select_Request; 
   int Keyset_Interval_Select_Request; 
   int Keyset_AUTO_CCIP_Toggle;
   int Keyset_RWR_Frequency_Table; 
   int Keyset_RWR_Search_Sector_Table;

   // Functionality:
   void target_sweetening1()
   {
     int temp1, temp2, temp3, temp4;
     temp1 = DP_Keyset_RWR_Program_Message; 
     temp2 = DP_Keyset_Weapon_Program_Message; 
     temp3 = DP_Keyset_Target_Designation_Message; 
     temp4 = DP_Keyset_Delivery_Mode_Toggle_Message;

     Keyset_Waypoint_Table = temp4; 
     Keyset_Waypoint_Offset = temp4;
     Keyset_Waypoint_Steering_Selected = temp3; 
     Keyset_Quantity_Select_Request = temp2; 
     Keyset_Interval_Select_Request = temp2; 
     Keyset_AUTO_CCIP_Toggle = temp3;
     Keyset_RWR_Frequency_Table = temp1; 
     Keyset_RWR_Search_Sector_Table = temp1;
     }
     
/*________________________________________________*/

 // Task name6: Aircraft_flight_data
   // Priority: 6
   // Period: 55
   // WCET: 8
   // Inputs (11):
    int ADC_Angle_of_Attack, ADC_Mach_Number, ADC_Barometric_Altitude;
    int ADC_Magnetic_Heading, ADC_True_Airspeed;
    int INS_Body_Rates;
    int INS_Acceleration; 
    int INS_Present_Position;
    int INS_True_Heading;
    int INS_Velocity;
    int RALT_Radar_Altitude;
    // Outputs (19):
    int INS_Reference_Velocity;
    int NAV_Airspeed;
    int NAV_Rate_of_Change_Airspeed;
    int NAV_Position;
    int NAV_Angle_of_Attack;
    int NAV_Attitude; 
    int NAV_Body_Rates;
    int NAV_Flight_Path_Angle;
    int NAV_Ground_Speed;
    int NAV_Ground_Track_Angle;
    int NAV_Magnetic_Variation;
    int NAV_Altitude;
    int NAV_Velocity;
    int NAV_Acceleration;
    int NAV_Wind; 
    int NAV_Body_to_Earth_Transform;
    int NAV_Body_to_Horizon_Transform;
    int NAV_Radar_to_Body_Transform;
    int NAV_Radar_to_Earth_Transform;
    
   // Functionality:
   void aircraft_flight_data()
   {
     int temp1, temp2, temp3;
     temp1 = ADC_Angle_of_Attack; //Changed ADC_AoA -> ADC_Angle_of_Attack
     temp1 = RALT_Radar_Altitude; //Changed RALT -> RALT_Radar_Altitude
     temp1 = ADC_Mach_Number;
     temp2 = ADC_Barometric_Altitude;
     temp2 = ADC_Magnetic_Heading;
     temp2 = ADC_True_Airspeed;
     temp3 = INS_Body_Rates;
     temp3 = INS_Acceleration;
     temp3 = INS_Present_Position;
     temp3 = INS_True_Heading;
     temp3 = INS_Velocity;
     temp3 = RALT_Radar_Altitude;
   
     //INS_ref_val = temp1;
     INS_Reference_Velocity = temp1;
     NAV_Airspeed = temp1; 
     NAV_Rate_of_Change_Airspeed = temp1;
     NAV_Position = temp1;
     NAV_Angle_of_Attack = temp1; 
     NAV_Attitude = temp2;
     NAV_Body_Rates = temp2;
     NAV_Flight_Path_Angle = temp2;
     NAV_Ground_Speed = temp2; 
     NAV_Ground_Track_Angle = temp2;
     NAV_Magnetic_Variation = temp2;
     NAV_Altitude  = temp3;
     NAV_Velocity = temp3;
     NAV_Acceleration = temp3;
     NAV_Wind = temp3;
     NAV_Body_to_Earth_Transform = temp3;
     NAV_Body_to_Horizon_Transform = temp3;
     NAV_Radar_to_Body_Transform = temp3; 
     NAV_Radar_to_Earth_Transform = temp3;
   }

/*__________________________________________*/

 // Task name7: HUD_display
  //  Priority: 7
  //  Period: 52
  //  WCET: 6
  //  Inputs (14):
  //int NAV_Airspeed; 
  //int NAV_Position; 
  //int NAV_Angle_of_Attack;
 // int NAV_Attitude; 
 // int NAV_Body_Rates;
  int NAV_Barometric_Altitude; 
  //int NAV_Velocity; 
  int NAV_Steer_to_Point; 
 // int HUD_Target_Reticle; 
//int HUD_Reticle_Position; 
 // int AG_Time_to_Go_to_Release; 
 // int AG_Delivery_Mode_Selected; 
  int AG_Weapon_Down_Range_Travel; 
  int AG_Weapon_Cross_Range_Travel;
  
  //  Outputs (7):

  int DP_HUD_NAV_Data_Message;
  int DP_HUD_Pitch_Ladder_Message; 
  int DP_HUD_Velocity_Vector_Message; 
  int DP_HUD_Steering_Cue_Message; 
  int DP_HUD_Reticle_Message; 
  int DP_HUD_Weapon_Release_Message; 
  int DP_HUD_CCIP_Display_Message;

  // Functionality:
   void HUD_display()
   {
     int temp1, temp2, temp3, temp4;
     temp1 = NAV_Airspeed; 
     temp2 = NAV_Position; 
     temp3 = NAV_Angle_of_Attack;
     temp1 = NAV_Attitude; 
     temp2 = NAV_Body_Rates;
     temp3 = NAV_Barometric_Altitude; 
     temp1 = NAV_Velocity; 
     temp2 = NAV_Steer_to_Point; 
     temp3 = HUD_Target_Reticle; 
     temp1 = HUD_Reticle_Position;
     temp2 = AG_Time_to_Go_to_Release; 
     temp3 = AG_Delivery_Mode_Selected; 
     temp4 = AG_Weapon_Down_Range_Travel; 
     temp3 = AG_Weapon_Cross_Range_Travel;

     DP_HUD_NAV_Data_Message = temp1;
     DP_HUD_Pitch_Ladder_Message = temp2; 
     DP_HUD_Velocity_Vector_Message = temp1; 
     if (NAV_Steer_to_Point || HUD_Target_Reticle)
        DP_HUD_Steering_Cue_Message = temp3;
     DP_HUD_Reticle_Message = temp1; 
     if (AG_Delivery_Mode_Selected && HUD_Reticle_Position)
     	 DP_HUD_Weapon_Release_Message = temp4; 
     DP_HUD_CCIP_Display_Message = temp2;
     }
     
/*_________________________________________________*/

 // Task name8: MPD_tactical_display
   // Priority: 8
   // Period: 50
   // WCET: 8
   // Inputs (8):
   int MPD_Tactical_Display_Scale_Selected; 
 //  int Radar_Contact_Table; 
   int RWR_Threat_Table; 
  // int NAV_Position;
  // int NAV_Magnetic_Variation; 
  // int NAV_Steer_to_Point; 
  // int Radar_Target_Position; 
  // int AG_Target_Location; 
   // Outputs (1):
   int DP_MPD_Tactical_Radar_Contacts_Message; 
   int DP_MPD_Tactical_Radar_Target_Message; 
   int DP_MPD_Tactical_Threats_Display_Message; 
   int DP_MPD_Tactical_Compass_Rose_Message; 
   int DP_MPD_AG_Target_Message;
   
  // Functionality:
   void MPD_tactical_display()
   {
     int temp1, temp2;
     temp1 = MPD_Tactical_Display_Scale_Selected; 
     temp2 = Radar_Contact_Table; 
     temp2 = RWR_Threat_Table; 
     temp1 = NAV_Position;
     temp1 = NAV_Magnetic_Variation; 
     temp2 = NAV_Steer_to_Point; 
     temp1 = Radar_Target_Position; 
     temp2 = AG_Target_Location;

     DP_MPD_Tactical_Radar_Contacts_Message = temp1; 
     DP_MPD_Tactical_Radar_Target_Message = temp2; 
     DP_MPD_Tactical_Threats_Display_Message = temp1; 
     DP_MPD_Tactical_Compass_Rose_Message = temp2; 
     DP_MPD_AG_Target_Message = temp1;
   }
     
/*________________________________________________*/

 // Task name9: Steering
   // Priority: 9
   // Period: 80
   // WCET: 6
   // Inputs (8):
  //  int NAV_Position;
	//int NAV_Velocity;
	int MPD_Waypoint_Counter;
  //  int Keyset_Waypoint_Table;
    int Keyset_Offset;
   // int Keyset_Waypoint_Steering_Selected;
  //  int AG_Target_Location;
   // Outputs (1):
   // int NAV_Steer_to_Point;
    
   // Functionality:
   void steering()
   {
     int temp1, temp2;
     temp1 = NAV_Position;
     temp1 = NAV_Velocity;
     temp1 = MPD_Waypoint_Counter;
     temp1 = Keyset_Waypoint_Table;
     temp2 = Keyset_Offset; 
     temp2 = Keyset_Waypoint_Steering_Selected;
     temp2 = AG_Target_Location;

     NAV_Steer_to_Point = temp1;
   }

/*_____________________________________________*/

 // Task name10 : Weapon_trajectory
    // Priority: 10
    // Period: 100
    // WCET: 7
    // Inputs (5):
   // int NAV_Aircraft_Position; 
   // int NAV_Barometric_Altitude; 
    int NAV_Aircraft_Velocity; 
    int NAV_Mach_Number; 
   // int NAV_Wind; 
   // int NAV_Angle_of_Attack; 
   // int NAV_Attitude; 
 //   int NAV_Body_Rates; 
   // int AG_Target_Location; 
    int MPD_Weapon_Selected; 
  //  int AG_Delivery_Mode_Selected; 
    int SMS_Ballistic_Coefficients; 
    // Outputs (6):
 //   int AG_Time_to_Go_to_Release; 
    int AG_Weapon_Time_of_Fall; 
  //  int AG_Weapon_Down_Range_Travel; 
 //   int AG_Weapon_Cross_Range_Travel; 
    int AG_Weapon_Down_Range_Error; 
    int AG_Weapon_Cross_Range_Error;

    // Functionality:
    void weapon_trajectory()
   {
     int temp1, temp2, temp3;
     temp1 = NAV_Aircraft_Position; 
     temp2 = NAV_Barometric_Altitude; 
     temp3 = NAV_Aircraft_Velocity; 
     temp1 = NAV_Mach_Number; 
     temp2 = NAV_Wind; 
     temp3 = NAV_Angle_of_Attack; 
     temp1 = NAV_Attitude; 
     temp2 = NAV_Body_Rates; 
     temp3 = AG_Target_Location; 
     temp1 = MPD_Weapon_Selected; 
     temp2 = AG_Delivery_Mode_Selected; 
     temp3 = SMS_Ballistic_Coefficients;

    AG_Time_to_Go_to_Release = temp1; 
    AG_Weapon_Time_of_Fall = temp3; 
    AG_Weapon_Down_Range_Travel = temp2; 
    AG_Weapon_Cross_Range_Travel = temp3; 
    AG_Weapon_Down_Range_Error = temp3; 
    AG_Weapon_Cross_Range_Error = temp3;
    }

/*___________________________________________________*/

 // Task name11: Threat_response_display
    // Priority: 11
    // Period: 100
    // WCET: 3
    // Inputs (2):
    int RWR_Threat_Table_Bearing;
    int RWR_Threat_Table_Frequency;
    // Outputs (2):
    int MPD_Threat_Warning; 
    int HUD_Threat_Warning;
    
    // Functionality:
    void threat_response_display()
   {
     int temp1, temp2;
     temp1 = RWR_Threat_Table_Bearing;
     temp2 = RWR_Threat_Table_Frequency;

     MPD_Threat_Warning = temp2;
     HUD_Threat_Warning = temp1;
     }

/*_________________________________________________*/

 // Task name12: Auto_CCIP_toggle
    // Priority: 12
    // Period: 200
    // WCET: 1
    // Inputs (1):
    //int Keyset_AUTO_CCIP_Toggle;

    // Outputs (1):
    //int DP_HUD_CCIP_Display_Message;

    // Functionality:
    void AUTO_CCIP_Toggle()
   {
     int temp;
     temp = Keyset_AUTO_CCIP_Toggle;
     DP_HUD_CCIP_Display_Message =temp;
     }

/*_____________________________________________*/

 // Task name13: Poll_RWR
    // Priority: 13
    // Period: 200
    // WCET: 3
    // Inputs (1):
    int RWR_Threat_Table; 
    // Outputs (4):
    int SMS_Stores_Select; 
    int SMS_Stores_Release; 
  //  int MPD_Threat_Warning; 
  //  int HUD_Threat_Warning;

    // Functionality:
    void poll_RWR()
   {
     int temp1, temp2;
     temp1 = RWR_Threat_Table;
     SMS_Stores_Select = temp1;
     SMS_Stores_Release = temp1;
     MPD_Threat_Warning = temp2;
     HUD_Threat_Warning = temp2;
     }

/*_____________________________________________*/

 //Task name14: Reinitiate_trajectory
    // Priority: 14
    // Period: 400
    // WCET:400 (6)
    // Inputs (2):
  //  int MPD_Weapon_Selected;
  //  int AG_Delivery_Mode_Selected;
    // Outputs (1):
  //  int AG_Weapon_Down_Range_Error; 
  //  int AG_Weapon_Cross_Range_Error;

    // Functionality:
    void reinitiate_trajectory()
   {
     int temp1, temp2;
     temp1 = MPD_Weapon_Selected;
     temp2 = AG_Delivery_Mode_Selected;

     AG_Weapon_Down_Range_Error = temp1; 
    AG_Weapon_Cross_Range_Error = temp2;
    }
     
/*_____________________________________________*/

 // Task name15: Periodic_BIT
    // Priority: 15
    // Period: 1000
    // WCET: 5
    // Inputs ():
    int Equipment_status_message;
    // Outputs (9):
    int MCC_Status;
    int ADC_Status; 
    int INS_Status; 
    int SMS_Status;
  //  int Radar_Status;
    int RWR_Status; 
    int RALT_Status;
    int DP_MPD_Error_Advisory_Message; 
    int DP_HUD_Error_Advisory_Message;

     // Functionality:
    void Periodic_BIT()
   {
     int temp1, temp2, temp3, temp4, temp5;
     temp4 = Equipment_status_message;

     MCC_Status = temp1;
     ADC_Status = temp2; 
     INS_Status = temp3; 
     SMS_Status = temp2;
     Radar_Status = temp4;
     RWR_Status = temp4; 
     RALT_Status = temp1;
     DP_MPD_Error_Advisory_Message = temp5; 
    DP_HUD_Error_Advisory_Message = temp5;
    }

/*_______________________________________________*/
void main() 
{
    create_task("Weapon_release","weapon_release",1,10,5.0);  
    create_task("Radar_tracking","radar_control",2,40,2.0);
    create_task("Target_tracking","target_tracking",3,40,4.0);
    create_task("Target_sweetening","target_sweetening",4,40,2.0);
    create_task("HOTAS_bomb_button","target_sweetening1",5,40,1.0);
    create_task("Aircraft_flight_data","aircraft_flight_data",6,55,8.0);
    create_task("HUD_display","HUD_display",7,52,6.0);
    create_task("MPD_tactical_display","MPD_tactical_display",8,50,8.0);
    create_task("Steering","steering",9,80,6.0);
    create_task("Weapon_trajectory","weapon_trajectory",10,100,7.0);
    create_task("Threat_response_display","threat_response_display",11,100,3.0);
    create_task("Auto_CCIP_toggle","AUTO_CCIP_Toggle",12,200,1.0);
    create_task("Poll_RWR","poll_RWR",13,100,3.0);
    create_task("Reinitiate_trajectory","reinitiate_trajectory",14,400,6.0);
    create_task("Periodic_BIT","Periodic_BIT",15,1000,5.0);
}


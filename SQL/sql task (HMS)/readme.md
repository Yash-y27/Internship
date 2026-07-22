# Hospital System Database 


# 1. Purpose of Each Table


 roles =>  Stores different user roles like Admin, Doctor, Receptionist and their permissions. 

 users =>  Stores system users who access the hospital application. 

 permissions => Stores available system permissions for authorization. 

 role_permissions =>  Creates a many-to-many relationship between roles and permissions.

 patients =>  Stores patient personal and medical identity information. 

 patient_addresses =>  Stores multiple addresses of patients. 

 insurance_policies =>  Stores patient insurance provider and policy details.

 departments => Stores hospital departments like Cardiology, Neurology, etc. 

 doctors =>  Stores doctor profile, qualification, department and availability information. 

 specializations => Stores medical specialization types. 

 doctor_specializations => Maps doctors with their multiple specializations. 

 doctor_schedules => Stores doctors' available working days and time slots. 

 appointments => Stores patient appointments with doctors. 

 appointment_status_history => Maintains appointment status change history for auditing. 

 room_types => Stores different room categories like ICU, General, Private. 

 rooms => Stores hospital room details and availability. 

 admissions => Stores patient hospital admission records. 

 medicines => Stores medicine inventory details including quantity and expiry. 

 prescriptions => Stores prescriptions created by doctors for patients. 

 prescription_items => Stores individual medicines included in a prescription. 

 bills => Stores patient billing information including consultation, medicine and room charges. 

 payments => Stores payment transactions against generated bills. 

 patient_ratings => Stores patient feedback and ratings for doctors. 

 patient_medical_records => Stores complete patient medical history references. 



# 2. Delete Behaviour Decisions (Task 5)

# CASCADE DELETE

Used when child records have no meaning without the parent.

Examples:

# Patient → Patient Addresses





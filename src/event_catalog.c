#include "events.h"

const event_def_t event_catalog[WORLD_EVENT_COUNT] = {
    /* 000: Emergency Blood Donor Rally */
    { "Emergency Blood Donor Rally", "Walk-in donors raise blood-route spread by 15% for 16 cycles.", {{1,12,15},{0,255,0}}, 8,0,255,16,1,0,255,7,0,0,255,0,255,255,255 },
    /* 001: Convention Hall Vent Fault */
    { "Convention Hall Vent Fault", "Stale air adds 15% to air travel and 10% to aerosol spread for 8 cycles.", {{2,255,15},{1,0,10}}, 8,0,255,8,7,0,255,7,0,0,255,0,255,255,255 },
    /* 002: Choir Tour Rehearsals */
    { "Choir Tour Rehearsals", "Shared warm-up rooms raise air travel by 20% and Air I spread by 15% for 16 cycles.", {{2,255,20},{1,0,15}}, 16,0,255,16,1,0,255,7,0,0,255,0,255,255,255 },
    /* 003: University Welcome Week */
    { "University Welcome Week", "Dormitory mixers add 15% to general spread in urban regions for 16 cycles.", {{1,255,15},{0,255,0}}, 8,0,255,16,7,0,255,7,0,0,255,0,255,255,255 },
    /* 004: Faith Hall Meal Line */
    { "Faith Hall Meal Line", "A shared meal queue raises Water I spread by 15% for 8 cycles in humid regions.", {{1,2,15},{0,255,0}}, 8,0,255,8,5,0,255,7,0,0,255,0,255,255,255 },
    /* 005: Marathon Aid Stations */
    { "Marathon Aid Stations", "Repeated handoffs add 10% to blood-route spread and 10% to air travel for 16 cycles.", {{1,12,10},{2,255,10}}, 8,0,255,16,1,0,10,7,0,0,255,0,255,255,255 },
    /* 006: Night Market Opening */
    { "Night Market Opening", "Open produce stalls raise Insects I spread by 15% and air travel by 10% for 16 cycles.", {{1,8,15},{2,255,10}}, 16,0,255,16,8,0,10,7,0,0,255,0,255,255,255 },
    /* 007: School Exam Assembly */
    { "School Exam Assembly", "Packed examination rooms add 10% to blood-route spread and 10% to discovery for 8 cycles.", {{1,12,10},{5,255,10}}, 8,0,255,8,1,0,255,7,5,0,255,0,255,255,255 },
    /* 008: Transit Union Rally */
    { "Transit Union Rally", "An indoor rally raises blood-route spread by 15% and air travel by 10% for 16 cycles.", {{1,12,15},{2,255,10}}, 8,0,255,16,7,1,255,7,0,0,255,0,255,255,255 },
    /* 009: Indoor Esports Final */
    { "Indoor Esports Final", "A packed arena adds 20% to air travel and 15% to Air I spread for 8 cycles.", {{2,255,20},{1,0,15}}, 8,0,255,8,7,0,255,2,0,0,255,0,255,255,255 },
    /* 010: New Regional Air Link */
    { "New Regional Air Link", "A new route raises air travel by 15% and air travel by 10% for 16 cycles.", {{2,255,15},{2,255,10}}, 16,1,255,16,11,0,10,7,0,0,255,0,255,255,255 },
    /* 011: Red-Eye Cabin Recirculation */
    { "Red-Eye Cabin Recirculation", "Long recirculation raises air travel by 20% and discovery by 10% for 16 cycles.", {{2,255,20},{5,255,10}}, 8,1,255,16,11,0,255,7,2,0,255,0,255,255,255 },
    /* 012: Sleeper Rail Through-Service */
    { "Sleeper Rail Through-Service", "Overnight rail links add 15% to blood-route spread and 10% to air travel for 16 cycles.", {{1,12,15},{2,255,10}}, 8,1,255,16,0,0,10,7,0,0,255,0,255,255,255 },
    /* 013: Coach Border Screening */
    { "Coach Border Screening", "A health checkpoint cuts air travel by 15% and adds 10% to discovery for 8 cycles.", {{2,255,-15},{5,255,10}}, 8,1,255,8,11,0,255,7,0,0,255,0,255,255,255 },
    /* 014: Crew Sick-Leave Roster */
    { "Crew Sick-Leave Roster", "Fewer available crew cut air travel by 15% for 16 cycles in active regions.", {{2,255,-15},{0,255,0}}, 8,1,255,16,11,0,255,7,2,0,255,0,255,255,255 },
    /* 015: Rural Mail Flight */
    { "Rural Mail Flight", "A chartered mail flight adds 15% to air travel and 10% to air travel for 8 cycles.", {{2,255,15},{2,255,10}}, 8,1,255,8,11,0,10,1,0,0,255,0,255,255,255 },
    /* 016: Student Exchange Charter */
    { "Student Exchange Charter", "An exchange charter raises air travel by 15% and blood-route spread by 10% for 16 cycles.", {{2,255,15},{1,12,10}}, 16,1,255,16,11,0,255,7,0,0,255,0,255,255,255 },
    /* 017: Relief Bus Convoy */
    { "Relief Bus Convoy", "Displaced passengers raise air travel by 20% and blood-route spread by 10% for 16 cycles.", {{2,255,20},{1,12,10}}, 8,1,255,16,1,0,10,7,0,0,255,0,255,255,255 },
    /* 018: Overnight Ferry Surge */
    { "Overnight Ferry Surge", "An overnight ferry raises sea travel by 20% and Water I spread by 15% for 16 cycles.", {{3,255,20},{1,2,15}}, 16,1,255,16,10,0,255,7,0,0,255,0,255,255,255 },
    /* 019: Airport Slot Pause */
    { "Airport Slot Pause", "A temporary slot freeze blocks air travel for 8 cycles and slows air travel by 10%.", {{7,255,1},{2,255,-10}}, 8,1,255,8,11,2,10,7,0,0,255,0,255,255,255 },
    /* 020: Container Hub Shift */
    { "Container Hub Shift", "A new transshipment shift raises sea travel by 20% and Water I spread by 15% for 16 cycles.", {{3,255,20},{1,2,15}}, 16,2,255,16,10,0,255,7,0,0,255,0,255,255,255 },
    /* 021: Reefer Door Failure */
    { "Reefer Door Failure", "A spoiled cargo transfer adds 10% to sea travel and Livestock I spread for 16 cycles.", {{3,255,10},{1,4,10}}, 8,2,255,16,10,0,255,7,0,0,255,0,255,255,255 },
    /* 022: Port Health Quarantine */
    { "Port Health Quarantine", "A dockside quarantine blocks sea travel for 8 cycles and lifts discovery by 15%.", {{8,255,1},{5,255,15}}, 8,2,255,8,10,0,255,7,0,0,255,0,255,255,255 },
    /* 023: Ballast Water Audit */
    { "Ballast Water Audit", "Sampling delays ships by 10% but improves discovery by 20% for 16 cycles.", {{3,255,-10},{5,255,20}}, 8,2,255,16,10,0,255,7,1,0,255,0,255,255,255 },
    /* 024: Cold-Chain Fish Auction */
    { "Cold-Chain Fish Auction", "A busy auction adds 15% to Water I spread and 10% to general spread for 8 cycles.", {{1,2,15},{1,255,10}}, 8,2,255,8,5,0,255,7,1,0,255,0,255,255,255 },
    /* 025: Deckhand Sick Roster */
    { "Deckhand Sick Roster", "Crew shortages reduce sea travel by 15% while blood-route spread rises 10% for 8 cycles.", {{3,255,-15},{1,12,10}}, 8,2,255,8,10,0,255,7,0,0,255,0,255,255,255 },
    /* 026: Canal Lock Closure */
    { "Canal Lock Closure", "A damaged lock blocks sea travel for 16 cycles and reduces local spread by 10%.", {{8,255,1},{1,255,-10}}, 8,2,255,16,10,2,10,7,0,0,255,0,255,255,255 },
    /* 027: Grain Hold Rodents */
    { "Grain Hold Rodents", "Rodent sightings raise Rodents I spread by 20% and sea travel by 10% for 16 cycles.", {{1,6,20},{3,255,10}}, 16,2,255,16,10,0,255,7,0,0,255,0,255,255,255 },
    /* 028: Inland Barge Relay */
    { "Inland Barge Relay", "A river-to-port relay raises sea travel by 10% and local spread by 15% for 16 cycles.", {{3,255,10},{1,255,15}}, 8,2,255,16,10,0,10,7,0,0,255,0,255,255,255 },
    /* 029: Customs Scanner Outage */
    { "Customs Scanner Outage", "A scanner outage raises sea travel by 15% and reduces discovery by 10% for 8 cycles.", {{3,255,15},{5,255,-10}}, 8,2,255,8,10,0,255,7,0,0,255,0,255,255,255 },
    /* 030: Monsoon Humidity Belt */
    { "Monsoon Humidity Belt", "Persistent rain raises Water I spread by 20% and local spread by 10% for 16 cycles.", {{1,2,20},{1,255,10}}, 16,3,255,16,5,0,10,7,0,0,255,0,255,255,255 },
    /* 031: Desert Dust Front */
    { "Desert Dust Front", "Dust cuts air travel by 15% but raises Insects I spread by 15% for 8 cycles.", {{2,255,-15},{1,8,15}}, 8,3,255,8,6,0,255,7,0,0,255,0,255,255,255 },
    /* 032: Heat Haze Corridor */
    { "Heat Haze Corridor", "Hot, dry conditions raise Insects I spread by 20% and lower air travel by 10% for 16 cycles.", {{1,8,20},{2,255,-10}}, 8,3,255,16,3,0,255,7,0,0,29,0,255,255,255 },
    /* 033: Highland Cold Snap */
    { "Highland Cold Snap", "A sudden cold snap cuts local spread by 15% and Livestock I spread by 10% for 8 cycles.", {{1,255,-15},{1,4,-10}}, 8,3,255,8,4,0,10,7,0,0,255,0,255,255,255 },
    /* 034: Coastal Fog Bank */
    { "Coastal Fog Bank", "Low visibility cuts air travel by 20% and blocks it for 8 cycles.", {{2,255,-20},{7,255,1}}, 8,3,255,8,11,0,255,7,0,0,255,0,255,255,255 },
    /* 035: Freeze-Thaw Runoff */
    { "Freeze-Thaw Runoff", "Runoff raises Water I spread by 15% and sea travel by 10% for 16 cycles.", {{1,2,15},{3,255,10}}, 8,3,255,16,5,0,255,7,0,0,255,0,255,255,255 },
    /* 036: Dry-Season Wind Shift */
    { "Dry-Season Wind Shift", "Trade winds raise air travel by 10% and Air I spread by 15% for 16 cycles.", {{2,255,10},{1,0,15}}, 16,3,255,16,6,0,255,7,0,0,255,0,255,255,255 },
    /* 037: Warm Wet Nights */
    { "Warm Wet Nights", "Warm nights raise Insects I spread by 20% and local spread by 10% for 16 cycles.", {{1,8,20},{1,255,10}}, 8,3,255,16,5,0,10,7,0,0,255,0,255,255,255 },
    /* 038: Snowbound Mountain Pass */
    { "Snowbound Mountain Pass", "Deep snow cuts local spread by 20% and general spread by 10% for 8 cycles.", {{1,255,-20},{1,255,-10}}, 8,3,255,8,4,0,10,7,0,0,255,0,255,255,255 },
    /* 039: Wildfire Smoke Plume */
    { "Wildfire Smoke Plume", "Where Air I is evolved, smoke raises aerosol spread by 10% and discovery by 10% for 8 cycles.", {{1,0,10},{5,255,10}}, 8,3,255,8,6,0,255,7,1,0,255,0,255,255,255 },
    /* 040: Chlorination Pump Failure */
    { "Chlorination Pump Failure", "Untreated mains raise Water I spread by 20% and discovery by 10% for 16 cycles.", {{1,2,20},{5,255,10}}, 8,4,255,16,5,0,255,7,0,0,255,0,255,255,255 },
    /* 041: Boil-Water Broadcast */
    { "Boil-Water Broadcast", "Household boiling cuts Water I spread by 20% and adds 10% to discovery for 8 cycles.", {{1,2,-20},{5,255,10}}, 8,4,255,8,5,0,255,7,0,0,255,0,255,255,255 },
    /* 042: Leaking Neighborhood Main */
    { "Leaking Neighborhood Main", "Pressure loss raises Water I and blood-route spread by 10% for 16 cycles.", {{1,2,10},{1,12,10}}, 8,4,255,16,7,0,255,7,1,0,255,0,255,255,255 },
    /* 043: Wastewater Bypass Release */
    { "Wastewater Bypass Release", "A bypass adds 15% to Water I spread while sewage sampling lifts discovery 10% for 8 cycles.", {{1,2,15},{5,255,10}}, 8,4,255,8,5,0,255,7,0,0,255,0,255,255,255 },
    /* 044: Mobile Test-Strip Drive */
    { "Mobile Test-Strip Drive", "Field water tests reduce Water I spread by 10% and increase discovery by 15% for 16 cycles.", {{1,2,-10},{5,255,15}}, 16,4,255,16,0,0,255,7,1,0,255,0,255,255,255 },
    /* 045: Rural Wellhead Repair */
    { "Rural Wellhead Repair", "A sealed well cuts Livestock I spread by 10% and Water I spread by 15% for 16 cycles.", {{1,4,-10},{1,2,-15}}, 8,4,255,16,8,0,255,7,0,0,255,0,255,255,255 },
    /* 046: Flooded Sewage Lift Station */
    { "Flooded Sewage Lift Station", "Overflow raises Water I spread by 15% and sea travel by 10% for 8 cycles.", {{1,2,15},{3,255,10}}, 8,4,255,8,5,0,255,7,0,1,255,0,255,255,255 },
    /* 047: Shared Tanker Contamination */
    { "Shared Tanker Contamination", "A contaminated tanker route raises Water I spread by 25% for 16 cycles.", {{1,2,25},{0,255,0}}, 8,4,255,16,8,0,255,7,0,0,255,0,255,255,255 },
    /* 048: Chlorine Delivery Strike */
    { "Chlorine Delivery Strike", "A supply stoppage raises Water I spread by 15% and lowers research by 10% for 16 cycles.", {{1,2,15},{6,255,-10}}, 8,4,255,16,0,1,255,7,0,0,255,0,255,255,255 },
    /* 049: Aquifer Lab Consortium */
    { "Aquifer Lab Consortium", "Well sampling boosts discovery before detection and improves cure research after trials begin for 16 cycles.", {{5,255,15},{6,255,10}}, 16,4,255,16,8,0,255,7,1,0,255,0,255,255,255 },
    /* 050: Mixed Herd Market Day */
    { "Mixed Herd Market Day", "Animal mixing raises Livestock I spread by 20% and local spread by 10% for 16 cycles.", {{1,4,20},{1,255,10}}, 8,5,255,16,8,0,10,7,0,0,255,0,255,255,255 },
    /* 051: Rookery Roost Expansion */
    { "Rookery Roost Expansion", "A larger seasonal roost adds 25% to bird migration for 16 cycles when Birds I is evolved.", {{4,255,25},{0,255,0}}, 16,5,255,16,0,0,10,7,0,0,255,0,255,255,255 },
    /* 052: Pig Barn Fan Failure */
    { "Pig Barn Fan Failure", "Poor ventilation raises Livestock I spread by 20% and air travel by 10% for 8 cycles.", {{1,4,20},{2,255,10}}, 8,5,255,8,8,0,255,7,1,0,255,0,255,255,255 },
    /* 053: Vector Hatch Cycle */
    { "Vector Hatch Cycle", "A warm hatch raises Insects I spread by 20% and local spread by 10% for 16 cycles.", {{1,8,20},{1,255,10}}, 8,5,255,16,3,0,10,7,0,0,29,0,255,255,255 },
    /* 054: Urban Rat Feeding Ban */
    { "Urban Rat Feeding Ban", "Sealed refuse cuts Rodents I spread by 20% and discovery rises 10% for 8 cycles.", {{1,6,-20},{5,255,10}}, 8,5,255,8,7,0,255,7,0,0,255,0,255,255,255 },
    /* 055: Wildlife Corridor Reopens */
    { "Wildlife Corridor Reopens", "A reopened corridor adds 15% to bird migration and 10% to Livestock I spread for 16 cycles.", {{4,255,15},{1,4,10}}, 8,5,255,16,8,0,10,7,0,0,255,0,255,255,255 },
    /* 056: Veterinary Vaccine Sweep */
    { "Veterinary Vaccine Sweep", "Animal testing cuts Livestock I spread by 15% and lifts discovery by 10% for 16 cycles.", {{1,4,-15},{5,255,10}}, 16,5,255,16,8,0,255,7,0,0,255,0,255,255,255 },
    /* 057: Poultry Transfer Pause */
    { "Poultry Transfer Pause", "A veterinary hold reduces local spread by 15% and blocks sea traffic for 8 cycles.", {{1,255,-15},{8,255,1}}, 8,5,255,8,10,1,10,7,0,0,255,0,255,255,255 },
    /* 058: Mosquito Net Rollout */
    { "Mosquito Net Rollout", "Net distribution cuts Insects I spread by 20% and raises discovery by 10% for 16 cycles.", {{1,8,-20},{5,255,10}}, 8,5,255,16,3,0,255,7,0,0,255,0,255,255,255 },
    /* 059: Grain Store Ratproofing */
    { "Grain Store Ratproofing", "Sealed feed cuts Rodents I spread by 20% and general spread by 10% for 16 cycles.", {{1,6,-20},{1,255,-10}}, 16,5,255,16,8,0,255,7,0,0,255,0,255,255,255 },
    /* 060: Clinic Triage Queue */
    { "Clinic Triage Queue", "Crowded intake raises blood-route spread by 15% and discovery by 10% for 8 cycles.", {{1,12,15},{5,255,10}}, 8,6,255,8,9,0,255,7,2,0,33,0,255,255,255 },
    /* 061: Sterile Pack Delay */
    { "Sterile Pack Delay", "A delayed supply raises blood-route spread by 20% for 16 cycles in strained care regions.", {{1,12,20},{0,255,0}}, 8,6,255,16,9,0,255,7,5,0,33,0,255,255,255 },
    /* 062: Lab Reagent Shortage */
    { "Lab Reagent Shortage", "Missing reagents slow discovery before detection and cure research once laboratory trials begin for 16 cycles.", {{5,255,-15},{6,255,-10}}, 8,6,255,16,9,0,255,7,0,0,255,0,255,255,255 },
    /* 063: Mobile Clinic Circuit */
    { "Mobile Clinic Circuit", "A traveling clinic lowers blood-route spread by 10% and raises discovery by 15% for 16 cycles.", {{1,12,-10},{5,255,15}}, 16,6,255,16,0,0,255,7,1,0,255,0,255,255,255 },
    /* 064: Ward Cohorting Protocol */
    { "Ward Cohorting Protocol", "Separating patients cuts blood-route spread by 15% and adds 10% to research for 16 cycles.", {{1,12,-15},{6,255,10}}, 8,6,255,16,9,1,255,7,0,0,255,0,255,255,255 },
    /* 065: Oxygen Hub Overload */
    { "Oxygen Hub Overload", "Overfilled treatment raises blood-route spread by 10% and discovery by 15% for 8 cycles.", {{1,12,10},{5,255,15}}, 8,6,255,8,9,0,255,7,0,2,33,0,255,255,255 },
    /* 066: Nurse Cross-Training */
    { "Nurse Cross-Training", "Cross-trained teams cut blood-route spread by 10% and add 15% to research for 16 cycles.", {{1,12,-10},{6,255,15}}, 16,6,255,16,9,1,255,7,0,0,255,0,255,255,255 },
    /* 067: Rural Ambulance Gap */
    { "Rural Ambulance Gap", "Long transfers raise blood-route spread by 15% and local spread by 10% for 16 cycles.", {{1,12,15},{1,255,10}}, 8,6,255,16,8,0,10,7,2,0,255,0,255,255,255 },
    /* 068: Protective Kit Shipment */
    { "Protective Kit Shipment", "A new protective-kit stock cuts blood-route spread by 20% for 16 cycles.", {{1,12,-20},{0,255,0}}, 8,6,255,16,9,1,255,7,0,0,255,0,255,255,255 },
    /* 069: Transfusion Trace Audit */
    { "Transfusion Trace Audit", "Donor tracing cuts blood-route spread by 15% and boosts discovery by 15% for 16 cycles.", {{1,12,-15},{5,255,15}}, 16,6,255,16,9,0,255,7,1,0,255,0,255,255,255 },
    /* 070: Bacterial Culture Exchange */
    { "Bacterial Culture Exchange", "Shared bacterial cultures accelerate regional cure research.", {{6,255,15},{0,255,0}}, 8,7,255,16,0,2,255,1,1,0,255,0,255,255,255 },
    /* 071: Viral Genome Review */
    { "Viral Genome Review", "New viral genome comparisons accelerate regional cure research.", {{6,255,15},{0,255,0}}, 8,7,255,16,0,2,255,2,0,0,255,0,255,255,255 },
    /* 072: Fungal Sample Backlog */
    { "Fungal Sample Backlog", "Slow fungal sample processing temporarily delays regional cure research.", {{6,255,-15},{0,255,0}}, 16,7,255,16,0,2,255,4,1,0,255,0,255,255,255 },
    /* 073: Field Cohort Consent */
    { "Field Cohort Consent", "A consenting study cohort raises blood-route spread by 10% and cure research by 15% once trials begin, for 8 cycles.", {{6,255,15},{1,12,10}}, 8,7,255,8,9,1,255,7,0,0,33,0,255,255,255 },
    /* 074: Assay Contamination Review */
    { "Assay Contamination Review", "Recalled assays slow discovery before detection and cure research after laboratory trials begin for 8 cycles.", {{5,255,-15},{6,255,-15}}, 8,7,255,8,0,0,255,7,0,0,255,0,255,255,255 },
    /* 075: Replication Protocol Release */
    { "Replication Protocol Release", "A replicated protocol speeds discovery before detection and cure research after trials begin for 16 cycles.", {{6,255,20},{5,255,10}}, 16,7,255,16,0,0,255,7,0,0,255,0,255,255,255 },
    /* 076: Sensitive Data Embargo */
    { "Sensitive Data Embargo", "An embargo slows discovery before detection and cure research after trials begin for 16 cycles.", {{6,255,-15},{5,255,-10}}, 8,7,255,16,0,0,255,7,0,0,255,0,255,255,255 },
    /* 077: Cross-Lab Proficiency Panel */
    { "Cross-Lab Proficiency Panel", "Common reference samples raise research by 20% for 16 cycles.", {{6,255,20},{0,255,0}}, 16,7,255,16,9,1,255,7,0,0,255,0,255,255,255 },
    /* 078: Research Server Outage */
    { "Research Server Outage", "A server outage slows cure research after trials begin and discovery before detection for 8 cycles.", {{6,255,-20},{5,255,-10}}, 8,7,255,8,9,0,255,7,0,0,255,0,255,255,255 },
    /* 079: Negative-Control Audit */
    { "Negative-Control Audit", "Control audits speed discovery before detection and cure research after trials begin for 16 cycles.", {{5,255,10},{6,255,15}}, 8,7,255,16,0,0,255,7,1,0,255,0,255,255,255 },
    /* 080: Mask Fit Campaign */
    { "Mask Fit Campaign", "Fit checks reduce Air I spread by 15% and discovery by 10% for 16 cycles.", {{1,0,-15},{5,255,-10}}, 8,8,255,16,7,0,255,7,0,0,255,0,255,255,255 },
    /* 081: Asymptomatic Rumor Wave */
    { "Asymptomatic Rumor Wave", "A rumor suppresses discovery by 15% while general spread rises 10% for 8 cycles.", {{5,255,-15},{1,255,10}}, 8,8,255,8,0,0,255,7,2,0,255,0,255,255,255 },
    /* 082: Work-From-Home Week */
    { "Work-From-Home Week", "Remote schedules lower general spread by 15% and local spread by 10% for 16 cycles.", {{1,255,-15},{1,255,-10}}, 8,8,255,16,7,1,10,7,0,0,255,0,255,255,255 },
    /* 083: Handwashing Pledge Drive */
    { "Handwashing Pledge Drive", "A public pledge cuts blood-route spread by 15% and raises discovery by 10% for 8 cycles.", {{1,12,-15},{5,255,10}}, 8,8,255,8,0,0,255,7,0,0,255,0,255,255,255 },
    /* 084: Funeral Attendance Surge */
    { "Funeral Attendance Surge", "Large memorial services raise general spread by 15% and discovery by 10% for 8 cycles.", {{1,255,15},{5,255,10}}, 8,8,255,8,1,0,255,7,0,1,255,0,255,255,255 },
    /* 085: Community Testing Week */
    { "Community Testing Week", "More voluntary testing raises discovery by 15% and lowers general spread by 10% for 16 cycles.", {{5,255,15},{1,255,-10}}, 8,8,255,16,0,0,255,7,1,0,255,0,255,255,255 },
    /* 086: School Door Closure */
    { "School Door Closure", "A temporary closure lowers general spread by 15% and adds 10% to discovery for 16 cycles.", {{1,255,-15},{5,255,10}}, 8,8,255,16,7,0,255,7,0,0,255,0,255,255,255 },
    /* 087: Cure Rumor Reversal */
    { "Cure Rumor Reversal", "A corrected rumor raises general spread by 10% and cure research by 10% once trials begin, for 8 cycles.", {{6,255,10},{1,255,10}}, 8,8,255,8,0,1,255,7,0,0,255,0,255,255,255 },
    /* 088: Volunteer Supply Drops */
    { "Volunteer Supply Drops", "Doorstep deliveries cut general spread by 10% and local spread by 10% for 16 cycles.", {{1,255,-10},{1,255,-10}}, 16,8,255,16,0,1,10,7,0,0,255,0,255,255,255 },
    /* 089: Compliance Fatigue Break */
    { "Compliance Fatigue Break", "A lull in precautions raises general spread by 15% and lowers research by 10% for 8 cycles.", {{1,255,15},{6,255,-10}}, 8,8,255,8,0,2,255,7,0,0,255,0,255,255,255 },
    /* 090: Regional Grid Brownout */
    { "Regional Grid Brownout", "A brownout slows air travel by 10% and research by 15% for 8 cycles.", {{2,255,-10},{6,255,-15}}, 8,9,255,8,11,1,255,7,0,0,255,0,255,255,255 },
    /* 091: Telecom Backbone Cut */
    { "Telecom Backbone Cut", "A severed network slows discovery before detection and cure research after trials begin for 16 cycles.", {{5,255,-15},{6,255,-10}}, 8,9,255,16,0,0,255,7,0,0,255,0,255,255,255 },
    /* 092: Cold-Store Warehouse Fault */
    { "Cold-Store Warehouse Fault", "A failed cold store raises Livestock I spread by 15% and sea travel by 10% for 16 cycles.", {{1,4,15},{3,255,10}}, 8,9,255,16,8,0,255,7,0,0,255,0,255,255,255 },
    /* 093: Water Pumping Blackout */
    { "Water Pumping Blackout", "A power cut raises Water I spread by 15% and lowers research by 10% for 8 cycles.", {{1,2,15},{6,255,-10}}, 8,9,255,8,5,1,255,7,0,0,255,0,255,255,255 },
    /* 094: Runway Resurfacing Window */
    { "Runway Resurfacing Window", "Runway works block air travel for 8 cycles and lower air travel by 10%.", {{7,255,1},{2,255,-10}}, 8,9,255,8,11,0,10,7,0,0,255,0,255,255,255 },
    /* 095: Bridge Washout Detour */
    { "Bridge Washout Detour", "A washed-out bridge cuts local spread by 20% and general spread by 10% for 8 cycles.", {{1,255,-20},{1,255,-10}}, 8,9,255,8,0,1,10,7,0,0,255,0,255,255,255 },
    /* 096: Port Crane Labor Strike */
    { "Port Crane Labor Strike", "Idle cranes block sea travel for 8 cycles and lower local spread by 10%.", {{8,255,1},{1,255,-10}}, 8,9,255,8,10,0,10,7,0,0,255,0,255,255,255 },
    /* 097: Cell Broadcast Alert */
    { "Cell Broadcast Alert", "A reliable emergency alert raises discovery by 20% and lowers general spread by 10% for 16 cycles.", {{5,255,20},{1,255,-10}}, 8,9,255,16,0,0,255,7,0,0,255,0,255,255,255 },
    /* 098: Grid Backup Generator */
    { "Grid Backup Generator", "Backup power improves cure research after trials begin and discovery before detection for 16 cycles.", {{6,255,15},{5,255,10}}, 8,9,255,16,9,0,255,7,0,0,255,0,255,255,255 },
    /* 099: Municipal Pressure Restore */
    { "Municipal Pressure Restore", "Stable mains cut Water I spread by 15% and lift discovery by 10% for 16 cycles.", {{1,2,-15},{5,255,10}}, 16,9,255,16,5,0,255,7,1,0,255,0,255,255,255 },
    /* 100: Games Delegations Arrive */
    { "Games Delegations Arrive", "International teams raise air travel by 15% and air travel by 10% for 16 cycles.", {{2,255,15},{2,255,10}}, 16,0,0,16,0,0,10,7,1,0,255,0,255,101,255 },
    /* 101: Games Entry Plan */
    { "Games Entry Plan", "Entry checks lower air travel by 10% while arena crowd plans are reviewed.", {{2,255,-10},{0,255,0}}, 16,0,0,16,0,0,255,7,1,0,255,2,255,102,103 },
    /* 102: Venue Air Plan */
    { "Venue Air Plan", "Distributed events cut Air I spread by 20% and air travel by 10% for 16 cycles.", {{1,0,-20},{2,255,-10}}, 16,0,0,16,7,1,255,7,0,0,255,0,255,104,255 },
    /* 103: Finals Crowd Surge */
    { "Finals Crowd Surge", "Sold-out finals raise blood-route spread by 15% and discovery by 10% for 16 cycles.", {{1,12,15},{5,255,10}}, 16,0,0,16,7,0,255,7,0,12,255,0,255,104,255 },
    /* 104: Athlete Village Dispersal */
    { "Athlete Village Dispersal", "Departing teams raise air travel by 10% for 16 cycles.", {{2,255,10},{0,255,0}}, 16,0,0,16,0,0,10,7,0,0,255,0,255,255,255 },
    /* 105: Festival Campgrounds Open */
    { "Festival Campgrounds Open", "Shared campground taps raise Water I spread by 15% and general spread by 10% for 16 cycles.", {{1,2,15},{1,255,10}}, 16,0,1,16,5,0,255,7,1,0,255,0,255,106,255 },
    /* 106: Festival Hygiene Drive */
    { "Festival Hygiene Drive", "Handwashing stations at food stalls cut general spread by 10% during the festival.", {{1,255,-10},{0,255,0}}, 16,0,1,16,5,0,255,7,1,0,255,1,8,107,108 },
    /* 107: Vector Screens Hold */
    { "Vector Screens Hold", "Larval screening cuts Insects I spread by 20% and air travel by 10% for 16 cycles.", {{1,8,-20},{1,255,-10}}, 16,0,1,16,3,1,10,7,8,8,255,0,255,109,255 },
    /* 108: Late-Night Stalls Expand */
    { "Late-Night Stalls Expand", "Unscreened stalls raise Insects I spread by 20% and general spread by 10% for 16 cycles.", {{1,8,20},{1,255,10}}, 16,0,1,16,3,1,255,7,8,8,29,0,255,109,255 },
    /* 109: Festival Routes Clear */
    { "Festival Routes Clear", "Crowd dispersal adds 10% to air travel for 16 cycles.", {{2,255,10},{0,255,0}}, 16,0,1,16,0,0,10,7,0,0,255,0,255,255,255 },
    /* 110: Open Cure Notebook */
    { "Open Cure Notebook", "Shared case notes speed discovery before detection and cure research once trials begin for 16 cycles.", {{6,255,15},{5,255,10}}, 16,7,2,16,0,0,255,7,1,0,35,0,255,111,255 },
    /* 111: Shared Cure Data Review */
    { "Shared Cure Data Review", "Researchers compare case notes, raising cure research by 10% once research is active.", {{6,255,10},{0,255,0}}, 16,7,2,16,0,2,255,7,1,0,35,5,255,112,113 },
    /* 112: Replicated Cure Leads */
    { "Replicated Cure Leads", "Replicated findings raise research by 20% for 16 cycles.", {{6,255,20},{0,255,0}}, 16,7,2,16,0,1,255,7,1,0,35,0,255,114,255 },
    /* 113: Unvetted Cure Recipes */
    { "Unvetted Cure Recipes", "Unverified recipes slow discovery before detection and cure research after trials begin for 16 cycles.", {{6,255,-20},{5,255,-10}}, 16,7,2,16,0,0,255,7,1,0,35,0,255,114,255 },
    /* 114: Clinical Notes Consolidated */
    { "Clinical Notes Consolidated", "A consolidated protocol raises research by 10% for 16 cycles.", {{6,255,10},{0,255,0}}, 16,7,2,16,0,1,255,7,0,0,35,0,255,255,255 },
    /* 115: First Clinic Cluster */
    { "First Clinic Cluster", "A traceable clinic cluster raises discovery by 20% and blood-route spread by 10% for 16 cycles.", {{5,255,20},{1,12,10}}, 16,6,3,16,9,0,255,7,1,0,33,0,255,116,255 },
    /* 116: Spaced Contact Interviews */
    { "Spaced Contact Interviews", "Separated interview rooms cut general spread by 10% while contact tracing expands.", {{1,255,-10},{0,255,0}}, 16,6,3,16,9,0,255,7,1,0,255,2,255,117,118 },
    /* 117: Contact Trace Starts Early */
    { "Contact Trace Starts Early", "Confirmed contacts focus regional research and reduce local spread while clinics trace the first infection.", {{6,255,20},{1,255,-10}}, 16,6,3,16,9,0,255,7,1,0,255,0,255,119,255 },
    /* 118: Contact Trace Arrives Late */
    { "Contact Trace Arrives Late", "Delayed contact tracing allows local spread; investigators still contribute to regional cure research.", {{1,255,10},{6,255,10}}, 16,6,3,16,9,0,255,7,1,0,33,0,255,119,255 },
    /* 119: Clinic Register Reconciled */
    { "Clinic Register Reconciled", "Updated records help trace infections and support regional cure research while this response is active.", {{5,255,10},{6,255,10}}, 16,6,3,16,9,0,255,7,0,0,255,0,255,255,255 },
    /* 120: Terminal Filter Inspection */
    { "Terminal Filter Inspection", "A filter inspection raises discovery by 10% and cuts air travel by 10% for 16 cycles.", {{5,255,10},{2,255,-10}}, 16,9,4,16,11,0,255,7,1,0,0,0,255,121,255 },
    /* 121: Terminal Filter Sweep */
    { "Terminal Filter Sweep", "The airport filter sweep cuts air travel by 10% during the sanitation check.", {{2,255,-10},{0,255,0}}, 16,9,4,16,11,0,255,7,1,0,0,1,0,122,123 },
    /* 122: Filter Stock Reaches Hubs */
    { "Filter Stock Reaches Hubs", "Working filters cut Air I spread by 20% and air travel by 10% for 16 cycles.", {{1,0,-20},{2,255,-10}}, 16,9,4,16,11,1,255,7,0,0,0,0,255,124,255 },
    /* 123: Ventilation Ducts Stay Open */
    { "Ventilation Ducts Stay Open", "Unfiltered ducts raise Air I spread by 15% and air travel by 10% for 16 cycles.", {{1,0,15},{2,255,10}}, 16,9,4,16,11,1,255,7,0,0,255,0,255,124,255 },
    /* 124: Airflow Audit Closes */
    { "Airflow Audit Closes", "Updated records help trace infections and support regional cure research while this response is active.", {{5,255,10},{6,255,10}}, 16,9,4,16,11,0,255,7,0,0,0,0,255,255,255 },
    /* 125: Harbor Discharge Sampling */
    { "Harbor Discharge Sampling", "Harbor sampling raises discovery by 10% and Water I spread by 10% for 16 cycles.", {{5,255,10},{1,2,10}}, 16,2,5,16,10,0,255,7,1,0,255,0,255,126,255 },
    /* 126: Ballast Sample Hold */
    { "Ballast Sample Hold", "Sampling delays lower sea travel by 10% while untreated ballast is checked.", {{3,255,-10},{0,255,0}}, 16,2,5,16,10,0,255,7,1,0,2,1,2,127,128 },
    /* 127: Ballast Treatment Holds */
    { "Ballast Treatment Holds", "Treatment cuts Water I spread by 20% and sea travel by 10% for 16 cycles.", {{1,2,-20},{3,255,-10}}, 16,2,5,16,10,1,255,7,2,2,2,0,255,129,255 },
    /* 128: Untreated Ballast Release */
    { "Untreated Ballast Release", "Untreated discharge raises Water I spread by 20% and sea travel by 10% for 16 cycles.", {{1,2,20},{3,255,10}}, 16,2,5,16,10,1,255,7,2,2,255,0,255,129,255 },
    /* 129: Harbor Water Recheck */
    { "Harbor Water Recheck", "Updated records help trace infections and support regional cure research while this response is active.", {{5,255,10},{6,255,10}}, 16,2,5,16,10,0,255,7,0,0,2,0,255,255,255 },
    /* 130: Seasonal Flyway Opens */
    { "Seasonal Flyway Opens", "A seasonal flyway raises bird migration by 20% for 16 cycles when Birds I is evolved.", {{4,255,20},{0,255,0}}, 16,5,6,16,0,0,10,7,1,0,255,0,255,131,255 },
    /* 131: Flyway Watch Teams */
    { "Flyway Watch Teams", "Watch teams cut bird bird migration by 10% as seasonal counts are compared.", {{4,255,-10},{0,255,0}}, 16,5,6,16,0,0,10,7,1,0,255,3,255,132,133 },
    /* 132: Rest Stop Route Thins */
    { "Rest Stop Route Thins", "Loss of a roost cuts bird migration by 25% for 16 cycles when Birds I is evolved.", {{4,255,-25},{0,255,0}}, 16,5,6,16,0,1,10,7,0,25,255,0,255,134,255 },
    /* 133: Wetland Rest Stops Fill */
    { "Wetland Rest Stops Fill", "Busy roosts raise bird migration by 25% for 16 cycles when Birds I is evolved.", {{4,255,25},{0,255,0}}, 16,5,6,16,0,1,10,7,0,25,255,0,255,134,255 },
    /* 134: Flyway Traffic Settles */
    { "Flyway Traffic Settles", "Migration remains 10% higher as seasonal bird routes finish for 16 cycles.", {{4,255,10},{0,255,0}}, 16,5,6,16,0,0,10,7,0,0,255,0,255,255,255 },
    /* 135: Mixed Herd Auction */
    { "Mixed Herd Auction", "Mixed pens raise Livestock I spread by 20% and local spread by 10% for 16 cycles.", {{1,4,20},{1,255,10}}, 16,5,7,16,8,0,10,7,1,0,255,0,255,136,255 },
    /* 136: Livestock Gate Checks */
    { "Livestock Gate Checks", "Gate checks cut Livestock I spread by 10% before herd movement is reviewed.", {{1,4,-10},{0,255,0}}, 16,5,7,16,8,0,255,7,1,0,255,2,255,137,138 },
    /* 137: Farm Gate Biosecurity */
    { "Farm Gate Biosecurity", "Owned livestock controls cut Livestock I spread by 20% and raise discovery by 10% for 16 cycles.", {{1,4,-20},{5,255,10}}, 16,5,7,16,8,0,255,7,4,4,255,0,255,139,255 },
    /* 138: Auction Pens Remain Mixed */
    { "Auction Pens Remain Mixed", "Unscreened pens raise Livestock I spread by 20% and local spread by 10% for 16 cycles.", {{1,4,20},{1,255,10}}, 16,5,7,16,8,1,10,7,4,4,255,0,255,139,255 },
    /* 139: Herd Movement Register */
    { "Herd Movement Register", "Updated records help trace infections and support regional cure research while this response is active.", {{5,255,10},{6,255,10}}, 16,5,7,16,8,0,255,7,0,0,255,0,255,255,255 },
    /* 140: Warm-Season Hatch */
    { "Warm-Season Hatch", "A warm hatch raises Insects I spread by 20% and local spread by 10% for 16 cycles.", {{1,8,20},{1,255,10}}, 16,5,8,16,3,0,10,7,1,0,29,0,255,141,255 },
    /* 141: Vector Mapping Sweep */
    { "Vector Mapping Sweep", "Mapped breeding sites cut Insects I spread by 10% during the survey.", {{1,8,-10},{0,255,0}}, 16,5,8,16,3,0,255,7,1,0,255,2,255,142,143 },
    /* 142: Larvicide Grid Covers Town */
    { "Larvicide Grid Covers Town", "Owned insect controls cut Insects I spread by 20% and local spread by 10% for 16 cycles.", {{1,8,-20},{1,255,-10}}, 16,5,8,16,3,1,10,7,8,8,255,0,255,144,255 },
    /* 143: Unmapped Ponds Breed Vectors */
    { "Unmapped Ponds Breed Vectors", "Untreated ponds raise Insects I spread by 20% and general spread by 10% for 16 cycles.", {{1,8,20},{1,255,10}}, 16,5,8,16,3,1,255,7,8,8,29,0,255,144,255 },
    /* 144: Vector Survey Repeats */
    { "Vector Survey Repeats", "Updated records help trace infections and support regional cure research while this response is active.", {{5,255,10},{6,255,10}}, 16,5,8,16,3,0,255,7,0,0,255,0,255,255,255 },
    /* 145: Market Grain Spill */
    { "Market Grain Spill", "Loose grain raises Rodents I spread by 20% and general spread by 10% for 16 cycles.", {{1,6,20},{1,255,10}}, 16,5,9,16,7,0,255,7,1,0,255,0,255,146,255 },
    /* 146: Night Refuse Pickup */
    { "Night Refuse Pickup", "Night refuse pickup cuts general spread by 10% while rodent access is assessed.", {{1,255,-10},{0,255,0}}, 16,5,9,16,7,0,255,7,1,0,255,4,255,147,148 },
    /* 147: Waste Bins Seal */
    { "Waste Bins Seal", "A well-adopted cleanup cuts Rodents I spread by 20% and general spread by 10% for 16 cycles.", {{1,6,-20},{1,255,-10}}, 16,5,9,16,7,1,255,7,0,50,255,0,255,149,255 },
    /* 148: Alleys Stay Accessible */
    { "Alleys Stay Accessible", "Dense activity leaves Rodents I spread 20% higher and discovery 10% lower for 16 cycles.", {{1,6,20},{5,255,-10}}, 16,5,9,16,7,0,255,7,0,50,255,0,255,149,255 },
    /* 149: Night Traps Reset */
    { "Night Traps Reset", "Continued trapping cuts Rodents I spread by 10% for 16 cycles.", {{1,6,-10},{0,255,0}}, 16,5,9,16,7,0,255,7,0,0,255,0,255,255,255 },
    /* 150: River Gauge Overtops */
    { "River Gauge Overtops", "Flooded wells strengthen Water transmission while damaged laboratories slow regional cure research.", {{1,2,20},{6,255,-15}}, 16,4,10,16,5,0,255,7,1,0,255,0,255,151,255 },
    /* 151: Floodwater Intake Watch */
    { "Floodwater Intake Watch", "Temporary intake controls cut sea travel by 10% while floodwater is sampled.", {{3,255,-10},{0,255,0}}, 16,4,10,16,5,0,255,7,1,0,255,3,255,152,153 },
    /* 152: Water Test Teams Arrive */
    { "Water Test Teams Arrive", "A high death toll brings tests that cut Water I spread by 20% and lift discovery by 15% for 16 cycles.", {{1,2,-20},{5,255,15}}, 16,4,10,16,5,0,255,7,0,25,255,0,255,154,255 },
    /* 153: Lowland Wells Stay Submerged */
    { "Lowland Wells Stay Submerged", "Submerged wells raise Water I spread by 25% and lower discovery by 10% for 16 cycles.", {{1,2,25},{5,255,-10}}, 16,4,10,16,5,0,255,7,0,25,255,0,255,154,255 },
    /* 154: Pumps Drain Floodplain */
    { "Pumps Drain Floodplain", "Recovery pumping cuts Water I spread by 10% and raises research by 10% for 16 cycles.", {{1,2,-10},{6,255,10}}, 16,4,10,16,5,1,255,7,0,0,255,0,255,255,255 },
    /* 155: Seismic Lab Shutdown */
    { "Seismic Lab Shutdown", "Shaken labs lower research by 15% while local spread rises 10% for 16 cycles.", {{6,255,-15},{1,255,10}}, 16,9,11,16,0,2,10,7,1,0,255,0,255,156,255 },
    /* 156: Emergency Lab Relay */
    { "Emergency Lab Relay", "A portable lab relay raises cure research by 10% once research is active.", {{6,255,10},{0,255,0}}, 16,9,11,16,0,2,255,7,1,0,255,2,255,157,158 },
    /* 157: Backup Lab Network Restored */
    { "Backup Lab Network Restored", "A coordinated rebuild speeds cure research after trials begin and discovery before detection for 16 cycles.", {{6,255,20},{5,255,10}}, 16,9,11,16,0,0,255,7,1,0,255,0,255,159,255 },
    /* 158: Power Relays Remain Damaged */
    { "Power Relays Remain Damaged", "Ongoing outages slow cure research after trials begin and discovery before detection for 16 cycles.", {{6,255,-20},{5,255,-10}}, 16,9,11,16,0,0,255,7,1,0,255,0,255,159,255 },
    /* 159: Sample Freezers Rechecked */
    { "Sample Freezers Rechecked", "Updated records help trace infections and support regional cure research while this response is active.", {{5,255,10},{6,255,10}}, 16,9,11,16,9,0,255,7,0,0,255,0,255,255,255 },
    /* 160: Storm Surge Reaches Docks */
    { "Storm Surge Reaches Docks", "Surge water raises Water I spread by 15% and cuts sea travel by 10% for 16 cycles.", {{1,2,15},{3,255,-10}}, 16,3,12,16,10,0,255,7,1,0,255,0,255,161,255 },
    /* 161: Harbor Closure Review */
    { "Harbor Closure Review", "A harbor review cuts sea travel by 10% as crews test the disinfection plan.", {{3,255,-10},{0,255,0}}, 16,3,12,16,10,0,255,7,1,0,255,1,2,162,163 },
    /* 162: Harbor Disinfection Crews */
    { "Harbor Disinfection Crews", "Treatment cuts Water I spread by 20% and restores sea travel by 10% for 16 cycles.", {{1,2,-20},{3,255,10}}, 16,3,12,16,10,1,255,7,2,2,255,0,255,164,255 },
    /* 163: Harbor Closure Persists */
    { "Harbor Closure Persists", "An unsafe harbor blocks sea travel for 16 cycles and raises discovery by 10%.", {{8,255,1},{5,255,10}}, 16,3,12,16,10,0,255,7,2,2,255,0,255,164,255 },
    /* 164: Coastal Intake Reopens */
    { "Coastal Intake Reopens", "Follow-up samples cut Water I spread by 10% and raise discovery by 10% for 16 cycles.", {{1,2,-10},{5,255,10}}, 16,3,12,16,10,0,255,7,0,0,255,0,255,255,255 },
    /* 165: Heatwave Shelter Demand */
    { "Heatwave Shelter Demand", "Heat conditions reduce local spread by 20%. Matching adaptation halves this temporary penalty.", {{1,255,-20},{0,255,0}}, 16,3,13,16,3,0,255,7,1,0,29,0,255,166,255 },
    /* 166: Cooling Center Check-In */
    { "Cooling Center Check-In", "Heat conditions reduce local spread by 25%. Matching adaptation halves this temporary penalty.", {{1,255,-25},{0,255,0}}, 16,3,13,16,3,0,255,7,1,0,29,1,29,167,168 },
    /* 167: Cooling Halls Relieve Crowding */
    { "Cooling Halls Relieve Crowding", "Heat conditions reduce local spread by 10%. Matching adaptation halves this temporary penalty.", {{1,255,-10},{0,255,0}}, 16,3,13,16,3,1,10,7,0,0,29,0,255,169,255 },
    /* 168: Night Cooling Fails */
    { "Night Cooling Fails", "Heat conditions reduce local spread by 30%. Matching adaptation halves this temporary penalty.", {{1,255,-30},{0,255,0}}, 16,3,13,16,3,1,255,7,8,0,29,0,255,169,255 },
    /* 169: Heat Clinics Keep Hours */
    { "Heat Clinics Keep Hours", "Heat conditions reduce local spread by 10%. Matching adaptation halves this temporary penalty.", {{1,255,-10},{0,255,0}}, 16,3,13,16,9,0,255,7,0,0,29,0,255,255,255 },
    /* 170: Winter Shelter Census */
    { "Winter Shelter Census", "Cold conditions reduce local spread by 20%. Matching adaptation halves this temporary penalty.", {{1,255,-20},{0,255,0}}, 16,3,14,16,4,0,255,7,1,0,31,0,255,171,255 },
    /* 171: Winter Shelter Roster */
    { "Winter Shelter Roster", "Cold conditions reduce local spread by 25%. Matching adaptation halves this temporary penalty.", {{1,255,-25},{0,255,0}}, 16,3,14,16,4,0,255,7,1,0,31,1,31,172,173 },
    /* 172: Cold-Weather Clinics Open */
    { "Cold-Weather Clinics Open", "Cold conditions reduce local spread by 10%. Matching adaptation halves this temporary penalty.", {{1,255,-10},{0,255,0}}, 16,3,14,16,9,0,255,7,1,0,31,0,255,174,255 },
    /* 173: Shelter Intake Overflows */
    { "Shelter Intake Overflows", "Cold conditions reduce local spread by 30%. Matching adaptation halves this temporary penalty.", {{1,255,-30},{0,255,0}}, 16,3,14,16,9,0,255,7,1,0,31,0,255,174,255 },
    /* 174: Spring Ventilation Checks */
    { "Spring Ventilation Checks", "Cold conditions reduce local spread by 10%. Matching adaptation halves this temporary penalty.", {{1,255,-10},{0,255,0}}, 16,3,14,16,4,0,255,7,0,0,31,0,255,255,255 },
    /* 175: Reservoir Allocation Tightens */
    { "Reservoir Allocation Tightens", "Water shortages raise Water I spread by 10% and lower discovery by 10% for 16 cycles.", {{1,2,10},{5,255,-10}}, 16,4,15,16,6,0,255,7,1,0,255,0,255,176,255 },
    /* 176: Water Queue Testing */
    { "Water Queue Testing", "Shared tanker queues raise general spread by 10% before drought water tests begin.", {{1,255,10},{0,255,0}}, 16,4,15,16,6,0,255,7,1,0,255,4,255,177,178 },
    /* 177: Rural Tankers Are Tested */
    { "Rural Tankers Are Tested", "Testing cuts Water I spread by 15% and lifts discovery by 15% for 16 cycles.", {{1,2,-15},{5,255,15}}, 16,4,15,16,8,0,255,7,0,50,255,0,255,179,255 },
    /* 178: Unsealed Tanker Stops */
    { "Unsealed Tanker Stops", "Untested deliveries raise Water I spread by 20% and general spread by 10% for 16 cycles.", {{1,2,20},{1,255,10}}, 16,4,15,16,8,1,255,7,0,50,255,0,255,179,255 },
    /* 179: Reservoir Sampling Resumes */
    { "Reservoir Sampling Resumes", "Updated records help trace infections and support regional cure research while this response is active.", {{5,255,10},{6,255,10}}, 16,4,15,16,6,0,255,7,0,0,255,0,255,255,255 },
    /* 180: Ward Beds Reach Capacity */
    { "Ward Beds Reach Capacity", "Overfull wards raise blood-route spread by 15% and discovery by 10% for 16 cycles.", {{1,12,15},{5,255,10}}, 16,6,16,16,9,0,255,7,1,0,33,0,255,181,255 },
    /* 181: Overflow Ward Cohorting */
    { "Overflow Ward Cohorting", "Ward cohorting cuts blood-route spread by 10% during the capacity review.", {{1,12,-10},{0,255,0}}, 16,6,16,16,9,0,255,7,1,0,255,3,255,182,183 },
    /* 182: Regional Staff Pool Arrives */
    { "Regional Staff Pool Arrives", "Staffing support cuts blood-route spread by 20% and boosts research by 10% for 16 cycles.", {{1,12,-20},{6,255,10}}, 16,6,16,16,9,1,255,7,1,25,255,0,255,184,255 },
    /* 183: Transfers Queue at Triage */
    { "Transfers Queue at Triage", "Transfer queues raise blood-route spread by 20% and lower research by 10% for 16 cycles.", {{1,12,20},{6,255,-10}}, 16,6,16,16,9,1,255,7,1,25,33,0,255,184,255 },
    /* 184: Discharge Reviews Resume */
    { "Discharge Reviews Resume", "Care reviews cut blood-route spread by 10% and raise discovery by 10% for 16 cycles.", {{1,12,-10},{5,255,10}}, 16,6,16,16,9,0,255,7,0,0,255,0,255,255,255 },
    /* 185: Joint Genome Desk Opens */
    { "Joint Genome Desk Opens", "A shared genome desk speeds discovery before detection and cure research after trials begin for 16 cycles.", {{5,255,15},{6,255,10}}, 16,7,17,16,0,0,255,7,1,0,255,0,255,186,255 },
    /* 186: Coalition Assay Exchange */
    { "Coalition Assay Exchange", "Shared assay notes raise cure research by 10% as laboratories align results.", {{6,255,10},{0,255,0}}, 16,7,17,16,0,2,255,7,1,0,255,1,35,187,188 },
    /* 187: Hardening Data Is Shared */
    { "Hardening Data Is Shared", "A coalition overcomes hardening, lifting research by 20% for 16 cycles.", {{6,255,20},{0,255,0}}, 16,7,17,16,0,1,255,7,1,35,255,0,255,189,255 },
    /* 188: Separate Assay Queues Persist */
    { "Separate Assay Queues Persist", "Separate assay queues slow cure research after trials begin and discovery before detection for 16 cycles.", {{6,255,-15},{5,255,-10}}, 16,7,17,16,0,0,255,7,1,35,255,0,255,189,255 },
    /* 189: Shared Reagent Ledger */
    { "Shared Reagent Ledger", "Joint procurement raises research by 10% for 16 cycles.", {{6,255,10},{0,255,0}}, 16,7,17,16,0,1,255,7,0,0,255,0,255,255,255 },
    /* 190: Daily Case Board Launches */
    { "Daily Case Board Launches", "Clear case counts improve discovery before detection and cure research once trials begin for 16 cycles.", {{5,255,10},{6,255,10}}, 16,8,18,16,0,0,255,7,1,0,255,0,255,191,255 },
    /* 191: Daily Briefing Schedule */
    { "Daily Briefing Schedule", "Regular briefings cut general spread by 10% as case information is checked.", {{1,255,-10},{0,255,0}}, 16,8,18,16,0,0,255,7,1,0,255,5,255,192,193 },
    /* 192: Trusted Briefings Continue */
    { "Trusted Briefings Continue", "Credible progress raises research by 15% and lowers general spread by 10% for 16 cycles.", {{6,255,15},{1,255,-10}}, 16,8,18,16,0,1,255,7,1,0,255,0,255,194,255 },
    /* 193: Unclear Results Erode Trust */
    { "Unclear Results Erode Trust", "Mixed results lower research by 15% and raise general spread by 10% for 16 cycles.", {{6,255,-15},{1,255,10}}, 16,8,18,16,0,1,255,7,1,0,255,0,255,194,255 },
    /* 194: Community Questions Answered */
    { "Community Questions Answered", "Updated records help trace infections and support regional cure research while this response is active.", {{5,255,10},{6,255,10}}, 16,8,18,16,0,0,255,7,0,0,255,0,255,255,255 },
    /* 195: National Response Desk Opens */
    { "National Response Desk Opens", "A central desk improves discovery before detection and cure research after trials begin for 16 cycles.", {{5,255,15},{6,255,10}}, 16,9,19,16,0,0,255,7,1,0,255,0,255,196,255 },
    /* 196: Emergency Air Order */
    { "Emergency Air Order", "A temporary air order lowers air travel by 10% while national rules are coordinated.", {{2,255,-10},{0,255,0}}, 16,9,19,16,0,0,255,7,1,0,255,6,255,197,198 },
    /* 197: Escalated Travel Order */
    { "Escalated Travel Order", "A coordinated order blocks air travel for 16 cycles and cuts general spread by 15%.", {{7,255,1},{1,255,-15}}, 16,9,19,16,11,1,255,7,2,0,255,0,255,199,255 },
    /* 198: Local Rules Conflict */
    { "Local Rules Conflict", "Conflicting orders raise general spread by 15% and lower discovery by 10% for 16 cycles.", {{1,255,15},{5,255,-10}}, 16,9,19,16,0,0,255,7,1,0,255,0,255,199,255 },
    /* 199: Emergency Powers Reviewed */
    { "Emergency Powers Reviewed", "A review raises research by 10% and lowers general spread by 10% for 16 cycles.", {{6,255,10},{1,255,-10}}, 16,9,19,16,0,1,255,7,0,0,255,0,255,255,255 },
};

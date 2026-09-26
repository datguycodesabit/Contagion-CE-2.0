# World Events Catalog

This reference is generated from data/events.json. The calculator compiles the checked-in C table; normal builds do not run Python.

Events begin after the 24-cycle opening grace period. Standalone events last 8, 16, or 24 cycles; storyline stages last 16 cycles. Each event ID can occur once per run. A chain keeps its selected region throughout its selected path of four stages, and its two outcomes join at the aftermath.

Spread, travel, and migration modifiers stack additively and are bounded to 50–150% of the normal value. Regional discovery/research contributions are weighted by regional land. Discovery and research modifiers are bounded to 75–125%. Zero baseline transmission remains zero. Route closures are temporary and do not reopen a permanent closure; human travel restrictions do not block bird migration.

Trait gate means the disease must own that trait to start the event. Target describes the region filter used for selection. In a storyline, the onset chooses a region and subsequent stages retain it. Research effects apply once cure research has begun; Discovery effects apply before detection.

## Standalone events

The first 100 entries are ten events in each topic.

| ID | Topic | Headline | Explanation | Start eligibility | Duration | Effect |
|---:|---|---|---|---|---:|---|
| 0 | Public gatherings | Emergency Blood Donor Rally | Walk-in donors raise blood-route spread by 15% for 16 cycles. | cycle 8+, active cases, response undetected+ | 16 | Blood I spread +15% |
| 1 | Public gatherings | Convention Hall Vent Fault | Stale air adds 15% to air travel and 10% to aerosol spread for 8 cycles. | cycle 8+, urban region, response undetected+ | 8 | air travel +15%; Air I spread +10% |
| 2 | Public gatherings | Choir Tour Rehearsals | Shared warm-up rooms raise air travel by 20% and Air I spread by 15% for 16 cycles. | cycle 16+, active cases, response undetected+ | 16 | air travel +20%; Air I spread +15% |
| 3 | Public gatherings | University Welcome Week | Dormitory mixers add 15% to general spread in urban regions for 16 cycles. | cycle 8+, urban region, response undetected+ | 16 | spread +15% |
| 4 | Public gatherings | Faith Hall Meal Line | A shared meal queue raises Water I spread by 15% for 8 cycles in humid regions. | cycle 8+, humid region, response undetected+ | 8 | Water I spread +15% |
| 5 | Public gatherings | Marathon Aid Stations | Repeated handoffs add 10% to blood-route spread and 10% to air travel for 16 cycles. | cycle 8+, active cases, response undetected+, owns Birds I | 16 | Blood I spread +10%; air travel +10% |
| 6 | Public gatherings | Night Market Opening | Open produce stalls raise Insects I spread by 15% and air travel by 10% for 16 cycles. | cycle 16+, rural region, response undetected+, owns Birds I | 16 | Insects I spread +15%; air travel +10% |
| 7 | Public gatherings | School Exam Assembly | Packed examination rooms add 10% to blood-route spread and 10% to discovery for 8 cycles. | cycle 8+, active cases, response undetected+, active >= 5% | 8 | Blood I spread +10%; discovery pressure +10% |
| 8 | Public gatherings | Transit Union Rally | An indoor rally raises blood-route spread by 15% and air travel by 10% for 16 cycles. | cycle 8+, urban region, response discovered+ | 16 | Blood I spread +15%; air travel +10% |
| 9 | Public gatherings | Indoor Esports Final | A packed arena adds 20% to air travel and 15% to Air I spread for 8 cycles. | cycle 8+, urban region, response undetected+, type: virus | 8 | air travel +20%; Air I spread +15% |
| 10 | Passenger travel | New Regional Air Link | A new route raises air travel by 15% and air travel by 10% for 16 cycles. | cycle 16+, airport, response undetected+, owns Birds I | 16 | air travel +15%; air travel +10% |
| 11 | Passenger travel | Red-Eye Cabin Recirculation | Long recirculation raises air travel by 20% and discovery by 10% for 16 cycles. | cycle 8+, airport, response undetected+, active >= 2% | 16 | air travel +20%; discovery pressure +10% |
| 12 | Passenger travel | Sleeper Rail Through-Service | Overnight rail links add 15% to blood-route spread and 10% to air travel for 16 cycles. | cycle 8+, any living region, response undetected+, owns Birds I | 16 | Blood I spread +15%; air travel +10% |
| 13 | Passenger travel | Coach Border Screening | A health checkpoint cuts air travel by 15% and adds 10% to discovery for 8 cycles. | cycle 8+, airport, response undetected+ | 8 | air travel -15%; discovery pressure +10% |
| 14 | Passenger travel | Crew Sick-Leave Roster | Fewer available crew cut air travel by 15% for 16 cycles in active regions. | cycle 8+, airport, response undetected+, active >= 2% | 16 | air travel -15% |
| 15 | Passenger travel | Rural Mail Flight | A chartered mail flight adds 15% to air travel and 10% to air travel for 8 cycles. | cycle 8+, airport, response undetected+, type: bacteria, owns Birds I | 8 | air travel +15%; air travel +10% |
| 16 | Passenger travel | Student Exchange Charter | An exchange charter raises air travel by 15% and blood-route spread by 10% for 16 cycles. | cycle 16+, airport, response undetected+ | 16 | air travel +15%; Blood I spread +10% |
| 17 | Passenger travel | Relief Bus Convoy | Displaced passengers raise air travel by 20% and blood-route spread by 10% for 16 cycles. | cycle 8+, active cases, response undetected+, owns Birds I | 16 | air travel +20%; Blood I spread +10% |
| 18 | Passenger travel | Overnight Ferry Surge | An overnight ferry raises sea travel by 20% and Water I spread by 15% for 16 cycles. | cycle 16+, sea port, response undetected+ | 16 | sea travel +20%; Water I spread +15% |
| 19 | Passenger travel | Airport Slot Pause | A temporary slot freeze blocks air travel for 8 cycles and slows air travel by 10%. | cycle 8+, airport, response research+, owns Birds I | 8 | air routes blocked; air travel -10% |
| 20 | Shipping | Container Hub Shift | A new transshipment shift raises sea travel by 20% and Water I spread by 15% for 16 cycles. | cycle 16+, sea port, response undetected+ | 16 | sea travel +20%; Water I spread +15% |
| 21 | Shipping | Reefer Door Failure | A spoiled cargo transfer adds 10% to sea travel and Livestock I spread for 16 cycles. | cycle 8+, sea port, response undetected+ | 16 | sea travel +10%; Livestock I spread +10% |
| 22 | Shipping | Port Health Quarantine | A dockside quarantine blocks sea travel for 8 cycles and lifts discovery by 15%. | cycle 8+, sea port, response undetected+ | 8 | sea routes blocked; discovery pressure +15% |
| 23 | Shipping | Ballast Water Audit | Sampling delays ships by 10% but improves discovery by 20% for 16 cycles. | cycle 8+, sea port, response undetected+, active >= 1% | 16 | sea travel -10%; discovery pressure +20% |
| 24 | Shipping | Cold-Chain Fish Auction | A busy auction adds 15% to Water I spread and 10% to general spread for 8 cycles. | cycle 8+, humid region, response undetected+, active >= 1% | 8 | Water I spread +15%; spread +10% |
| 25 | Shipping | Deckhand Sick Roster | Crew shortages reduce sea travel by 15% while blood-route spread rises 10% for 8 cycles. | cycle 8+, sea port, response undetected+ | 8 | sea travel -15%; Blood I spread +10% |
| 26 | Shipping | Canal Lock Closure | A damaged lock blocks sea travel for 16 cycles and reduces local spread by 10%. | cycle 8+, sea port, response research+, owns Birds I | 16 | sea routes blocked; spread -10% |
| 27 | Shipping | Grain Hold Rodents | Rodent sightings raise Rodents I spread by 20% and sea travel by 10% for 16 cycles. | cycle 16+, sea port, response undetected+ | 16 | Rodents I spread +20%; sea travel +10% |
| 28 | Shipping | Inland Barge Relay | A river-to-port relay raises sea travel by 10% and local spread by 15% for 16 cycles. | cycle 8+, sea port, response undetected+, owns Birds I | 16 | sea travel +10%; spread +15% |
| 29 | Shipping | Customs Scanner Outage | A scanner outage raises sea travel by 15% and reduces discovery by 10% for 8 cycles. | cycle 8+, sea port, response undetected+ | 8 | sea travel +15%; discovery pressure -10% |
| 30 | Weather | Monsoon Humidity Belt | Persistent rain raises Water I spread by 20% and local spread by 10% for 16 cycles. | cycle 16+, humid region, response undetected+, owns Birds I | 16 | Water I spread +20%; spread +10% |
| 31 | Weather | Desert Dust Front | Dust cuts air travel by 15% but raises Insects I spread by 15% for 8 cycles. | cycle 8+, dry region, response undetected+ | 8 | air travel -15%; Insects I spread +15% |
| 32 | Weather | Heat Haze Corridor | Hot, dry conditions raise Insects I spread by 20% and lower air travel by 10% for 16 cycles. | cycle 8+, hot region, response undetected+ | 16 | Insects I spread +20%; air travel -10%; percentage effects halved by Heat Adaptation I |
| 33 | Weather | Highland Cold Snap | A sudden cold snap cuts local spread by 15% and Livestock I spread by 10% for 8 cycles. | cycle 8+, cold region, response undetected+, owns Birds I | 8 | spread -15%; Livestock I spread -10% |
| 34 | Weather | Coastal Fog Bank | Low visibility cuts air travel by 20% and blocks it for 8 cycles. | cycle 8+, airport, response undetected+ | 8 | air travel -20%; air routes blocked |
| 35 | Weather | Freeze-Thaw Runoff | Runoff raises Water I spread by 15% and sea travel by 10% for 16 cycles. | cycle 8+, humid region, response undetected+ | 16 | Water I spread +15%; sea travel +10% |
| 36 | Weather | Dry-Season Wind Shift | Trade winds raise air travel by 10% and Air I spread by 15% for 16 cycles. | cycle 16+, dry region, response undetected+ | 16 | air travel +10%; Air I spread +15% |
| 37 | Weather | Warm Wet Nights | Warm nights raise Insects I spread by 20% and local spread by 10% for 16 cycles. | cycle 8+, humid region, response undetected+, owns Birds I | 16 | Insects I spread +20%; spread +10% |
| 38 | Weather | Snowbound Mountain Pass | Deep snow cuts local spread by 20% and general spread by 10% for 8 cycles. | cycle 8+, cold region, response undetected+, owns Birds I | 8 | spread -20%; spread -10% |
| 39 | Weather | Wildfire Smoke Plume | Where Air I is evolved, smoke raises aerosol spread by 10% and discovery by 10% for 8 cycles. | cycle 8+, dry region, response undetected+, active >= 1% | 8 | Air I spread +10%; discovery pressure +10% |
| 40 | Water and sanitation | Chlorination Pump Failure | Untreated mains raise Water I spread by 20% and discovery by 10% for 16 cycles. | cycle 8+, humid region, response undetected+ | 16 | Water I spread +20%; discovery pressure +10% |
| 41 | Water and sanitation | Boil-Water Broadcast | Household boiling cuts Water I spread by 20% and adds 10% to discovery for 8 cycles. | cycle 8+, humid region, response undetected+ | 8 | Water I spread -20%; discovery pressure +10% |
| 42 | Water and sanitation | Leaking Neighborhood Main | Pressure loss raises Water I and blood-route spread by 10% for 16 cycles. | cycle 8+, urban region, response undetected+, active >= 1% | 16 | Water I spread +10%; Blood I spread +10% |
| 43 | Water and sanitation | Wastewater Bypass Release | A bypass adds 15% to Water I spread while sewage sampling lifts discovery 10% for 8 cycles. | cycle 8+, humid region, response undetected+ | 8 | Water I spread +15%; discovery pressure +10% |
| 44 | Water and sanitation | Mobile Test-Strip Drive | Field water tests reduce Water I spread by 10% and increase discovery by 15% for 16 cycles. | cycle 16+, any living region, response undetected+, active >= 1% | 16 | Water I spread -10%; discovery pressure +15% |
| 45 | Water and sanitation | Rural Wellhead Repair | A sealed well cuts Livestock I spread by 10% and Water I spread by 15% for 16 cycles. | cycle 8+, rural region, response undetected+ | 16 | Livestock I spread -10%; Water I spread -15% |
| 46 | Water and sanitation | Flooded Sewage Lift Station | Overflow raises Water I spread by 15% and sea travel by 10% for 8 cycles. | cycle 8+, humid region, response undetected+, dead >= 1% | 8 | Water I spread +15%; sea travel +10% |
| 47 | Water and sanitation | Shared Tanker Contamination | A contaminated tanker route raises Water I spread by 25% for 16 cycles. | cycle 8+, rural region, response undetected+ | 16 | Water I spread +25% |
| 48 | Water and sanitation | Chlorine Delivery Strike | A supply stoppage raises Water I spread by 15% and lowers research by 10% for 16 cycles. | cycle 8+, any living region, response discovered+ | 16 | Water I spread +15%; cure research -10% |
| 49 | Water and sanitation | Aquifer Lab Consortium | Well sampling boosts discovery before detection and improves cure research after trials begin for 16 cycles. | cycle 16+, rural region, response undetected+, active >= 1% | 16 | discovery pressure +15%; cure research +10% |
| 50 | Animal transmission | Mixed Herd Market Day | Animal mixing raises Livestock I spread by 20% and local spread by 10% for 16 cycles. | cycle 8+, rural region, response undetected+, owns Birds I | 16 | Livestock I spread +20%; spread +10% |
| 51 | Animal transmission | Rookery Roost Expansion | A larger seasonal roost adds 25% to bird migration for 16 cycles when Birds I is evolved. | cycle 16+, any living region, response undetected+, owns Birds I | 16 | bird migration +25% |
| 52 | Animal transmission | Pig Barn Fan Failure | Poor ventilation raises Livestock I spread by 20% and air travel by 10% for 8 cycles. | cycle 8+, rural region, response undetected+, active >= 1% | 8 | Livestock I spread +20%; air travel +10% |
| 53 | Animal transmission | Vector Hatch Cycle | A warm hatch raises Insects I spread by 20% and local spread by 10% for 16 cycles. | cycle 8+, hot region, response undetected+, owns Birds I | 16 | Insects I spread +20%; spread +10%; percentage effects halved by Heat Adaptation I |
| 54 | Animal transmission | Urban Rat Feeding Ban | Sealed refuse cuts Rodents I spread by 20% and discovery rises 10% for 8 cycles. | cycle 8+, urban region, response undetected+ | 8 | Rodents I spread -20%; discovery pressure +10% |
| 55 | Animal transmission | Wildlife Corridor Reopens | A reopened corridor adds 15% to bird migration and 10% to Livestock I spread for 16 cycles. | cycle 8+, rural region, response undetected+, owns Birds I | 16 | bird migration +15%; Livestock I spread +10% |
| 56 | Animal transmission | Veterinary Vaccine Sweep | Animal testing cuts Livestock I spread by 15% and lifts discovery by 10% for 16 cycles. | cycle 16+, rural region, response undetected+ | 16 | Livestock I spread -15%; discovery pressure +10% |
| 57 | Animal transmission | Poultry Transfer Pause | A veterinary hold reduces local spread by 15% and blocks sea traffic for 8 cycles. | cycle 8+, sea port, response discovered+, owns Birds I | 8 | spread -15%; sea routes blocked |
| 58 | Animal transmission | Mosquito Net Rollout | Net distribution cuts Insects I spread by 20% and raises discovery by 10% for 16 cycles. | cycle 8+, hot region, response undetected+ | 16 | Insects I spread -20%; discovery pressure +10% |
| 59 | Animal transmission | Grain Store Ratproofing | Sealed feed cuts Rodents I spread by 20% and general spread by 10% for 16 cycles. | cycle 16+, rural region, response undetected+ | 16 | Rodents I spread -20%; spread -10% |
| 60 | Healthcare | Clinic Triage Queue | Crowded intake raises blood-route spread by 15% and discovery by 10% for 8 cycles. | cycle 8+, healthcare region, response undetected+, active >= 2% | 8 | Blood I spread +15%; discovery pressure +10%; percentage effects halved by Medical Resistance I |
| 61 | Healthcare | Sterile Pack Delay | A delayed supply raises blood-route spread by 20% for 16 cycles in strained care regions. | cycle 8+, healthcare region, response undetected+, active >= 5% | 16 | Blood I spread +20%; percentage effects halved by Medical Resistance I |
| 62 | Healthcare | Lab Reagent Shortage | Missing reagents slow discovery before detection and cure research once laboratory trials begin for 16 cycles. | cycle 8+, healthcare region, response undetected+ | 16 | discovery pressure -15%; cure research -10% |
| 63 | Healthcare | Mobile Clinic Circuit | A traveling clinic lowers blood-route spread by 10% and raises discovery by 15% for 16 cycles. | cycle 16+, any living region, response undetected+, active >= 1% | 16 | Blood I spread -10%; discovery pressure +15% |
| 64 | Healthcare | Ward Cohorting Protocol | Separating patients cuts blood-route spread by 15% and adds 10% to research for 16 cycles. | cycle 8+, healthcare region, response discovered+ | 16 | Blood I spread -15%; cure research +10% |
| 65 | Healthcare | Oxygen Hub Overload | Overfilled treatment raises blood-route spread by 10% and discovery by 15% for 8 cycles. | cycle 8+, healthcare region, response undetected+, dead >= 2% | 8 | Blood I spread +10%; discovery pressure +15%; percentage effects halved by Medical Resistance I |
| 66 | Healthcare | Nurse Cross-Training | Cross-trained teams cut blood-route spread by 10% and add 15% to research for 16 cycles. | cycle 16+, healthcare region, response discovered+ | 16 | Blood I spread -10%; cure research +15% |
| 67 | Healthcare | Rural Ambulance Gap | Long transfers raise blood-route spread by 15% and local spread by 10% for 16 cycles. | cycle 8+, rural region, response undetected+, active >= 2%, owns Birds I | 16 | Blood I spread +15%; spread +10% |
| 68 | Healthcare | Protective Kit Shipment | A new protective-kit stock cuts blood-route spread by 20% for 16 cycles. | cycle 8+, healthcare region, response discovered+ | 16 | Blood I spread -20% |
| 69 | Healthcare | Transfusion Trace Audit | Donor tracing cuts blood-route spread by 15% and boosts discovery by 15% for 16 cycles. | cycle 16+, healthcare region, response undetected+, active >= 1% | 16 | Blood I spread -15%; discovery pressure +15% |
| 70 | Research | Bacterial Culture Exchange | Shared bacterial cultures accelerate regional cure research. | cycle 8+, any living region, response research+, type: bacteria, active >= 1% | 16 | cure research +15% |
| 71 | Research | Viral Genome Review | New viral genome comparisons accelerate regional cure research. | cycle 8+, any living region, response research+, type: virus | 16 | cure research +15% |
| 72 | Research | Fungal Sample Backlog | Slow fungal sample processing temporarily delays regional cure research. | cycle 16+, any living region, response research+, type: fungus, active >= 1% | 16 | cure research -15% |
| 73 | Research | Field Cohort Consent | A consenting study cohort raises blood-route spread by 10% and cure research by 15% once trials begin, for 8 cycles. | cycle 8+, healthcare region, response discovered+ | 8 | cure research +15%; Blood I spread +10%; percentage effects halved by Medical Resistance I |
| 74 | Research | Assay Contamination Review | Recalled assays slow discovery before detection and cure research after laboratory trials begin for 8 cycles. | cycle 8+, any living region, response undetected+ | 8 | discovery pressure -15%; cure research -15% |
| 75 | Research | Replication Protocol Release | A replicated protocol speeds discovery before detection and cure research after trials begin for 16 cycles. | cycle 16+, any living region, response undetected+ | 16 | cure research +20%; discovery pressure +10% |
| 76 | Research | Sensitive Data Embargo | An embargo slows discovery before detection and cure research after trials begin for 16 cycles. | cycle 8+, any living region, response undetected+ | 16 | cure research -15%; discovery pressure -10% |
| 77 | Research | Cross-Lab Proficiency Panel | Common reference samples raise research by 20% for 16 cycles. | cycle 16+, healthcare region, response discovered+ | 16 | cure research +20% |
| 78 | Research | Research Server Outage | A server outage slows cure research after trials begin and discovery before detection for 8 cycles. | cycle 8+, healthcare region, response undetected+ | 8 | cure research -20%; discovery pressure -10% |
| 79 | Research | Negative-Control Audit | Control audits speed discovery before detection and cure research after trials begin for 16 cycles. | cycle 8+, any living region, response undetected+, active >= 1% | 16 | discovery pressure +10%; cure research +15% |
| 80 | Public behavior | Mask Fit Campaign | Fit checks reduce Air I spread by 15% and discovery by 10% for 16 cycles. | cycle 8+, urban region, response undetected+ | 16 | Air I spread -15%; discovery pressure -10% |
| 81 | Public behavior | Asymptomatic Rumor Wave | A rumor suppresses discovery by 15% while general spread rises 10% for 8 cycles. | cycle 8+, any living region, response undetected+, active >= 2% | 8 | discovery pressure -15%; spread +10% |
| 82 | Public behavior | Work-From-Home Week | Remote schedules lower general spread by 15% and local spread by 10% for 16 cycles. | cycle 8+, urban region, response discovered+, owns Birds I | 16 | spread -15%; spread -10% |
| 83 | Public behavior | Handwashing Pledge Drive | A public pledge cuts blood-route spread by 15% and raises discovery by 10% for 8 cycles. | cycle 8+, any living region, response undetected+ | 8 | Blood I spread -15%; discovery pressure +10% |
| 84 | Public behavior | Funeral Attendance Surge | Large memorial services raise general spread by 15% and discovery by 10% for 8 cycles. | cycle 8+, active cases, response undetected+, dead >= 1% | 8 | spread +15%; discovery pressure +10% |
| 85 | Public behavior | Community Testing Week | More voluntary testing raises discovery by 15% and lowers general spread by 10% for 16 cycles. | cycle 8+, any living region, response undetected+, active >= 1% | 16 | discovery pressure +15%; spread -10% |
| 86 | Public behavior | School Door Closure | A temporary closure lowers general spread by 15% and adds 10% to discovery for 16 cycles. | cycle 8+, urban region, response undetected+ | 16 | spread -15%; discovery pressure +10% |
| 87 | Public behavior | Cure Rumor Reversal | A corrected rumor raises general spread by 10% and cure research by 10% once trials begin, for 8 cycles. | cycle 8+, any living region, response discovered+ | 8 | cure research +10%; spread +10% |
| 88 | Public behavior | Volunteer Supply Drops | Doorstep deliveries cut general spread by 10% and local spread by 10% for 16 cycles. | cycle 16+, any living region, response discovered+, owns Birds I | 16 | spread -10%; spread -10% |
| 89 | Public behavior | Compliance Fatigue Break | A lull in precautions raises general spread by 15% and lowers research by 10% for 8 cycles. | cycle 8+, any living region, response research+ | 8 | spread +15%; cure research -10% |
| 90 | Infrastructure disruption | Regional Grid Brownout | A brownout slows air travel by 10% and research by 15% for 8 cycles. | cycle 8+, airport, response discovered+ | 8 | air travel -10%; cure research -15% |
| 91 | Infrastructure disruption | Telecom Backbone Cut | A severed network slows discovery before detection and cure research after trials begin for 16 cycles. | cycle 8+, any living region, response undetected+ | 16 | discovery pressure -15%; cure research -10% |
| 92 | Infrastructure disruption | Cold-Store Warehouse Fault | A failed cold store raises Livestock I spread by 15% and sea travel by 10% for 16 cycles. | cycle 8+, rural region, response undetected+ | 16 | Livestock I spread +15%; sea travel +10% |
| 93 | Infrastructure disruption | Water Pumping Blackout | A power cut raises Water I spread by 15% and lowers research by 10% for 8 cycles. | cycle 8+, humid region, response discovered+ | 8 | Water I spread +15%; cure research -10% |
| 94 | Infrastructure disruption | Runway Resurfacing Window | Runway works block air travel for 8 cycles and lower air travel by 10%. | cycle 8+, airport, response undetected+, owns Birds I | 8 | air routes blocked; air travel -10% |
| 95 | Infrastructure disruption | Bridge Washout Detour | A washed-out bridge cuts local spread by 20% and general spread by 10% for 8 cycles. | cycle 8+, any living region, response discovered+, owns Birds I | 8 | spread -20%; spread -10% |
| 96 | Infrastructure disruption | Port Crane Labor Strike | Idle cranes block sea travel for 8 cycles and lower local spread by 10%. | cycle 8+, sea port, response undetected+, owns Birds I | 8 | sea routes blocked; spread -10% |
| 97 | Infrastructure disruption | Cell Broadcast Alert | A reliable emergency alert raises discovery by 20% and lowers general spread by 10% for 16 cycles. | cycle 8+, any living region, response undetected+ | 16 | discovery pressure +20%; spread -10% |
| 98 | Infrastructure disruption | Grid Backup Generator | Backup power improves cure research after trials begin and discovery before detection for 16 cycles. | cycle 8+, healthcare region, response undetected+ | 16 | cure research +15%; discovery pressure +10% |
| 99 | Infrastructure disruption | Municipal Pressure Restore | Stable mains cut Water I spread by 15% and lift discovery by 10% for 16 cycles. | cycle 16+, humid region, response undetected+, active >= 1% | 16 | Water I spread -15%; discovery pressure +10% |

## Storylines

### World Games

The onset uses: cycle 16+, any living region, response undetected+, active >= 1%, owns Birds I. The escalation branches when severity is at least 20; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 100 | Onset | Games Delegations Arrive | International teams raise air travel by 15% and air travel by 10% for 16 cycles. | 16 | air travel +15%; air travel +10% | 101 |
| 101 | Escalation | Games Entry Plan | Entry checks lower air travel by 10% while arena crowd plans are reviewed. | 16 | air travel -10% | 102 / 103 |
| 102 | Outcome A | Venue Air Plan | Distributed events cut Air I spread by 20% and air travel by 10% for 16 cycles. | 16 | Air I spread -20%; air travel -10% | 104 |
| 103 | Outcome B | Finals Crowd Surge | Sold-out finals raise blood-route spread by 15% and discovery by 10% for 16 cycles. | 16 | Blood I spread +15%; discovery pressure +10% | 104 |
| 104 | Aftermath | Athlete Village Dispersal | Departing teams raise air travel by 10% for 16 cycles. | 16 | air travel +10% | Ends |

### Regional festival

The onset uses: cycle 16+, humid region, response undetected+, active >= 1%. The escalation branches when owns Insects I; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 105 | Onset | Festival Campgrounds Open | Shared campground taps raise Water I spread by 15% and general spread by 10% for 16 cycles. | 16 | Water I spread +15%; spread +10% | 106 |
| 106 | Escalation | Festival Hygiene Drive | Handwashing stations at food stalls cut general spread by 10% during the festival. | 16 | spread -10% | 107 / 108 |
| 107 | Outcome A | Vector Screens Hold | Larval screening cuts Insects I spread by 20% and air travel by 10% for 16 cycles. | 16 | Insects I spread -20%; spread -10% | 109 |
| 108 | Outcome B | Late-Night Stalls Expand | Unscreened stalls raise Insects I spread by 20% and general spread by 10% for 16 cycles. | 16 | Insects I spread +20%; spread +10%; percentage effects halved by Heat Adaptation I | 109 |
| 109 | Aftermath | Festival Routes Clear | Crowd dispersal adds 10% to air travel for 16 cycles. | 16 | air travel +10% | Ends |

### Crowdsourced cure project

The onset uses: cycle 16+, any living region, response undetected+, active >= 1%. The escalation branches when cure is at least 50%; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 110 | Onset | Open Cure Notebook | Shared case notes speed discovery before detection and cure research once trials begin for 16 cycles. | 16 | cure research +15%; discovery pressure +10%; percentage effects halved by Genetic Hardening I | 111 |
| 111 | Escalation | Shared Cure Data Review | Researchers compare case notes, raising cure research by 10% once research is active. | 16 | cure research +10%; percentage effects halved by Genetic Hardening I | 112 / 113 |
| 112 | Outcome A | Replicated Cure Leads | Replicated findings raise research by 20% for 16 cycles. | 16 | cure research +20%; percentage effects halved by Genetic Hardening I | 114 |
| 113 | Outcome B | Unvetted Cure Recipes | Unverified recipes slow discovery before detection and cure research after trials begin for 16 cycles. | 16 | cure research -20%; discovery pressure -10%; percentage effects halved by Genetic Hardening I | 114 |
| 114 | Aftermath | Clinical Notes Consolidated | A consolidated protocol raises research by 10% for 16 cycles. | 16 | cure research +10%; percentage effects halved by Genetic Hardening I | Ends |

### Patient Zero investigation

The onset uses: cycle 16+, healthcare region, response undetected+, active >= 1%. The escalation branches when severity is at least 20; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 115 | Onset | First Clinic Cluster | A traceable clinic cluster raises discovery by 20% and blood-route spread by 10% for 16 cycles. | 16 | discovery pressure +20%; Blood I spread +10%; percentage effects halved by Medical Resistance I | 116 |
| 116 | Escalation | Spaced Contact Interviews | Separated interview rooms cut general spread by 10% while contact tracing expands. | 16 | spread -10% | 117 / 118 |
| 117 | Outcome A | Contact Trace Starts Early | Confirmed contacts focus regional research and reduce local spread while clinics trace the first infection. | 16 | cure research +20%; spread -10% | 119 |
| 118 | Outcome B | Contact Trace Arrives Late | Delayed contact tracing allows local spread; investigators still contribute to regional cure research. | 16 | spread +10%; cure research +10%; percentage effects halved by Medical Resistance I | 119 |
| 119 | Aftermath | Clinic Register Reconciled | Updated records help trace infections and support regional cure research while this response is active. | 16 | discovery pressure +10%; cure research +10% | Ends |

### Airline sanitation rollout

The onset uses: cycle 16+, airport, response undetected+, active >= 1%. The escalation branches when owns Air I; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 120 | Onset | Terminal Filter Inspection | A filter inspection raises discovery by 10% and cuts air travel by 10% for 16 cycles. | 16 | discovery pressure +10%; air travel -10%; percentage effects halved by Air I | 121 |
| 121 | Escalation | Terminal Filter Sweep | The airport filter sweep cuts air travel by 10% during the sanitation check. | 16 | air travel -10%; percentage effects halved by Air I | 122 / 123 |
| 122 | Outcome A | Filter Stock Reaches Hubs | Working filters cut Air I spread by 20% and air travel by 10% for 16 cycles. | 16 | Air I spread -20%; air travel -10%; percentage effects halved by Air I | 124 |
| 123 | Outcome B | Ventilation Ducts Stay Open | Unfiltered ducts raise Air I spread by 15% and air travel by 10% for 16 cycles. | 16 | Air I spread +15%; air travel +10% | 124 |
| 124 | Aftermath | Airflow Audit Closes | Updated records help trace infections and support regional cure research while this response is active. | 16 | discovery pressure +10%; cure research +10%; percentage effects halved by Air I | Ends |

### Shipping sanitation rollout

The onset uses: cycle 16+, sea port, response undetected+, active >= 1%. The escalation branches when owns Water I; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 125 | Onset | Harbor Discharge Sampling | Harbor sampling raises discovery by 10% and Water I spread by 10% for 16 cycles. | 16 | discovery pressure +10%; Water I spread +10% | 126 |
| 126 | Escalation | Ballast Sample Hold | Sampling delays lower sea travel by 10% while untreated ballast is checked. | 16 | sea travel -10%; percentage effects halved by Water I | 127 / 128 |
| 127 | Outcome A | Ballast Treatment Holds | Treatment cuts Water I spread by 20% and sea travel by 10% for 16 cycles. | 16 | Water I spread -20%; sea travel -10%; percentage effects halved by Water I | 129 |
| 128 | Outcome B | Untreated Ballast Release | Untreated discharge raises Water I spread by 20% and sea travel by 10% for 16 cycles. | 16 | Water I spread +20%; sea travel +10% | 129 |
| 129 | Aftermath | Harbor Water Recheck | Updated records help trace infections and support regional cure research while this response is active. | 16 | discovery pressure +10%; cure research +10%; percentage effects halved by Water I | Ends |

### Migration season

The onset uses: cycle 16+, any living region, response undetected+, active >= 1%, owns Birds I. The escalation branches when deaths in the selected region are at least 25%; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 130 | Onset | Seasonal Flyway Opens | A seasonal flyway raises bird migration by 20% for 16 cycles when Birds I is evolved. | 16 | bird migration +20% | 131 |
| 131 | Escalation | Flyway Watch Teams | Watch teams cut bird bird migration by 10% as seasonal counts are compared. | 16 | bird migration -10% | 132 / 133 |
| 132 | Outcome A | Rest Stop Route Thins | Loss of a roost cuts bird migration by 25% for 16 cycles when Birds I is evolved. | 16 | bird migration -25% | 134 |
| 133 | Outcome B | Wetland Rest Stops Fill | Busy roosts raise bird migration by 25% for 16 cycles when Birds I is evolved. | 16 | bird migration +25% | 134 |
| 134 | Aftermath | Flyway Traffic Settles | Migration remains 10% higher as seasonal bird routes finish for 16 cycles. | 16 | bird migration +10% | Ends |

### Livestock outbreak

The onset uses: cycle 16+, rural region, response undetected+, active >= 1%, owns Birds I. The escalation branches when severity is at least 20; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 135 | Onset | Mixed Herd Auction | Mixed pens raise Livestock I spread by 20% and local spread by 10% for 16 cycles. | 16 | Livestock I spread +20%; spread +10% | 136 |
| 136 | Escalation | Livestock Gate Checks | Gate checks cut Livestock I spread by 10% before herd movement is reviewed. | 16 | Livestock I spread -10% | 137 / 138 |
| 137 | Outcome A | Farm Gate Biosecurity | Owned livestock controls cut Livestock I spread by 20% and raise discovery by 10% for 16 cycles. | 16 | Livestock I spread -20%; discovery pressure +10% | 139 |
| 138 | Outcome B | Auction Pens Remain Mixed | Unscreened pens raise Livestock I spread by 20% and local spread by 10% for 16 cycles. | 16 | Livestock I spread +20%; spread +10% | 139 |
| 139 | Aftermath | Herd Movement Register | Updated records help trace infections and support regional cure research while this response is active. | 16 | discovery pressure +10%; cure research +10% | Ends |

### Insect population boom

The onset uses: cycle 16+, hot region, response undetected+, active >= 1%, owns Birds I. The escalation branches when severity is at least 20; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 140 | Onset | Warm-Season Hatch | A warm hatch raises Insects I spread by 20% and local spread by 10% for 16 cycles. | 16 | Insects I spread +20%; spread +10%; percentage effects halved by Heat Adaptation I | 141 |
| 141 | Escalation | Vector Mapping Sweep | Mapped breeding sites cut Insects I spread by 10% during the survey. | 16 | Insects I spread -10% | 142 / 143 |
| 142 | Outcome A | Larvicide Grid Covers Town | Owned insect controls cut Insects I spread by 20% and local spread by 10% for 16 cycles. | 16 | Insects I spread -20%; spread -10% | 144 |
| 143 | Outcome B | Unmapped Ponds Breed Vectors | Untreated ponds raise Insects I spread by 20% and general spread by 10% for 16 cycles. | 16 | Insects I spread +20%; spread +10%; percentage effects halved by Heat Adaptation I | 144 |
| 144 | Aftermath | Vector Survey Repeats | Updated records help trace infections and support regional cure research while this response is active. | 16 | discovery pressure +10%; cure research +10% | Ends |

### Rodent infestation

The onset uses: cycle 16+, urban region, response undetected+, active >= 1%. The escalation branches when active cases in the selected region are at least 50%; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 145 | Onset | Market Grain Spill | Loose grain raises Rodents I spread by 20% and general spread by 10% for 16 cycles. | 16 | Rodents I spread +20%; spread +10% | 146 |
| 146 | Escalation | Night Refuse Pickup | Night refuse pickup cuts general spread by 10% while rodent access is assessed. | 16 | spread -10% | 147 / 148 |
| 147 | Outcome A | Waste Bins Seal | A well-adopted cleanup cuts Rodents I spread by 20% and general spread by 10% for 16 cycles. | 16 | Rodents I spread -20%; spread -10% | 149 |
| 148 | Outcome B | Alleys Stay Accessible | Dense activity leaves Rodents I spread 20% higher and discovery 10% lower for 16 cycles. | 16 | Rodents I spread +20%; discovery pressure -10% | 149 |
| 149 | Aftermath | Night Traps Reset | Continued trapping cuts Rodents I spread by 10% for 16 cycles. | 16 | Rodents I spread -10% | Ends |

### Flood emergency

The onset uses: cycle 16+, humid region, response undetected+, active >= 1%. The escalation branches when deaths in the selected region are at least 25%; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 150 | Onset | River Gauge Overtops | Flooded wells strengthen Water transmission while damaged laboratories slow regional cure research. | 16 | Water I spread +20%; cure research -15% | 151 |
| 151 | Escalation | Floodwater Intake Watch | Temporary intake controls cut sea travel by 10% while floodwater is sampled. | 16 | sea travel -10% | 152 / 153 |
| 152 | Outcome A | Water Test Teams Arrive | A high death toll brings tests that cut Water I spread by 20% and lift discovery by 15% for 16 cycles. | 16 | Water I spread -20%; discovery pressure +15% | 154 |
| 153 | Outcome B | Lowland Wells Stay Submerged | Submerged wells raise Water I spread by 25% and lower discovery by 10% for 16 cycles. | 16 | Water I spread +25%; discovery pressure -10% | 154 |
| 154 | Aftermath | Pumps Drain Floodplain | Recovery pumping cuts Water I spread by 10% and raises research by 10% for 16 cycles. | 16 | Water I spread -10%; cure research +10% | Ends |

### Earthquake recovery

The onset uses: cycle 16+, any living region, response research+, active >= 1%, owns Birds I. The escalation branches when severity is at least 20; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 155 | Onset | Seismic Lab Shutdown | Shaken labs lower research by 15% while local spread rises 10% for 16 cycles. | 16 | cure research -15%; spread +10% | 156 |
| 156 | Escalation | Emergency Lab Relay | A portable lab relay raises cure research by 10% once research is active. | 16 | cure research +10% | 157 / 158 |
| 157 | Outcome A | Backup Lab Network Restored | A coordinated rebuild speeds cure research after trials begin and discovery before detection for 16 cycles. | 16 | cure research +20%; discovery pressure +10% | 159 |
| 158 | Outcome B | Power Relays Remain Damaged | Ongoing outages slow cure research after trials begin and discovery before detection for 16 cycles. | 16 | cure research -20%; discovery pressure -10% | 159 |
| 159 | Aftermath | Sample Freezers Rechecked | Updated records help trace infections and support regional cure research while this response is active. | 16 | discovery pressure +10%; cure research +10% | Ends |

### Coastal storm season

The onset uses: cycle 16+, sea port, response undetected+, active >= 1%. The escalation branches when owns Water I; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 160 | Onset | Storm Surge Reaches Docks | Surge water raises Water I spread by 15% and cuts sea travel by 10% for 16 cycles. | 16 | Water I spread +15%; sea travel -10% | 161 |
| 161 | Escalation | Harbor Closure Review | A harbor review cuts sea travel by 10% as crews test the disinfection plan. | 16 | sea travel -10% | 162 / 163 |
| 162 | Outcome A | Harbor Disinfection Crews | Treatment cuts Water I spread by 20% and restores sea travel by 10% for 16 cycles. | 16 | Water I spread -20%; sea travel +10% | 164 |
| 163 | Outcome B | Harbor Closure Persists | An unsafe harbor blocks sea travel for 16 cycles and raises discovery by 10%. | 16 | sea routes blocked; discovery pressure +10% | 164 |
| 164 | Aftermath | Coastal Intake Reopens | Follow-up samples cut Water I spread by 10% and raise discovery by 10% for 16 cycles. | 16 | Water I spread -10%; discovery pressure +10% | Ends |

### Heatwave

The onset uses: cycle 16+, hot region, response undetected+, active >= 1%. The escalation branches when owns Heat Adaptation I; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 165 | Onset | Heatwave Shelter Demand | Heat conditions reduce local spread by 20%. Matching adaptation halves this temporary penalty. | 16 | spread -20%; percentage effects halved by Heat Adaptation I | 166 |
| 166 | Escalation | Cooling Center Check-In | Heat conditions reduce local spread by 25%. Matching adaptation halves this temporary penalty. | 16 | spread -25%; percentage effects halved by Heat Adaptation I | 167 / 168 |
| 167 | Outcome A | Cooling Halls Relieve Crowding | Heat conditions reduce local spread by 10%. Matching adaptation halves this temporary penalty. | 16 | spread -10%; percentage effects halved by Heat Adaptation I | 169 |
| 168 | Outcome B | Night Cooling Fails | Heat conditions reduce local spread by 30%. Matching adaptation halves this temporary penalty. | 16 | spread -30%; percentage effects halved by Heat Adaptation I | 169 |
| 169 | Aftermath | Heat Clinics Keep Hours | Heat conditions reduce local spread by 10%. Matching adaptation halves this temporary penalty. | 16 | spread -10%; percentage effects halved by Heat Adaptation I | Ends |

### Severe winter

The onset uses: cycle 16+, cold region, response undetected+, active >= 1%. The escalation branches when owns Cold Adaptation I; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 170 | Onset | Winter Shelter Census | Cold conditions reduce local spread by 20%. Matching adaptation halves this temporary penalty. | 16 | spread -20%; percentage effects halved by Cold Adaptation I | 171 |
| 171 | Escalation | Winter Shelter Roster | Cold conditions reduce local spread by 25%. Matching adaptation halves this temporary penalty. | 16 | spread -25%; percentage effects halved by Cold Adaptation I | 172 / 173 |
| 172 | Outcome A | Cold-Weather Clinics Open | Cold conditions reduce local spread by 10%. Matching adaptation halves this temporary penalty. | 16 | spread -10%; percentage effects halved by Cold Adaptation I | 174 |
| 173 | Outcome B | Shelter Intake Overflows | Cold conditions reduce local spread by 30%. Matching adaptation halves this temporary penalty. | 16 | spread -30%; percentage effects halved by Cold Adaptation I | 174 |
| 174 | Aftermath | Spring Ventilation Checks | Cold conditions reduce local spread by 10%. Matching adaptation halves this temporary penalty. | 16 | spread -10%; percentage effects halved by Cold Adaptation I | Ends |

### Drought and water rationing

The onset uses: cycle 16+, dry region, response undetected+, active >= 1%. The escalation branches when active cases in the selected region are at least 50%; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 175 | Onset | Reservoir Allocation Tightens | Water shortages raise Water I spread by 10% and lower discovery by 10% for 16 cycles. | 16 | Water I spread +10%; discovery pressure -10% | 176 |
| 176 | Escalation | Water Queue Testing | Shared tanker queues raise general spread by 10% before drought water tests begin. | 16 | spread +10% | 177 / 178 |
| 177 | Outcome A | Rural Tankers Are Tested | Testing cuts Water I spread by 15% and lifts discovery by 15% for 16 cycles. | 16 | Water I spread -15%; discovery pressure +15% | 179 |
| 178 | Outcome B | Unsealed Tanker Stops | Untested deliveries raise Water I spread by 20% and general spread by 10% for 16 cycles. | 16 | Water I spread +20%; spread +10% | 179 |
| 179 | Aftermath | Reservoir Sampling Resumes | Updated records help trace infections and support regional cure research while this response is active. | 16 | discovery pressure +10%; cure research +10% | Ends |

### Hospital overload

The onset uses: cycle 16+, healthcare region, response undetected+, active >= 1%. The escalation branches when deaths in the selected region are at least 25%; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 180 | Onset | Ward Beds Reach Capacity | Overfull wards raise blood-route spread by 15% and discovery by 10% for 16 cycles. | 16 | Blood I spread +15%; discovery pressure +10%; percentage effects halved by Medical Resistance I | 181 |
| 181 | Escalation | Overflow Ward Cohorting | Ward cohorting cuts blood-route spread by 10% during the capacity review. | 16 | Blood I spread -10% | 182 / 183 |
| 182 | Outcome A | Regional Staff Pool Arrives | Staffing support cuts blood-route spread by 20% and boosts research by 10% for 16 cycles. | 16 | Blood I spread -20%; cure research +10% | 184 |
| 183 | Outcome B | Transfers Queue at Triage | Transfer queues raise blood-route spread by 20% and lower research by 10% for 16 cycles. | 16 | Blood I spread +20%; cure research -10%; percentage effects halved by Medical Resistance I | 184 |
| 184 | Aftermath | Discharge Reviews Resume | Care reviews cut blood-route spread by 10% and raise discovery by 10% for 16 cycles. | 16 | Blood I spread -10%; discovery pressure +10% | Ends |

### International research coalition

The onset uses: cycle 16+, any living region, response undetected+, active >= 1%. The escalation branches when owns Genetic Hardening I; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 185 | Onset | Joint Genome Desk Opens | A shared genome desk speeds discovery before detection and cure research after trials begin for 16 cycles. | 16 | discovery pressure +15%; cure research +10% | 186 |
| 186 | Escalation | Coalition Assay Exchange | Shared assay notes raise cure research by 10% as laboratories align results. | 16 | cure research +10% | 187 / 188 |
| 187 | Outcome A | Hardening Data Is Shared | A coalition overcomes hardening, lifting research by 20% for 16 cycles. | 16 | cure research +20% | 189 |
| 188 | Outcome B | Separate Assay Queues Persist | Separate assay queues slow cure research after trials begin and discovery before detection for 16 cycles. | 16 | cure research -15%; discovery pressure -10% | 189 |
| 189 | Aftermath | Shared Reagent Ledger | Joint procurement raises research by 10% for 16 cycles. | 16 | cure research +10% | Ends |

### Public confidence crisis

The onset uses: cycle 16+, any living region, response undetected+, active >= 1%. The escalation branches when cure is at least 50%; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 190 | Onset | Daily Case Board Launches | Clear case counts improve discovery before detection and cure research once trials begin for 16 cycles. | 16 | discovery pressure +10%; cure research +10% | 191 |
| 191 | Escalation | Daily Briefing Schedule | Regular briefings cut general spread by 10% as case information is checked. | 16 | spread -10% | 192 / 193 |
| 192 | Outcome A | Trusted Briefings Continue | Credible progress raises research by 15% and lowers general spread by 10% for 16 cycles. | 16 | cure research +15%; spread -10% | 194 |
| 193 | Outcome B | Unclear Results Erode Trust | Mixed results lower research by 15% and raise general spread by 10% for 16 cycles. | 16 | cure research -15%; spread +10% | 194 |
| 194 | Aftermath | Community Questions Answered | Updated records help trace infections and support regional cure research while this response is active. | 16 | discovery pressure +10%; cure research +10% | Ends |

### Emergency government response

The onset uses: cycle 16+, any living region, response undetected+, active >= 1%. The escalation branches when response is escalating; both outcomes lead to the aftermath.

| ID | Stage | Headline | Explanation | Duration | Effect | Next |
|---:|---|---|---|---:|---|---|
| 195 | Onset | National Response Desk Opens | A central desk improves discovery before detection and cure research after trials begin for 16 cycles. | 16 | discovery pressure +15%; cure research +10% | 196 |
| 196 | Escalation | Emergency Air Order | A temporary air order lowers air travel by 10% while national rules are coordinated. | 16 | air travel -10% | 197 / 198 |
| 197 | Outcome A | Escalated Travel Order | A coordinated order blocks air travel for 16 cycles and cuts general spread by 15%. | 16 | air routes blocked; spread -15% | 199 |
| 198 | Outcome B | Local Rules Conflict | Conflicting orders raise general spread by 15% and lower discovery by 10% for 16 cycles. | 16 | spread +15%; discovery pressure -10% | 199 |
| 199 | Aftermath | Emergency Powers Reviewed | A review raises research by 10% and lowers general spread by 10% for 16 cycles. | 16 | cure research +10%; spread -10% | Ends |

## Effect and branch codes

Effects are percentages of the named baseline unless the entry says a route is blocked. A spread effect with a transmission trait applies only to that trait's existing regional contribution; the available roots are Air I, Water I, Livestock I, Rodents I, Insects I, and Blood I. Bird migration has no local spread bonus.

The branch tests are: trait ownership; severity at least 20; deaths at least 25% in the selected region; active cases at least 50% in the selected region; cure at least 50%; or an escalating public response. Storylines use an explicit test at the escalation stage.

Only Genetic Reshuffle I or II can delay the unresolved Patient Zero investigation; each newly used reshuffle adds 16 cycles while the first two stages are active.

## Save compatibility

Event state is stored separately from the event definitions. A catalog edit changes authored content but does not require Python at calculator build time. Save-format migration and calculator artifact size are documented with the save implementation.

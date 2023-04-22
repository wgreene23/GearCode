# GearCode
Code for gear design MEE 342

# Inputs
- Diametral Pitch
- Face Width

- Material Properties
  - Poisson Ratio for Pinion/Gear
  - Elastic Modulus for Pinion/Gear (ksi)
  - Density for Pinion/Gear (lb/ft^3)

- Project Inputs
  - Load (rev/min)
  - Horsepower
  - Reliability
  - Overload Factor (REFERENCE ATTACHED TABLE IN REPO FILES)

- Gear/Pinion Inputs
  - Normal Pressure Angle (degrees) (20º is common in industry!)
  - Number of teeth on pinion
  - Number of teeth on gear 
  - Root fillet radius (inches)
  - Quality Number
  - Distance between gear and Midway (from bearing/key)
  - Total Distance between centerline of bearing (from bearing/key)
  - Geometry factors for gear/pinion (REFERENCE ATTACHED TABLE IN REPO FILES)
  - Type of material (Grade 1 or 2 through hardened steel)

# Outputs
- Bending, Contact stresses in gear/pinion
- Bending, Contact factors of safety
- Weight

# Assumptions
- m_b
- Surface Condition Factor, C_f, assumed to be 1 
- Hardness Ratio Factor, C_h, assumed to be 1 (Gear and Pinion assumed to be same material)
- Temperature Factor, K_t, assumed to be 1 (Operating at room temp)
- Stress Cycle Factors depend on the life of the gears, which is assumed be be greater than 10^7 cylces (1 rev = 1 cycle)

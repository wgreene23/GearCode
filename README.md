# GearCode
Code for Gear Design MEE 342

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
  - Design factor

# Outputs
- Bending, Contact stresses in gear/pinion
- Bending, Contact factors of safety
- Weight

# Assumptions
- Gears are made of typical commercial quality
- Surface Condition Factor, C_f, assumed to be unity as there is no known detrimental effects known to exist
- Hardness Ratio Factor, C_h, assumed to be 1 (Gear and Pinion assumed to be same material)
- Temperature Factor, K_t, assumed to be unity (Operating at room temperature and below 250 degrees Fahrenheit)
- Stress Cycle Factors depend on the life of the gears, which is assumed be be greater than 10^7 cylces (1 rev = 1 cycle)
- Weight is proportional to the cost of the gear/pinion material

# Limitations
- The Gear and Pinion are of the same material
- User dependent for optimization
- Number of teeth for the pinion and gear must be of the common values included in table 14-2 from the book (REFERENCE ATTACHED TABLE IN REPO FILES)

# Note
- The overload factor is up to the user to decide, but we found that with the wind loadings, we recommend the highest value of 2.25
- The through hardened steel properties needs to be researched prior!
- For the project, the bending stress needs to have a factor of safety of no greater than 1.5. And the contact stress needs to have a factor of safety of no greater than 1.2.

# References
- Budynas, Richard G., et al. Shigley's Mechanical Engineering Design. McGraw-Hill Education, 2021. 

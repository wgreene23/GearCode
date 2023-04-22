% Spur Gear Design Project
% MEE 342 - Principals of Mechanical Engineering Design
% Professor Yi Ren
% Diego Torres, Matteo Orlando, Tyler Rokop, William Greene

%% Purpose 
% The purpose of this code is to build a code capable of designing a spur
% gear with given parameters

%% Design Decisions

% Diametral Pitch and Face width
P_d = input("Diametral Pitch (teeth/inch):"); % Diametral Pitch
F = input("Face Width (inches):"); % Face Width

% Pinion Material
nu_p = input("Poisson's ratio of pinion:"); % Poisson's ratio of pinion
E_p = input("Elastic Modulus of pinion (ksi):"); % Elastic Modulus of pinion
density_p = input("Desnity of pinion material (lb/ft^3):"); %density of pinion

% Gear Material
nu_g = input("Poisson's ratio of gear:"); % Poisson's ratio of gear
E_g = input("Elastic Modulus of gear (ksi):"); % Elastic Modulus of gear
density_g = input("Desnity of gear material (lb/ft^3):"); %density of gear
%% A Priori Decisions

% Function
H = input("Load (rev/min):"); % Load
hp = input("Horsepower (hp):"); % Horsepower
R = input("Reliability:"); % Reliability
K_o = input("Overload Factor (obtain from table of overload factors):"); % Overload Factor 

% Unquantifiable Risk
n_d = input("Design Factor:"); % Design Factor

% Tooth System
phi_n = input("Normal Pressure Angle (in degrees):"); % Normal Pressure Angle
N_p = input("Number of teeth on pinion:"); % Number of teeth on pinion
N_g = input("Number of teeth on gear:"); % Number of teeth on gear

adn = 1/P_d; % addendum
dedn = 1.25/P_d; % dedendum

rf = input("root fillet radius (in inches):"); % root fillet radius

% Quality Number
Q_v = input("Quality Number (from 1 to 6):"); % Quality Number (with 1 being the lowest and 6 being the heighest quality)


%% Auxilliary Equations


% Pinion Dimensions

d_p = N_p/P_d; % inches

d_ref_p = (P_d * N_p)/12; % ref circle diameter converted to feet

Vol_p = (pi/4) * (d_ref_p^2) * F; % used for finding weight

% Gear Dimensions

d_g = N_g/P_d; % inches

d_ref_g = (P_d * N_g)/12; % ref circle diameter converted to feet

Vol_g = (pi/4) * (d_ref_g^2) * F; % used for finding weight


% Various Factors for Calculations:

% Dynamic Factor Pinion
V_t = (pi/12)*(d_p*N_p); % Pitch Line Velocity
B = 0.25*(12-Q_v)^(2/3); 
A = 50+56*(1-B);
K_v = ((A+(V_t)^(1/2))/A)^(B); % Dynamic Factor

% Transmitted Load

W_t = H/V_t;


% Size Factor

t = 1.2*(adn+dedn); % assuming m_b to be 1.2
l = (adn + dedn); % height of tooth

LewisFormFactorMatrix = [12 0.245;13 0.261;14 0.277;15 0.29;16 0.296;17 0.303;18 0.309;19 0.314;20 0.322;21 0.328;22 0.331;24 0.337;26 0.346;28 0.353;30 0.359;34 0.371;38 0.384;43 0.397;50 0.409;60 0.422;75 0.435;100 0.447;150 0.46;300 0.472;400 0.480]; % Table of lewis form factors. Table 14-2 from book

% Statements for Pinion Lewis Form Factor:
if N_p == 12
    Y_p = LewisFormFactorMatrix(1,2);
elseif N_p == 13
    Y_p = LewisFormFactorMatrix(2,2);
elseif N_p == 14
    Y_p = LewisFormFactorMatrix(3,2);
elseif N_p == 15
    Y_p = LewisFormFactorMatrix(4,2);
elseif N_p == 16
    Y_p = LewisFormFactorMatrix(5,2);
elseif N_p == 17
    Y_p = LewisFormFactorMatrix(6,2);
elseif N_p == 18
    Y_p = LewisFormFactorMatrix(7,2);
elseif N_p == 19
    Y_p = LewisFormFactorMatrix(8,2);
elseif N_p == 20
    Y_p = LewisFormFactorMatrix(9,2);
elseif N_p == 21
    Y_p = LewisFormFactorMatrix(10,2);
elseif N_p == 22
    Y_p = LewisFormFactorMatrix(11,2);
elseif N_p == 24
    Y_p = LewisFormFactorMatrix(12,2);
elseif N_p == 26
    Y_p = LewisFormFactorMatrix(13,2);
elseif N_p == 28
    Y_p = LewisFormFactorMatrix(14,2);
elseif N_p == 30
    Y_p = LewisFormFactorMatrix(15,2);
elseif N_p == 34
    Y_p = LewisFormFactorMatrix(16,2);
elseif N_p == 38
    Y_p = LewisFormFactorMatrix(17,2);
elseif N_p == 43
    Y_p = LewisFormFactorMatrix(18,2);
elseif N_p == 50
    Y_p = LewisFormFactorMatrix(19,2);
elseif N_p == 60
    Y_p = LewisFormFactorMatrix(20,2);
elseif N_p == 75
    Y_p = LewisFormFactorMatrix(21,2);
elseif N_p == 100
    Y_p = LewisFormFactorMatrix(22,2);
elseif N_p == 150
    Y_p = LewisFormFactorMatrix(23,2);
elseif N_p == 300
    Y_p = LewisFormFactorMatrix(24,2);
elseif N_p == 400
    Y_p = LewisFormFactorMatrix(25,2);
else
    error('invalid selection')
end

% Statements for Gear Lewis Form Factor:

if N_g == 12
    Y_g = LewisFormFactorMatrix(1,2);
elseif N_g == 13
    Y_g = LewisFormFactorMatrix(2,2);
elseif N_g == 14
    Y_g = LewisFormFactorMatrix(3,2);
elseif N_g == 15
    Y_g = LewisFormFactorMatrix(4,2);
elseif N_g == 16
    Y_g = LewisFormFactorMatrix(5,2);
elseif N_g == 17
    Y_g = LewisFormFactorMatrix(6,2);
elseif N_g == 18
    Y_g = LewisFormFactorMatrix(7,2);
elseif N_g == 19
    Y_g = LewisFormFactorMatrix(8,2);
elseif N_g == 20
    Y_g = LewisFormFactorMatrix(9,2);
elseif N_g == 21
    Y_g = LewisFormFactorMatrix(10,2);
elseif N_g == 22
    Y_g = LewisFormFactorMatrix(11,2);
elseif N_g == 24
    Y_g = LewisFormFactorMatrix(12,2);
elseif N_g == 26
    Y_g = LewisFormFactorMatrix(13,2);
elseif N_g == 28
    Y_g = LewisFormFactorMatrix(14,2);
elseif N_g == 30
    Y_g = LewisFormFactorMatrix(15,2);
elseif N_g == 34
    Y_g = LewisFormFactorMatrix(16,2);
elseif N_g == 38
    Y_g = LewisFormFactorMatrix(17,2);
elseif N_g == 43
    Y_g = LewisFormFactorMatrix(18,2);
elseif N_g == 50
    Y_g = LewisFormFactorMatrix(19,2);
elseif N_g == 60
    Y_g = LewisFormFactorMatrix(20,2);
elseif N_g == 75
    Y_g = LewisFormFactorMatrix(21,2);
elseif N_g == 100
    Y_g = LewisFormFactorMatrix(22,2);
elseif N_g == 150
    Y_g = LewisFormFactorMatrix(23,2);
elseif N_g == 300
    Y_g = LewisFormFactorMatrix(24,2);
elseif N_g == 400
    Y_g = LewisFormFactorMatrix(25,2);
else
    error('invalid selection')
end

K_sp = 1.192*((F/d_p)*(Y_p)^(1/2))^(0.0535);  % Size factor for pinion

K_sg = 1.192*((F/d_p)*(Y_g)^(1/2))^(0.0535); % Size factor for gear

% Load Distribution Factor

C_mc = input("1.0 (uncrowned) or 0.8 (crowned):"); % Load Correction Factor

% Pinion Proportion Factor

if F <= 1
    C_pf = ((F/(10*d_p))-0.025);
elseif (1<F)&&(F<=17)
    C_pf = ((F/(10*d_p))-0.0375+0.0125*F);
elseif (17<F)&&(F<=40)
    C_pf = ((F/(10*d_p))-0.1109+0.0207*F-0.000228*(F)^(2));
end

% Pinion Proportion Modifier

s_1 = input("distance between gear and midway:");
s = input("total distance between centerline of bearing:");

if (s_1/s)<0.175
    C_pm = 1;
elseif (s_1/s)>= 0.175
    C_pm = 1.1;
end

% C_e

C_e = input("Enter 0.8 (gearing adjusted at assembly) or 1.0 (for all other conditions):"); 

% C_ma Commercial Condition

C_ma = 0.127 + 0.0158*F - (0.93*(10)^(-4))*F^(2); % Equation for commercial application

% K_m

K_m = 1+(C_mc)*((C_pf*C_pm)+(C_ma*C_e)); % Load distribution factor calculation


% Rim thickness factor

m_b = t/(adn+dedn);

if m_b < 1.2
    K_b = 1.6*(log(2.242/m_b));
elseif m_b >= 1.2
    K_b = 1;
end

% Geometry Factor for Bending Stress

J_p = input("Geometry factor J for the pinion:"); % Geometry factor J obtained from figure #1 (14-6 from book)

J_g = input("Geometry factor J for the gear:"); % Geometry factor J obtained from figure #1 (14-6 from book)


% Elastic Coefficient

C_p = (1/((pi*(((1-nu_p^2)/E_p) + ((1-nu_g^2)/E_g)))))^(1/2);

% Surface Condition Factor

C_f = 1; % assumed to be one unless otherwise stated

% Geometry Factor for Pitting (contact resistance)

m_g = N_g/N_p; % speed ratio

I = ((cosd(phi_n)*sind(phi_n))/(2))*(m_g/(m_g+1)); % Geometry Factor

% Temperature Factor

K_t = 1;

% Reliability Factor

if (R>0.5)&&(R<0.99)
    K_r = 0.658 - 0.0759*log(1-R);
elseif (R>=0.99)&&(R<=0.9999)
    K_r = 0.50 - 0.109*log(1-R);
end

% Gear Bending Strength

% Brinell Hardness
material11= input("From the material list, enter the corresponding letter: A = Grade 1 through-hardened steel, B = Grade 2 through-hardened steel:",'s');
if strcmp(material11,'A')
    H_b = (200+400)/2; % taking the midrange value
elseif strcmp(material11,'B')
    H_b = (200+400)/2;
else
    error('invalid selection')
end

% Bending Strength
material12 = input("From the chosen material before, enter the same corresponding letter: A = Grade 1 through-hardened steel, B = Grade 2 through-hardened steel:",'s');
if strcmp(material12,'A')
    S_t = (77.3*H_b)+(12800);
elseif strcmp(material12,'B')
    S_t = (102*H_b)+(16400);
else
    error('invalid selection')
end

% Contact Strength

material13 = input("From the chosen material before, enter the same corresponding letter: A = Grade 1 through-hardened steel, B = Grade 2 through-hardened steel:",'s');
if strcmp(material13,'A')
    S_c = (322*H_b)+(29100);
elseif strcmp(material13,'B')
    S_c = (349*H_b)+(34300);
else
    error('invalid selection')
end

% Number of Cycles for Design
Num_Cycles = H*(60)*(24)*(365)*(10); % calculates the number of cycles from years of operation


% Stress Cycle Factor for bending

Y_n = 1.3558*Num_Cycles^(-0.0178); % Stress Cycle factor

% Stress Cycle Factor for pitting

Z_n = 1.4488*Num_Cycles^(-0.0178); % Stress Cycle factor


% Note, these stress cycle factors assume the life cycle to be above 10^(7)!

% Hardness Ratio Factor

C_h = 1; % assumed to be one as the pinion and gear are of the same material

%% Governing Equations

% Gear
BendingStressGear = (W_t)*(K_o)*(K_v)*(K_sg)*((P_d)/F)*((K_m)*(K_b)/J_g); % AGMA Bending Stress for gear

ContactStressGear = (C_p)*((W_t)*(K_o)*(K_v)*(K_sg)*((K_m)*(C_f))/((d_p)*(F)*(I))); % AGMA Contact Stress for gear

SafetyFactorBendingGear = ((S_t)*(Y_n))/((K_t)*(K_r)*BendingStressGear); % Safety Factor for Bending Stress for gear
 
SafetyFactorContactGear = ((S_c)*(Z_n)*(C_h))/((K_t)*(K_r)*ContactStressGear); % Safety Factor for Contact Stress for gear

GearWeight = density_g * Vol_g % gear weight in lbs

% Pinion
BendingStressPinion = (W_t)*(K_o)*(K_v)*(K_sp)*((P_d)/F)*((K_m)*(K_b)/J_p); % AGMA Bending Stress for pinion

ContactStressPinion = (C_p)*((W_t)*(K_o)*(K_v)*(K_sp)*((K_m)*(C_f))/((d_p)*(F)*(I))); % AGMA Contact Stress for pinion

SafetyFactorBendingPinion = ((S_t)*(Y_n))/((K_t)*(K_r)*BendingStressPinion); % Safety Factor for Bending Stress for pinion

SafetyFactorContactPinion = ((S_c)*(Z_n)*(C_h))/((K_t)*(K_r)*ContactStressPinion); % Safety Factor for Contact Stress for pinion

PinionWeight = density_p * Vol_p % pinion weight in lbs

%% Analysis
disp(['Bending stress for gear:', num2str(BendingStressGear)]) % AGMA Bending Stress for gear
disp(['Contact Stress for gear:', num2str(ContactStressGear)]) % AGMA Contact Stress for gear

disp(['Bending stress for pinion:', num2str(BendingStressPinion)]) % AGMA Bending Stress for pinion
disp(['Contact Stress for pinion:', num2str(ContactStressPinion)]) % AGMA Contact Stress for pinion

disp(['Bending Safety Factor for Gear:', num2str(SafetyFactorBendingGear)]) % Safety Factor for Bending Stress for gear
disp(['Contact Safety Factor for Gear:', num2str(SafetyFactorContactGear)]) % AGMA Contact Stress for gear

disp(['Bending Safety Factor for Pinion:', num2str(SafetyFactorBendingPinion)]) % Safety Factor for Bending Stress for pinion
disp(['Contact Safety Factor for Pinion:', num2str(SafetyFactorContactPinion)]) % AGMA Contact Stress for pinion


if SafetyFactorBendingGear>(SafetyFactorContactGear)^(2)
    disp('The gear bending stress is significant compared to contact stress.')
elseif (SafetyFactorContactGear)^(2)>SafetyFactorBendingGear
    disp('The gear contact stress is significant compared to bending stress.')
elseif SafetyFactorBendingPinion>(SafetyFactorContactPinion)^(2)
    disp('The pinion contact stress is significant compared to bending stress.')
elseif (SafetyFactorContactPinion)^(2)>SafetyFactorBendingPinion
    disp('The pinion contact stress is significant compared to bending stress.')
end


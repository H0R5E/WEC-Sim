%% Simulation Data
simu = simulationClass();               % Initialize Simulation Class
simu.simMechanicsFile = 'WEC_1_NoGearbox.slx';      % Specify Simulink Model File
simu.mode = 'normal';                   % Specify Simulation Mode ('normal','accelerator','rapid-accelerator')
simu.explorer = 'off';                  % Turn SimMechanics Explorer (on/off)
simu.startTime = 0;                     % Simulation Start Time [s]
simu.rampTime = 20;                     % Wave Ramp Time [s]
simu.endTime = 100;                       % Simulation End Time [s]
simu.solver = 'ode4';                   % simu.solver = 'ode4' for fixed step & simu.solver = 'ode45' for variable step 
simu.dt = 0.05; 	                    % Simulation time-step [s]
simu.domainSize = 2;                    % Simulation domain size [m]
%% Wave Information 
% % Regular Waves  
% waves = waveClass('regular');           % Initialize Wave Class and Specify Type                                 
% waves.height = 0.12;                    % Wave Height [m]
% waves.period = 1.5;                    % Wave Period [s]
% waves.direction = 0;

% % Irregular Waves using JS Spectrum with Equal Energy and Seeded Phase
% waves = waveClass('irregular');           % Initialize Wave Class and Specify Type
% waves.height = 0.12;                      % Significant Wave Height [m]
% waves.period = 1.0;                       % Peak Period [s]
% waves.spectrumType = 'JS';                % Specify Wave Spectrum Type
% waves.bem.option = 'EqualEnergy';         % Uses 'EqualEnergy' bins (default) 
% waves.phaseSeed = 10;                      % Phase is seeded so eta is the same
% simu.endTime = 100*waves.period;
% waves.direction = [90 95];
% waves.spread = [0.5 0.5];

% % Imported wave spectrum
% waves = waveClass('spectrumImport');
% waves.spectrumFile = 'DirectionalSpectrum_ReducedFrequencyRange_Test.mat';
% waves.phaseSeed = 10;

% Full directional wave spectrum
waves = waveClass('spectrumImportFullDir');
% waves.spectrumFile = 'DirectionalSpectrum_Test.mat';
waves.spectrumFile = 'DirectionalSpectrum_ReducedFrequencyRange_Test.mat';
waves.freqDepDirection.spreadRange = 2;
waves.freqDepDirection.nBins = 73; 
waves.phaseSeed = 10;
%% Body Data
% Float
% body(1) = bodyClass('oswec.h5');
body(1) = bodyClass('1_WEC_Data_d1p10_IRR_AllDirections_0360_d15.h5');               % Create the body(1) Variable, Set Location of Hydrodynamic Data File and Body Number Within this File.   
% body(1) = bodyClass('1_WEC_Data_d1p10_IRR_AllDirections.h5');               % Create the body(1) Variable, Set Location of Hydrodynamic Data File and Body Number Within this File.   
body(1).geometryFile = 'geometry/Full_Buoy_Rack.stl';                       % Location of Geometry File
body(1).mass = 'equilibrium';                                               % Body Mass. The 'equilibrium' Option Sets it to the Displaced Water Weight.
body(1).inertia = [0 0 0];                                                  % Moment of Inertia [kg*m^2]   
% body(1).centerGravity = [0 0 0];
%% PTO Parameters
% Translational PTO
pto(1) = ptoClass('PTO1');                                                  % Initialize PTO Class for PTO1
pto(1).stiffness = 0;                                                       % PTO Stiffness [N/m]
pto(1).damping = 0;                                                         % PTO Damping [N/(m/s)]
pto(1).location = [0 0 0];                                                  % PTO Location [m]
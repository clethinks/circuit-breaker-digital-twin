clc


% Define Simulation Model
modelName = 'circuit_breaker_model';
open_system(modelName);

% Define Sensors
positionSensor = 'Motion_Sensor';
currentSensor = 'Breaker_Current_Sensor';
voltageSensor = 'Solenoid_Voltage_Sensor';

% Run Simulation
simOut = sim(modelName);

% Extract Data
time = simOut.tout;
breakerPosition = simOut.get(positionSensor).Values.Data;
breakerCurrent = simOut.get(currentSensor).Values.Data;
solenoidVoltage = simOut.get(voltageSensor).Values.Data;

% Plot Sensor Data
figure;
subplot(3,1,1);
plot(time, breakerPosition);
title('Breaker Position');
xlabel('Time (s)');
ylabel('Position (m)');
grid on;

subplot(3,1,2);
plot(time, breakerCurrent);
title('Breaker Current');
xlabel('Time (s)');
ylabel('Current (A)');
grid on;

subplot(3,1,3);
plot(time, solenoidVoltage);
title('Solenoid Voltage');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;

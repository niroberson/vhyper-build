%open the arduino and begin communicating with it
delete(instrfind({'Port'},{'COM'}))
clear all;
ard = arduino('COM3');


r0 = 100e3; %resistance of thermistor at 25 degrees C
t0 = 25 + 273.15;
vcc = 3.3; %input voltage to resistor divider
% divider resistor values for each tempature probe
r = [98.51e3 98.94e3 98.73e3 98.63e3 98.33e3];
beta = [3935 3950 3950 3970 3980];

deg_c_average_1 = 0;%used for the averages
deg_c_average_2 = 0;
deg_c_average_3 = 0;
deg_c_average_4 = 0;
deg_c_average_5 = 0;


%Time of the simulation
end_time = 60;
analog_pin = ['A0';'A1';'A2';'A3';'A4'];%used to incremenet the pin that is being measured


begin_time = cputime;


for i=1:1:end_time %total simulation time this loop helps format the data
    
    for x=1:1:3 %for loop used to average the data from each pin 3 times
        
        for pin=1:1:5 %loop samples pin A1-A5, one time
            voltage(1,pin) = readVoltage(ard, strcat('A',int2str(pin)));
            rT(1,pin) = (voltage(1,pin)*r(pin))/(vcc-voltage(1,pin));
            k = r0*exp(-beta(pin)/t0); %constant for temperature calculation
            deg_c(1,pin) = (beta(pin)/log(rT(1,pin)/k))- 273.15;                      
        end
        %read the voltage from the 5 pins three time and then calculate the
        %average
        deg_c_average_1 = (deg_c_average_1 + deg_c(1,1))/x;
        deg_c_average_2 = (deg_c_average_2 + deg_c(1,2))/x;
        deg_c_average_3 = (deg_c_average_3 + deg_c(1,3))/x;
        deg_c_average_4 = (deg_c_average_4 + deg_c(1,4))/x;
        deg_c_average_5 = (deg_c_average_5 + deg_c(1,5))/x;
        pause(0.1);
    end
      
    t(i,1) = i*0.5;
    data_1(i,1) = deg_c_average_1;
    data_2(i,1) = deg_c_average_2;
    data_3(i,1) = deg_c_average_3;
    data_4(i,1) = deg_c_average_4;
    data_5(i,1) = deg_c_average_5;
    disp('Average 1 =');
    disp(deg_c_average_1);
    disp('Average 2 =');
    disp(deg_c_average_2);
    disp('Average 3 =');
    disp(deg_c_average_3);
    disp('Average 4 =');
    disp(deg_c_average_4);
    disp('Average 5 =');
    disp(deg_c_average_5);
    pause(0.2);
end
disp(cputime - begin_time);

%plot the data aquired
plot(t,data_1,t,data_2,t,data_3,t,data_4,t,data_5);
title('Temperature DAQ');
xlabel('Time (seconds)');
ylabel('Temp (C)');
legend ('Probe 1', 'Probe 2', 'Probe 3', 'Probe 4', 'Probe 5');
grid on;


%Exporting to Excel
Simulation_Time = t(1:end_time);
Temp_Probe_1 = data_1(1:end_time);
Temp_Probe_2 = data_2(1:end_time);
Temp_Probe_3 = data_3(1:end_time);
Temp_Probe_4 = data_4(1:end_time);
Temp_Probe_5 = data_5(1:end_time);
T = table(Simulation_Time,Temp_Probe_1,Temp_Probe_2,Temp_Probe_3,Temp_Probe_4,Temp_Probe_5);
filename = 'Temperature_Dac.xlsx';
delete(filename);
writetable(T,filename,'Sheet',1)




% plot(t,data);global x k ard;
% x=0;
% for k=1:(1/handles.sample_rate):handles.total_samples
%     voltage = readVoltage(ard, 'A0');
%     %millivolts = (voltage *(5/1024));
%     deg_c = ((voltage*1000)-500)/10;
%     x=[x,deg_c];
%     plot(x,'LineWidth',2); grid on;
%     axis([0 handles.total_samples -10 90]);
%     pause(1/handles.sample_rate);
% end

 
    
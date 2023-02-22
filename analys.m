%Contants
j_kWh = 1/(3600*1000);

%Start fig1
figure;
hold on;

%Plot SOC over time in fig 1
soc = out.simout.Battery.SOC___(:, 1);
subplot(2,1,1);
plot(soc);
title('SOC in %');
ylabel('SOC [%]');
xlabel('Time');

%Plot motTorque vs VehSpeed in fig 1
subplot(2,1,2);
vehSpeed = out.simout.Vehicle.Velocity_m_s_.data;
motorTorque = out.simout.Motor.MototNetTorque_Nm_.data*3.6;
plot(vehSpeed,motorTorque,'.');
title('Motor Torque vs. Vehicle Speed');
ylabel('Motor Torque[Nm]');
xlabel('Vehicle Speed[Km/h]');
hold off;


%Create a stackedbar with energy consumtion
 x = categorical({'Motor','Battery','External powersource'}); 
 y = [  out.simout.Motor.MotorEnergyLosses_W_.data(end, :)*j_kWh out.simout.Motor.MotorEnergyInput_J_.data(end, :)*j_kWh; 
        out.simout.Battery.Batt_energy_losses__J_.data(end, :)*j_kWh out.simout.Battery.Batt_energy_at_terminal__J_.data(end, :)*j_kWh ;
         0 out.simout.signal1.External_power_kWh_.Data(end, :) ]; 
 b = bar(x,y,"stacked");
 title('System Energy consumtion & losses');
 ylabel('Power [kWh]');
 legend('Losses','Input')
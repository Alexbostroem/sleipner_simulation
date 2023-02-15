t = out.tout;


%Plot SOC
figure
soc = out.results.Battery.SOC___;
plot(t,get(soc,"Data"));
title('SOC[%] over time')
ylabel('SOC[%]')



%Plot Battery power vs VehSpeed
figure
battPow = out.results.Battery.Batt_power_at_terminal__W_;
vehSpeed = out.results.BusCreator.Velocity_m_s_;
plot(get(vehSpeed,"Data"),get(battPow,"Data"),'o')
title('Battery Power vs. Vehicle Speed')
xlabel('Vehicle Speed[m/s]')
ylabel('Power[kW]')

%Plot Motor torque vs VehSpeed
figure
motorTorque = out.results.signal2.MototNetTorque_Nm_;
vehSpeed = out.results.BusCreator.Velocity_m_s_;
plot(get(vehSpeed,"Data"),get(motorTorque,"Data"),'o')
xlabel('Vehicle Speed[m/s]')
ylabel('Torque[Nm]')
title('Motor Torque vs. Vehicle Speed')
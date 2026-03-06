function [optimized_load, SOC_profile] = demand_side_management(loadData, PV_generation, battery_capacity, SOC, efficiency)
% Simple DSM function for load shifting and PV integration
% Inputs: 
%   loadData - original load profile (kW)
%   PV_generation - PV output (kW)
%   battery_capacity - battery size (kWh)
%   SOC - initial state of charge (%)
%   efficiency - battery efficiency
% Outputs:
%   optimized_load - adjusted load profile
%   SOC_profile - battery state of charge over time

optimized_load = loadData;          % initialize
SOC_profile = zeros(size(loadData));% track SOC

for t = 1:length(loadData)
    net_generation = PV_generation(t) - loadData(t);
    
    if net_generation >= 0
        % Excess PV: charge battery
        SOC = min(battery_capacity, SOC + net_generation*efficiency);
        optimized_load(t) = loadData(t);
    else
        % Deficit: discharge battery if possible
        discharge = min(-net_generation, SOC/efficiency);
        SOC = SOC - discharge*efficiency;
        optimized_load(t) = loadData(t) - discharge;
    end
    
    SOC_profile(t) = SOC;
end

end
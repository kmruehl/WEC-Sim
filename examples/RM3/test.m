clear all
close all

%% run normal
wecSim

figure
hold on;
phaseSeed = waves.phaseSeed;
plot(waves.waveAmpTime(:,1),waves.waveAmpTime(:,2), 'DisplayName', ['Normal phaseSeed=', num2str(phaseSeed)])

%% create .mat file
mcr.header = ["waves.height", "waves.period"];
mcr.cases(1 , 1) = waves.height;
mcr.cases(1, 2) = waves.period;
save MCR_cases.mat mcr

%% run in parallel
wecSimPCT
load('savedData001.mat')
phaseSeed = waves.phaseSeed;
plot(waves.waveAmpTime(:,1),waves.waveAmpTime(:,2), 'DisplayName', ['Parallel phaseSeed=', num2str(phaseSeed)])
xlabel('time [s]')
ylabel('Generated waves [m]')
legend
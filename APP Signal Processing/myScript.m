function myScript()

digitalSilenceThreshold = 0; %establish digital silence to zero

[S,Fs] = audioread('chord_MI_SOL.wav');

%sound(S,Fs) %play sound
N = length(S); %number of samples in signal S

duration = N/Fs; %the number of seconds in 'chord_M1_SOL.wav'.

power = 0; 
for i = 1:Fs/4 %Take first quater of the signal to compute the power of the audio signal to conserve power
    power = power + S(i)*S(i);
end
disp(power);
disp(N);
disp(duration);

%if power > digitalSilenceThreshold
 
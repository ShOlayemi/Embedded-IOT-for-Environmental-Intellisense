function myTrigger()

digitalSilenceThreshold = 0; %establish digital silence to zero

power = 0; 

while power <= digitalSilenceThreshold 
    [S,Fs] = audioread('chord_MI_SOL.wav');
 
    for i = 1:Fs/4 %Take first quater of the first second of the signal to compute the power of the audio signal to conserve power
        power = power + S(i)*S(i);
    end  
end
N = length(S); %number of samples in signal S

duration = N/Fs; %the number of seconds in 'chord_M1_SOL.wav'.

disp(power); %wake the device
disp(N);
disp(duration); 

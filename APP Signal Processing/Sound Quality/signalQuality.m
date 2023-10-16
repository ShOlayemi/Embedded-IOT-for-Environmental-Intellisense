function signalQuality()
power = 0; 
power1 = 0; 
[s,fs]=audioread('good.m4a'); %read good signal

spectrum= abs(fft(s)); %Apply Fast Fourier Transform on the signal to take the signal to the
%%frequency domain

subplot(2,1,1)
plot(spectrum) %plot the spectrum of the signal


for k = 1:fs/4 %Take first quater of the first second of the signal to compute the power of the audio signal to conserve power
        power = power + s(k)*s(k);
    end
    

%disp(power) %2.2348

[s1,fs1]=audioread('Noise.m4a'); % read noisy signal

spectrum1= abs(fft(s1)); %Apply Fast Fourier Transform on the signal to take the signal to the
%%frequency domain


subplot(2,1,2)
plot(spectrum1) %plot the spectrum of the signal


for j = 1:fs1/4 %Take first quater of the first second of the signal to compute the power of the audio signal to conserve power
        power1 = power1 + s1(j)*s1(j);
end

%disp(power1) %9.6392

Threshold = 4; %establish treshhold as 4 based on the power computation of the good signal

if (power < Threshold)  %compare the power of the signal to the threshold
    disp('1'); % display 1 when power is good or lower than threshold
else 
        disp('0'); % display 0 when power is noisy or higher than threshold
end


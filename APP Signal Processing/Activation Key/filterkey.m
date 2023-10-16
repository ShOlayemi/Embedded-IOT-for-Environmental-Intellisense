%function myfilter
[S,Fs]=audioread('392.wav');


spectrum= abs(fft(S));
plot(spectrum);

subplot(2,1,1)
plot(spectrum)

Fs = 16000;  % Sampling Frequency

Fstop1 = 352;             % First Stopband Frequency
Fpass1 = 372;             % First Passband Frequency
Fpass2 = 412;             % Second Passband Frequency
Fstop2 = 432;             % Second Stopband Frequency
Dstop1 = 0.001;           % First Stopband Attenuation
Dpass  = 0.057501127785;  % Passband Ripple
Dstop2 = 0.001;           % Second Stopband Attenuation
dens   = 20;              % Density Factor



% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
    0], [Dstop1 Dpass Dstop2]);
% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);


% [EOF]

Outputsignal=filter(Hd,S);
Spectrum2=abs(fft(Outputsignal));

subplot(2,1,2)
plot(Spectrum2)
title("after filter")

Ps1 = 0;
for i = 1:Fs
    %for i = 1:N
    Ps1 = Ps1 + S(i) * S(i);
end
Ps2 = 0;
for i = 1:Fs
    %for i = 1:N
    Ps2 = Ps2 + Outputsignal(i) * Outputsignal(i);
end
disp(Ps1);
disp(Ps2);

Threshold = 3;

if (Ps2 > Threshold)
    disp("Key is activated")
else
    disp("Key is not activated")
end    



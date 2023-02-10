clear all
clc


filename='Sample1.wav'; %testing audio input 
[x,fs] = audioread(filename); 
x=x(:,1); % channel 1
L= length(x); % sample length

%fs=100;
%t = 0:time/L:time-time/L;
t=0:1/fs:L-1/fs;
x=sin(2*pi*t);
time = length(x)/fs;

fs_new=210; %Resampling Frequency;
[N, D] = rat(fs_new/fs); % To find the fraction.
fs_up = N*fs; %Upsampled Frequency;
fs_down=fs_up/D; %Downsampled Frequency;
figure(1);
subplot(2,1,1);
title('Original Signal');
plot(t,x);
subplot(2,1,2);
pwelch(x);
%spectrogram(x);
%plot(ft,abs(spec_x));


% upsampling 
yup = zeros(1,N*length(x)) ;
yup([1:N:length(yup)])=x;       %UPSAMPLED

 
% plots for Upsampled signal %
L= length(yup); % sample length
time = L/fs_up; %Total Time
t = 0:time/L:time-time/L;
figure(2);
subplot(2,1,1);
stem(t,yup);
title('Upsampled Signal');
xlim([0 0.2])
subplot(2,1,2);
pwelch(yup)
%spectrogram(upsampled_x);
%plot(ft,abs(upsampled_spec));



%LPF filter Deisgn

y=lowpass(yup,pi/N);

%fc_in=(fs/2)/N;
%wc1=2*pi*fc_in/fs_up;
%fc_dec=(fs_up/4)/D;
%wc2=2*pi*fc_dec/fs_down;
%[b,a]=fir1(5,min(wc1, wc2));
%y=filter(b,a,yup);

 % plots for filtered signal %
L= length(y); % sample lengthtime = L/fs_up; % Total Time
t = 0:time/L:time-time/L;
figure(3);
subplot(2,1,1);
plot(t,y);
title('filtered signal ');
xlim([0 0.2])
subplot(2,1,2);
pwelch(y);
%spectrogram(y);
%plot(ft,abs(y_spec));



% downsampling 
 % downsampling 
downsampled_x=y(1:D:end); %downsampling of the 
%filtered signal
 % plots for Downsampled signal %
L= length(downsampled_x); % sample length
time = L/fs_down; % Total Time
t = 0:time/L:time-time/L;
figure(4);
subplot(2,1,1);
stem(t,downsampled_x);
xlim([0 0.2])
title('Downsampled Signal');
subplot(2,1,2);
pwelch(downsampled_x)
%spectrogram(downsampled_x);
%plot(ft, abs(downsampled_spec));
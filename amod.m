clear all;
clc;
Am=5; %amplitude of message signal
Ac=5; %amplitude of carrier signal 
m=0.85;  %modulation index
fm=6.67;  %frequency of message signal
fc=250;   %frequency of carrier signal
F=300;   %sampling rate
T=1/F;   %sampling time
t=0:T:1;  %time period of plot
m_t=Am.*cos(2*pi*fm*t); %message signal
x_t= Ac.*cos(2*pi*fc*t); %carrier signal
y=Ac*(1+m*cos(2*pi*fm*t)).*cos(2*pi*fc*t); %Modulated signal
x=F*fftshift(fft(m_t));    %Fast-fourier transformation of Message signal
M=abs(x);     %abstraction of imaginary part
dF=-F/2:F/2;  % Frequency plot range
Y=T*fftshift(fft(y));  %Fast fourier transformation of Modulated signal
Ym=abs(Y);    
subplot(3,1,1);  
plot(t,m_t);   %plot of message signal
title('MESSAGE SIGNAL');
xlabel('Time');
ylabel('Amplitude');
subplot(3,1,2);
plot(t,x_t);   %plot of carrier signal
title('Carrier ');
xlabel('Time');
ylabel('Amplitude');
subplot(3,1,3);
plot(t,y);   % plot of modulated signal
title('MODULATED SIGNAL');
xlabel('Time');
ylabel('Amplitude');
figure;
plot(dF,Ym);  %plot of fft of modulated signal
title('SPECTRUM');
xlabel('Frequency');
ylabel('Amplitude');
figure;
plot(dF,M);   % plot of fft of Message signal
title('MESSAGE SPECTRUM');
xlabel('Frequency');
ylabel('Amplitude');


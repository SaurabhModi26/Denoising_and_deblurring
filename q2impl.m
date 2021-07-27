%Importing data from data.xlsx excel file
x = readmatrix('data.xlsx','Sheet','data','Range','A2:A194');
y = readmatrix('data.xlsx','Sheet','data','Range','B2:B194');

%plotting x[n]
figure;
plot(x);
title('Q2: Graph of x');
xlabel('n');
ylabel('Temperature')

%plotting y[n]
figure;
plot(y);
title('Q2: Graph of y');
xlabel('n');
ylabel('Temperature');

%h
h=[1 4 6 4 1] * (1/16);

%taking N=193
N=length(y);

%taking DTFT of Y
Y=DTFT(y,N);
figure;
m1 = abs(Y);
plot(m1);
title('Q2: DTFT of y');
xlabel('omega(k)');
ylabel('Y = y(e^jw)');

H=DTFT2(h,N);
figure;
m1 = abs(H);
plot(m1);
title('Q2: DTFT of h');
xlabel('omega(k)');
ylabel('H = h(e^jw)');

%Deblurring y
y_deblur=deblur(Y,H,N);
%finding Inverse DTFT Deblurred signal y_deblur
y_deblur=IFT(y_deblur,N);
figure;
plot(abs(y_deblur));
title('Q2: Graph of deblurred signal');
xlabel('n');
ylabel('Temperature');

%Denoising y_deblur
% we convolve the noisy signal by a kernal of length p
p=3; %length of kernel
temps=1e6;
convolution_signal=convolution(y_deblur,p);
%p1=value of p at which standard deviation is minimum
p1=denoised_signal(y_deblur,p,convolution_signal,temps);

% We will find the denoised signal by putting length of kernel as p.
% y_den=denoised signal of y
y_den=convolution(y_deblur,p1); % y_den=denoised signal of y
x2=y_den;
q=1:N;
figure;
plot(q,abs(x2));
hold on
plot(q,x);
legend('x2[n]','x[n]');
title('Q2: Final signal after denoising and deblurring');
xlabel('n');
ylabel('Temperature = final[n]');

%Printing Standard deviation between x[n] and final[n] in Command Window
%Open Command Window to see standard deviation = 6.1571
std2=std(x,abs(x2));
fprintf('Standard deviation between x[n] and final output of Q2 = %i\n', std2);
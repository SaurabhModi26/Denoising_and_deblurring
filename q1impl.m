%Importing data from data.xlsx excel file 
x = readmatrix('data.xlsx','Sheet','data','Range','A2:A194');
y = readmatrix('data.xlsx','Sheet','data','Range','B2:B194');

%plotting x[n]
figure;
plot(x);
title('Q1: Graph of x');
xlabel('n');
ylabel('Temperature');

%plotting y[n]
figure;
plot(y);
title('Q1: Graph of y');
xlabel('n');
ylabel('Temperature');

% Denoising y
% we convolve the noisy signal by a kernal of length p
p=3; %length of kernel
temps=1e6;
convolution_signal=convolution(y,p);
%p1=value of p at which standard deviation is minimum
p1=denoised_signal(y,p,convolution_signal,temps);

% We will find the denoised signal by putting length of kernel as p1.
% y_den=denoised signal of y
y_den=convolution(y,p1);
figure;
plot(y_den);
title('Q1: Graph of denoised signal');
xlabel('n');
ylabel('Temperature');
%Thus y_den is denoised signal found from y


N=length(y);
%taking h from the question given 
h=[1 4 6 4 1] * (1/16);

%finding DTFT of denoised y i.e. y_den
Y=DTFT(y_den,N);
figure;
m1 = abs(Y);
plot(m1);
title('Q1: DTFT of y');
xlabel('omega(k)');
ylabel('Y = y_den(e^jw)');

%finding DTFT of h
H=DTFT2(h,N);
figure;
m1 = abs(H);
plot(m1);
title('Q1: DTFT of h');
xlabel('omega(k)');
ylabel('H = h(e^jw)');

%deblurring
y_deblur=deblur(Y,H,N);
%finding Inverse DTFT of final signal after deblurring
x1=IFT(y_deblur,N);
q=1:N;
figure;
plot(q,abs(x1));
hold on
plot(q,x);
legend('x1[n]','x[n]');
title('Q1: Final signal after denoising and deblurring');
xlabel('n');
ylabel('Temperature = final[n]');

%Printing Standard deviation between x[n] and final[n] in Command Window
%Open command window to see standard deviation = 6.1571
std1=std(x,abs(x1));
fprintf('Standard deviation between x[n] and final output of Q1 = %i\n', std1);
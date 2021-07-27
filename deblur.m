function ARR=deblur(Y,H,N)
% This function divides the DTFT of Y and H element wise
w=linspace(0,2*pi,N); %splitting 0 to 2pi into N=193 parts
ARR=0.0+0.0i;
for i=1:N
    ARR(i)=Y(i)/H(i);
end
figure;
m1 = abs(ARR);
plot(m1);
title('Q1: Graph of Deblurred signal in frequency domain');
xlabel('omega(k)');
ylabel('ARR(omega(k)) = Y(omega(k))/H(omega(k))');

end

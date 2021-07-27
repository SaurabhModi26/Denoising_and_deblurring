function z=DTFT(x,nfft)
% This function is take DTFT of function (here for y function)
% we sample our DTFT in N=length(y)=193 intervals
N=length(x);
z=zeros(1,nfft);
Sum=0;
for k=1:nfft
    for jj=1:N
        Sum=Sum+x(jj)*exp(-2*pi*1i*(jj-1)*(k-1)/nfft);
    end
z(k)=Sum;
Sum=0; % Reset
end
return
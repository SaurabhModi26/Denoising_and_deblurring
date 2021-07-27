function z=IFT(x,nfft)
% This function is take Inverse DTFT of function after doing deblurring
% we sample our DTFT in N=length(y)=193 intervals
N=length(x);
z=zeros(1,nfft);
Sum=0;
for k=1:nfft
    for jj=1:N
        Sum=Sum+x(jj)*exp(2*pi*1i*(jj-1)*(k-1)/nfft);
    end
z(k)=Sum;
Sum=0;% Reset
end
z=z/N;
return
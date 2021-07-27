function H=DTFT2(h,N)
% This function is take DTFT of H function which includes first 
% taking DTFT of h and then making a limit for values less than
% threshold constant t=0.8 (selected by wish)
% we sample our DTFT in N=length(y)=193 intervals
w=linspace(0,2*pi,N); %splitting 0 to 2pi into 193 parts
for k=1:N
    H(k)=0.0+0.0i;
    for n=1:length(h)
        H(k)=H(k)+h(n) .* exp(-1i .* w(k) .* (2-n));
    end
end

t=0.8; % t -> threshold constant
% this constant is selected through trial and errror with final output.
for k=1:N
    if(H(k)<t)
        H(k)=t;
    end
end
end
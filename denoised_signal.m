function k=denoised_signal(y,k,convolution_signal,temps)
% this function is called to get a value of length of kernel at which
% standard deviation is minimum with y.
   arr1=[];
   N=length(y);
   for i=1:N
       c=abs(convolution_signal(i)-y(i));
       arr1=[arr1 c];
   end
  
   s=std(arr1);
   if(s<temps)
       temps=s;
       k=k+2;
       denoised_signal(y,k,convolution(y,k),temps);
   else
       k;
   end
end

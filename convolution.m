function arr=convolution(y,k)
% this function is to apply the weighted averaging through 
% usage of h as a kernel in order to do denoising
%k is length of kernel
   arr=y;
   N=length(y);
   for i=1:N
       s=0;
       a=i-(k-1)/2;
       b=i+(k-1)/2;
       c=((k-1)/2)-i+1;
       d=((k-1)/2)-N+i;
      
       if (2*i-k-1>=0) && (2*N-k-2*i+1>=0)
           s=s+sum(arr(a : b));
       elseif (2*i-k-1<0) && (2*N-k-2*i+1>=0)
           s=s+sum(arr(1 : b));
           s=s+c*arr(1);
       elseif (2*i-k-1>=0) && (2*N-k-2*i+1<0)
           s=s+sum(arr(a : N));
           s=s+d*arr(N);
       else
           s=s+sum(arr(1 : N));
           s=s+c*arr(1);
           s=s+d*arr(N);
       end
       arr(i)=s/k;
   end
end

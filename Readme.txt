We have written code in MATLAB . 


    Following is way to run the codes
1. Open MATLAB 
2. Upload B20BB033andB20EE035.zip file on MATLAB 
3. Extract the zip file in MATLAB
4. Run q1impl.m for getting Implementation of x1[n] (for final answer check figure 7)
5. Run q2impl.m for getting Implementation of x2[n] (for final answer check figure 7)
     NOTE :- Figures 1 to 6 are for better understanding of analysis of intermediate functions ,                    and figure 7 is for analysis of final answer produced in both .m files


                   This zip file consists of :
1. A readme file 
2. Report.pdf
3. Contribution of student.pdf


                    Main files  :     
1. q1impl.m :- Implementation of question 1 , (basically x1[n] ) 
2. q2impl.m :- Implementation of question 2 , (basically x2[n] )


Also contains 6 MATLAB function files( This functions are made by us to make code modular and readable) :


3. convolution.m :- 
4. denoised_signal.m :-
5. DTFT.m :- 
6. DTFT2.m :- 
7. deblur.m :-
8. IFT.m :-


Also a data file :


9. data.xlsx






Detailed description of each files :-


1. q1impl.m :-  This file contains codes for implementation of question 1 . First denoising is done then deblurring(sharpening) is done .                                                                     
      1. Firstly , data is taken from data.xlsx file as x and y .
      2. Then x[n] and y[n] are plotted for understanding 
      3. Now , main step is done , we make a variable convolution_signal to denoise the signal using (convolution.m ) function with  length of kernel = 3 . 
      4. Now we find a suitable length of kernel p1 (which is always a odd number) by running denoised_signal.m function , at which the standard deviation between the denoised signal and y is minimum . 
Note :- temps variable stores a very high value for initial standard deviation 


      5. As we find p1 , we again run convolution.m function to get the most appropriate denoised signal , stored in variable y_den .
      6. Now we find DTFT of y_den by running DTFT.m function ,stored as Y.
      7. Now we find DTFT of h by running DTFT2.m function( in this function we also limit the DTFT to a threshold constant t = 0.8 (taken through trail and error method ) ) , stored as H .
      8.Then deblurring is done through deblur.m function ,which return the deblurred signal ( element wise division of Y and H ) , stored in y_deblur .
      9. Now ,we take Inverse DTFT of y_deblur by using IFT.m function , stored as x1.
     10.Now , we plot x1 and x in same graph using plot function ,for doing proper analysis . 
2. q2impl.m :-This file contains codes for implementation of question 2 . First deblurring is done then denoising is done . 
      1. Firstly , data is taken from data.xlsx file as x and y .
      2. Then x[n] and y[n] are plotted for understanding .
      3.Now we find DTFT of y_den by running DTFT.m function ,stored as Y.
      4. Now we find DTFT of h by running DTFT2.m function( in this function we also limit the DTFT to a threshold constant t = 0.8 (taken through trail and error method ) ) , stored as H .
     5.Then deblurring is done through deblur.m function ,which return the deblurred signal ( element wise division of Y and H ) , stored in y_deblur .
     6.Now ,we take Inverse DTFT of y_deblur by using IFT.m function , stored again in y_deblur .
      7.Now  , we make a variable convolution_signal to denoise the signal using (convolution.m ) function with  length of kernel = 3 . 
      8. Now we find a suitable length of kernel p1 (which is always a odd number) by running the denoised_signal.m function , at which the standard deviation between the denoised signal and y is minimum . 
Note :- temps variable stores a very high value for initial standard deviation 
      9. As we find p1 , we again run convolution.m function to get the most appropriate denoised signal , stored in variable y_den . 
     10 . Now we make x2 = y_den .
     11.Now , we plot x2 and x in same graph using plot function ,for doing proper analysis .




Function files detailed description 
1. convolution.m :-
                  1 . make a variable arr to store y.
                  2 . Make variable N=length(y)
                  3.  Now we initialise the sum function for the sum of the values at index where kernel is put.
                4.  Now there are 4 cases that when a)kernel left edge goes beyond y, b) kernel right edge goes beyond y, c) No edge of kernel goes beyond y, d) both kernel edges goes beyond y
                       5. Now divide the kernel sum by k(length of kernel) and store it in arr






2. denoised_signal.m :-
1 . we first initialise a empty array arr to store difference between convoluted_signal and y
2. Now we store standard deviation of arr , store it in std.
3 . if std is smaller than temps than do temps=std and increase k by 2(as length of kernel is always odd) and again recursively run denoised_signal.m function.
4. Else if k>temps then return k.






3. DTFT.m :-         
1. In this we initialise a zero array z to store the DTFT.
2. Now we run 2 nested for loops for calculating DTFT and store it in cells of z.




4. DTFT2.m :-
1.  This function is specifically designed to find DTFT of h.
2. First we find DTFT of h as in DTFT.m function
3. Then if the value of fourier transform is greater than i.e. t>0.8 than make t=0.8.




5. deblur.m :-
1.  In this we just element wise divide DTFT of y i.e. Y and DTFT of h i.e. H


6. IFT.m :-
1. In this we initialise a zero array z to store the IFT.
2. Now we run 2 nested for loops for calculating IFT and store it in cells of z.
3. Now finally divide all values by N=length(y).


7. data.xlsx :- This file was given , contains data that was exported as x[n] and y[n]. We read data by readmatrix function in MATLAB .
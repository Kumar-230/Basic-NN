%Madaline code for Assignment-I_111117069%

clear all
close all
clc
LR= 1;
%Modify Inputs
M=[1 1;1 -1;-1 1;-1 -1]; 
D=[-1; 1; 1; -1];
%Modify Weights
W1= [0.1;0.3];
W2= [0.2;0.4];
%Modify bias
B1= 0.5; B2= 0.5; B3= 0.5;
Z1=0.5; Z2=0.6;
NW1=W1; NW2=W2;
i=1;e=0;
NE=input("Enter number of epochs ");
condition= true;

while condition
    
W1=NW1; W2=NW2;
Sum1= M(i,[1 2])*W1+B1;
Sum2= M(i,[1 2])*W2+B2;

if (Sum1>0) H1=1;
else H1=-1;
end
if (Sum2>0) H2=1;
else H2=-1;
end

Sum=H1*Z1+H2*Z2+B3;

if (Sum>0) O=1;
else O=-1;
end

if (D(i)~=O)
    if(D(i)== -1)
        if(H1== 1)
            B1= B1+ LR*(-1-Sum1);
            NW1= NW1+ LR*(-1-Sum1)*M(i,[1 2])';
        end
        if(H2== 1)
            B2= B2+ LR*(-1-Sum2); 
            NW2= NW2+ LR*(-1-Sum2)*M(i,[1 2])'; 
        end
    else if(D(i)== 1)
            if(abs(Sum1-0)<abs(Sum2-0))
            B1= B1+ LR*(1-Sum1); 
            NW1= NW1+ LR*(1-Sum1)*M(i,[1 2])';
            else
            B2= B2+ LR*(1-Sum2); 
            NW2= NW2+ LR*(1-Sum2)*M(i,[1 2])';
            end
        end
    end
end

i=i+1;
if(i==5)i=1;e=e+1; end

if(e==NE) condition=false;   
end

end

display("New Weights");
display(NW1);
display(NW2);
display(" New Bias values");
display(B1);
display(B2);

%Backpropagation code for Assignment-I_111117069%

clear all
close all
clc
condition= true;
LR=0.5;S=1;i=1;e=0;SSE=0;
%Modify inputs
%%I=[0.1 0.2;0.2 0.3;0.3 0.4;0.4 0.5];
I=input("Enter training patterns: ");
%Modify Targets
%%D=[0.3;0.5;0.7;0.9];
D=input("Enter targets: ");
%Modify Weights
W=[0.1 0.2;0.3 0.4];W1=0.5;W2=0.6;
%Modify Bias
B1=-0.5;B2=-0.5;B3=-0.5;
CW=[0 0;0 0];
NE=input("Enter number of epochs: ");

while condition
    
Sum1=I(i,[1 2])*W([1 2],1)+B1;
Sum2=I(i,[1 2])*W([1 2],2)+B2;
f1=(1+exp(-Sum1))^-1;
f2=(1+exp(-Sum2))^-1;
Sum=f1*W1+f2*W2+B3;
f=(1+exp(-Sum))^-1;
CW(1,1)= -LR*(-2*S*(D(i)-f)*f*(1-f)*W1*S*(f1*(1-f1)*I(i,1)));
CW(1,2)= -LR*(-2*S*(D(i)-f)*f*(1-f)*W2*S*(f1*(1-f1)*I(i,1)));
CW(2,1)= -LR*(-2*S*(D(i)-f)*f*(1-f)*W1*S*(f1*(1-f1)*I(i,2)));
CW(2,2)= -LR*(-2*S*(D(i)-f)*f*(1-f)*W2*S*(f1*(1-f1)*I(i,2)));

B1=B1-LR*(-2*S*(D(i)-f)*f*(1-f)*W1*S*(f1*(1-f1)));
B2=B2-LR*(-2*S*(D(i)-f)*f*(1-f)*W2*S*(f1*(1-f1)));

W=W+CW;
W1=W1-LR*(-2*S*(D(i)-f)*f*(1-f)*f1);
W2=W2-LR*(-2*S*(D(i)-f)*f*(1-f)*f2);

B3=B3-LR*(-2*S*(D(i)-f)*f*(1-f));

SSE=SSE+(D(i)-f)^2;
i=i+1;
if(i==5)i=1;
    %display("Sum Squared Error for :");display(e);display(SSE);
    e=e+1;SSE=0; end
if(e==NE) condition=false; end
end

display("New weights in the output layer:");
display(W1);display(W2);
display("New bias in the output layer:");
display(B3);
display("New weights in the input layer:");
display(W);
display("New bias in the input layer:");
display(B1); display(B2);

%Testing
%%IT=[0.2 0.4];
IT=input("Enter testing pattern: ");
%%DT=0.6;
DT=input("Enter testing output: ");
Sum1T=IT([1 2])*W([1 2],1)+B1;
Sum2T=IT([1 2])*W([1 2],2)+B2;
f1T=(1+exp(-Sum1T))^-1;
f2T=(1+exp(-Sum2T))^-1;
SumT=f1T*W1+f2T*W2+B3;
fT=(1+exp(-SumT))^-1;
display(fT);

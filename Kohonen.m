%Kohonen code for Assignment-I_111117069%

clear all
clc
close all

LR=0.9;e=0;
%Modify input values
%%I=[1 1 1 -1;-1 -1 -1 1;1 -1 -1 -1;-1 -1 1 1];
n=input("Enter number of training patterns: ");
I=input("Enter training patterns: ");
%Modify Weights- Classifying into 2 clusters
%%W=[0.2 0.8;0.6 0.4;0.5 0.7;0.9 0.3]; 
W=input("Enter initial weights: ");
condition =true; i=1;
NE=input("Enter number of epochs: ");

while condition
    
for i=1:n
 ED1= 0; ED2=0; 
  for j=1:4
      ED1=ED1+(W(j,1)-I(i,j)).^2; 
      ED2=ED2+(W(j,2)-I(i,j)).^2;
  end
  
  if(ED2<ED1)
    for k=1:4
     W(k,2)=W(k,2)+LR*(I(i,k)-W(k,2));
    end
 
   else
    for k=1:4
     W(k,1)=W(k,1)+LR*(I(i,k)-W(k,1));
    end
   end
end

e=e+1; LR=LR/2;
if(e==NE) condition= false; end

end

display("New Weights");
display(W);
%Testing
%IT=[-1 -1 -1 -1];
IT=input("Enter testing pattern: ");
EDT1= (W(1,1)-IT(1)).^2+(W(2,1)-IT(2)).^2+(W(3,1)-IT(3)).^2+(W(4,1)-IT(4)).^2; 
EDT2= (W(1,2)-IT(1)).^2+(W(2,2)-IT(2)).^2+(W(3,2)-IT(3)).^2+(W(4,2)-IT(4)).^2;
if(EDT1<EDT2)
    display("Testing pattern belongs to cluster 1");
else
    display("Testing pattern belongs to cluster 2");
end


    
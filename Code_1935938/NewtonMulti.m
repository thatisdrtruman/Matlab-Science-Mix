% CM2208 Newton's Method
% Input: function f, df (derivative of f), initial guess p0, 
% tolerance (as relative error)
% N0 (max. iterations)
% Output: the value p
% Example: NewtonMulti(@(x) x^5/1024+3*x^4/256-5*x^3/64-15*x^2/16+x+12, @(x) 4*x^4/1024+12*x^3/256-15*x^2/64-30*x/16+1, 10)
function p = NewtonMulti(f, df, p0)
fplot(0,[-10 10],'black');
hold on
grid
fplot(f,[-10 10],'b');
f0=f;
xroots(1)=fzero(f0,-10);
plot(xroots(1),0,'ro');
f0=@(x) f0(x)./(x-xroots(1));
xroots(2)=fzero(f0,10);
plot(xroots(2),0,'ro');
f0=@(x) f0(x)./(x-xroots(2));
xroots(3)=fzero(f0,5);
plot(xroots(3),0,'ro');
f0=@(x) f0(x)./(x-xroots(3));
xroots(4)=fzero(f0,0);
plot(xroots(4),0,'ro');
f0=@(x) f0(x)./(x-xroots(4));
xroots(5)=fzero(f0,-5);
plot(xroots(5),0,'ro');


fprintf('%3d:%16.9f\n', 0, p0); 
%Step 1:
i = 1;
TOL=1e-5;
N0=100;
%Step 2:
while i <= N0
   %Step 3:
   p = p0 - f(p0)/df(p0);
   fprintf('%3d:%16.9f\n', i, p); 
   %Step 4:
   if abs(p - p0) < TOL
       fprintf('Solution found p = %g\n', p);
       break
   end
   %Step 5:
   i = i + 1;
   %Step 6:
   p0 = p;  
end
    
%for l=-10:.0001:10
%   x0=[l 10];
%   root=fsolve(f,x0);
%   if root<=10
%    fplot(root, 0, 'ro');
%   end
   
%    root=fzero(f,[-10 10]);
%    disp(root)
%    fplot(0,root,'ro')
%    if root<=10
%        xinterceptCounter=xinterceptCounter+1;
%    end
%    if xinterceptCounter==10
%        break
%    end
%end
hold off

end
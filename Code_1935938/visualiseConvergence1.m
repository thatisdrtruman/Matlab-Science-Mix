% Input: function f, df (derivative of f), initial guess p0, 
% tolerance (as relative error set to 1e-5)
% N0 (max. iterations) set to 100
% Output: the value p
% Example: visualiseConvergence1(@(x) x^3+4*x^2-10, @(x) 3*x^2+8*x, 1)
% Example: visualiseConvergence1(@(x) (x)*exp(-x), @(x) exp(-x)-(x)*exp(-x), 0.3)
function p = visualiseConvergence1(f, df, p0)
fprintf('%3d:%16.9f\n', 0, p0); 
%Step 1:
ostp0=p0;
i = 1;
TOL=1e-5;
N0=100;
%Step 2:
while i <= N0
   %Step 3 Newton:
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
%Step 2 Ostrowski:
i=1;
while i <= N0
   %Step 3:
   p = ostp0 - f(ostp0)/df(ostp0);
   q= ostp0 - (f(ostp0)/df(ostp0)) * ((f(ostp0)-f(p))/(f(ostp0)-(2*f(p))));
   fprintf('%3d:%16.9f\n', i, q); 
   %Step 4:
   if abs(q - ostp0) < TOL
       fprintf('Solution found p = %g\n', q);
       break
   end
   %Step 5:
   i = i + 1;
   %Step 6:
   ostp0 = q;
end
subplot(10,10,1);
originalfunction=f;
fplot(originalfunction,[p0 10], 'r');
hold on
fplot(originalfunction,[-10 p0], 'b');
title('Newton');
hold off

subplot(10,10,2);
fplot(originalfunction,[ostp0 10], 'r');
hold on
fplot(originalfunction,[-10 ostp0], 'b');
title('Ostrowski');
hold off
end
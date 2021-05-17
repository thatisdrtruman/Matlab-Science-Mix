% CM2208 Newton's Method
% Input: function f, df (derivative of f), initial guess p0, 
% tolerance (as absolute error= 0.00001)
% N0 (max. iterations =100)
% Output: the value p
% Example: Ostrowski(@(x) x^3+4*x^2-10, @(x) 3*x^2+8*x, 1)
function p = Ostrowski(f, df, p0)
fprintf('%3d:%16.9f\n', 0, p0); 
%Step 1:
i = 1;
TOL=1e-5;
N0=100;
%Step 2:
while i <= N0
   %Step 3:
   p = p0 - (f(p0)/df(p0));
   q= p0 - (f(p0)/df(p0)) * ((f(p0)-f(p))/(f(p0)-(2*f(p))));
   fprintf('%3d:%16.9f\n', i, q); 
   %Step 4:
   if abs(q - p0) < TOL
       fprintf('Solution found p = %g\n', q);
       return
   end
   %Step 5:
   i = i + 1;
   %Step 6:
   p0 = q;  
end
fprintf('Method failed after %d iterations\n', N0);

end
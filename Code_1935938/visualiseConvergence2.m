% CM2208 Newton's Method
% Input: function f, df (derivative of f), initial guess p0, 
% tolerance (as relative error)
% N0 (max. iterations)
% Output: the value p
%Courtesy of Chrima
%Example visualiseConvergence2(@(x) x^3+4*x^2-10, @(x) 3*x^2+8*x-10, 1+2i)
%visualiseConvergence2(@(x) x^16-1, @(x) 16*x^15, 5-4i)
function p = visualiseConvergence2(f, df, p0)
fprintf('%3d:%16.9f\n', 0, p0); 
%Step 1:
ostp0=p0;
i = 1;
TOL=1e-5;
N0=100;
%Step 2:
while i <= N0
   %Step 3:
   p = p0 - (f(p0)/df(p0));
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
fprintf('Method failed after %d iterations\n', N0);

while i <= N0
   %Step 3:
   p = ostp0 - (f(ostp0)/df(ostp0));
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
fprintf('Method failed after %d iterations\n', N0);
if norm(p0-p)<1e-5 
     c='r';        % use the color red
elseif norm(p-p0)<1e-5
     c='b';        % use the color blue
elseif norm(p+p0)<1e-5
     c='g';        % use the color green
else               
     c='k';        % use the color black
end
plot(p0,p,'.','color',c); 
                         % with the color c
title('Newton');
if norm(ostp0-p)<1e-5 
     c='r';        
elseif norm(p-ostp0)<1e-5
     c='b';        
elseif norm(p+ostp0)<1e-5
     c='g';       
else               
     c='k';        
end
plot(ostp0,p,'.','color',c); %
                        
title('Ostrowski');
end

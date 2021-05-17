% CM2208 Bisection Method
% Input: function f, interval [a, b] (a < b), 
% tolerance (as relative error= 0.00001)
% N0 (max. iterations= 100)
% Output: the value p
%BisectionInitialise(@(x) x^3+4*x^2-10, -2, 3)
% Error test 1: BisectionInitialise(@(x) x^3+4*x^2-10, 5, 3)
% Error test 2: BisectionInitialise(@(x) x^3+4*x^2-10, 2, 3) (Without step
% 0 modification gives error
function p = BisectionInitialise(f, a, b)
%Step 0: check if f(a) and f(b) have opposite signs
pass=0;
if (a >= b) || (f(a) * f(b) >= 0)
    if (a >= b)
        error('Incorrect interval. Try making variable a smaller than b');
    else
        while diff([a,b])>= diff([a,b])/(2^20)
            midX=(a+b)/2;
            a=midX;
            if (f(a)*f(b)>=0)
                pass=1;
                break
            end
        end
        if pass==0
            error('Bad interval');
        end
    end
end

%Step 1:
i = 1;
TOL=1e-5;
N0=100;
FA = f(a);
fprintf('%-3s %-16s %-16s %-16s %-16s\n', 'n', 'an', 'bn', 'pn', 'f(pn)'); 

%Step 2:
while i <= N0 
    %Step 3:
    p = a + (b-a)/2;
    FP = f(p);
    %Step 4:
    err = (b-a)/min(abs(a),abs(b));
    if err < TOL
        fprintf('Solution found: p = %g\n', p);
        return
    end
    fprintf('%3d %-16.9f %-16.9f %-16.9f %-16.9f\n', i, a, b, p, FP);
    %Step 5:
    i = i + 1;
    %Step 6:
    if FA * FP > 0
        a = p;
        FA = FP;
    else
        b = p;
    end
end
%Step 7
fprintf('Method failed after %d iterations\n', N0);

end

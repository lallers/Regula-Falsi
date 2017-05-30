function [root,err] = regula(f,a,b,tol,maxi)
% r = regula(f,a,b,tol,maxi) approximates the root of a function
% using the regula falsi method (False Position Method)
%
% inputs
% ------
% f: function handle for objective function
% a,b: points satisfying b > a and f(a)*f(b) < 0
% tol: tolerance for approximate root
% maxi: sets a maximum number of iterations
%
% outputs
% -------
% r: approximate root of objective function
% err: approximates the error in the estimate
% See example script for more info

if nargin < 5
    maxi = 1000;
end
tic; 
fa = f(a); fb = f(b); i=0;
[root,err] = regulasr(f,a,b,fa,fb,tol,i,maxi);
end
function [root, err] = regulasr(f,a,b,fa,fb,tol,i,maxi)
clc
i = i + 1;
fprintf('Iteration ... %g\n',i)
c = a - ((fa*(b-a))/(fb-fa));
fc = f(c);

size = abs(fc);

if size < tol
    root = c;
    t = toc;
    clc
    fprintf('Completed in %g iterations (%.03f s).\n',i,t)
    return
elseif i >= maxi
    root = 'Unk';
    err = 'Unk';
    t = toc
    clc
    fprintf('Failed at %g iterations (%.03f s).\n',i,t)
    return
elseif fa*fc < 0
    err = abs(a - c);
    if err < tol
        root = c;
        t = toc;
        clc
        fprintf('Completed in %g iterations (%.03f s).\n',i,t)
        return
    end
    a = c;
    [root, err] = regulasr(f,a,c,fa,fc,tol,i,maxi);
else
    err = abs(b - c);
    if err < tol
        root = c;
        t = toc;
        clc
        fprintf('Completed in %g iterations (%.03f s).\n',i,t)
        return
    end
    b = c;
    [root, err] = regulasr(f,c,b,fc,fb,tol,i,maxi);
end

end
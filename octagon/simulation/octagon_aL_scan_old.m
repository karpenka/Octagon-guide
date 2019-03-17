function octagon_aL_scan_old(lambda,varargin)
%parameters varargin -> f = -2, m = 6, ncount = 1e5
numvarargs = length(varargin);
if numvarargs > 3
    error('myfuns:TooManyInputs', ...
        'requires at most 3 optional inputs');
end
% set defaults for optional inputs
optargs = {6 1e5};
% now put these defaults into the valuesToUse cell array, 
% and overwrite the ones specified in varargin.
optargs(1:numvarargs) = varargin;
% or ...
% [optargs{1:numvarargs}] = varargin{:};

% Place optional args in memorable variable names
[m, ncount] = optargs{:};
%guide parameters for geks function)
%if you want to change something, look for a_max,a_min,a_step(for size of
%octagon) and the same for L - length of the guide and you need change dir
%in mcstas part of the function

%guide parameters for geks function
w = 0.03;
h = 0.15;
L1 = 100;
% a = 0.15;
% b = a/sqrt(2);
a_min = 0.02;
a_step = 0.01;
a_max = 0.16;
L_min = 1;
L_step = 2;
L_max = 21;
i=1;
j=1;
%Screw param
%loop
k=1;
l=1;
lr=1;


progressbar('a','b');
for L = L_min:L_step:L_max
    rect(w,h,2*L+L1);
    [p0,m0]=mcstas('screw_str.instr',struct('lambda',lambda,'L',2*L+L1,'guide_m',m,'w',w,'h',h),struct('ncount',ncount,'mpi',4));
    p0l=p0(1,:,:).Signal;
    p0m=p0(2,:,:).Signal;
    p0s=p0(3,:,:).Signal;
    I0l(lr) = p0l;
    I0m(lr) = p0m;
    I0s(lr) = p0s;
    for a = a_min:a_step:a_max
        b = a/sqrt(2);
        geks_ps(a,b,w,h,L,L1);
        [p1,m1]=mcstas('LIRA_oct.instr',struct('lambda',lambda,'L0',L,'L1',L1,'guide_m',m,'w',w,'h',h),struct('ncount',ncount,'mpi',4));
        p1l=p1(1,:,:).Signal;
        p1m=p1(2,:,:).Signal;
        p1s=p1(3,:,:).Signal;
        Il(l,k)=p1l/I0l;
        Im(l,k)=p1m/I0m;
        Is(l,k)=p1s/I0s;
        
        I_l(l,k)=p1l;
        I_m(l,k)=p1m;
        I_s(l,k)=p1s;
        frac1 = ((a-a_min)/a_step+1)/((a_max-a_min)/a_step+1);
        frac2 = ((b-L_min)/L_step+1)/((L_max-L_min)/L_step+1);
        progressbar(frac1, frac2);
        l=l+1;
    end
    k=k+1;
    l=1;
end

dlmwrite(strjoin({strjoin({'oct_ab','lambda',num2str(lambda),'l'},'_'),'.dat'},''),Il,' ');
bb=a_min:a_step:a_max;
aa=L_min:L_step:L_max;
[X,Y]=meshgrid(aa,bb);
figure;
surf(X,Y,Il)
xlabel('L [m]')
ylabel('a [m]')
zlabel('I_{oct}/I_{str}')
title(strjoin({'Divergence = \pm1.5\circ, ','lambda = ',num2str(lambda)}))
savefig(strjoin({'oct_ab_20','lambda',num2str(lambda),'l'},'_'));
figure;
surf(X,Y,Im)
xlabel('L [m]')
ylabel('a [m]')
zlabel('I_{oct}/I_{str}')
title(strjoin({'Divergence = \pm0.5\circ, ','lambda = ',num2str(lambda)}))
savefig(strjoin({'oct_ab_20','lambda',num2str(lambda),'m'},'_'));
figure;
surf(X,Y,Is)
xlabel('L [m]')
ylabel('a [m]')
zlabel('I_{oct}/I_{str}')
title(strjoin({'Divergence = \pm0.1\circ, ','lambda = ',num2str(lambda)}))
savefig(strjoin({'oct_ab_20','lambda',num2str(lambda),'s'},'_'));

figure;
surf(X,Y,I_l)
xlabel('L [m]')
ylabel('a [m]')
zlabel('I_{oct}/I_{str}')
title(strjoin({'Divergence(m) = \pm1.5\circ, ','lambda = ',num2str(lambda)}))
savefig(strjoin({'oct_ab_max_20','lambda',num2str(lambda),'l'},'_'));
figure;
surf(X,Y,I_m)
xlabel('L [m]')
ylabel('a [m]')
zlabel('I_{oct}/I_{str}')
title(strjoin({'Divergence(m) = \pm0.5\circ, ','lambda = ',num2str(lambda)}))
savefig(strjoin({'oct_ab_max_20','lambda',num2str(lambda),'m'},'_'));
figure;
surf(X,Y,I_s)
xlabel('L [m]')
ylabel('a [m]')
zlabel('I_{oct}/I_{str}')
title(strjoin({'Divergence(m) = \pm0.1\circ, ','lambda = ',num2str(lambda)}))
savefig(strjoin({'oct_ab_max_20','lambda',num2str(lambda),'s'},'_'));
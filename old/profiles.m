%L = 50; a = 0.04/0.03;  0.13/0.14;
lambda = 5;
m = 6; w = 0.03; h = 0.15; L1 = 0.01; ncount = 1e6;
A = [0.12 0.13 0.14 0.15];
%0.02 0.03 0.04 0.05
%0.12 0.13 0.14 0.15
L = 50;
for i = 1:length(A)
    a = A(i);
    b = a/sqrt(2);
    geks_ps(a,b,w,h,L,L1);
    [P,M]=mcstas('LIRA_oct.instr',struct('lambda',lambda,'L0',L,'L1',L1,'guide_m',m,'w',w,'h',h),struct('ncount',ncount));
    plot(M(1),'LineWidth',1.5)
    %savefig(join(['lambda_' string(lambda) '_' string(a) '.fig'],''))
end
savefig(join(['lambda_' string(lambda) '_' 'all_2' '.fig'],''))
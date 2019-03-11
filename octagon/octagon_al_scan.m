fname = 'Octagon_aL_scan_lambda_5A';
lambda = 5;
w = 0.03;
h = 0.15;
m = 6;
a_min = 0.02;
a_step = 0.01;
a_max = 0.21;
L_min=5;
L_max=40;
L_step=5;
L1 = 1;

lr=1;
for L = L_min:L_step:L_max
    rect(w,h,2*L+L1);
    [p0,m0]=mcstas('screw_str.instr',struct('lambda',lambda,'L',2*L+L1,'guide_m',m,'w',w,'h',h),struct('ncount',1e5));
    p0l=p0(1,:,:).Signal;
    p0m=p0(2,:,:).Signal;
    p0s=p0(3,:,:).Signal;
    I0l(lr) = p0l;
    I0m(lr) = p0m;
    I0s(lr) = p0s;
    lr=lr+1;
end

ppath = 'D:\JOB\github\Octagon-guide\octagon\try\off\';
files = dir(fullfile(ppath, '*.off'));
filenames = {files.name};
size_filenames = size(filenames);

Il = zeros(length(a_min:a_step:a_max),length(L_min:L_step:L_max));
Im = zeros(length(a_min:a_step:a_max),length(L_min:L_step:L_max));
Is = zeros(length(a_min:a_step:a_max),length(L_min:L_step:L_max));
for j = 1:size_filenames(2)
    octagon_n(['/off/'  filenames{j}])
    %geks_ps(a,b,w,h,L,0.05);
	for i = 1:1:1
		
	end
    [p1,m1]=mcstas('LIRA_oct_n.instr',struct('L0',L,'L1',L1,'guide_m',m,'w',w,'h',h),struct('ncount',1e5));
    p1l=p1(1,:,:).Signal;
    p1m=p1(2,:,:).Signal;
    p1s=p1(3,:,:).Signal;
    Il(j)=p1l/I0l(j);
    Im(j)=p1m/I0m(j);
    Is(j)=p1s/I0s(j);
end
% 
% dlmwrite([fname '_l.dat'],Il,' ');
% dlmwrite([fname '_m.dat'],Im,' ');
% dlmwrite([fname '_s.dat'],Is,' ');
% aa=a_min:a_step:a_max;
% LL=L_min:L_step:L_max;
% [X,Y]=meshgrid(aa,LL);
% figure;
% surf(X,Y,Il)
% savefig([fname '_l.fig']);
% figure;
% surf(X,Y,Im)
% savefig([fname '_m.fig']);
% figure;
% surf(X,Y,Is)
% savefig([fname '_s.fig']);

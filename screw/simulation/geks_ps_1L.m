function geks_ps_1L(a,b,w,h,L1)
%a - side of geks, w - width, h - height, L - length
x0=['OFF'];
x1=[12 8 0;...
-w/2 -h/2 0;...
-w/2 h/2 0;...
w/2 h/2 0;...
w/2 -h/2 0;...
-a/2 -a/2-b L1;...
-a/2-b -a/2 L1;...
-a/2-b a/2 L1;...
-a/2 a/2+b L1;...
a/2 a/2+b L1;...
a/2+b a/2 L1;...
a/2+b -a/2 L1;...
a/2 -a/2-b L1];
x2=[4 1 2 8 7;...
4 2 9 10 3;...
4 0 3 11 4;...
4 0 1 6 5];
x3=[3 2 8 9;...
3 3 10 11;...
3 0 4 5;...
3 1 6 7];
dlmwrite('geks.off',x0,'')
dlmwrite('geks.off',x1,'-append','delimiter',' ')
dlmwrite('geks.off',x2,'-append','delimiter',' ')
dlmwrite('geks.off',x3,'-append','delimiter',' ')
end
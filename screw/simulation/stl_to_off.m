ppath = 'D:\JOB\github\Octagon-guide\simulation\new_shit\stl\';
files = dir(fullfile(ppath, '*.stl'));
filenames = {files.name};
for j = 1:length(filenames)
    [p,t,tnorm] = stlread([ppath filenames{j}],1);
    x0=['OFF'];
    x1=[num2str(length(p)) ' ' num2str(length(t)) ' 0'];
    x2 = p;
    bb = zeros(length(t),1);
    for i = 1:length(bb)
        bb(i) = 3;
    end
    x3 = [bb t-1];
    dlmwrite([ppath filenames{j} '.off'],x0,'')
    dlmwrite([ppath filenames{j} '.off'],x1,'-append','delimiter','')
    dlmwrite([ppath filenames{j} '.off'],x2,'-append','delimiter',' ')
    if length(p)>=1e5
    dlmwrite([ppath filenames{j} '.off'],x3,'precision','%10.0f','-append','delimiter','')
    else
        dlmwrite([ppath filenames{j} '.off'],x3,'-append','delimiter',' ')
    end
end
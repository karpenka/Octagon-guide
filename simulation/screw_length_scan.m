clear all;

name_for_png = 'screw_length_scan_lam5_m3';
m = 3; ncount = 1e6;
lambda = 5;
d = 'data/length';
f1 = '/extra_fine';
f2 = '/super';
ff1 = [d f1];
ff2 = [d f2];
filename = ff1;
files = dir(fullfile(filename, '*.off'));
filenames = {files.name};
%writing a mcstas file
i = 1;
a = size(filenames);

for j = 1:a(2)
    length = '';
    nn = filenames{j};
    nn_size = size(nn);
    nn_size = nn_size(2);
    for k = 1:nn_size
        if  strcmp(nn(k),'.') == 1
            break
        else
            length = [length nn(k)];
        end
    end
    LL(j) = str2num(length);
end


while i <= a(2)
    try
    screw_n3([filename '/' filenames{i}])
    rect(0.03,0.15,LL(i));
    model = mccode('screw_n.instr', 'ncount=1e6');
    parameters.guide_m = m;
    parameters.L = LL(i);
    parameters.lambda = lambda;
    results = iData(model,parameters);
    sum_Lb_l(i) = results.UserData.monitors(1).Data.values(1);
    sum_Lb_m(i) = results.UserData.monitors(2).Data.values(1);
    sum_Lb_s(i) = results.UserData.monitors(3).Data.values(1);
    
    model_str = mccode('screw_str.instr','ncount=1e6');
    parameters_str.guide_m=m;
    parameters_str.L=LL(i);
    parameters_str.lambda = lambda;
    results_str = iData(model_str,parameters_str);
    sum_L_str_l = results_str.UserData.monitors(1).Data.values(1);
    sum_L_str_m = results_str.UserData.monitors(2).Data.values(1);
    sum_L_str_s = results_str.UserData.monitors(3).Data.values(1);
    
    sum_L_on_L_str_l(i) = sum_Lb_l(i)/sum_L_str_l;
    sum_L_on_L_str_m(i) = sum_Lb_m(i)/sum_L_str_m;
    sum_L_on_L_str_s(i) = sum_Lb_s(i)/sum_L_str_s;
    i = i + 1;
    catch
    end
    
end

figure;
plot(LL,sum_Lb_l,'*',LL,sum_Lb_m,'x',LL,sum_Lb_s,'o');
title(name_for_png)
grid on
xlabel('L, m')
ylabel('transmission')
legend('large','medium','small')
legend('Location','south')
print(gcf,[name_for_png 'absolute'],'-dpng','-r300');
saveas(gcf,[name_for_png 'abs.fig']);

figure;
plot(LL,sum_L_on_L_str_l,'*',LL,sum_L_on_L_str_m,'x',LL,sum_L_on_L_str_s,'o');
title([name_for_png])
grid on
xlabel('L, m')
ylabel('transmission')
legend('large','medium','small')
legend('Location','south')
print(gcf,[name_for_png 'relative'],'-dpng','-r300')
saveas(gcf,[name_for_png 'rel.fig']);

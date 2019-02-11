name_for_png = 'screw_length_scan_super';
m = 6; ncount = 1e6;
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
figure
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
    screw_n3([filename '/' filenames{i}])
    rect(0.03,0.15,LL(i));
    model = mccode('screw_n.instr','ncount=1e6');
    parameters.m = m;
    parameters.L = LL(i);
    parameters.lambda = lambda;
    results = iData(model,parameters);
    sum_Lb(i) = results.UserData.monitors(1).Data.values(1);
    
    model_str = mccode('screw_str.instr','ncount=1e6');
    parameters_str.m=m;
    parameters_str.L=LL(i);
    parameters_str.lambda = lambda;
    results_str = iData(model_str,parameters_str);
    sum_L_str = results_str.UserData.monitors(1).Data.values(1);
    
    sum_L_on_L_str(i) = sum_Lb(i)/sum_L_str;
    i = i + 1;
end

plot(LL,sum_Lb,'o');
title(name_for_png)
grid on
xlabel('L, m')
ylabel('transmission')
legend('I')
legend('Location','south')
print(gcf,[name_for_png 'i'],'-dpng','-r300');

figure;
plot(LL,sum_L_on_L_str,'o');
title([name_for_png 'ii0'])
grid on
xlabel('L, m')
ylabel('transmission')
legend('I/I0')
legend('Location','south')
print(gcf,[name_for_png 'i'],'-dpng','-r300')

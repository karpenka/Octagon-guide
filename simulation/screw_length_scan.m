name_for_png = 'screw_length_scan';
m = 6; ncount = 1e6;
d = 'D:\JOB\github\Octagon-guide\simulation\data\length';
f1 = '\extra_fine';
f2 = '\super';
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
    screw_n3([filename '\' filenames{i}])
    model = mccode('screw_n.instr');
    model.ncount = ncount;
    parameters.m = m;
    parameters.L = length;
    results = iData(model,parameters);
    sum_Lb(i) = sum(results, 0);
    
    model_str = mccode('screw_str.instr');
    model_str.ncount = ncount;
    parameters.m=m;
    parameters.L=length;
    results_str = iData(model_str,parameters_str);
    sum_L_str = sum(results_str, 0);
    
    sum_L_on_L_str(i) = sum_Lb(i)/sum_L_str;
    i = i + 1;
end

plot(LL,sum_Lb,LL,sum_L_on_L_str,'LineWidth',2);
title(name)
grid on
xlabel('L, m')
ylabel('transmission')
legend('I')
legend('Location','south')
print(gcf,[name 'i'],'-dpng','-r300')

plot(LL,sum_L_on_L_str,'LineWidth',2);
title([name 'ii0'])
grid on
xlabel('L, m')
ylabel('transmission')
legend('I/I0')
legend('Location','south')
print(gcf,[name 'i'],'-dpng','-r300')

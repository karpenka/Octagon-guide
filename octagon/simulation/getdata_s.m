function getdata_s()
open oct_2_30_s.fig %open your fig file, data is the name I gave to my file
D=get(gca,'Children'); %get the handle of the line object
XData=get(D,'XData'); %get the x data
YData=get(D,'YData'); %get the y data
%Data=[XData' YData']; %join the x and y data on one array nx2
%Data=[XData;YData]; %join the x and y data on one array 2xn
close
open oct_5_30_s.fig %open your fig file, data is the name I gave to my file
D=get(gca,'Children'); %get the handle of the line object
X1Data=get(D,'XData'); %get the x data
Y1Data=get(D,'YData'); %get the y data
close
open oct_10_30_s.fig %open your fig file, data is the name I gave to my file
D=get(gca,'Children'); %get the handle of the line object
X2Data=get(D,'XData'); %get the x data
Y2Data=get(D,'YData'); %get the y data
close
figure;
plot(XData,YData,X1Data,Y1Data,X2Data,Y2Data)
savefig('oct_s.fig');
end
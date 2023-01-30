function s2PVisualize_NEW(s2p, freqs,options)   
    arguments
    options.showParams (1,1) string = "S11 S21 S12 S22"
    options.magParams (1,1) string  = "dB"
    options.xLog (1,1) {mustBeNumericOrLogical} = true
    options.addPhase(1,1) {mustBeNumericOrLogical} = false
    options.independentPlot (1,1) {mustBeNumericOrLogical}  = false
    end 

params=strsplit(showParams);
s = sparameters(s2p(:,:,:),freqs) % S-���������
s11=rfparam(s,1,1);
s21=rfparam(s,2,1);
s12=rfparam(s,1,2);
s22=rfparam(s,2,2);

ind=0
ind=find(ismember(params,'S11'))
% S11
if (ind ~= 0) 
% ��������� ������
if(independetPlot==1)
figure;
else
figure(1);
end
draw_smith_chart;
hold on;
plot(s11,'*','DisplayName','S11')
% ������� ������������ ��������� �������
s11_dB=mag2db(abs(s11));
if(independetPlot==1)
figure;
else
figure(2);
end
plot(freqs,s11_dB,'DisplayName','S11')
xlabel('�������, ��')
ylabel('return loss, ��')
title('�������� ������ (return loss)')
grid on
hold on;
% VSWR
VSWR = (1+abs(s11))/(1-abs(s11));% VSWR minimum
%ration=vswr(s11)
if(independetPlot==1)
figure;
else
figure(3);
end
plot(freqs,VSWR,'DisplayName','S11')
xlabel('�������')
ylabel('����')
title('����')
grid on
axis tight;
ylim([1 inf]);
hold on;
% ���
if(independetPlot==1)
figure;
else
figure(4);
end
z11=real(s11)
plot(freqs,s11,'DisplayName','S11')
% ���
if (addPhase == 1) 
if(independetPlot==1)
figure;
else
figure(5);
end
f11=imag(s11)
plot(freqs,f11,'DisplayName','S11')
end
end 

%%S21
ind=0
ind=find(ismember(params,'S21'))

if (ind ~= 0) 
% ��������� ������
if(independetPlot==1)
figure;
else
figure(1);
end
draw_smith_chart;
hold on;
plot(s21,'*','DisplayName','S21')
% ������� ������������ ��������� �������
s21_dB=mag2db(abs(s21));
if(independetPlot==1)
figure;
else
figure(2);
end
plot(freqs,s21_dB,'DisplayName','S21')
xlabel('�������, ��')
ylabel('return loss, ��')
title('�������� ������ (return loss)')
grid on
hold on;
% VSWR
VSWR = (1+abs(s21))/(1-abs(s21));% VSWR minimum
%ration=vswr(s21)
if(independetPlot==1)
figure;
else
figure(3);
end
plot(freqs,VSWR,'DisplayName','S21')
xlabel('�������')
ylabel('����')
title('����')
grid on
axis tight;
ylim([1 inf]);
hold on;
% ���
if(independetPlot==1)
figure;
else
figure(4);
end
z121=real(s21)
plot(freqs,s11,'DisplayName','S21')
% ���
if (addPhase == 1) 
if(independetPlot==1)
figure;
else
figure(5);
end
f21=imag(s21)
plot(freqs,f11,'DisplayName','S21')
end
end 
%%S22
ind=0
ind=find(ismember(params,'S22'))

if (ind ~= 0) 
% ��������� ������
if(independetPlot==1)
figure;
else
figure(1);
end
draw_smith_chart;
hold on;
plot(s22,'*','DisplayName','S22')
% ������� ������������ ��������� �������
s22_dB=mag2db(abs(s22));
if(independetPlot==1)
figure;
else
figure(2);
end
plot(freqs,s22_dB,'DisplayName','S22')
xlabel('�������, ��')
ylabel('return loss, ��')
title('�������� ������ (return loss)')
grid on
hold on;
% VSWR
VSWR = (1+abs(s22))/(1-abs(s22));% VSWR minimum
%ration=vswr(s11)
if(independetPlot==1)
figure;
else
figure(3);
end
plot(freqs,VSWR,'DisplayName','S22')
xlabel('�������')
ylabel('����')
title('����')
grid on
axis tight;
ylim([1 inf]);
hold on;
% ���
if(independetPlot==1)
figure;
else
figure(4);
end
z22=real(s22)
plot(freqs,s22,'DisplayName','S22')
% ���
if (addPhase == 1) 
if(independetPlot==1)
figure;
else
figure(5);
end
f22=imag(s22)
plot(freqs,f22,'DisplayName','S22')
end
end 

%%S12
ind=0
ind=find(ismember(params,'S12'))

if (ind ~= 0) 
% ��������� ������
if(independetPlot==1)
figure;
else
figure(1);
end
draw_smith_chart;
hold on;
plot(s12,'*','DisplayName','S12')
% ������� ������������ ��������� �������
s12_dB=mag2db(abs(s12));
if(independetPlot==1)
figure;
else
figure(2);
end
plot(freqs,s12_dB,'DisplayName','S12')
xlabel('�������, ��')
ylabel('return loss, ��')
title('�������� ������ (return loss)')
grid on
hold on;
% VSWR
VSWR = (1+abs(s12))/(1-abs(s12));% VSWR minimum
%ration=vswr(s11)
if(independetPlot==1)
figure;
else
figure(3);
end
plot(freqs,VSWR,'DisplayName','S12')
xlabel('�������')
ylabel('����')
title('����')
grid on
axis tight;
ylim([1 inf]);
hold on;
% ���
if(independetPlot==1)
figure;
else
figure(4);
end
z12=real(s12)
plot(freqs,s12,'DisplayName','S12')
% ���
if (addPhase == 1) 
if(independetPlot==1)
figure;
else
figure(5);
end
f12=imag(s12)
plot(freqs,f12,'DisplayName','S12')
end
end 
%� ������ ��������� ��������� s2pImport � ��������� ������ result
%���������� ������ result ������ ���� � ���� workspase
%������� ������� � uiimport � �������� ���� ��������������� �� ADS.
%�����, ������ �� 2010b ������ ������� s-���������� ��� ��������� data 600x8 � ���� � ���������, ������ 2020b ������ ������� 9x600 � ��� �� ��������.


f=result{1};
sp=result{2};

for x=1:1:size(data, 1);

     A=data (x,1);
     B=data (x,2);
     B=B*i;
     S11=A+B;
     A=data (x,3);
     B=data (x,4);
     B=B*i;
     S12=A+B;
     A=data (x,5);
     B=data (x,6);
     B=B*i;
     S21=A+B;
     A=data (x,7);
     B=data (x,8);
     B=B*i;
     S22=A+B;
     
     sp123 (1,1,x)=S11;
     sp123 (1,2,x)=S12;
     sp123 (2,1,x)=S21;
     sp123 (2,2,x)=S22;
     
end

error=sp123-sp; %������ ������

%errormax=abs(max(error));

for x=1:1:size(error, 3);
    hold on
    grid on
    figure(11)
    plot(x,abs(error(1,1,x)),'*')
end
for x=1:1:size(error, 3);
    hold on
	grid on
    figure(12)
    plot(x,abs(error(1,2,x)),'*')
end
for x=1:1:size(error, 3);
	hold on
    grid on
	figure(21)
    plot(x,abs(error(2,1,x)),'*')
end
for x=1:1:size(error, 3);
    hold on
    grid on
    figure(22)
    plot(x,abs(error(2,2,x)),'*')
end
function [MAT_NUM] = readsnp(FileName)
%--------------------------------------------------------------------------
%������� ���������� ����� ������� Touchstone. �������� ���������� MAT_NUM 
%�������� �������� ������ ������ ����� (��������� � ����������� ��������� 
%����� �������). ������� �������� FileName - �������� ��� ������ (� ������ 
%�����)��� ������������ �����.
%--------------------------------------------------------------------------
%ID - ������������� ������������ �����
%mes - ������ ��� ������ ������ �������� �����
[ID, mes] = fopen('AMP-15.s2p', 'rt');
%�������� ����������� �������� �����
if ID ~= -1
    %�������� ������� ����������� �������
    MAS = '';
    %���� ���������� ����� ����� ���� �� ����������� ����� �����
    while feof(ID) == 0
        %���������� ������
        line = fgetl(ID);
        %������ ��������� ������ � ������ MAS
        MAS = char(MAS, line);
    end
    %�������� �����
    fclose(ID);
    else
    disp('������ �������� �����')
    disp(mes)
end
%����� ����� � �����
numstr=length(MAS(:,1));
%�������� ������� ����������� ������� ��� �������� ����� �����, ���������� ����� (��������� � ����������� ���������)
MAT = '';
%������������ ���������� ���������� com ����� ����������� � sNp-�����
com = '!';
%������������ ��������� ���������� tab ����� ��������� ������� � sNp-�����
tab = '#';
%��������� �������� �������� ����� ������� MAT
n = 1;
%���� �������� ����� sNp-����� � ��������� ������� 
for k=1:numstr
    %k-� ������ ������� MAS
    strk = MAS(k, :);
    %�������� ����, ��� ������ �� �������� ������������ ��� ���������� sNp-�����
    if  (length(findstr(strk, com)) ~= 0) | (length(findstr(strk, tab)) ~= 0)
        %�������� ����, ��� ������ �������� �������� ������, � �� ������
    elseif (length(findstr(strk, '0')) ~= 0) | (length(findstr(strk, '1') ~= 0)) | (length(findstr(strk, '2') ~= 0)) |...
           (length(findstr(strk, '3') ~= 0)) | (length(findstr(strk, '4') ~= 0)) | (length(findstr(strk, '5') ~= 0)) |...
           (length(findstr(strk, '6') ~= 0)) | (length(findstr(strk, '7') ~= 0)) | (length(findstr(strk, '8')) ~= 0) |...
           (length(findstr(strk, '9') ~= 0))
           %������������ k-�� ������ (� ��������� �������) ������� MAS n-�� ������ ������� MAT
            MAT(n, :) = MAS(k, :);
            %����������������� ��������
            n = n + 1;
   end
end
%�������������� ��������� ������� � ������ ����� (�������� �������� �������)
MAT_NUM1=str2num(MAT);

%����� � ������ ������ ���������� ���������
for k=1:numstr
        strk = MAS(k, :);
    if  (length(findstr(strk, tab)) ~= 0)
        str_data=k;
        break
    end
end
um=0;
%����������� ������
if findstr(strk,'GHZ')
    um=1e+9;
elseif findstr(strk,'MHZ')
    um=1e+6;
elseif findstr(strk,'KHZ')
    um=1e+3; 
elseif findstr(strk,'HZ')
    um=1;
end
MAT_NUM1(:,1)=MAT_NUM1(:,1)*um
un=size(MAT_NUM1);
um
un

c = 0;
if findstr(strk,'MA')
    c = 1;
elseif findstr(strk,'DB')
    c = 2;
elseif findstr(strk,'RI')
    c = 3;
end

MAT_NUM = trans(MAT_NUM1, c) 
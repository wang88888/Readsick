function [] = testsick()
t = tcpclient('192.168.28.98', 2111, 'Timeout', 20);
%t = tcpclient('106.91.27.110', 80, 'Timeout', 20);
pause(2);
i = 1;
while i <= 100  
    data = uint8('sRN LMDscandata ');
    write(t, data)
    pause(0.5);
    nBytes = get(t,'BytesAvailable');
    if nBytes>2
        a = read(t);
        b = char(a);
        %disp(b);
        str = deblank(b);
        %���ÿո�ֿ����ַ���Ϊ��Ԫ����
        S=regexp(str,'\s+','split');
        s1=char(S(27:407));
        y=hex2dec(s1);    %y��������
        x=(-pi/36:pi/360:37*pi/36);
        %x=0:0.5:180;
        %plot(x,y)
        polar(x, y','b')  %��yתΪ������

    else
        disp('û���յ�����');  
    end
    i=i+1;
end
fclose(t);
end

do

local function run(msg, matches)
if matches[1]=="����" and is_sudo(msg) then 
return  "����� ?�� ����� ������ � ????�"
elseif matches[1]=="���" then 
return  "�����?��� ������� ????"
elseif matches[1]=="������ �����" then 
return  "�������� ��������� ????"
elseif matches[1]=="��������" or matches[1]== "����� ���" then 
return  " ������� ��{��� ����}��? ??'� "
elseif matches[1]=="�����" then 
return  " ������? ��?���? ????'� "
elseif matches[1]=="���" then 
return  " ������� �������?????'� "
elseif matches[1]=="������" then 
return  " ���� ������ ����'� ���� �������'�???'� "
elseif matches[1]=="���" then 
return  " ����� �������'� �����????'� "
elseif matches[1]=="����" then 
return  " �����?��� ������� ???? "
elseif matches[1]=="��� � �����" then 
return  " ����� ��� ���� ��� ����� ���� ???? "
elseif matches[1]=="����" then 
return  " ������� ���????? "
elseif matches[1]=="���" then 
return  " �����'� ����� ������?????� "
elseif matches[1]=="���" then 
return  " �����'� ����� ������?????� "
elseif matches[1]=="�����" then 
return  " ���� ���� ���ܘ?????� "
elseif matches[1]=="������" then 
return  " ������ ��� ������ � ???'� "
elseif matches[1]=="�����" then 
return  " ����� �?��� ����� � ????'� "
elseif matches[1]=="�������" then 
return  " ���� ������ ����'� ���� �������'�???'� "
elseif matches[1]=="���� ���" then 
return  " ����� ������� � ????� \n??� ������� : @AHMAD_X7 "
elseif matches[1]=="����" then 
return  " ������� ��{��� ����}��???'�  "
else
return  "����� ?�� ����� ������ ����� � ????�"
end

end

return {
  patterns = {
  "^(����)$",
"^(���)$",
"^(��������)$",
"^(����� ���)$",
"^(�����)$",
"^(���)$",
"^(������)$",
"^(���)$",
"^(����)$",
"^(��� � �����)$",
"^(����)$",
"^(���)$",
"^(���)$",
"^(�����)$",
"^(������)$",
"^(�����)$",
"^(�������)$",
"^(���� ���)$",
"^(����)$",
    },
  run = run
}
end
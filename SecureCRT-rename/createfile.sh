#!/bin/sh
#��IPΪ�ļ������������ļ�����׼��ip_hostname.txt���Լ�root����
mkdir vbfile
read -p "Enter the root passwd�� " passwd
cat > /root/example.vbs << EOF
#\$language = "VBScript"
#\$interface = "1.0"

Sub main
  crt.Screen.Synchronous = True
  crt.Screen.WaitForString "gandalf@hostname:~>"
  crt.Screen.Send "su - root" & VbCr
  crt.Screen.WaitForString "Password:"
  crt.Screen.Send "$passwd" & VbCr
  crt.Screen.WaitForString "hostname:~ #"
  crt.Screen.Send "TMOUT=0" & VbCr
  crt.Screen.Synchronous = False
End Sub
EOF
    
##################################################
while read a b
#����aΪip�б��е�ip��bΪip�б��е�������
do
sed "s/hostname/${b}/g" /root/example.vbs > /root/vbfile/$a.vbs
done </root/ip_hostname.txt
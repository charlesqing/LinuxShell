#!/bin/bash

#��ImagePath.txt�ļ���ȡ����·��
for ImagePath in $(cat /root/ImagePath.txt)
do
ImageName=$(echo $ImagePath | awk -F '/' '{print $NF}')
docker pull registry.cn-hangzhou.aliyuncs.com/aliwill/$ImageName
docker tag registry.cn-hangzhou.aliyuncs.com/aliwill/$ImageName $ImagePath
docker rmi registry.cn-hangzhou.aliyuncs.com/aliwill/$ImageName
done 
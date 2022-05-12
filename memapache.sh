#!/bin/bash
  

pidapache=`ps -U www-data -o pid | sed -n '2 p'`
memapache=`ps -U www-data -o %mem  | tail -n +2 | awk 'a+=$1; END{print a}' | tail -1`


if [ $memapache -gt 40 ];then
        renice -n 15 $pidapache
else
        renice -n 0 $pidapache
fi
        exit 0
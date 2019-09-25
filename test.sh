joincount=`grep joined dbg.log | cut -d" " -f2,4-7 | sort -u | wc -l`
if [ $joincount -eq 100 ]; then
	grade=`expr $grade + 10`
	echo "Checking Join..................10/10"
else
	joinfrom=`grep joined dbg.log | cut -d" " -f2 | sort -u`
	cnt=0
	for i in $joinfrom
	do
		jointo=`grep joined dbg.log | grep '^ '$i | cut -d" " -f4-7 | grep -v $i | sort -u | wc -l`
		if [ $jointo -eq 9 ]; then
			cnt=`expr $cnt + 1`
		fi
	done
	if [ $cnt -eq 10 ]; then
		grade=`expr $grade + 10`
		echo "Checking Join..................10/10"
	else
		echo "Checking Join..................0/10"
	fi
fi
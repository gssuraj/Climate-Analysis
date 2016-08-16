year=$(zenity --list \
  --text="Please select the year:" \
  --title="Year" \
  --column="Year" \
	1996 \
    	1997 \
    	1998 \
	1999 \
	2000 \
	2001 \
	2002 \
	2003 \
        2004 \
	2005 \
	2006 \
	2007 \
	2008 \
	2009 \
	2010 \
	2011 \
	2012 \
	2013 \
	2014 \
	2015 	
);
param=$(zenity --list \
  --text="Please select a parameter" \
  --title="Parameter" \
  --column="Parameter" \
	Average-Temperature \
    	Maximum-Temperature \
    	Minimum-Temperature \
	Lowest-possible-temperature 	
);
if [ "$param" = "Average-Temperature" ]
then
daily="daily.txt"
hadoop jar ~/Desktop/climate/MonthlyAvg.jar /dset/$year/ /op/newop/
wget http://localhost:50070/webhdfs/v1/op/newop/part-00000?op=OPEN
hdfs dfs -rmr /op/newop/

visual=$(zenity --list \
  --text="Please select a visualization type" \
  --title="Visualization" \
  --column="Visualization" \
	Bar-chart \
	Line-chart 	
);
if [ "$visual" = "Bar-chart" ]
then
Rscript mB.R
rm part-00000?op=OPEN
fi
if [ "$visual" = "Line-chart" ]
then
Rscript mL.R
rm part-00000?op=OPEN
fi
fi
if [ "$param" = "Maximum-Temperature" ]
then
daily="daily.txt"
hadoop jar ~/Desktop/climate/MonthlyMax.jar /dset/$year/ /op/newop/
wget http://localhost:50070/webhdfs/v1/op/newop/part-00000?op=OPEN
hdfs dfs -rmr /op/newop/

visual=$(zenity --list \
  --text="Please select a visualization type" \
  --title="Visualization" \
  --column="Visualization" \
	Bar-chart \
	Line-chart 	
);
if [ "$visual" = "Bar-chart" ]
then
Rscript mB.R
rm part-00000?op=OPEN
fi
if [ "$visual" = "Line-chart" ]
then
Rscript mL.R
rm part-00000?op=OPEN
fi
fi
if [ "$param" = "Minimum-Temperature" ]
then
daily="daily.txt"
hadoop jar ~/Desktop/climate/MonthlyMin1.jar /dset/$year/ /op/newop/
hadoop jar ~/Desktop/climate/MonthlyMin2.jar /dset/$year/ /op/newop1/
wget http://localhost:50070/webhdfs/v1/op/newop/part-00000?op=OPEN
wget http://localhost:50070/webhdfs/v1/op/newop1/part-00000?op=OPEN
hdfs dfs -rmr /op/newop/
hdfs dfs -rmr /op/newop1/

cat part-00000?op=OPEN.1 >> part-00000?op=OPEN
rm part-00000?op=OPEN.1

visual=$(zenity --list \
  --text="Please select a visualization type" \
  --title="Visualization" \
  --column="Visualization" \
	Bar-chart \
	Line-chart 	
);
if [ "$visual" = "Bar-chart" ]
then
Rscript mB.R
rm part-00000?op=OPEN
fi
if [ "$visual" = "Line-chart" ]
then
Rscript mL.R
rm part-00000?op=OPEN
fi
fi
if [ "$param" = "Lowest-possible-temperature" ]
then
daily="daily.txt"
hadoop jar ~/Desktop/climate/MonthlyLP1.jar /dset/$year/ /op/newop/
hadoop jar ~/Desktop/climate/MonthlyLP2.jar /dset/$year/ /op/newop1/
wget http://localhost:50070/webhdfs/v1/op/newop/part-00000?op=OPEN
wget http://localhost:50070/webhdfs/v1/op/newop1/part-00000?op=OPEN
hdfs dfs -rmr /op/newop/
hdfs dfs -rmr /op/newop1/

cat part-00000?op=OPEN.1 >> part-00000?op=OPEN
rm part-00000?op=OPEN.1

visual=$(zenity --list \
  --text="Please select a visualization type" \
  --title="Visualization" \
  --column="Visualization" \
	Bar-chart \
	Line-chart 	
);
if [ "$visual" = "Bar-chart" ]
then
Rscript mB.R
rm part-00000?op=OPEN
fi
if [ "$visual" = "Line-chart" ]
then
Rscript mL.R
rm part-00000?op=OPEN
fi
fi

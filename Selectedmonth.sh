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
month=$(zenity --list \
  --text="Please select the month:" \
  --title="Month" \
  --column="Month" \
	01 \
	02 \
	03 \
	04 \
	05 \
	06 \
	07 \
        08 \
	09 \
	10 \
	11 \
	12
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
hadoop jar ~/Desktop/climate/DailyAvg.jar /dset/dset/$year$month$daily/ /op/newop/
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
Rscript dB.R
rm part-00000?op=OPEN
fi
if [ "$visual" = "Line-chart" ]
then
Rscript dL.R
rm part-00000?op=OPEN
fi
fi
if [ "$param" = "Maximum-Temperature" ]
then
daily="daily.txt"
hadoop jar ~/Desktop/climate/DailyMax.jar /dset/dset/$year$month$daily/ /op/newop/
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
Rscript dB.R
rm part-00000?op=OPEN
fi
if [ "$visual" = "Line-chart" ]
then
Rscript dL.R
rm part-00000?op=OPEN
fi
fi
if [ "$param" = "Minimum-Temperature" ]
then
daily="daily.txt"
hadoop jar ~/Desktop/climate/DailyMin1.jar /dset/dset1/$year$month$daily/ /op/newop/
hadoop jar ~/Desktop/climate/DailyMin2.jar /dset/dset2/$year$month$daily/ /op/newop1/
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
Rscript dB.R
rm part-00000?op=OPEN
fi
if [ "$visual" = "Line-chart" ]
then
Rscript dL.R
rm part-00000?op=OPEN
fi
fi
if [ "$param" = "Lowest-possible-Temperature" ]
then
daily="daily.txt"
hadoop jar ~/Desktop/climate/DailyLP1.jar /dset/dset1/$year$month$daily/ /op/newop/
hadoop jar ~/Desktop/climate/DailyLP2.jar /dset/dset2/$year$month$daily/ /op/newop1/
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
Rscript dB.R
rm part-00000?op=OPEN
fi
if [ "$visual" = "Line-chart" ]
then
Rscript dL.R
rm part-00000?op=OPEN
fi
fi



param=$(zenity --list \
  --text="Please select a parameter" \
  --title="Parameter" \
  --column="Parameter" \
	Average-Temperature \
    	Maximum-Temperature \
    	Minimum-Temperature \
	Lowest-possible-Temperature 	
);

if [ "$param" = "Average-Temperature" ]
then
daily="daily.txt"
hadoop jar ~/Desktop/climate/YearlyAvg.jar /dset/dset/ /op/newop/
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
Rscript yB.R
rm part-00000?op=OPEN
fi
if [ "$visual" = "Line-chart" ]
then
Rscript yL.R
rm part-00000?op=OPEN
fi
fi

if [ "$param" = "Maximum-Temperature" ]
then
hadoop jar ~/Desktop/climate/YearlyMax.jar /dset/dset/ /op/newop/
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
Rscript yB.R
rm part-00000?op=OPEN
fi
if [ "$visual" = "Line-chart" ]
then
Rscript yL.R
rm part-00000?op=OPEN
fi
fi
if [ "$param" = "Minimum-Temperature" ]
then
hadoop jar ~/Desktop/climate/YearlyMin1.jar /dset/dset/ /op/newop/
hadoop jar ~/Desktop/climate/YearlyMin2.jar /dset/dset/ /op/newop1/
wget http://localhost:50070/webhdfs/v1/op/newop/part-00000?op=OPEN
wget http://localhost:50070/webhdfs/v1/op/newop1/part-00000?op=OPEN
hdfs dfs -rmr /op/newop/
hdfs dfs -rmr /op/newop1/
sed '1d' part-00000?op=OPEN.1 | sponge part-00000?op=OPEN.1
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
Rscript yB.R
rm part-00000?op=OPEN
fi
if [ "$visual" = "Line-chart" ]
then
Rscript yL.R
rm part-00000?op=OPEN
fi
fi
if [ "$param" = "Lowest-possible-Temperature" ]
then
hadoop jar ~/Desktop/climate/YearlyLP1.jar /dset/dset/ /op/newop/
hadoop jar ~/Desktop/climate/YearlyLP2.jar /dset/dset/ /op/newop1/
wget http://localhost:50070/webhdfs/v1/op/newop/part-00000?op=OPEN
wget http://localhost:50070/webhdfs/v1/op/newop1/part-00000?op=OPEN
hdfs dfs -rmr /op/newop/
hdfs dfs -rmr /op/newop1/
sed '1d' part-00000?op=OPEN.1 | sponge part-00000?op=OPEN.1
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
Rscript yB.R
rm part-00000?op=OPEN
fi
if [ "$visual" = "Line-chart" ]
then
Rscript yL.R
rm part-00000?op=OPEN
fi
fi

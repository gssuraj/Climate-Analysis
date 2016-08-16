hadoop jar ~/Desktop/climate/YearlyAvg.jar /dset/dset/ /op/newop/
wget http://localhost:50070/webhdfs/v1/output/newop/part-00000?op=OPEN
hdfs dfs -rmr /op/newop/
visual=$(zenity --list \
  --text="Please select a visualization type" \
  --title="Visualization" \
  --column="Visualization" \
	Bar-chart \
	Line-chart 	
);
if [ "$param" = "Bar-chart" ]
then
Rscript yB.R
fi
if [ "$param" = "Line-chart" ]
then
Rscript yL.R
fi


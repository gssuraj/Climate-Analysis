hadoop jar ~/Desktop/YearlyMax.jar /dset/dset/ /op/newop/
wget http://localhost:50070/webhdfs/v1/op/newop/part-00000?op=OPEN
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
Rstart yB.R
fi
if [ "$param" = "Line-chart" ]
then
Rstart yL.R
fi



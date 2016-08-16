type=$(zenity --list \
  --text="Please select type of analysis you want:" \
  --title="Type" \
  --column="Type" \
        All-years \
    	All-months-of-A-year \
    	All-days-of-A-month 	
);

if [ "$type" = "All-years" ]
then
sh Allyears.sh
fi
if [ "$type" = "All-months-of-A-year" ]
then
sh Selectedyear.sh
fi
if [ "$type" = "All-days-of-A-month" ]
then
sh Selectedmonth.sh
fi





	

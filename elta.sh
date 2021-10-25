#Needed Variables
divider="================ \n"
eltaTrackingLink=https://www.elta.gr/el-gr/tabid/93/\?qc\=

#Main Logic
while true
do
    now=$(date)
    echo "Latest update: $now \n"
    echo $divider
    while IFS= read -r trackingNumber
    do 
        curl $eltaTrackingLink${trackingNumber} -s | sed -n '/<table class="tg">/,/<\/table>/p' | sed -n '/<tr>/,/<\/tr>/p' | grep '^<td>' | sed 's/<td>//g' | sed 's/<\/td>//g' | head -3
        echo $divider
    done < tracking_numbers.txt
    sleep 3600
done
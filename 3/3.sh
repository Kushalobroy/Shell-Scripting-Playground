awk '
BEGIN {FS=","; c=0}
{
    if($3>100){
        c++;
    }
}
END{
    print("Total Count:", c);
}
' data.txt
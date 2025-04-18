awk '
BEGIN {FS="-"; c=0}{
    if(($2+$3+$4)>=200){
        c++;
        print;
    }
}
END{
    print("Total Count:",c)
}

' data.txt
awk '
BEGIN { FS=" "; c=0; IGNORECASE=1 }
{
    if ($3 == "Smartphone") {
        c += $4;
    }
}
END {
    if (c == 0) {
        print("No Smartphone Product found.")
    } else {
        print("Total Count =", c)
    }
}
' data.txt

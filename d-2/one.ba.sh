# expecting 1694130
IFS="
"
for i in `<i`
{
  a=${i: -1}
  [[ $i = f* ]]&&x=$[x+a]
  [[ $i = d* ]]&&d=$[d+a]
  [[ $i = u* ]]&&d=$[d-a]
}
echo $[x*d]

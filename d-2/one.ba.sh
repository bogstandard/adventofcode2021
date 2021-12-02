# expecting 1694130
IFS=$'\n'
z=($(<i))
for i in ${z[@]}
{
  a=${i: -1}
  [[ $i = f* ]]&&x=$[x+a]
  [[ $i = d* ]]&&d=$[d+a]
  [[ $i = u* ]]&&d=$[d-a]
}
echo $[x*d]

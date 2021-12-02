# expecting 1698850445
IFS=$'\n'
for i in `<i`
{
  t=${i: -1}
  [[ $i = f* ]]&&x=$[x+t]&&d=$[d+(a*t)]
  [[ $i = d* ]]&&a=$[a+t]
  [[ $i = u* ]]&&a=$[a-t]
}
echo $[x*d]

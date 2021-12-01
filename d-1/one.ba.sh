# expecting 1374
IFS=$'\n'
z=($(<i))
c=p=0
for i in ${z[@]}
{
  $[p&&i>p&&c++]
  p=$i
}
echo $c

# expecting 1374
IFS=$'\n'
z=($(<i))
for i in ${z[@]}
{
  $[p&&i>p&&c++]
  p=$i
}
echo $c

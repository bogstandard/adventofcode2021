# expecting 1418
IFS=$'\n'
z=($(<i))
for ((j=0;j<${#z[@]};))
{
  s=$[${z[j++]}+${z[j]}+${z[j+1]}]
  $[p&&p<s&&c++]
  p=$s
}
echo $c

# expecting 1418
IFS="
"
z=(`<i`)
for((;j<${#z[@]};))
{
  s=$[${z[j++]}+${z[j]}+${z[j+1]}]
  $[p&&p<s&&c++]
  p=$s
}
echo $c

# expecting 91257582
IFS=,
numbers=`<i`
costs=()

max=0
for num in ${numbers[@]}
{
  ((!max||max<num))&&{
    max=$num
  }
}

for from in ${numbers[@]}
{
  i=0
  for ((to=0;to<=$max;to++))
  {
    d=$[from-to]
    d="${d##*[+-]}"
    cost=${costs[$i]}

    ex=$[(d*(d+1))/2]

    costs[$i]=$[ex + cost]
    ((i++))
  }
}

last=0
for cost in ${costs[@]}
{
  ((!last||cost<last))&&{
    last=$cost
  }
}

echo $last


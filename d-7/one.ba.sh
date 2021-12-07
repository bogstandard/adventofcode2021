# expecting 328187
IFS=,
numbers=`<i`
costs=()

# make array of cost of move to each point
# find index of lowest

for from in ${numbers[@]}
{
  i=0
  for to in ${numbers[@]}
  {
    d=$[from-to]
    d="${d##*[+-]}"
    cost=${costs[$i]}
    costs[$i]=$[d + cost]
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


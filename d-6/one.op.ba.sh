fishes=" "`<i`" "
fishes=${fishes//,/ }
cs=(0 0 0 0 0 0 0 0 0)
echo "intial: $fishes"

for f in $fishes
{
  cs[$f]=$[cs[$f]+1]
}

list(){
  echo
  echo "day $day"

  # tabular
  for c in {0..8}
  {
    echo "${cs[$c]} x $c's"
  }

  echo

  # old school
  total=0
  for c in {0..8}
  {
    for ((n=0; n<${cs[$c]};n++))
    {
      ((total++))
    }
  }
  echo


  echo total of $total
}

list

for day in {1..80}
{

  t=("${cs[@]}")
  for f in {0..7}
  {

    # 0s take on 1s & birth new
    # 1s take on 2s
    # 2s take on 3s
    # 4s take on 5s
    # 5s take on 6s
    # 6s take on 7s and 0s
    # 7s take on 8s
    # 8s take on 0s
    n=$[f+1]
    t[$f]=${cs[$n]}
  }
  t[6]=$[cs[0]+cs[7]]
  t[8]=${cs[0]}

  cs=("${t[@]}")
  list
}

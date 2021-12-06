# expecting 393019
p=`<i`
p=${p//,/ }
x=(0 0 0 0 0 0 0 0 0)

for f in $p
{
  x[$f]=$[x[$f]+1]
}

for d in {1..80}
{
  t=("${x[@]}")
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
    t[$f]=${x[$n]}
  }
  t[6]=$[x[0]+x[7]]
  t[8]=${x[0]}

  x=("${t[@]}")

  T=0
  for c in {0..8}
  {
    for ((n=0; n<${x[$c]};n++))
    {
      ((T++))
    }
  }
  echo $T
}

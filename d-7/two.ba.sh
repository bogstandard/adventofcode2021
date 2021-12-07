# expecting 91257582
# this could be math, but why use a ski when you've a snowmobile
IFS=,
N=`<i`
C=()

for n in ${N[@]}
{
  ((!m||m<n))&&m=$n
}

for f in ${N[@]}
{
  i=
  for ((t=0;t<=$m;t++))
  {
    d=$[f-t]
    d="${d##*[+-]}"
    c=${C[$i]}
    # maths is magic
    # why does this work?
    # only the elfs know
    C[$i]=$[((d*(d+1))/2) + c]
    ((i++))
  }
}

for c in ${C[@]}
{
  ((!l||c<l))&&l=$c
}

echo $l


# expecting 328187
IFS=,
N=`<i`
C=()

for f in ${N[@]}
{
  i=
  for t in ${N[@]}
  {
    d=$[f-t]
    d="${d##*[+-]}"
    c=${C[$i]}
    C[$i]=$[d + c]
    ((i++))
  }
}

for c in ${C[@]}
{
  ((!l||c<l))&&l=$c
}

echo $l


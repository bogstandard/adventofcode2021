# expecting 71708

# Bash3 doesnt do matrices or Assoc Arrays properly,
# so we have to be creative..
# declare g_$i=mystr_$i
# v=g_$i
# echo ${!v}

IFS="
"
i=g=0
for l in `<i`
{
  ((i<1))&&k=$l||{
    r=$[(i-(g*5))-1]
    IFS=' '
    c=0
    for p in $l
    {
      declare g${g}r${r}c${c}=$p
      v=g${g}r${r}c${c}
      ((c++))
    }
    ((i%5))||((g++))
  }
  ((i++))
}

f(){
  echo $1
  exit
}

IFS=,
for c in $k
{
  for ((G=0;G<$g;G++))
  {
    s=
    for R in {0..4}
    {
      for C in {0..4}
      {
        v=g${G}r${R}c${C}
        K=${!v}
        ((K==c))&&declare g${G}r${R}c${C}=x||s=$[s+K]
      }
      T=
      for C in {0..4}
      {
        v=g${G}r${R}c${C}
        T+=${!v}
      }
      [ $T = xxxxx ]&&w=L=$c

    }

    for C in {0..4}
    {
      T=
      for R in {0..4}
      {
        v=g${G}r${R}c${C}
        T+=${!v}
      }
      [ $T = xxxxx ]&&w=L=$c
    }

    ((w))&&f $[L*s]
  }
}

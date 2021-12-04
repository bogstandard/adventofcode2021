# expecting 71708

# Bash3 doesnt do matrices or Assoc Arrays properly,
# so we have to be creative..
# declare g_$i=mystr_$i
# v=g_$i
# echo ${!v}

W(){
  [ $t = xxxxx ]&&w=L=$Z
}

T(){
  v=g${g}r${r}c${c}
  t+=${!v}
}

D(){
  eval "g${g}r${r}c${c}=$1"
}

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
      D $p
      T
      ((c++))
    }
    ((i%5))||((g++))
  }
  ((i++))
}

J=$g
IFS=,
for Z in $k
{
  for ((g=0;g<$J;g++))
  {
    s=
    for r in {0..4}
    {
      for c in {0..4}
      {
        T
        K=${!v}
        ((K==Z))&&D x||s=$[s+K]
      }
      t=
      for c in {0..4}
      {
        T
      }
      W
    }

    for c in {0..4}
    {
      t=
      for r in {0..4}
      {
        T
      }
      W
    }

    ((w))&&echo $[L*s]&&exit
  }
}

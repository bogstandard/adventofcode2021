# expecting 71708

# Bash3 doesnt do matrices or Assoc Arrays properly,
# so we have to be creative..
# declare g_$i=mystr_$i
# v=g_$i
# echo ${!v}

winners=' '

W(){
  [ $t = xxxxx ]&&w=L=$Z
}

V(){
  v=g${g}r${r}c${c}
}

T(){
  V
  t+=${!v}
}

D(){
  V
  eval "$v=$1"
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
  call=$Z
  for ((g=0;g<$J;g++))
  {
    s=0
    for r in {0..4}
    {
      for c in {0..4}
      {
        V
        K=${!v}
        ((K==Z))&&D x||{
          [[ $K != "x" ]]&&{
            s=$[s+K]
          }||{
            :
          }
        }
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

    ((w))&&{
      [[ $winners == *" $g "* ]]||{
        echo call is $Z
        S=$s
        LK=$Z
        winners+=" $g "
      }
      w=L=0
    }
  }
}

echo "last winner ${winners##* } with sum $S on last call $LK total of $[S*LK]"

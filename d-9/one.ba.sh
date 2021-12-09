# expecting 530
IFS="
"
L=(`<i`)
w=${#L[0]}
h=${#L[@]}
P=()

for ((y=0;y<$h;y++))
{
  for ((x=0;x<$w;x++))
  {
    P[$[w*y+x]]=${L[$y]:$x:1}
  }
}

s=0

for ((y=0;y<$h;y++))
{
  for ((x=0;x<$w;x++))
  {
    p=${P[w*y+x]}

    # default to high
    t=9
    r=9
    b=9
    l=9

    # not ths
    ((y>0))&&t=${P[$[w*(y-1)+x]]}

    # not rhs
    ((x<(w-1)))&&r=${P[$[w*y+(x+1)]]}

    # not bhs
    ((y<(h-1)))&&b=${P[$[w*(y+1)+x]]}

    # not lhs
    ((x>0))&&l=${P[$[w*y+(x-1)]]}

    ((p<t&&p<r&&p<b&&p<l))&&s=$[s+p+1]
  }
}

echo $s

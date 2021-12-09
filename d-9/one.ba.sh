# expecting 530
IFS="
"
lines=(`<i`)
width=${#lines[0]}
height=${#lines[@]}
points=()

for ((y=0;y<$height;y++))
{
  for ((x=0;x<$width;x++))
  {
    points[$[width * y + x]]=${lines[$y]:$x:1}
  }
}

sum=0

for ((y=0;y<$height;y++))
{
  for ((x=0;x<$width;x++))
  {
    p=${points[width * y + x]}

    # default to high
    t=9
    r=9
    b=9
    l=9

    # not ths
    ((y>0))&&{
      t=${points[$[width * (y-1) + x]]}
    }

    # not rhs
    ((x<(width-1)))&&{
      r=${points[$[width * y + (x+1)]]}
    }

    # not bhs
    ((y<(height-1)))&&{
      b=${points[$[width * (y+1) + x]]}
    }

    # not lhs
    ((x>0))&&{
      l=${points[$[width * y + (x-1)]]}
    }

    ((p<t&&p<r&&p<b&&p<l))&&{
      echo "$p lower than ($t $r $b $l)"
      sum=$[sum+p+1]
    }
  }
}

echo $sum

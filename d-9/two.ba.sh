# expecting 530
IFS="
"
lines=(`<i`)
width=${#lines[0]}
height=${#lines[@]}
points=()
basins=()

# print function
pr(){
  echo
  for ((y=0;y<$height;y++))
  {
    for ((x=0;x<$width;x++))
    {
      p=${points[$[width * y + x]]}
      echo -n ${points[$[width * y + x]]}
    }
    echo
  }
}

# bootstrap the data
for ((y=0;y<$height;y++))
{
  for ((x=0;x<$width;x++))
  {
    points[$[width * y + x]]=${lines[$y]:$x:1}
  }
}

hunt() {

  local x=$1
  local y=$2
  local inital=$3
  local p=${points[width * y + x]}

  basins[$inital]=$[${basins[$inital]}+1]

  echo "looking at $x,$y ($p)"

  points[width * y + x]=9

  # default to high
  local t=9
  local r=9
  local b=9
  local l=9

  # not ths
  ((y>0))&&{
    local j=$[width * (y-1) + x]
    t=${points[$j]}
    ((t<9))&&{
      hunt $x $[y-1] $inital
    }
  }

  # not rhs
  ((x<(width-1)))&&{
    local j=$[width * y + (x+1)]
    r=${points[$j]}
    ((r<9))&&{
      hunt $[x+1] $y $inital
    }
  }

  # not bhs
  ((y<(height-1)))&&{
    local j=$[width * (y+1) + x]
    b=${points[$j]}
    ((b<9))&&{
      hunt $x $[y+1] $inital
    }
  }

  # not lhs
  ((x>0))&&{
    local j=$[width * y + (x-1)]
    l=${points[$j]}
    ((l<9))&&{
      hunt $[x-1] $y $inital
    }
  }
}


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
      basins[$[width * y + x]]=0
      hunt $x $y $[width * y + x]
    }
  }
}

printf '%s\n' "${basins[@]}" | sort -n | tail -3 | head -3

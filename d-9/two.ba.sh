# expecting 1019494
IFS="
"
L=(`<i`)
w=${#L[0]}
h=${#L[@]}
P=()
B=()

# bootstrap the data
for ((y=0;y<$h;y++))
{
  for ((x=0;x<$w;x++))
  {
    P[$[w*y+x]]=${L[$y]:$x:1}
  }
}

h() {

  local x=$1
  local y=$2
  local i=$3
  local p=${P[width * y + x]}

  B[$i]=$[${B[$i]}+1]

  P[w*y+x]=9

  # default to high
  local t=9
  local r=9
  local b=9
  local l=9

  # not ths
  ((y>0))&&{
    local j=$[w * (y-1) + x]
    t=${P[$j]}
    ((t<9))&&h $x $[y-1] $i
  }

  # not rhs
  ((x<(w-1)))&&{
    local j=$[w * y + (x+1)]
    r=${P[$j]}
    ((r<9))&&h $[x+1] $y $i
  }

  # not bhs
  ((y<(h-1)))&&{
    local j=$[w * (y+1) + x]
    b=${P[$j]}
    ((b<9))&&h $x $[y+1] $i
  }

  # not lhs
  ((x>0))&&{
    local j=$[w * y + (x-1)]
    l=${P[$j]}
    ((l<9))&&h $[x-1] $y $i
  }
}


for ((y=0;y<$h;y++))
{
  for ((x=0;x<$w;x++))
  {
    p=${P[w*y+x]}
    ((p<9))&&{
      B[$[w*y+x]]=0
      h $x $y $[w*y+x]
    }
  }
}

T=(`printf '%s\n' "${B[@]}" | sort -n | tail -3 | head -3`)
echo $[T[0]*T[1]*T[2]]

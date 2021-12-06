# expecting 16793
p=`<i`
p=${p//,/ }
i=0
j=0
olaps=0

is_unset() {   [[ -z "${!1+x}" ]]; }

add(){
  # if already contained, tally it
  # else add it
  name=c$1x$2
  is_unset $name ||{
    is_unset o$name &&{
      ((olaps++))
      eval "o$name=1"
    }
  }
  eval "$name=1"
}


p0=0
p1=0
p2=0
p3=0
for t in $p
{
  [[ $t == "->" ]]||{
    # its a data point
    eval "p$i=$t"

    # end of line
    ((++i%4))||{
      echo "$j) $olaps so far"
      sx=(`seq $p0 $p2`)
      sy=(`seq $p1 $p3`)
      #echo covers ${sx[@]}, ${sy[@]}

      ((${#sx[@]}<2))&&{
        echo sideways
        for y in ${sy[@]}
        {
          add $p0 $y
        }
      }

      ((${#sy[@]}<2))&&{
        echo vertical
        for x in ${sx[@]}
        {
          add $x $p1
        }
      }

      ((${#sx[@]}>1))&&((${#sy[@]}>1))&&{
        echo diagonal
        for ((n=0;n<${#sx[@]};n++))
        {
          add ${sx[$n]} ${sy[$n]}
        }
      }

      i=0
      ((j++))
    }
  }
}

echo overlaps $olaps

# expecting 4826
p=`<i`
p=${p//,/ }
i=0
o=0

d() { [[ -z "${!1+x}" ]]; }

a(){
  # if already contained, tally it
  # else add it
  m=c$1x$2
  d $m ||{
    d o$m &&{
      ((o++))
      eval "o$m=1"
    }
  }
  eval "$m=1"
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
      sx=($(seq $p0 $p2))
      sy=($(seq $p1 $p3))
      #echo covers ${sx[@]}, ${sy[@]}

      ((${#sx[@]}<2))&&{
        for y in ${sy[@]}
        {
          a $p0 $y
        }
      }

      ((${#sy[@]}<2))&&{
        for x in ${sx[@]}
        {
          a $x $p1
        }
      }

      i=0
      ((j++))
    }
  }
}

echo $o

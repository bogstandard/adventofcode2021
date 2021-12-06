# expecting 4826
p=`<i`
p=${p//,/ }
i=0
j=0
olaps=0

for t in $p
{
  [[ $t == "->" ]]||{
    # its a data point
    line[$i]=$t

    # end of line
    ((++i%4))||{
      echo "$j) working ${line[@]}, ($olaps overlaps so far)"
      sx=(`seq ${line[0]} ${line[2]}`)
      sy=(`seq ${line[1]} ${line[3]}`)
      # echo covers ${sx[@]}, ${sy[@]}

      is_unset() {   [[ -z "${!1+x}" ]]; }

      add(){
        # if already contained, tally it
        # else add it
        name=c$1x$2
        is_unset $name ||{
          echo $name already marked
          is_unset o$name &&{
            ((olaps++))
            eval "o$name=1"
          }
        }
        eval "$name=1"
      }

      ((${#sx[@]}<2))&&{
        for y in ${sy[@]}
        {
          add ${line[0]} $y
        }
      }
      ((${#sy[@]}<2))&&{
        for x in ${sx[@]}
        {
          add $x ${line[1]}
        }

      }
      i=0
      ((j++))
    }
  }
}

echo overlaps $olaps

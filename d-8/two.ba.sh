# expecting 1091165

# unique IDs
# these were worked from the example
ids=()
ids[49]=8
ids[37]=5
ids[34]=2
ids[39]=3
ids[25]=7
ids[45]=9
ids[41]=6
ids[30]=4
ids[42]=0
ids[17]=1

ord() {
  LC_CTYPE=C printf '%d' "'$1"
}

count() {
  r=`ord "$1"`
  ((count[$r]++))
}

get() {
  r=`ord "$1"`
  echo ${count[$r]}
}


IFS="
"

total=0
for line in `<i`
{
  count=()
  IFS='|'
  values=($line)
  unset IFS
  input=${values[0]}
  output=${values[1]}

  # letsa go!
  for word in $input
  {
    for ((i=0; i<${#word}; i++))
    {
      char=${word:$i:1}
      # echo -n counting $char
      count $char
      res=$(get $char)
      # echo -n " ($res)"
      # echo
    }
    # echo
  }

  # get unique ids
  for word in $input
  {
    id=0
    for ((i=0; i<${#word}; i++))
    {
      char=${word:$i:1}
      res=$(get $char)
      id=$[id+res]
    }
    # echo $word at $id
  }

  # echo

  cuml=""
  for word in $output
  {
    id=0
    for ((i=0; i<${#word}; i++))
    {
      char=${word:$i:1}
      res=$(get $char)
      id=$[id+res]
    }
    cuml=$cuml${ids[$id]}
  }
  cuml=$((10#$cuml)) # removing leading zeros
  total=$((total+cuml))
  echo "$total (+$cuml)"

  IFS="
  "
}

echo $total

# Experimental library that shortens the more verbose calls
# Answers using this aren't scored and are noted with gosh
# in the name

# echo INPUT
e() {
  echo $1
}

# echo $[INPUT]
m() {
  echo $[$1]
}

# loop INPUT-1 then do INPUT-2 on each
l() {
  local IFS=$'\n'
  local z=($(<$1))
  for i in ${z[@]}
  {
    $2 $i
  }
}

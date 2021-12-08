# expecting 1091165

# unique IDs
# these were worked from the example because we know how the clock is displayed
d=()
d[49]=8
d[37]=5
d[34]=2
d[39]=3
d[25]=7
d[45]=9
d[41]=6
d[30]=4
d[42]=0
d[17]=1

p() {
  LC_CTYPE=C printf '%d' "'$1"
}

IFS="
"
t=0
for l in `<i`
{
  k=()
  IFS='|'
  v=($l)
  unset IFS

  # letsa go!
  # derive the segment representation using LHS
  for w in ${v[0]}
  {
    for ((j=0;j<${#w};j++))
    {
      c=${w:$j:1}
      ((k[`p "$c"`]++))
    }
  }

  # string together RHS
  c=""
  for w in ${v[1]}
  {
    n=0
    for((j=0;j<${#w};j++))
    {
      n=$[n+k[`p "${w:$j:1}"`]]
    }
    c=$c${d[$n]}
  }

  # removing leading zeros & sum
  c=$((10#$c))
  t=$[t+c]

  # next line
  IFS="
  "
}

echo $t

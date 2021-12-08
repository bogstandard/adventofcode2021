# d    true    count
# 0 -> abcfg   (5)
# 1 -> cf      (2) unique
# 2 -> acdeg   (5)
# 3 -> acdfg   (5)
# 4 -> bcdf    (4) unique
# 5 -> abdfg   (5)
# 6 -> abdefg  (6)
# 7 -> acf     (3) unique
# 8 -> abcdefg (7) unique
# 9 -> abcdfg  (6)

lens=()
IFS="
"
for line in `<i`
{
  IFS='|'
  values=($line)
  IFS=' '
  output=(${values[1]})
  for word in ${output[@]}
  {
    lens[${#word}]=$[lens[${#word}]+1]
  }
  IFS="
  "
}

c=0
tra=( __ __ 1 7 4 0,2,3,5 6,9 8)
for i in {2..7}
{
  ((${#tra[i]}<2))&&c=$[c+lens[i]]
}

# 8 1s
# 6 4s
# 5 7s
# 7 8s
echo $c

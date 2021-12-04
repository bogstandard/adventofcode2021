# expecting 71708

# Bash3 doesnt do matrices or Assoc Arrays properly,
# so we have to be creative..
# declare g_$i=mystr_$i
# v=g_$i
# echo ${!v}

IFS="
"
i=0
g=0
for line in `<i`
{
  ((i<1))&&k=$line||{
    r=$[(i - (g*5))-1]
    IFS=' '
    c=0
    for cell in $line
    {
      declare g${g}r${r}c${c}=$cell
      v=g${g}r${r}c${c}
      ((c++))
    }
    ((i%5))||((g++))
  }
  ((i++))
}

f(){
  echo $1
  exit
}


IFS=','
win=0
last=
for call in $k
{
  echo Looking for.. $call
  for ((gi=0;gi<$g;gi++))
  {
    sum=0
    for ri in {0..4}
    {
      for ci in {0..4}
      {
        v=g${gi}r${ri}c${ci}
        cell=${!v}
        ((cell==call))&&{
          declare g${gi}r${ri}c${ci}=x
        }||{
          sum=$[sum+cell]
        }
      }

      # now to check row for winners
      tr=
      for ci in {0..4}
      {
        v=g${gi}r${ri}c${ci}
        tr+=${!v}
      }
      [ $tr = "xxxxx" ]&&{
        win=1
        last=$call
      }
    }

    # check cols for winners
    for ci in {0..4}
    {
      tc=
      for ri in {0..4}
      {
        v=g${gi}r${ri}c${ci}
        tc+=${!v}
      }
      [ $tc = "xxxxx" ]&&{
        win=1
        last=$call
      }
    }

    ((win>0))&&{
      f $[last*sum]
    }
  }
}

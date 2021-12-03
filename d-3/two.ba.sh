# expecting 1694130
IFS="
"

for r in {0..1}
{
  q=(`<i`)
  x=${q[0]}
  cols=${#x}
  for (( col=0; col<cols; col++ )){

    # count 1s at col
    s=''
    for i in ${q[@]}
    {
      ((${i:~0} < 2))&&s+=${i:col:1}
    }

    ((r<1))&&o=1||o=0
    l=${s//[!$o]/}
    l=${#l}

    l=${s//[!1]/}&&l=${#l}&&((l>=${#s}-l))&&t=1||t=0
    ((o<1))&&t=$[1-t]
    echo found $l $o\'s at col $col
    echo $t is majority $l vs ${#s}

    # check each word at col
    j=0
    for i in ${q[@]}
    {
      ((${i: -1} < 2 && ${i:col:1} == t)) && echo $i || echo "$i delete"
      ((${i: -1} < 2 && ${i:col:1} == t)) && a[$r]=${q[$j]} || q[$j]=22222
      ((j++))
    }

  }
}

n=${a[0]}
m=${a[1]}
echo $[$[2#$n]*$[2#$m]]

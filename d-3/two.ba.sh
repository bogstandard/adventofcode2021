# expecting 3832770
IFS="
"

f()
{
  q=(`<i`)
  for((c=0;c<12;c++)){
    s=
    for i in ${q[@]}
    {
      ((i))&&s+=${i:c:1}
    }

    l=${s//[!1]/}
    l=${#l}
    ((l>=${#s}-l))&&t=1||t=0
    (($1))&&t=$[1-t]

    j=
    for i in ${q[@]}
    {
      ((i&&${i:c:1}==t))&&a=$i||q[$j]=0
      ((j++))
    }
  }
  echo $[2#$a]
}

echo $[`f`*`f 1`]

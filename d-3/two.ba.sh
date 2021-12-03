# expecting 3832770
IFS="
"

f()
{
  q=(`<i`)
  x=${q[0]}
  for((c=0;c<${#x};c++))
  {
    j=
    s=

    for i in ${q[@]}
    {
      ((i))&&s+=${i:c:1}
    }

    l=${s//[!1]/}
    l=${#l}
    t=$[l>=${#s}-l]
    (($1))&&t=$[1-t]

    for i in ${q[@]}
    {
      ((j++&&i))&&((${i:c:1}==t))&&a=$i||q[$j-1]=0
    }
  }
  echo $[2#$a]
}

echo $[`f`*`f 1`]

# expecting 415953

# this is my last day of Bashing it
# moving to something else after this

IFS="
"

O="([{<"
C=")]}>"

for L in `<i`
{

  s=0
  S=""

  G() {
    e=${S:0:1}
    p=${O#*$e}
    p=${#p}
    l=${#O}
    p=$[l-p-1]
    g=${C:p:1}
    S=${S:1}
  }

  for ((n=0;n<${#L};n++))
  {
    c=${L:n:1}
    [[ $c == *[$O]* ]]&&S=$c$S||{
      # closer
      G
      [[ "$c" = "$g" ]]||{
        S=""
        break
      }
    }
  }

  ((${#S}>0))&&{
    for ((n=0;n<${#S};))
    {
      G
      s=$[(s*5)+p+1]
    }
    t+="$s "
  }
}

t=`echo $t | tr " " "\n" | sort -g`
t=(${t})
echo ${t[$[(${#t[@]})/2]]}

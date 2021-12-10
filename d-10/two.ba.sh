# expecting 415953

# this is my last day of Bashing it
# moving to something else after this
IFS="
"

opens="([{<"
closers=")]}>"
t=

for line in `<i`
{

  s=0
  stack=""
  error=""

  get() {
    e=${stack:0:1}
    p=${opens#*$e}
    p=${#p}
    l=${#opens}
    p=$[l-p-1]
    g=${closers:p:1}
    stack=${stack:1}
  }

  for ((n=0;n<${#line};n++))
  {
    c=${line:n:1}
    [[ $c == *[$opens]* ]]&&{
      # opener
      stack=$c$stack
    }||{
      # closer
      get
      [[ "$c" = "$g" ]]||{
        stack=""
        break
      }
    }
  }

  ((${#stack}>0))&&{
    for ((n=0;n<${#stack};))
    {
      get
      s=$[(s*5)+p+1]
    }
    t+=" $s "
  }
  #echo $s
}

t=`echo $t | tr " " "\n" | sort -g`
t=( ${t} )
echo ${t[$[(${#t[@]})/2]]}

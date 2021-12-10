# expecting 415953

# this is my last day of Bashing it
# moving to something else after this
IFS="
"

opens="([{<"
closers=")]}>"
s=0

for line in `<i`
{
  stack=""
  for ((n=0;n<${#line};n++))
  {
    c=${line:n:1}
    [[ $c == *[$opens]* ]]&&{
      # opener
      stack=$c$stack
    }||{
      # closer
      e=${stack:0:1}
      p=${opens#*$e}
      p=${#p}
      l=${#opens}
      p=$[l-p-1]
      g=${closers:p:1}
      stack=${stack:1}

      [[ "$c" = "$g" ]]||{
        echo "Syntax error! Expcted $g got $c"
        [[ "$c" = ")" ]]&&s=$[s+3]
        [[ "$c" = "]" ]]&&s=$[s+57]
        [[ "$c" = "}" ]]&&s=$[s+1197]
        [[ "$c" = ">" ]]&&s=$[s+25137]
        continue
      }
    }
  }
}

echo $s

# The two solutions with the experimental g.sh library

# expecting 1694130
. ../g.sh
f(){
  i=$1
  a=${i: -1}
  [[ $i = f* ]]&&x=$[x+a]
  [[ $i = d* ]]&&d=$[d+a]
  [[ $i = u* ]]&&d=$[d-a]
}
l i f
m x*d

# expecting 1698850445
x=d=0
g(){
  t=${i: -1}
  [[ $i = f* ]]&&x=$[x+t]&&d=$[d+(a*t)]
  [[ $i = d* ]]&&a=$[a+t]
  [[ $i = u* ]]&&a=$[a-t]
}
l i g
m x*d

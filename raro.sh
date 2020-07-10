3   token(){
  1   GetToken=$(curl -s --compressed "https://cse.google.com/cse.js?cx=partner-pub-2698861478625135:3033704849" -L -D -)
  2   token=$(echo $GetToken | grep -Po "(?<=\"cse_token\": \")[^\"]*")
  3 }
  
  4 luruh(){
  5   token
  6   key="partner-pub-2698861478625135:3033704849"
  7   ┊ luruh=$(curl -s --compressed 'https://cse.google.com/cse/element/v1?num=10&hl=en&cx='''"${key}"'''&safe=off&cse_tok='''"${token}"'''&start='''"${2}"'''&q='''"${1}"'''&callback=x' -L -D
  8 }
  9 mluruh(){
 10   token
 11   key="partner-pub-2698861478625135:3033704849"
 12   ┊ luruh=$(curl -s --compressed 'https://cse.google.com/cse/element/v1?num=10&hl=en&cx='''"${key}"'''&safe=off&cse_tok='''"${token}"'''&start='''"${2}"'''&q='''"${1}"'''&callback=x' -L -D
 13 }
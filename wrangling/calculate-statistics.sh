# consider removing:
# - timestamps (1619173596)
# - dates (especially before spliting since it will produce tokens like "04" etc)

# list and rank the cookies by frequency of occurence
grep -rai '"name"' cookies/ |
  perl -ne 'm/"name":\s*"(.+?)",/g && print $1."\n"' |
  sort --version-sort | uniq -c | sort -k 1,2 -n -r |
  perl -pe 's/^\s*//g' > metadata/names.txt

# list cookie values
grep -rai '"value"' cookies/ |
  perl -ne 'm/"value":\s*"(.+?)",/g && print $1."\n"' |
  sort | uniq -c | sort -k 1,2 -n -r |
  perl -pe 's/^\s*//g' > metadata/values.txt

# tokenize
grep -rai '"value"' cookies/ |
  perl -ne 'm/"value":\s*"(.+?)",/g && print $1."\n"' |
  tok |
  sort | uniq -c | sort -k 1,2 -n -r > metadata/tokens.txt

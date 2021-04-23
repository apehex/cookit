# list and rank the cookies by frequency of occurence
grep -rai '"name"' cookies/ |
  perl -ne 'm#"name":\s*"(.+)",#g && print $1."\n"' |
  sort --version-sort | uniq -c | sort -k 1,2 -r |
  perl -pe 's/^\s*//g' > metadata/names.txt

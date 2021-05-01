# diffrences
# - before / no
# - before / yes
# - yes / no

# new cookies
# todo: grep the names before doing the diff
# (the lines could have changed while the name is the same)
diff -u before.json no.json |
  grep -iaE '^\+' |
  perl -ne 'm/"name":\s*"(.*)",/g && print $1'

# modified values

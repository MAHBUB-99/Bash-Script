# -eq	Equal	[ "$a" -eq "$b" ]
# -ne	Not equal	[ "$a" -ne "$b" ]
# -gt	Greater than	[ "$a" -gt "$b" ]
# -lt	Less than	[ "$a" -lt "$b" ]
# -ge	Greater or equal	[ "$a" -ge "$b" ]
# -le	Less or equal	[ "$a" -le "$b" ]
# String comparisons:
# =	Equal	[ "$a" = "$b" ]
# !=	Not equal	[ "$a" != "$b" ]
# -z	Empty string	[ -z "$a" ]
# -n	Not empty	[ -n "$a" ]

a=-5
[ "$a" -gt 0 ] && echo "a is positive"
[ "$a" -lt 0 ] && echo "a is negative"
[ $a -eq 0 ] && echo "a is zero"
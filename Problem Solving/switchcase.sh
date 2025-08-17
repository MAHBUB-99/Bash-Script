# read -p "Enter action start/stop : " opt

# case $opt in
#     start)
#         echo "Service started"
#         ;;
#     stop)
#         echo "Service stopped"
#         ;;
#     *)
#         echo "Invalid option"
#         ;;
# esac

read -p "Enter a number : " a
read -p "Enter operator (+, -, *, /) : " op
read -p "Enter another number : " b

case $op in
    +)
    echo "$a + $b = $((a+b))"
    ;;
    -)
    echo "$a - $b = $((a-b))"
    ;;
    *)
    echo "$a * $b = $((a*b))"
    ;;
    /)
    echo "$a / $b = $((a/b))"
    ;;
    *)
    echo "Invalid operator"
    ;;
esac
read -p "Enter the length of the password: " length

if ! [[ $length =~ ^[0-9]+$ ]];then
    echo "Please enter a valid number."
    exit 1
fi

echo "Choose complexity level:"
echo "1. Letters only"
echo "2. Letters and numbers"
echo "3. Letters, numbers, and special characters"
read -p "Enter your choice (1-3): " choice

case $choice in
    1)
        charSet='A-Za-z'
        ;;
    2)
        charSet='A-Za-z0-0-9'
        ;;
    3)
        charSet='A-Za-z0-9!@#$%^&*()_+'
        ;;
    *)
        echo "Invalid choice. Defaulting to letters and numbers."
        exit 1
        ;;
esac

password=$(tr -dc '$charSet' < /dev/urandom | head -c $length)

echo "Generated Password: $password"

echo "$(date)"
read -p "Enter the length of the password: " length

if ! [[ "$length" =~ ^[0-9]+$ ]];then
    echo "Please enter a valid number."
    exit 1
fi

password=$(tr -dc 'A-Za-z0-9!@#$%^&*()_+' < /dev/urandom | head -c $length)
echo "Generated Password: $password"

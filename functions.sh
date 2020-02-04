function execute_command()
{
    eval message="$1"
    eval command="$2"
    echo ${message}
    echo "Command: "${command}
    eval ${command}
}
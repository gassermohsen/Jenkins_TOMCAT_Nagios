user=pet-clinic
PATH=$(echo $PATH)
JAVA_HOME=/home/$user/jdk-20.0.2
# Check if user exists in the system by getent command to retrive info if exists in the passwd file

# If no user exists Create one


if [ $(getent passwd $user) ] ; then
    echo "*********"
    echo "**User $user already exists**"
    echo "*********"

else
    echo "*************"
    echo "**User $user doesn't exists**" 
    echo "*************"

    echo "**Creating $user user please provide password**"
    echo "*************"

    sudo useradd -c "$user" -m $user -s /bin/bash

    # Read the password from a file
    password=$(cat file.txt)

# Create the user

    # Set the password for the user
    echo "pet-clinic:$password" | sudo chpasswd
    # sudo useradd -r -m -U -d /home/pet-clinic $user
    
    echo "*************"
    echo "* $user Created successfuly***"

fi

#file="/home/gasser/ansible/file"


# Reads the user password to install java if needed
#echo -n "Please enter the password for user $user to check for java" 
#read -d $'\x04' password < "$file"

password1=$(cat file.txt)

su - $user <<EOF
$password1

# Checks for java if exists to download it 

if java -version 2>&1 >/dev/null | grep -q "java version" ; then

    # Checks for Java version

    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    java_version=\$(java -version 2>&1 >/dev/null | sed 's/\"//g' | grep "java version "| awk '{print \$3}')
    echo "Java already installed with version \$java_version"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"

else 
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "Java not Installed on this user installing Java"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    cd /home/$user
    wget -P /home/pet-clinic https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.tar.gz
    tar xvzf jdk-20_linux-x64_bin.tar.gz

    echo "export JAVA_HOME=\"/home/$user/jdk-20.0.2\"" >> /home/pet-clinic/.profile
    echo "export PATH=\"\$PATH:$JAVA_HOME/bin\"" >> /home/pet-clinic/.profile
    . /home/$user/.profile
    echo "\n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "\nJava Installed Succesfully"
    echo "\n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    wget -P /home/pet-clinic https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.11/bin/apache-tomcat-10.1.11.tar.gz
    tar xf apache-tomcat-10.1.11.tar.gz
    /home/pet-clinic/apache-tomcat-10.1.11/bin/./startup.sh

    mkdir /home/pet-clinic/build_directory
    touch /home/pet-clinic/build_directory/build_history
     
    

fi

EOF

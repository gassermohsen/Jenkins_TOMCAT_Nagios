#!/bin/bash

# Set the maximum number of retries
max_retries=4

# Loop and retry the check
for i in $(seq 1 $max_retries); do
    # Check if the application is running
    response=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost:8080/spring-petclinic/)
    if [ $response -ne 200 ]; then
        echo "Sanity check failed: Application is not running (attempt $i of $max_retries)"
        if [ $i -eq $max_retries ]; then
            echo "Sanity check failed after $i attempts"
            echo "Rolling Back to the previous version"

            declare -i lastversion=$(tail -1 /home/pet-clinic/build_directory/build_history | awk -F : '{print $4'})-1

            # Checks if the last verision equals one so you can't rollback just restart the server 
            if [ $lastversion -eq 0]; then
        
            # Restart tomcat server 
            /home/pet-clinic/apache-tomcat-10.1.11/bin/./shutdown.sh
            /home/pet-clinic/apache-tomcat-10.1.11/bin/./startup.sh

            

            exit 1
        else 

            lastdir=$(ls /home/pet-clinic/build_directory | grep spring-petclinic_v$lastversion)
            rm -rf /home/pet-clinic/apache-tomcat-10.1.11/webapps/spring-petclinic.war /home/pet-clinic/apache-tomcat-10.1.11/webapps/spring-petclinic
            echo "The current app version is deleted, updating with the previous verison "
            cp /home/pet-clinic/build_directory/$lastdir/spring-petclinic/target/spring-petclinic.war /home/pet-clinic/apache-tomcat-10.1.11/webapps

            # Restart tomcat server 
            /home/pet-clinic/apache-tomcat-10.1.11/bin/./shutdown.sh
            /home/pet-clinic/apache-tomcat-10.1.11/bin/./startup.sh

            echo "lastdeploy:petclinic:v:$lastversion" >> /home/pet-clinic/build_directory/build_history


        fi 
        fi
        sleep 5
    else
        echo "Sanity check passed: Application is running"
        break
    fi
done
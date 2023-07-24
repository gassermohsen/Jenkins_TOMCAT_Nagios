<<<<<<< HEAD
git clone https://github.com/spring-projects/spring-petclinic.git
cd ~/spring-petclinic

 

sed -i 's/public class PetClinicApplication {/public class PetClinicApplication extends SpringBootServletInitializer {/' ~/spring-petclinic/src/main/java/org/springframework/samples/petclinic/PetClinicApplication.java
sed -i 's/import org.springframework.context.annotation.ImportRuntimeHints;/import org.springframework.context.annotation.ImportRuntimeHints;\nimport org.springframework.boot.web.servlet.support.SpringBootServletInitializer;/' ~/spring-petclinic/src/main/java/org/springframework/samples/petclinic/PetClinicApplication.java
sed -i 's+  </parent>+  </parent>\n  <packaging>war</packaging>+' ~/spring-petclinic/pom.xml
sed -i 's+    <dependency>\n      <groupId>org.springframework.boot</groupId>\n      <artifactId>spring-boot-starter-test</artifactId>\n      <scope>test</scope>\n    </dependency>+    <dependency>\n      <groupId>org.springframework.boot</groupId>\n      <artifactId>spring-boot-starter-test</artifactId>\n      <scope>test</scope>\n    </dependency>\n    <dependency>\n      <groupId>org.springframework.boot</groupId>\n      <artifactId>spring-boot-starter-tomcat</artifactId>\n      <scope>provided</scope>\n    </dependency>+' ~/spring-petclinic/pom.xml
sed -i 's+    <java.version>17</java.version>+    <java.version>18</java.version>+' ~/spring-petclinic/pom.xml
sed -i 's+  <build>+  <build>\n    <finalName>${project.artifactId}</finalName>+' ~/spring-petclinic/pom.xml

 

./mvnw spring-javaformat:apply

 

./mvnw clean package

 

cp ~/spring-petclinic/target/spring-petclinic.war ~/apache-tomcat-10.1.11/webapps/
=======

#!/bin/bash

# Set the application name and base directory
appname="spring-petclinic"
basedir="/home/pet-clinic/build_directory"

# Set the initial version number
version=1

# Loop until a non-existing directory is found
while true; do
  # Set the directory name
  dirname="${appname}_v${version}"

  # Check if the directory already exists
  if [ ! -d "${basedir}/${dirname}" ]; then
    # Create the directory and exit the loop
    mkdir "${basedir}/${dirname}"
    cd "${basedir}/${dirname}"
    git clone https://github.com/spring-projects/spring-petclinic.git
    cd ${basedir}/${dirname}/spring-petclinic

    sed -i 's/public class PetClinicApplication {/public class PetClinicApplication extends SpringBootServletInitializer {/' ${basedir}/${dirname}/spring-petclinic/src/main/java/org/springframework/samples/petclinic/PetClinicApplication.java
    sed -i 's/import org.springframework.context.annotation.ImportRuntimeHints;/import org.springframework.context.annotation.ImportRuntimeHints;\nimport org.springframework.boot.web.servlet.support.SpringBootServletInitializer;/' ${basedir}/${dirname}/spring-petclinic/src/main/java/org/springframework/samples/petclinic/PetClinicApplication.java
    sed -i 's+  </parent>+  </parent>\n  <packaging>war</packaging>+' ${basedir}/${dirname}/spring-petclinic/pom.xml
    sed -i 's+    <dependency>\n      <groupId>org.springframework.boot</groupId>\n      <artifactId>spring-boot-starter-test</artifactId>\n      <scope>test</scope>\n    </dependency>+    <dependency>\n      <groupId>org.springframework.boot</groupId>\n      <artifactId>spring-boot-starter-test</artifactId>\n      <scope>test</scope>\n    </dependency>\n    <dependency>\n      <groupId>org.springframework.boot</groupId>\n      <artifactId>spring-boot-starter-tomcat</artifactId>\n      <scope>provided</scope>\n    </dependency>+' ${basedir}/${dirname}/spring-petclinic/pom.xml
    sed -i 's+    <java.version>17</java.version>+    <java.version>18</java.version>+' ${basedir}/${dirname}/spring-petclinic/pom.xml
    sed -i 's+  <build>+  <build>\n    <finalName>${project.artifactId}</finalName>+' ${basedir}/${dirname}/spring-petclinic/pom.xml

    

    ./mvnw spring-javaformat:apply

    

    ./mvnw clean package

    

    cp ${basedir}/${dirname}/spring-petclinic/target/spring-petclinic.war ~/apache-tomcat-10.1.11/webapps/


    break
  fi

  # If the directory already exists, increment the version number and try again
  version=$((version+1))
done
# git clone https://github.com/spring-projects/spring-petclinic.git
# cd ~/spring-petclinic

 
>>>>>>> 4d77b53 (editing build script)

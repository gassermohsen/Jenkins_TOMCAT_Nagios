## Spring Pet Clinic Application Deployment with Ansible, Jenkins, and Nagios

This project is aimed at automating the deployment of a Spring Pet Clinic web application using Ansible, Jenkins, and Nagios. The deployment process includes installing Java and Tomcat on the target server, configuring Tomcat's deployment manager to allow access to a user named "pet-clinic", and setting up Jenkins for continuous integration and continuous deployment (CI/CD). In addition, Nagios is used for monitoring the application.

### Ansible

Ansible tool that allows you to automate the configuration and deployment of your infrastructure. In this project, Ansible is used to automate the installation of Java and Tomcat on your local machine.

### Jenkins

 Jenkins is used to automate the deployment process of the Spring Pet Clinic web application using a Jenkinsfile pipeline.

### Tomcat

Tomcat is a web server and servlet container that allows you to deploy Java web applications. In this project, Tomcat is used to deploy the Spring Pet Clinic web application and is configured to allow access to the deployment manager by a user named "admin".

### Nagios

Nagios is a monitoring system that allows you to monitor your infrastructure and applications. In this project, Nagios is used to monitor the Spring Pet Clinic web application.

### Deployment Process

The deployment process is automated using a Jenkinsfile pipeline, which includes the following stages:

1. **Build**: This stage builds the Spring Pet Clinic web application using Maven.


2. **Deploy**: This stage deploys the Spring Pet Clinic web application to Tomcat using Ansible.

3. **Sanity Checks**: This stage performs a series of sanity checks to ensure that the deployment was successful and the application is working as expected if not rollback to the previous build version.

Once the pipeline is complete, the Spring Pet Clinic web application will be deployed and ready to use.

### Monitoring

Nagios is used to monitor the Spring Pet Clinic web application. An Ansible playbook is used to install and configure Nagios on your local machine. The playbook sets up Nagios to monitor the Spring Pet Clinic web application.


---

## Run pet-clinic locally

1. Clone the repository.
```bash
git clone https://github.com/gassermohsen/Jenkins_TOMCAT_Nagios.git
```

> **_NOTE:_** To change the pet-clinic user password open the file.txt and edit the password from it 

2. Install ansible.
```bash
apt install ansible 
```
###### For ubuntu users 

> **Warning:** Before using the playbook please edit the paths with the directory you clone on.

3. Run ansible playbook on your localhost. 
```bash 
ansible-playbook -i hosts playbook.yml -K  
```

> **_NOTE:_** The -K option is mandatory to pass the pet-clinic user password to install the packages, This playbook creates user pet-clinic and install JDK , Tomcat and  Jenkins.


4. Install Nagios with root privilege and monitor the spring pet-clinic application.
```bash
ansible-playbook -i hosts nagios.yml 
```
---


### After the installation  

1. The application will be running at port 9090 with url: http://localhost:9090/spring-petclinic

2. jenkins server will be running at port 8090 with url: http://localhost:8090

3. Nagios will be running at url: http://localhost/nagios



---

### Jenkins stuff

1. To automate the build and sanity checks you can open Jenkins and make a pipeline job that runs from the jenkins file provided. 

2. You can make the jenkins file run by adding it manually to the pipepline script or to make it read automatically from github repository by adding the repo url and the needed credentials.


> **_NOTE:_** The Sanity checks script is made to check the health of the web application if it built successfully if not it will automatically rollback to the previous build saved on the system.
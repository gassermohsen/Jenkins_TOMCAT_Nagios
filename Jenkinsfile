pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
                sh ' git clone https://github.com/spring-projects/spring-petclinic.git'
            }
        }
    }
}

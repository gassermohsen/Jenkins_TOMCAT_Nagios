
pipeline {
    agent any
    stages {
        stage('Build & deploy') {
            steps {
                echo 'Build started'
                sh '/home/pet-clinic/build_directory/./build.sh'
        }

        }
        stage('Sanity Checks'){
            steps {
                echo ' Starting Sanity Checks'
                sh '/home/pet-clinic/build_directory/./sanitycheck.sh'
                

            }
        }
    }
}

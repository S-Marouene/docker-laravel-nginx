pipeline {
    agent any
    stages {
        stage("Verify tooling") {
            steps {
                bat '''
                    docker images
                    docker ps
                    composer --version
                '''
            }
        }
        stage("down  container") {
            steps {
                bat '''
                    docker-compose down
                '''
            }
        }

        stage("Up my container") {
            steps {
                bat '''
                    docker-compose up -d
                '''
            }
        }

        stage("Run Composer Install") {
            steps {
                bat 'composer install'
            }
        }

}

}

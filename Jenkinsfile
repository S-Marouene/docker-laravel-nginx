pipeline {
    agent any
    stages {
        stage("Verify tooling") {
            steps {
                bat '''
                    docker images
                    docker ps
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
                bat 'docker compose run --rm composer install'
            }
        }

}

}

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

}

}

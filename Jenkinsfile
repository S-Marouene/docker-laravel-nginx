pipeline {
    agent any
    stages {
        stage("Verify tooling") {
            steps {
                bat '''
                    ls
                    docker info
                    docker version
                    docker compose version
                '''
            }
        }

}

}

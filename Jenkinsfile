pipeline {
    agent any
    stages {
        stage("Verify tooling") {
            steps {
                sh '''
                    ls
                    docker info
                    docker version
                    docker compose version
                '''
            }
        }

}

}

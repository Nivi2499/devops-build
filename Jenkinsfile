pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo 'Source code checked out successfully.'
            }
        }

        stage('Build and Push DEV Image') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    def imageName = "nivi99/devops-build-dev"

                    sh """
                        docker build -t ${imageName}:dev .
                        docker tag ${imageName}:dev ${imageName}:${BUILD_NUMBER}
                    """

                    withCredentials([usernamePassword(
                        credentialsId: 'dockerhub-devops-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_TOKEN'
                    )]) {
                        sh '''
                            set +x
                            echo "$DOCKER_TOKEN" | docker login -u "$DOCKER_USER" --password-stdin
                            docker push nivi99/devops-build-dev:dev
                            docker push nivi99/devops-build-dev:$BUILD_NUMBER
                            docker logout
                        '''
                    }
                }
            }
        }

        stage('Build and Push PROD Image') {
            when {
                branch 'master'
            }
            steps {
                script {
                    def imageName = "nivi99/devops-build-prod"

                    sh """
                        docker build -t ${imageName}:prod .
                        docker tag ${imageName}:prod ${imageName}:${BUILD_NUMBER}
                    """

                    withCredentials([usernamePassword(
                        credentialsId: 'dockerhub-devops-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_TOKEN'
                    )]) {
                        sh '''
                            set +x
                            echo "$DOCKER_TOKEN" | docker login -u "$DOCKER_USER" --password-stdin
                            docker push nivi99/devops-build-prod:prod
                            docker push nivi99/devops-build-prod:$BUILD_NUMBER
                            docker logout
                        '''
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the Jenkins console output.'
        }
    }
}
@Library('my-shared-lib') _

pipeline {
    agent any
    
    stages {
        stage("Code") {
            steps {
                echo "This is cloning the code"
                git branch: "main", url: "https://github.com/UserTejaz/Python-APP-CICD"
                echo "Code cloning successful"
            }
        }
        
        stage("Build") {
            steps {
                buildApp()
            }
        }
        
        stage("Push to Dockerhub") {
            steps {
                pushToDockerHub('dockerhubCred', 'my-python-app')
            }
        }
        
        stage("Deploy") {
            steps {
                deployApp()
            }
        }
    }

    // Email Notifications
    post {
        success {
            mail to: 'tejas@example.com',
                 subject: "SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                 body: """
                 Hi Team,<br><br>
                 The build <b>${env.JOB_NAME} #${env.BUILD_NUMBER}</b> completed successfully.<br>
                 <a href="${env.BUILD_URL}">Click here</a> to view details.<br><br>
                 Regards,<br>
                 Jenkins
                 """,
                 mimeType: 'text/html'
        }
        
        failure {
            mail to: 'tejas@example.com',
                 subject: "FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                 body: """
                 Hi Team,<br><br>
                 The build <b>${env.JOB_NAME} #${env.BUILD_NUMBER}</b> has failed.<br>
                 Please review the logs: <a href="${env.BUILD_URL}">View Console Output</a>.<br><br>
                 Regards,<br>
                 Jenkins
                 """,
                 mimeType: 'text/html'
        }
    }
}

@Library('') _

pipeline {
    agent any
    
    stages {
        stage("Code"){
            steps{
                echo "This is cloning the code"
                git branch: "main", url:"https://github.com/UserTejaz/Python-APP-CICD"
                echo "code cloning successful"
            }
        }
        
        stage("Build"){
            steps{
                buildApp()
            }
        }
        
        stage("Push to Dockerhub"){
            steps{
                pushToDockerHub('dockerhubCred', 'my-python-app')
            }
        }
        
        stage("Deploy"){
            steps{
                deployApp()
            }
        }
    }
}
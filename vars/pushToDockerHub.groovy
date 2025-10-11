def call(dockerhubCred, imageName) {
    withCredentials([usernamePassword(credentialsId: dockerhubCred, usernameVariable: 'user', passwordVariable: 'pass')]) {
        sh """
            echo $pass | docker login -u $user --password-stdin
            docker tag my-python-app $user/${imageName}:latest
            docker push $user/${imageName}:latest
        """
    }
}
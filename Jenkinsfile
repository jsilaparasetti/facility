node {
      stage("Git Clone"){

        git branch: 'main', url: 'https://github.com/jsilaparasetti/facility.git'
    }
   
    stage("Docker build"){
    sh 'docker build -t facility:latest -f Dockerfile .'
        sh 'docker image ls'
    }
withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'test', usernameVariable: 'apurva09', passwordVariable: 'password']]) {
        sh 'docker login -u apurva09 -p $password'
	}
    stage("Pushing Image to Docker Hub"){
	     sh 'docker tag 1dbcb7da68c3 apurva09/facility:latest'
	   sh 'docker push apurva09/facility:latest'
    }
}

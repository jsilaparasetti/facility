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
	     sh 'docker tag facility apurva09/facility:latest'
	   sh 'docker push apurva09/facility:latest'
    }
stage("SSH Into Server") {
def remote = [:]
remote.name = 'VMububtu18.0'
remote.host = '20.163.181.235'
remote.user = 'azureuser'
remote.password = 'Miracle@1234'
remote.allowAnyHosts = true
}
	stage("Deploy"){
sh 'docker rm -f facility||true'
sh 'docker run -p 9001:9001 -d --name facility facility:latest'
}
}


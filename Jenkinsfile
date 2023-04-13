pipeline {
    agent {
        docker { image 'debian'
        args '-u root:root'
        }
    }
    stages {
        stage('Clone') {
            steps {
                git branch:'master',url:'https://github.com/afermor8/ic-diccionario'
            }
        }
        stage('Install') {
            steps {
                sh 'apt update'
                sh 'apt install -y aspell-es' 
            }
        }
        stage('Test')
        {
            steps {
                sh '''
                export LC_ALL=C.UTF-8
                OUTPUT=`cat doc/*.md | aspell list -d es -p ./.aspell.es.pws`; if [ -n "$OUTPUT" ]; then echo $OUTPUT; exit 1; fi'''
            }
        }
    }
    post {
         always {
          mail to: 'ara.fer.mor@gmail.com',
          subject: "Status of pipeline: ${currentBuild.fullDisplayName}",
          body: "${env.BUILD_URL} has result ${currentBuild.result}"
        }
      }
}

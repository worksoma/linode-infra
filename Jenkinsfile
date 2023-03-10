pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
		sh '''
echo $PWD
git clone https://github.com/worksoma/server.git ../server
cp ~/.sensitive/terraform.tfvars .
cp ~/.sensitive/sensitive.vars.yml ../server
cp ~/.sensitive/htpasswd ../server/files
		'''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
echo "stuff"
exit
EOF
                '''
            }
        }
    }
}



pipeline {
    agent any
    tools {
       terraform 'terraform'
    }
    stages {
         stage('Git checkout') {
           steps{
                  git 'https://github.com/ahmedhassan1999/new-terraform.git'
            }
        }
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
          stage('terraform Init') {
            steps{
                withAWS(region:'us-east-1') 
                {
                    withAWS(credentials:'iam') 
                    {
                          sh 'terraform init'
                          sh 'terraform apply --var-file /terraform/Dev.tfvars -lock=false -auto-approve'
    
                    }
                    
    
                }
              
            }
        }
        
       
       
        
       
       
        }
    }

    





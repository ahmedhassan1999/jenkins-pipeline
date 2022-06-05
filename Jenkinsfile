
pipeline 
{
        agent any
        tools 
        {
        terraform 'terraform'
        }
    stages 
    {

        
       /*  stage('terraform format check') 
        {
            steps
            {

                sh 'terraform fmt'
            }
        }


        stage('terraform Init') 
        {
            steps
            {

                withAWS(region:'us-east-1') 
                {
                    withAWS(credentials:'iam') 
                    {
                          sh 'terraform -chdir=terraform/  init'
                          sh 'terraform -chdir=terraform/ apply --var-file Dev.tfvars -lock=false -auto-approve'
    
                    }
                    
    
                }
              
            }
        } */
     /*   stage('private_key')
        {
            steps
            {
                 withAWS(region:'us-east-1') 
                {
                    withAWS(credentials:'iam') 
                    {
                           
                            sh 'chmod 777 /var/jenkins_home/mykey.pem'
                            sh 'terraform -chdir=terraform/ output -raw key > /var/jenkins_home/mykey.pem'
                            sh 'chmod 400 /var/jenkins_home/mykey.pem'
    
                    }
                    
    
                }



            }


        }*/ 

        stage('create ansible file')
        {
            stages
            {

                echo -e 'host bastion\nHostName `terraform -chdir=terraform/ output -raw pubEC2`\n
                 User ubuntu\nidentityFile' > /var/jenkins_home/.ssh/conf
    


            }


        }

        

       
    }
}

    




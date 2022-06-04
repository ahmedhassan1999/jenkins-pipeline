
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
        stage('private_key')
        {
            steps
            {
                 withAWS(region:'us-east-1') 
                {
                    withAWS(credentials:'iam') 
                    {
                           
                            sh 'chmod 777 mykey.pem'
                            sh 'terraform -chdir=terraform/ output -raw key > mykey.pem'
                            sh 'chmod 400 mykey.pem'
    
                    }
                    
    
                }



            }


        }

        

       
    }
}

    





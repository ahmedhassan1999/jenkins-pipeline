
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
            steps
            {
                 withAWS(region:'us-east-1') 
                {
                    withAWS(credentials:'iam') 
                    {
                                    sh '''
                        
                                public=$(terraform -chdir=terraform/ output -raw pubEC2)
                                
                                private=$(terraform -chdir=terraform/ output -raw privEC2)

                                        cat <<EOF > /var/jenkins_home/.ssh/config
                                host bastion
                                    HostName $public
                                    User ubuntu
                                    identityFile /var/jenkins_home/mykey.pem
                                    StrictHostKeyChecking=no

                                host private_instance
                                    HostName $private
                                    user  ubuntu
                                    ProxyCommand ssh bastion -W %h:%p
                                    identityFile /var/jenkins_home/mykey.pem
                                    StrictHostKeyChecking=no
                                EOF
                                '''
                    }
                }       
                   
    


            }


        }

        

       
    }
}

    




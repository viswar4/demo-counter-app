pipeline{
    agent any
     tools{
        maven 'maven'
     }
    stages{
        
        stage(" Git Checkout"){
            
            steps{
                git branch: 'main', url: 'https://github.com/viswar4/demo-counter-app.git'
            }
            
            }

        stage(" Maven unit testing"){
            
            steps{
                sh 'mvn test'
            }
            
            }
        
        stage(" Maven Integration testing"){
            
            steps{
                sh 'mvn verify -DskipUnitTests'
            }
            
            }
        }
    }

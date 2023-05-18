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

        stage(" Maven Build"){
            
            steps{
                sh 'mvn clean install'
            }
            
            }
        
        stage(" Static Code Analysis"){
            
            steps{
                withSonarQubeEnv(installationName: 'sonarqube', credentialsId: 'sonar') {
                sh 'mvn clean package sonar:sonar'
                }
            }
            
            }
        
        stage(" Quality Gate Status "){
            
            steps{
                
                script{

                    waitForQualityGate abortPipeline: true, credentialsId: 'sonar'
                }
                }
            }
        
        stage(" Push Artifact to Nexus Repo "){
            
            steps{
                
                script{

                    pom = readMavenPom(file: 'pom.xml')

                    def pom_version = pom.version

                    def nexusRepo = pom.version.endsWith("SNAPSHOT") ? "demoapp-snapshot" : "demoapp-release"

                    nexusArtifactUploader artifacts:
                     [[artifactId: 'springboot', classifier: '', file: 'target/Uber.jar', 
                     type: 'jar']], 
                     credentialsId: 'nexus', groupId: 'com.example',
                    nexusUrl: 'localhost:8081', nexusVersion: 'nexus3', protocol: 'http', 
                    repository: nexusRepo, version: "${pom.version}"            
                    }
                }
            }
            
            }
        }

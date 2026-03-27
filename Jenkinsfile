pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Récupération du code source
                checkout scm
            }
        }
        
        stage('Test') {
            steps {
                // Exécution des tests unitaires
                sh 'mvn test'
            }
        }
        

        stage('SonarScanner') {
            steps {
                // Transmission des métriques analytiques au serveur SonarQube
                withSonarQubeEnv('ServeurSonarQubeTP') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                // Utilisation stricte du Credentials Provider pour masquer les données sensibles
                withCredentials([usernamePassword(credentialsId:'tomcat-credentials', usernameVariable:'TOMCAT_USER', passwordVariable: 'TOMCAT_PASS')])
                {
                    sh './deploy_tomcat.sh --user $TOMCAT_USER --password $TOMCAT_PASS --file target/monapp.war'
                }
            }
        }
    }
}

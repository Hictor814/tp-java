pipeline {
  agent any
  environment {
    // Définition de variables pour le nommage
    IMAGE_NAME = 'mon-image-web-locale'
    CONTAINER_NAME = 'mon-conteneur-web-local'
    PORT_HOTE = '8082' // Le port sur lequel on accèdera au site
  }
  stages {
    stage('Build') { 
        steps {
            sh 'mvn -B -DskipTests clean package' 
        }
    }
    stage('Build Image Docker') {
    steps {
      echo 'Construction de l\'image Docker en local...'
      // Le point (.) à la fin indique à Docker de chercher le Dockerfile dans le dossier courant
      sh 'docker build -t ${IMAGE_NAME} .'
     }
   }
  }
}
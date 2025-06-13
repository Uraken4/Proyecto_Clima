pipeline {
  agent any
  stages {
    stage('Clean Workspace') {
      steps {
        cleanWs()
      }
    }
    stage('Install') {
      agent {
        docker { image 'node:18-alpine' }
      }
      steps {
        sh 'npm install'
      }
    }
    stage('Test') {
      agent {
        docker { image 'node:18-alpine' }
      }
      steps {
        sh 'npm test'
      }
    }
    stage('Build Docker') {
      steps {
        sh 'docker build -t proyecto_clima .'
      }
    }
    // Puedes agregar más stages para push o deploy si lo necesitas
  }
}

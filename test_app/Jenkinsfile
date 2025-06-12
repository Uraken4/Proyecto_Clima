pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        // Clona tu repositorio de GitHub
        git 'https://github.com/Uraken4/Proyecto_Clima.git'
      }
    }
    stage('Install') {
      steps {
        sh 'npm install'
      }
    }
    stage('Test') {
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

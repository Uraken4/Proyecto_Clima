pipeline {
  agent any
  environment {
    FLUTTER_HOME = "${HOME}/flutter"
    PATH = "${env.FLUTTER_HOME}/bin:${env.PATH}"
  }
  stages {
    stage('Clean Workspace') {
      steps {
        cleanWs()
      }
    }
    stage('Install Flutter SDK') {
      steps {
        sh '''
          if [ ! -d "$FLUTTER_HOME" ]; then
            git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_HOME
          fi
          flutter --version
        '''
      }
    }
    stage('Install Dependencies') {
      steps {
        sh 'flutter pub get'
      }
    }
    stage('Analyze') {
      steps {
        sh 'flutter analyze'
      }
    }
    stage('Test') {
      steps {
        sh 'flutter test'
      }
    }
    stage('Build APK') {
      steps {
        sh 'flutter build apk --debug'
      }
    }
    // Puedes agregar más stages para build web, linux, windows, etc.
  }
}

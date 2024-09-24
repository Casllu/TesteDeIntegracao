pipeline {
    agent any
    tools {
        jdk 'JAVA17'
    }
    environment {
        MAVEN_HOME = tool name: 'Maven 3.x', type: 'maven'
        PATH = "${MAVEN_HOME}\\bin;${env.PATH}" // Use o separador de caminho correto para o Windows
    }

    stages {
        stage('Checkout') {
            steps {
                // Clona o repositório do Git
                git 'https://github.com/Casllu/TesteDeIntegracao'
            }
        }

        stage('Build and Test') {
            steps {
                // Compila o projeto e executa os testes
                bat 'mvn clean install'
            }
        }

        stage('Publish Test Results') {
            steps {
                // Publica os resultados dos testes no Jenkins
                junit '**/target/surefire-reports/*.xml'
            }
        }
    }

    post {
        always {
            // Publica os relatórios de teste
            junit 'target/surefire-reports/*.xml' // Coleta os relatórios de teste
            // Limpa o workspace após a execução
            cleanWs()
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}

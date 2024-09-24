pipeline {
    agent any
    tools {
        jdk 'JAVA17'
    }
    environment {
        // Defina a versão do Maven configurada no Jenkins
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

        stage('Build') {
            steps {
                // Compila o projeto e executa os testes
                bat 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                // Executa os testes
                bat 'mvn test'
            }
        }

    post {
        always {
            // Limpa o workspace após a execução
            cleanWs()
        }
    }

        failure {
            echo 'Pipeline failed.'
        }
    }
}

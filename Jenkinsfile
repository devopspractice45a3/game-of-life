pipeline {
agent any
stages {
stage("clone"){
steps {
git 'https://github.com/devopspractice45a3/game-of-life.git'
}
}
stage("build"){
steps{
bat 'mvn compile'
}
}
} // stages
} // pipeline

def call() {
    echo "Building Docker image..."
    sh "docker build -t $IMAGE_NAME:${env.BUILD_NUMBER} ."
    echo "Docker image built successfully!"
}

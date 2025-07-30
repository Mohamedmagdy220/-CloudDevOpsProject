def call() {
    echo "Updating Kubernetes manifests..."

    def deploymentFile = readFile('k8s/app-deployment.yml')

    def newImageTag = "my-app:${env.BUILD_NUMBER}"
    deploymentFile = deploymentFile.replaceAll("my-app:.*", "my-app:${newImageTag}")

    writeFile(file: 'k8s/app-deployment.yml', text: deploymentFile)

    echo "Kubernetes deployment updated with new image tag: ${newImageTag}"

}


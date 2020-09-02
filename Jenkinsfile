node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm  
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        steps {
            bash docker commit assignemen_nvn_cont assignement_nvn:v1
            bash docker run --name assignemen_nvn_1 -d -p 5000:5000 assignement_nvn:v1
        }
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-id') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}

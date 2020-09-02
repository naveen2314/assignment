node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm  
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
				sh '''#!/bin/bash  
                docker commit assignemen_nvn_cont naveen2314/assignement_nvn
                docker run --name assignemen_nvn_1 -d -p 5004:5000 naveen2314/assignement_nvn
                '''
        
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

				  sh '''#!/bin/bash 
                  docker exec  assignemen_nvn_1 sh /carta/devops/carta-devops test
                  '''
        
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-id') {
            sh '''#!/bin/bash 
                  docker push naveen2314/assignement_nvn:latest                  
               '''
        }
    }
}

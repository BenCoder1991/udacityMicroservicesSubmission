[![CircleCI](https://circleci.com/gh/BenCoder1991/udacityMicroservicesSubmission/tree/main.svg?style=svg)](https://circleci.com/gh/BenCoder1991/udacityMicroservicesSubmission/tree/main)


## 1. Summary of the project
### Purpose of the application
* Predict housing prices
* Based on pre-trained ml model
* Predictions are made by first deploying the application and then running queries

### Architecture explanation
* The application with all relevant dependencies is bundled in a Docker image
* The Docker image is uploaded to Docker Hub
* The Docker image can be deployed and the purpose of the project is to showcase this for vanilla Docker and Kubernetes

## 2.a Setup the environment
* All commands are run from within the udacityMicroservicesSubmission directory

The following steps are necessary, however on cloud9 you can easily use the file `cloud9_setup_script` (1) to ensure this.
* Create a virtualenv and activate it (this project assumes python3 -m venv ~/.devops). This environment is to be activated for all subsequent steps.
* Run `make install` to install the necessary dependencies
* If cloud9 and low disk space, run `./resize.sh` (may require `chmod +x resize.sh`)
* Install minikube as in (1)
* Install kubectl as in (1)
* Run `make lint` to test that all linting tests are passed
* (Optional) run all the steps in the Makefile at once, run: `make all`

## 2.b. Containerize and run the application
* Run `./run_docker.sh` to build the app with the tag "mlapp", list all images, run the container in Docker
* To query the applicaiton, run `./make_prediction.sh` in a separate terminal window
* (Optional) Once you want to stop, press `Ctrl+C` 
* Upload the docker image  for later use to Docker Hub via: `./upload_docker.sh`
* Retrieve the image from Docker Hub and run in Kubernetes:
    * run `minikube start` in your terminal
    * run `./run_kubernetes.sh` 
    * query the application vai `./make_prediction.sh`  in a separate terminal
    * NEW: as discussed here, the docker output seems faulty (it does not display the actual output in cloud9), c.f.
    * ... https://knowledge.udacity.com/questions/79267 I have followed the suggestion and displayed the logs for kubernetes 
    * ... (I have tried increasing resources, used pyhtonunbuffered etc. none of it worked) 
    * ... therefore the output in the respective file stems from the command kubectl `kubectl logs mlapp`.
    * run `minikube delete` in your terminal

## 3. Explanation of all files
* `.gitignore` - git default, specifying untracked files
* `app.py` - main python application as provided with additional log output and fix f-string in line 23 in comparison to the assignment
* `Dockerfile` - specifying all information to build and run the later Docker image with the python app
* `make_prediction.sh` - file provided as part of the coursework, querying the app (to be run from a separate terminal)
* `Makefile` - setup of virtual environment, installing required dependencies, linting app.py and Dockerfile 
* `README.md` - provides information about the project
* `requirements.txt` - list of all required dependencies, note: added pylint as suggested in the project discussion forum by a mentor
* `resize.sh` - standard code provided by AWS to resize the disk space of cloud9 environments
* `run_docker.sh` - build the app with the tag "mlapp", list all images, run the container in docker
* `run_kubernetes.sh` - load the Docker Hub image, list all pods, forward the port (8000:80)
* `upload_docker.sh` - upload the docker image to Docker Hub
* `.circleci/config.yml` - CircleCI configuration to allow CircleCI integration
* `output_txt_files/docker_out.txt` - sample output from querying app running in vanilla docker
* `output_txt_files/kubernetes_out.txt` - sample output from querying app running in kubernetes
* `model_data/*` - provided for the project, underlying data for ml model (reference: line 71, app.py)
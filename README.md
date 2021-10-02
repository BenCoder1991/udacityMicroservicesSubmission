<include a CircleCI status badge, here>
[![CircleCI](https://circleci.com/gh/BenCoder1991/udacityMicroservicesSubmission/tree/main.svg?style=svg)](https://circleci.com/gh/BenCoder1991/udacityMicroservicesSubmission/tree/main)

## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl

# Notes: as recommended by the mentor I additionally included pylint in requirements file as suggested as well as adding an additional hadolint installation within the Makefile
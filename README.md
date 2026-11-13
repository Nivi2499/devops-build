\# Application Deployment Capstone



\## Project Overview



This project demonstrates an end-to-end application deployment workflow using DevOps tools and practices.



The Online Shopping application is containerized using Docker and Docker Compose. Jenkins automates the CI/CD pipeline by building Docker images and pushing them to Docker Hub based on Git branch changes.



\## Application Details



\- Application: Online Shopping

\- Frontend: React (pre-built static application)

\- Web Server: Nginx

\- Containerization: Docker

\- Orchestration: Docker Compose

\- CI/CD: Jenkins

\- Source Code Management: Git and GitHub

\- Container Registry: Docker Hub



\## Project Architecture



1\. Developer pushes code changes to the dev branch.

2\. Jenkins periodically checks the GitHub repository for changes.

3\. Jenkins builds the Docker image.

4\. Jenkins pushes the image to the public DEV Docker Hub repository.

5\. Changes are merged from dev into master.

6\. Jenkins builds the production Docker image.

7\. Jenkins pushes the production image to the private Docker Hub repository.



\## Docker Configuration



The application is containerized using a custom Dockerfile based on Nginx Alpine.



The Dockerfile:

\- Uses the Nginx Alpine base image.

\- Copies the React build files into the Nginx web directory.

\- Exposes port 80.

\- Starts the Nginx server.



\## Build Docker Image



Run:



```bash

docker build -t devops-build-app:dev .

```



\## Run the Application Using Docker Compose



Docker Compose is used to build and start the application container.



Start the application:



```bash

docker compose up -d --build

```



Check the running container:



```bash

docker compose ps

```



Access the application in your browser:



http://localhost:8081



Stop the application:



```bash

docker compose down

```



\## Shell Scripts



Two Bash scripts are included to simplify application deployment.



\### build.sh



This script builds the Docker image:



```bash

./build.sh

```



\### deploy.sh



This script starts the application using Docker Compose and checks the container status:



```bash

./deploy.sh

```



\## Git and GitHub



Git is used for source code management.



The project uses the following branches:



\- main: Original application branch.

\- dev: Development branch.

\- master: Production branch.



Changes are pushed to the dev branch and merged into master for production builds.



GitHub Repository:



https://github.com/Nivi2499/devops-build



\## Docker Hub Repositories



Two Docker Hub repositories are used:



\- DEV repository (Public):

&#x20; https://hub.docker.com/r/nivi99/devops-build-dev



\- PROD repository (Private):

&#x20; https://hub.docker.com/r/nivi99/devops-build-prod



The DEV pipeline pushes development images to the public repository.



The PROD pipeline pushes production images to the private repository.



\## Jenkins CI/CD Pipeline



Jenkins is configured with a Multibranch Pipeline.



Pipeline job name:



Final-Capstone-Pipeline



GitHub repository:



https://github.com/Nivi2499/devops-build



Jenkins scans the repository periodically every 5 minutes.



\### DEV Pipeline



When changes are detected in the dev branch:



1\. Jenkins checks out the source code.

2\. Jenkins builds the Docker image.

3\. Jenkins tags the image.

4\. Jenkins logs in to Docker Hub using stored Jenkins credentials.

5\. Jenkins pushes the DEV image to Docker Hub.



\### PROD Pipeline



When changes are merged into the master branch:



1\. Jenkins checks out the master branch.

2\. Jenkins builds the production Docker image.

3\. Jenkins tags the image.

4\. Jenkins logs in to Docker Hub using stored Jenkins credentials.

5\. Jenkins pushes the PROD image to the private Docker Hub repository.



\## Project Status



\- Dockerfile created.

\- Docker Compose configuration created.

\- Bash build.sh script created and tested.

\- Bash deploy.sh script created and tested.

\- Application successfully built and tested locally.

\- DEV Docker image pushed to Docker Hub.

\- PROD Docker image pushed to Docker Hub.

\- Jenkins DEV pipeline executed successfully.

\- Jenkins PROD pipeline executed successfully.


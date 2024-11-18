## [Youtube](https://www.youtube.com/watch?v=OgYGKoJI39g&feature=youtu.be)

MLOPS Tutorials :

Deploy ML flask App in : 
	- AWS Fargate ===> Tutorial already done ✅  
	- GCP ===> covered today 🏃
	- Azure Cloud

Build, train and deploy models in AWS Sagemaker

Build Gradio app 

Build Gradio app and deploy in Hugging Face

Build Streamlit app

Build Streamlit app and deploy in Render hosting solution


ML Pipelines :
	- ZenML
	- MLFlow
	- KubeFlow
	- DVC
	- Pycaret




# Deploy Machine Learning Pipeline on Google Kubernetes Engine

Tools used and Steps : 


Python Flask library
Pycaret library
Docker to build image app
GCP account
GCR = Google Container Registry (image management)
GKE = Google Kubernetes Engine (cluster management)
ML web app in action


Another Tutorial : https://pycaret.gitbook.io/docs/learn-pycaret/official-blog/deploy-ml-pipeline-on-google-kubernetes



Step 1 — Create a new project in GCP Console

Step 2 — Import Project Code :
git clone -b master https://github.com/davidtchouta/DeployMLonGCP.git


Step 3— Build the docker image : 
docker build -t gcr.io/deploymlgcp/insurance-app:v1 .

Step 4— Upload the container image :
==> Authenticate to Container Registry (you need to run this only once):
gcloud auth configure-docker

==> Execute the following code to upload the docker image to Google Container Registry:
docker push gcr.io/deploymlgcp/insurance-app:v1

Step 5— Create Cluster :
==> Set your project ID and Compute Engine zone options for the gcloud tool:
gcloud config set project 'deploymlgcp'
gcloud config set compute/zone europe-west6

gcloud container clusters create insurance-cluster --num-nodes=2 --disk-type=pd-standard --disk-size=10

Step 6— Deploy Application :
kubectl create deployment insurance-app --image=gcr.io/deploymlgcp/insurance-app:v1

Step 7— Expose your application to the internet
==> By default, the containers you run on GKE are not accessible from the internet : 
kubectl expose deployment insurance-app --type=LoadBalancer --port 80 --target-port 8080

Step 8— Check Service :
kubectl get service

Step 9— See the app in action

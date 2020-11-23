<h1>PRACTICAL PROJECT - DEVOPS</h1>

<h2>Project Overview</h2>

The second project at QA had been a practical project which would involve the use of DevOps technologies to deploy a working microservice application onto the cloud environment. This would include an entirely automated architecture being deployed with the use of the following technologies: 

<ul>
<li>Kanban Board: Jira </li>
<li>Version Control: Git </li>
<li>CI Server: Jenkins </li>
<li>Configuration Management: Ansible </li>
<li>Cloud Server: AWS EC2 </li>
<li>Database Server: AWS RDS </li>
<li>Containerisation: Docker </li>
<li>Reverse Proxy: NGINX </li>
<li>Orchestration Tool: Kubernetes</li> 
<li>Infrastructure Management: Terraform</li> 
</ul> 

<h2>Requirements:</h2> 

This project required the following, all of which are also documented within this README: 

<ul>
<li>A Jira board with full expansion on tasks needed to complete the project. </li>
<li>This could also provide a record of any issues or risks that you faced creating your project. </li>
<li>The application must be deployed using containerisation and orchestration tools. </li>
<li>The application must be tested through the CI pipeline. </li>
<li>The project must make use of two managed Database Servers: 1 for Testing and 1 for Production. </li>
<li>If a change is made to the code base, Webhooks should be used so that Jenkins recreates and redeploys the changed application. </li>
<li>The infrastructure for the project should be configured using an infrastructure management tool (Infrastructure as Code). </li>
<li>As part of the project, you need to create an Ansible Playbook that will provision the environment that your CI Server needs to run. </li>
<li>The project must make use of a reverse proxy to make your application accessible to the user. </li>
</ul>
 
<h2>My Solution</h2> 

This project begun with a flask application being provided, this application had a front-end html page, the back-end written in python and an SQL database for storage. As the application had been broken down into a multi-tiered application, this would require for the python app to be containerised, for the front-end to be hosted on a proxy and for the database to be configured within the cloud. 

The project involved the following tasks broken down: 

<ul>
<li>Dockerfile for python application and docker-compose written to create image. </li>
<li>Image run using a Jenkinsfile which would describe the build environment </li>
<li>Ansible would allow for the virtual EC2 environment to be prepared with Docker, Jenkins, Docker-Compose, NGINX... </li>
</ul>
 

<h2>Project Management </h2>

Being an individual project, this hadn't left much room for full scrum practise to be implemented, however I had attempted to integrate agile (more specifically Scrum) practises throughout the completion of this project. 

In order to do so, this involved a Kanban Scrum board, using the Jira software. On this board, I had then developed and placed all User Stories, which would become the base of the Product Backlog; these were based off the project requirements so that they would remain relevant and accurate. Once all product backlog artefacts had been developed and finalised to ensure they cover the entire scope of the project.  

These were then assigned story points in order to gauge the difficulty of the task in accordance to my abilities and the time available; this was done to allow for an estimation on the sprint backlog, as well as preparing me for the task at hand. 

Once all tasks were assigned story points, these were then grouped by epics which would allow for a collation of related backlog items so that they could be grouped. The user stories had been grouped by the following epics: Docker, Git, AWS, Jenkins, Terraform and Kubernetes.

A trello board had also been used for personal organisation throughout the project.

![Imgur](https://imgur.com/ypId20m)
 
 

<h2>Brief Overview of Risk Assessment </h2>

Throughout the course of a project, a Risk Assessment is used in order to increase awareness of potential risks to the outcome of the project, and ultimately prevent/mitigate these as best as possible. 

<h3>Key </h3>

![Imgur](https://imgur.com/gpjQoME)

![Imgur](https://imgur.com/undefined)

<h2> Architecture of My Solution </h2>

The Architecture that this project had followed can be seen as below. This was a 3 tier micro Flask application deployed on AWS via a CI Pipeline. The infrastructure had been set up via Terraform and Ansible on AWS. The application had been containerised by Docker and orchestrated via Kubernetes. The deploymenet had been on a Jenkins CI server.

![Imgur](https://imgur.com/sDPHlen)

<h3> Jenkins Job Build Stages </h3>

![Imgur](https://imgur.com/undefined)

<h2> Authors </h2>
Sheraz Shahid - QA Trainee
 

 
 

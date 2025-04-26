### To keep the docker container running you need -it (means interactive)
docker run -it --name <your_container_name> ubuntu:22.04

### To attach to the stopped container and login as internactive mode
docker start -ai <your_container_name>

### Create an image out of running container
docker commit <container_name_or_id> <new_image_name>

ie:
docker commit SDS ubuntu22_standard

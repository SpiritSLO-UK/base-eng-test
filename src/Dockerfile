# Use an official AWS Lambda Python runtime as a parent image
FROM public.ecr.aws/lambda/python:3.10

# Set the working directory in the container to /var/task
WORKDIR /var/task

# Add the current directory contents into the container at /var/task
ADD . /var/task

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Set the CMD to your handler
CMD ["main.lambda_handler"]

#Test v2.4
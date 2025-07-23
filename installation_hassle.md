# DON'T PANIC
The hardest part of being a data scientist is installing software.
This is because the software is written on a relatively small budget, and is not marketed to be run by the general public.
This means that the job of making sure software installs easily on every single operating system is difficult.
Furthermore, data science software libraries often rely on system software that can't be installed through the programming language. This is the case for the `rethinking` package in R.  The rethinking package depends on C++ and cmdstanr.

To get around this, the easiest way is to install docker and run a docker container.
A docker container emulates an operating system with any prerequisite software (like C++) already installed.

# Docker to the rescue!

To install docker: Check out one of the following links
* [Mac](https://docs.docker.com/desktop/setup/install/mac-install/) 
* [Linux](https://docs.docker.com/desktop/setup/install/linux/)
* [Windows](https://docs.docker.com/desktop/setup/install/windows-install/)



# Running rstudio

Once you've installed docker, the next phase is to use the "compose.yml" file that describes the program you want to run. To run the compose file use `docker compose up -d`.


# Logging in
Navigate to http:127.0.01:8787 and login with username rstudio and password password. 

# The Rstudio Docker Compose file.
```
services:
  rstudio:
    image: patrickrobotham/rethinking-rstudio:latest
    ports:
      - 8787:8787
    volumes:
      - ~/workspace:/home/rstudio/workspace
    environment:
      - PASSWORD=password
```

Here's a breakdown of what each part of the above `compose.yml` file does:
- `services:`  
  This section defines the services (containers) that will be run. Here, we have a single service called `rstudio`.

- `rstudio:`  
  The name of the service. You can refer to this service by this name in Docker Compose commands.

- `image: patrickrobotham/rethinking-rstudio:latest`  
  Specifies the Docker image to use. This image comes pre-installed with RStudio and the `rethinking` package.

- `ports:`  
  - `8787:8787`  
    Maps port 8787 on your computer to port 8787 in the container, allowing you to access RStudio in your browser at `http://localhost:8787`.

- `volumes:`  
  - `~/workspace:/home/rstudio/workspace`  
    Mounts the `~/workspace` directory from your computer into the container at `/home/rstudio/workspace`, so you can access your files from within RStudio.

- `environment:`  
  - `PASSWORD=password`  
    Sets the password for the RStudio user to `password`. You should change this to something more secure.



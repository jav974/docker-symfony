# Bootstrap Symfony projects with Docker

This repository contains 2 commands to help you bootstrap Symfony projects using Docker.

It uses [serversideup/docker-php](https://github.com/serversideup/docker-php) as a base to build the Docker image.

## Requirements

Docker engine is required to run this project. You can download it from [here](https://docs.docker.com/engine/).

Make utility is also required to run the Makefile. You can download it from [here](https://www.gnu.org/software/make/).

## Usage

1. Clone this repository:

    ```bash
    git clone git@github.com:jav974/docker-symfony.git
    ```

2. Use one of the following command to bootstrap your project (adapt the parameters to your needs):

    ```bash
    # make new|new-webapp <php_version> <symfony_version> <web_server> <project_name>
    make new php_version=8.2 symfony_version=6.3.* webserver=nginx project_name=symfony-nginx-skeletton
    make new-webapp php_version=8.1 symfony_version=5.4.* webserver=apache project_name=symfony-apache-skeletton
    ```

3. Open your browser and go to `http://127.0.0.1` or `https://127.0.0.1` to see the Symfony welcome page.

4. Run the following command inside the project directory to stop the container:

    ```bash
    make down
    ```

Refer to the [Makefile](.docker/Makefile) for more commands available.

## Going further

The Dockerfile, and any other copied configuration inside your project directory is all yours !
Modify them as you want to fit your needs.

Edit docker-compose.yaml (and docker-compose.override.yaml) to [add more services](https://docs.docker.com/compose/gettingstarted/#step-3-define-services-in-a-compose-file) to your project.

See also [how to customize environment variables in serversideup/docker-php](https://serversideup.net/open-source/docker-php/docs/reference/environment-variable-specification)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

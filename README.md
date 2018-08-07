# Docker Sceptre
Containerised [Sceptre](https://sceptre.cloudreach.com) to ensure consistent local development and simple CD pipelines.

## Usage
Run as a command using `sceptre` as entrypoint:

    docker run --rm --entrypoint sceptre contino/sceptre --version

Run as a shell and mount the `.aws` directory and current directory as volumes:

    docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/opt/app contino/sceptre bash

Using docker-compose:

    sceptre:
      image: contino/sceptre
      env_file: .env
      entrypoint: sceptre
      working_dir: /opt/app
      volumes:
      - ~/.aws:/root/.aws:ro
      - .:/opt/app:rw
      
And run `docker-compose run sceptre --version`

## Build
Update the `SCEPTRE_VERSION` in both `Makefile` and `Dockerfile`. Then run:

    make build
    
Docker Hub will automatically trigger a new build.

## Related Projects

- [docker-terraform](https://github.com/contino/docker-terraform)
- [docker-aws-cli](https://github.com/contino/docker-aws-cli)

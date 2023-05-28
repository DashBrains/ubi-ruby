# Ruby UBI

[![![dockeri.co](https://dockerico.blankenship.io/image/dashbrains/ubi-ruby)](https://hub.docker.com/r/dashbrains/ubi-ruby)

[![GitHub issues](https://img.shields.io/github/issues/dashbrains/ubi-ruby.svg "GitHub issues")](https://github.com//dashbrains/ubi-ruby)
[![GitHub stars](https://img.shields.io/github/stars/dashbrains/ubi-ruby.svg "GitHub stars")](https://github.com/dashbrains/ubi-ruby)

The Ruby image based on Redhat UBI.

## Table of Contents

- [Ruby UBI](#ruby-ubi)
  - [Table of Contents](#table-of-contents)
  - [What is Ruby?](#what-is-ruby)
  - [How to use this image](#how-to-use-this-image)
    - [Create a `Dockerfile` in your Ruby app project](#create-a-dockerfile-in-your-ruby-app-project)
    - [Run a single Ruby script](#run-a-single-ruby-script)
  - [Image Variants](#image-variants)
    - [`ruby-ubi::<version>-ubi9`](#ruby-ubiversion-ubi9)
    - [`ruby-ubi::<version>-ubi8`](#ruby-ubiversion-ubi8)
  - [License](#license)
  - [Supported Docker versions](#supported-docker-versions)
  - [Supported Ruby versions](#supported-ruby-versions)

## What is Ruby?

A dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.

See: https://www.ruby-lang.org

## How to use this image

### Create a `Dockerfile` in your Ruby app project

```dockerfile
# specify the ruby base image with your desired version ruby:<version>-<ubi-version>
FROM ruby:3.2.2-ubi9
# replace this with your application's default port
EXPOSE 8888
```

You can then build and run the Docker image:

```console
$ docker build -t my-ruby-app .
$ docker run -it --rm --name my-running-app my-ruby-app
```

If you prefer Docker Compose:

```yml
version: "2"
services:
  ruby:
    image: "ruby-ubi:3.2.2-ubi9"
    working_dir: /app
    expose:
      - "8081"
    command: "ruby app.rb"
```

You can then run using Docker Compose:

```console
$ docker-compose up -d
```

### Run a single Ruby script

For many simple, single file projects, you may find it inconvenient to write a
complete `Dockerfile`. In such cases, you can run a Ruby script by using the
Ruby Docker image directly:

```console
$ docker run -it --rm --name my-running-script -v "$PWD":/app -w /app ruby-uby:3.2.2-ubi9 ruby your-daemon-or-script.rb
```

## Image Variants

The `ruby-ubi` images come in many flavors, each designed for a specific use case.
All of the images contain pre-installed versions of `ruby`,
[`bundle`](https://bundler.io/). For each
supported architecture, the supported variants are different.

### `ruby-ubi::<version>-ubi9`

This image is based on version 9 of
[UBI](https://www.redhat.com/en/blog/introducing-red-hat-universal-base-image), available in
[the `ubi9` official image](https://hub.docker.com/r/redhat/ubi9).

### `ruby-ubi::<version>-ubi8`

This image is based on version 8 of
[UBI](https://www.redhat.com/en/blog/introducing-red-hat-universal-base-image), available in
[the `ubi8` official image](https://hub.docker.com/r/redhat/ubi8).


## License

[License information](LICENSE) for the
Ruby UBI Docker project.

## Supported Docker versions

This image is officially supported on Docker version 1.9.1.

Support for older versions (down to 1.6) is provided on a best-effort basis.

Please see [the Docker installation
documentation](https://docs.docker.com/installation/) for details on how to
upgrade your Docker daemon.

## Supported Ruby versions

This project will support Ruby versions as still under active support as per the [Ruby Maintenance Branches](https://www.ruby-lang.org/en/downloads/branches/).

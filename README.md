# cicd image

## Introduction

This Dockerfile provides a robust and versatile Docker image, ideal for Continuous Integration (CI) environments. It includes a variety of essential tools for software development, version management, and automated operations, ensuring a consistent and efficient working environment.

## Image Features

### Python Base

* **Python 3.11.5**: The image is based on Python 3.11.5, providing a solid foundation for Python applications and scripts.

### Included Tools

* **Git 2.40.1**: For version control management.
* **Curl 8.4.0**: A tool for transferring data from or to a server.
* **XMLStarlet 1.6.1**: A suite of tools to transform and query XML documents.
* **ExifTool 12.60**: Enables reading, writing, and editing metadata in files.
* **Bash 5.2.15**: Command shell for interacting with the operating system.
* **OpenSSL 3.1.4**: Provides robust cryptographic functions.
* **YQ 4.33.3 and JQ 1.6**: Tools for parsing and manipulating data in YAML and JSON formats, respectively.

### Kubernetes Automation and Management

* **Kubectl 1.23.4**: Command-line tool for Kubernetes, allowing cluster management.
* **Helm 3.11.0**: A package management tool for Kubernetes.

### Security and Configuration Management

* **SOPS**: Mozilla's tool for encrypting, decrypting, and managing secret configuration files.

### Python Virtual Environment

* Utilizes a virtual environment to isolate project dependencies.

### Custom Scripts

* **semver.sh**: A script for handling semantic versioning of applications.

### Dependency Management

* Installation of Python dependencies specified in `requirements.txt`.

## Advantages of Using This Image in CI

### Consistency

Each build or test is run in an identical environment, reducing discrepancies between development, testing, and production environments.

### Efficient Automation

Includes key tools for automating common tasks in CI, like deployments, testing, and configuration management.

### Security

Security tools like SOPS and OpenSSL enable secure handling of secrets and certificates.

### Flexibility

Suitable for a wide range of CI workflows, from Python applications to Kubernetes management and configuration handling.

### Easy Integration

Designed to seamlessly integrate with popular CI systems like Jenkins, GitLab CI/CD, and GitHub Actions.

## How to Use It

To use this image in your CI pipeline, simply reference the image in your CI configuration file. Here's an example for a GitLab CI pipeline:

```yaml
image: xavimf87/cicd:0.1.0

stages:
  - test
  - deploy

test:
  stage: test
  script:
    - python -m unittest

deploy:
  stage: deploy
  script:
    - helm upgrade my-app helm-chart/ --install
```

This image ensures that your development team and CI pipelines are always equipped with the necessary tools for efficient and secure software delivery.

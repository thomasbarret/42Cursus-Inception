# 42 Cursus - Inception

**Inception** is a 42 project designed to explore containerization concepts using Docker and Docker Compose. The goal is to create a set of containerized services simulating a web server environment, including services like Nginx, MariaDB, WordPress, and additional bonus services such as Adminer, Redis, and more.

---

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Installation and Usage](#installation-and-usage)
- [Core Services](#core-services)
- [Bonus Services](#bonus-services)

---

## Overview

This project helps you strengthen your understanding of:

- Creating and managing Docker containers.
- Using Docker Compose to orchestrate multiple containers.
- Configuring and deploying services such as MariaDB, WordPress, and Nginx.
- Implementing custom configurations for each service.

---

## Prerequisites

Ensure your environment has the following tools installed:

- **Docker** (Recommended version: 20.10+)
- **Docker Compose** (Recommended version: 1.29+)
- A Unix-based system (Linux/macOS)

---

## Project Structure

The project file structure is as follows:

```
.
├── Makefile                       # Simplifies container build and management
└── srcs                           # Contains all project files
    ├── docker-compose.yml         # Main file to orchestrate containers
    └── requirements               # Necessary services
        ├── mariadb                # MariaDB database service
        │   ├── Dockerfile
        │   ├── conf
        │   │   └── 50-server.cnf  # MariaDB configuration
        │   └── tools
        │       └── mariadb.sh     # Initialization script for MariaDB
        ├── nginx                  # Nginx web server
        │   ├── Dockerfile
        │   └── conf
        │       └── nginx.conf     # Nginx configuration
        ├── wordpress              # WordPress application
        │   ├── Dockerfile
        │   ├── conf
        │   │   └── www.conf       # WordPress configuration
        │   └── tools
        │       └── wordpress.sh   # WordPress setup script
        ├── bonus                  # Bonus services
            ├── adminer            # Admin interface for MariaDB
            │   ├── Dockerfile
            │   └── conf
            │       ├── apache2.conf
            │       └── ports.conf
            ├── discord            # Discord bot
            │   ├── Dockerfile
            │   └── conf
            │       └── main.js
            ├── redis              # Redis caching service
            │   └── Dockerfile
            ├── site               # Additional static website
                ├── Dockerfile
                └── conf
                    ├── apache2.conf
                    └── website    # Website files (HTML, CSS, JS)
```

---

## Installation and Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/inception.git
   cd inception
   ```

2. Build the containers:
   ```bash
   make
   ```

3. Start the environment with Docker Compose:
   ```bash
   docker-compose up -d
   ```

4. Access the services via your browser. By default:
   - **Nginx**: `http://localhost`
   - **Adminer** (bonus): `http://localhost:8080`
   - **WordPress**: `http://localhost`

5. Stop and remove the containers:
   ```bash
   make clean
   ```

---

## Core Services

### 1. **Nginx**
- Acts as a reverse proxy for WordPress.
- Configured with SSL certificates to secure connections.

### 2. **MariaDB**
- A containerized database service used by WordPress.
- Automatically initialized using custom scripts.

### 3. **WordPress**
- A WordPress instance connected to the MariaDB database.
- Ready to use as a blogging platform or CMS.

---

## Bonus Services

### 1. **Adminer**
- A web-based interface to manage the MariaDB database.

### 2. **Redis**
- A key-value caching system to optimize WordPress performance.

### 3. **Additional Static Website**
- A static website hosted in an Apache container.

### 4. **Discord Bot**
- A Node.js script hosted in a container to interact with Discord.

### 5. **FTP**
- An FTP server to manage files on the server.
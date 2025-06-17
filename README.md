# Project Management Platform

## Setup Instructions

> ![NOTE]
> It's setup for Nix systems and VS Code as the IDE, other's might have varying luck.

1. Clone repository
2. Open in VS Code
3. Install the recommended extensions
4. Download and setup required dependencies
    ```sh
    just init
    ```
4. Start local development environment
    ```sh
    just up
    ```
5. Start hacking on a service
6. Once finished shut it down
    ```sh
    just down
    ```

## Services

### User Service

Provides and *Interface* for getting and updating user data.

### Project Service

Provides and interfaces for managing projects.

### Git Repository Service

Provides a standardized *interface* for interacting with Git repositories from Git providers (ex. GitHub).

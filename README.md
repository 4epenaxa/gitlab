# GitLab + GitLab Runner in Docker

This project runs a local GitLab CE instance with a pre-configured GitLab Runner using the `shell` executor.

## Usage

1. Create Docker network:

```bash
docker network create gitnet
```

2. Create .env file with your GitLab URL and runner token:

```
CI_SERVER_URL=http://your_link/
CI_REGISTRATION_TOKEN=your_token_here
```

3. Start the services:

```
docker compose up -d
```

4. Access GitLab at http://localhost:9000

#TODO  
Replace shell executor with docker executor for improved security and isolation.

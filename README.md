
# 🛠️ Self-Hosted GitLab + Runner

Run GitLab CE and GitLab Runner in Docker for local development or CI/CD experiments.

---
## 📁 Project Structure

```text
.
├── config/                 # GitLab configuration
├── logs/                   # GitLab logs
├── data/                   # GitLab data (repositories, database, etc.)
├── gitlab-runner/
│   └── config/             # GitLab Runner configuration
├── .env                    # Environment variables (e.g., CI_SERVER_URL and token)
├── docker-compose.yaml     # Main docker-compose file
└── README.md               # Project documentation
```

---

## 🛡 Security

> ⚠️ **WARNING:** This configuration uses the `shell` executor for GitLab Runner.

- It is suitable for local development, but **not secure** for production environments.
- In `shell` mode, the Runner executes commands directly on the host, which can lead to data leakage or malicious code execution.
- 💡 **It is recommended** to transition to the `docker` executor or isolated `kubernetes`/`virtualbox` executor in the future.

---

## 🚀 Quick Start

```bash
docker network create gitnet
docker-compose up -d
```

Then open your browser and go to:

- GitLab: [http://localhost:9000](http://localhost:9000)

---

## 🧩 Runner Setup

Runner automatically registers on first start using the variables from `.env`:

```env
CI_SERVER_URL=http://gitlab/
CI_REGISTRATION_TOKEN=your_token_here
```

---

## 📜 License

MIT — Feel free to use and modify.

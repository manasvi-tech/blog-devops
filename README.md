# Next.js DevOps Assessment

## 🚀 Project Overview
This project containerizes a starter template Next.js application, builds and pushes the Docker image to GitHub Container Registry (GHCR) using GitHub Actions, and deploys it to a local Kubernetes cluster (Minikube).

---

## 🐳 Docker Setup

### Build and Run Locally
```bash
docker build -t nextjs-blog .
docker run -p 3000:3000 nextjs-blog
```

## Dockerfile Highlights

1. Multi-stage build using node:20-alpine
2. Optimized for production
3. Minimal image size

## 🤖 GitHub Actions Workflow

The workflow automatically:

1. Builds the Docker image
2. Tags it as ghcr.io/manasvi-tech/blog-devops:latest
3. Pushes it to GHCR on every push to the main branch

## ☸️ Kubernetes Deployment (Minikube)

### Start Minikube
```bash
minikube start

```
### Create Docker Registry Secret
```bash
kubectl create secret docker-registry ghcr \
  --docker-server=https://ghcr.io \
  --docker-username=manasvi-tech \
  --docker-password=<YOUR_TOKEN> \
  --docker-email=manasviarora28@example.com
```

### Apply Manifests
```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

### Check Status
```bash
kubectl get pods
kubectl get svc
```

### Access Application
```bash
minikube service nextjs-blog-service --url
```
Or Expose Publically
```bash
ngrok http http://127.0.0.1:<minikube-port>
```

🌐 Access

1. Local URL:
   ```
   http://127.0.0.1:<minikube-port>
   ```
3. Public URL (optional):
   ```
    https://<ngrok-or-localtunnel-link>
    ```

📦 Image Details

1. GHCR Image: ghcr.io/manasvi-tech/blog-devops:latest
2. Repository: https://github.com/manasvi-tech/blog-devops

## Project Structure
```
.
├── Dockerfile
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
├── .github/
│   └── workflows/
│       └── docker-publish.yml
├── package.json
└── README.md
```

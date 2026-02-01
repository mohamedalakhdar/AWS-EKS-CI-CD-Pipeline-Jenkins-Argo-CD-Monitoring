## Project Architecture

![alt text](<Screenshot 2026-01-29 213750.png>)

##  CI process

Implemented a fully automated Continuous Integration (CI) pipeline using Jenkins.

Source code checkout from GitHub at the start of the pipeline.

Prepared a clean workspace before each build to ensure consistency.

Integrated SonarQube for static code analysis; the build proceeds only if the Quality Gate passes.

Automatically installed all project dependencies during the pipeline.

Conducted security scans with Trivy on the file system to detect vulnerabilities.

Built a Docker image and pushed it automatically to Docker Hub.

Performed Docker image scanning with Trivy to identify security issues.

Finalized the pipeline with cleanup and post-build actions to maintain a stable CI environment.

![alt text](<Screenshot 2026-02-01 160128.png>)

## GitOps / CD process (ArgoCD)

Implemented Continuous Deployment using ArgoCD for one Kubernetes Deployment and one Service.

Stored manifests in Git as the single source of truth.

ArgoCD automatically applied changes from Git to the Kubernetes cluster.

Enabled automatic rollback in case of deployment issues.

Monitored cluster health to ensure a stable deployment.

![alt text](<Screenshot 2026-01-31 192213.png>)

## Monitoring using Prometheus & Grafana

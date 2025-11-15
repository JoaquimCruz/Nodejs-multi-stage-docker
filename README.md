# Docker Multi-Stage Build Optimization (Node.js)

<div style="display: inline-block;">
<img align="center" height="20px" width="60px" src="https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=Ubuntu&logoColor=white"/> 
<img align="center" height="20px" width="80px" src="https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white"/> 
</a> 
</div>

This repository demonstrates the optimization of a Node.js (TypeScript/Express) application using Docker multi-stage builds.

## 🚀 Project Goal

This project was created as a practical demonstration for Operational Systems course assignment. The main goal is to practically implement and analyze key Docker concepts, including:

* **Image Management:** Demonstrating how to build optimized, lightweight images.
* **Process Isolation:** Running the application in a sandboxed environment.
**Microservices:** Using Docker Compose to link the Node.js API to a Postgres database service.
* **Networking & Volumes:** Establishing communication between containers and persisting database data.

## 🔬 The Comparison

This project contrasts two primary methods for Dockerizing a Node.js application:

1.  **The "Naive" Build (`Dockerfile.simple`)**
    * A single-stage build.
    * Copies all source code (including `.ts` files) and installs all `devDependencies`.
    * **Result:** A very large, insecure, and inefficient image (e.g., ~1.16 GB).

2.  **The "Optimized" Build (`Dockerfile`)**
    * Uses **multi-stage builds**.
    * **Stage 1 (Builder):** Installs all dependencies and transpiles the TypeScript code.
    * **Stage 2 (Production):** Starts from a clean, lightweight image (e.g., `node:18-alpine`) and copies *only* the compiled JavaScript and production dependencies from the "builder" stage.
    * **Result:** A minimal, secure, production-ready image (e.g., ~131 MB).

This repository also includes the legacy "Builder Pattern" (`Dockerfile.build`, `Dockerfile.prod`, `build.sh`) to show the historical evolution of this optimization technique.

## 🏁 How to Run

### 1. Compare the Builds

```bash
# Build the naive (large) version
docker build -f Dockerfile.simple -t app-node:ingenuo .

# Build the optimized (small) version
docker build -t app-node:otimizado .

# See the size difference!
docker images app-node*

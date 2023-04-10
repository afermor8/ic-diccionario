FROM debian:latest
RUN apt-get update && apt-get install -y git nano && apt-get clean && rm -rf /var/lib/apt/lists/*
USER root

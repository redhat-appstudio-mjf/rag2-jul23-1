# ai-lab-template-gitops

# Gitops Repo Patterns

This repository contains a http gitops repository format component for use as the ai-lab gitops template

### http 
- contains a deployment with a model service image `quay.io/ai-lab/llamacpp_python:latest` listening on port `8001`, and an app interface image `quay.io/redhat-ai-dev/ai-template-bootstrap-app:latest` listening on port `8501`, service and route for `8501`
- this matches the current RHTAP and ai-lab software templates default deployment
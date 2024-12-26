# Use the PyTorch base image
FROM pytorch/pytorch:2.5.1-cuda12.4-cudnn9-devel

# Set a working directory
WORKDIR /workspace

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages for Jupyter and other utilities
RUN pip install --upgrade pip && \
    pip install jupyterlab numpy pandas matplotlib seaborn scipy scikit-learn

# Expose port for Jupyter Notebook
EXPOSE 8888

# Set the entrypoint to launch Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

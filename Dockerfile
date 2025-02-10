FROM python:3.12

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    VIRTUAL_ENV=/home/app/.venv \
    PATH="/home/app/.venv/bin:$PATH"

# Add user
ARG USERNAME=app
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# Set working directory and change ownership
WORKDIR /home/app
RUN chown $USERNAME -R /home/app

# Install UV temporarily (no need for apt-get)
RUN pip install uv

# Install requirements
COPY ./astro_template ./astro_template
COPY pyproject.toml uv.lock README.md ./
RUN uv sync --python=python3

# Change user
USER $USERNAME

# Copy the app and static files
COPY app.py .
COPY ./www ./www

# Run app on port 8080
EXPOSE 8080
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]
#CMD ["tail", "-f", "/dev/null"]

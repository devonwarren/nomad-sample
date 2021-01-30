FROM python:3.9-slim

LABEL maintainer="Devon Warren <devon.warren@gmail.com>"

# initialize non-root user for app to run as
RUN mkdir /app && useradd -d /app webapp && chown -R webapp:webapp /app
USER webapp
WORKDIR /app
ENV PATH="/app/.local/bin:${PATH}"

# copy app code folder in
COPY --chown=webapp:webapp . .

# install dependencies
RUN pip install --user -r ./requirements.txt

# run the application
ENTRYPOINT ["python", "app.py"]
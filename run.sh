# run this to build and run local
cd auth
docker build . -t auth:1.0
nomad job run ./app.hcl

cd ../jobs
docker build . -t jobs:1.0
nomad job run ./app.hcl

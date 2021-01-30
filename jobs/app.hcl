job "jobs-app" {

    # use local datacenter by default
    datacenters = ["dc1"]

    group "webapp" {

        task "webservice" {
            driver = "docker"

            config {
                # build using 1.0 tag so we don't have to use registry
                image = "jobs:1.0"
                labels {
                    group = "jobs"
                }
            }
        }
    }
}

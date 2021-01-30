job "auth-app" {

    # use local datacenter by default
    datacenters = ["dc1"]

    group "webapp" {
        count = 1

        task "webservice" {
            driver = "docker"

            config {
                # build using 1.0 tag so we don't have to use registry
                image = "auth:1.0"
                labels {
                    group = "auth"
                }
            }
            
        }
    }
}

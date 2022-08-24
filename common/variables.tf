#
# The following map is used across most of the examples available
#
variable "customers" {
  type    = any
  default = {
    "acme" = {
      sites = {
        s1 = {
          users = [
            "user11",
            "user12",
          ]
        }
      },
      attributes = {
        type = "public"
      }
    },
    "dotcom" = {
      sites = {
        s2 = {
          users = [
            "user21",
          ]
        },
        s3 = {
          users = [
            "user31",
            "user32",
            "user33",
          ]
        }
      },
      attributes = {
        type = "private"
      }
    },
  }
}

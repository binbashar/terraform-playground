#
# The following variables can be symliked by the examples in the repo should they need to use them:
#
variable "customers" {
  type    = any
  default = {
    # This key identifies a customer name
    "acme" = {
      # Each customer can have a map of sites
      sites = {
        s1 = {
          # And each site can have a list of users
          users = [
            "user11",
            "user12",
          ]
        }
      },
      # Each customer can also have a map of attributes
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

locals {
  # ---------------------------------------------------------------------------
  # Create a list with only the names of the customers:
  # ---------------------------------------------------------------------------
  #  customers_list = [
  #    "acme",
  #    "factory",
  #  ]
  #
  customers_list = [
    for customer, sites in var.customers: customer
  ]

  # ---------------------------------------------------------------------------
  # Create a map that only contains the sites, not the attributes:
  # ---------------------------------------------------------------------------
  #  customers_sites_map = {
  #    acme   = {
  #      s1 = {
  #        users = [
  #          "user11",
  #          "user12",
  #        ]
  #      }
  #    }
  #    dotcom = {
  #      s3 = {
  #        users = [
  #          "user31",
  #          "user32",
  #          "user33",
  #        ]
  #      }
  #      s2 = {
  #        users = [
  #          "user21",
  #        ]
  #      }
  #    }
  #  }
  #
  customers_sites_map = {
    for customer, customer_data in var.customers :
        customer => customer_data.sites
  }

  # -------------------------------------------------------------------------------
  # Create a map that includes only the users grouped by customer:
  # -------------------------------------------------------------------------------
  #  customers_users_map = {
  #    "acme" = [
  #      {
  #        "users" = [
  #          "user11",
  #          "user12",
  #        ]
  #      },
  #    ]
  #    "dotcom" = [
  #      {
  #        "users" = [
  #          "user21",
  #        ]
  #      },
  #      {
  #        "users" = [
  #          "user31",
  #          "user32",
  #          "user33",
  #        ]
  #      },
  #    ]
  #  }
  #
  customers_users_map = {
    for customer, sites in local.customers_sites_map :
      customer => [
        for site in sites : site
      ]
  }

}

output "customers_users_map" {
  value = local.customers_users_map
}

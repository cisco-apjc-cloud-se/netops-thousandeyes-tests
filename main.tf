terraform {
  cloud {
    organization = "mel-ciscolabs-com"
    # hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      name = "netops-thousandeyes-tests"
    }
  }
  required_providers {
    thousandeyes = {
      source = "william20111/thousandeyes"
      # source = "cgascoig/cgascoig/thousandeyes"   # this is a custom build of the william20111/thousandeyes provider with a bug fixed (see https://github.com/william20111/terraform-provider-thousandeyes/issues/59)
      # version = "0.6.0"
    }
  }
}

provider "thousandeyes" {
  token = var.te_token
}


# ### Remote State - Import Kube Config ###
# data "terraform_remote_state" "iks-1" {
#   backend = "remote"
#
#   config = {
#     organization = "mel-ciscolabs-com"
#     workspaces = {
#       name = "iks-cpoc-syd-demo-1"
#     }
#   }
# }

# data "thousandeyes_agent" "agents" {
#   for_each = toset(var.agent_list)
#   agent_name  = each.key
# }
#
# resource "thousandeyes_http_server" "http_tests" {
#   for_each = var.http_tests
#
#   test_name = "HTTP - ${each.value.name}"
#   interval = 60
#   url = each.value.url
#
#   content_regex = ".*"
#
#
#   # # NOTE: Bug with API/Provider?  Need to save test in GUI to match settings
#   # # Initial Setup
#   # network_measurements = 0
#   # mtu_measurements = 0
#   # bandwidth_measurements = 0
#   # bgp_measurements = 0
#   # use_public_bgp = 0
#   # # num_path_traces = 0
#
#   # Updated Settings
#   network_measurements = 1
#   mtu_measurements = 1
#   bandwidth_measurements = 0
#   bgp_measurements = 1
#   use_public_bgp = 1
#   # num_path_traces = 0
#
#   dynamic "agents" {
#     for_each = toset(var.agent_list)
#     content {
#       agent_id = data.thousandeyes_agent.agents[agents.key].agent_id
#     }
#   }
#
# }
#
# // resource "thousandeyes_agent_to_server" "icmp_tests" {
# //   for_each = local.icmp_tests
# //
# //   test_name = "Ping ${each.key}"
# //   interval = 60
# //   server = each.value.server
# //   agents {
# //       agent_id = data.thousandeyes_agent.agent.agent_id
# //   }
# //
# //   protocol = "ICMP"
# //
# //   network_measurements = 1
# //   mtu_measurements = 0
# //   bandwidth_measurements = 0
# //   bgp_measurements = 1
# //   use_public_bgp = 1
# //
# //   // alert_rules {
# //   //   rule_id = 1575407
# //   // }
# //   //
# //   // alert_rules {
# //   //   rule_id = 1575406
# //   // }
# // }
#
# // resource "thousandeyes_agent_to_server" "tcp_tests" {
# //   for_each = local.tcp_tests
# //
# //   test_name = "Connect to ${each.key}"
# //   interval = 600
# //   server = each.value.server
# //   agents {
# //       agent_id = data.thousandeyes_agent.agent.agent_id
# //   }
# //
# //   protocol = "TCP"
# //   port = each.value.port
# //
# //   network_measurements = 1
# //   mtu_measurements = 0
# //   bandwidth_measurements = 0
# //   bgp_measurements = 0
# //   use_public_bgp = 0
# //
# //   alert_rules {
# //     rule_id = 1575407
# //   }
# //
# //   alert_rules {
# //     rule_id = 1575406
# //   }
# // }

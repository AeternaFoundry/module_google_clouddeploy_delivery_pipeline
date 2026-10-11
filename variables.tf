variable "clouddeploy_delivery_pipelines" {
  description = <<EOT
Map of clouddeploy_delivery_pipelines, attributes below
Required:
    - location
    - name
Optional:
    - annotations
    - deletion_policy
    - description
    - labels
    - project
    - suspended
    - serial_pipeline (block):
        - stages (optional, block):
            - deploy_parameters (optional, block):
                - match_target_labels (optional)
                - values (required)
            - profiles (optional)
            - strategy (optional, block):
                - canary (optional, block):
                    - canary_deployment (optional, block):
                        - analysis (optional, block):
                            - custom_checks (optional, block):
                                - frequency (optional)
                                - id (required)
                                - task (optional, block):
                                    - container (optional, block):
                                        - args (optional)
                                        - command (optional)
                                        - env (optional)
                                        - image (required)
                            - duration (required)
                            - google_cloud (optional, block):
                                - alert_policy_checks (optional, block):
                                    - alert_policies (required)
                                    - id (required)
                                    - labels (optional)
                        - percentages (required)
                        - postdeploy (optional, block):
                            - actions (optional)
                        - predeploy (optional, block):
                            - actions (optional)
                        - verify (optional)
                        - verify_config (optional, block):
                            - tasks (optional, block):
                                - container (optional, block):
                                    - args (optional)
                                    - command (optional)
                                    - env (optional)
                                    - image (required)
                    - custom_canary_deployment (optional, block):
                        - phase_configs (required, block):
                            - analysis (optional, block):
                                - custom_checks (optional, block):
                                    - frequency (optional)
                                    - id (required)
                                    - task (optional, block):
                                        - container (optional, block):
                                            - args (optional)
                                            - command (optional)
                                            - env (optional)
                                            - image (required)
                                - duration (required)
                                - google_cloud (optional, block):
                                    - alert_policy_checks (optional, block):
                                        - alert_policies (required)
                                        - id (required)
                                        - labels (optional)
                            - percentage (required)
                            - phase_id (required)
                            - postdeploy (optional, block):
                                - actions (optional)
                            - predeploy (optional, block):
                                - actions (optional)
                            - profiles (optional)
                            - verify (optional)
                            - verify_config (optional, block):
                                - tasks (optional, block):
                                    - container (optional, block):
                                        - args (optional)
                                        - command (optional)
                                        - env (optional)
                                        - image (required)
                    - runtime_config (optional, block):
                        - cloud_run (optional, block):
                            - automatic_traffic_control (optional)
                            - canary_revision_tags (optional)
                            - prior_revision_tags (optional)
                            - stable_revision_tags (optional)
                        - kubernetes (optional, block):
                            - gateway_service_mesh (optional, block):
                                - deployment (required)
                                - http_route (required)
                                - pod_selector_label (optional)
                                - route_destinations (optional, block):
                                    - destination_ids (required)
                                    - propagate_service (optional)
                                - route_update_wait_time (optional)
                                - service (required)
                                - stable_cutback_duration (optional)
                            - service_networking (optional, block):
                                - deployment (required)
                                - disable_pod_overprovisioning (optional)
                                - pod_selector_label (optional)
                                - service (required)
                - standard (optional, block):
                    - analysis (optional, block):
                        - custom_checks (optional, block):
                            - frequency (optional)
                            - id (required)
                            - task (optional, block):
                                - container (optional, block):
                                    - args (optional)
                                    - command (optional)
                                    - env (optional)
                                    - image (required)
                        - duration (required)
                        - google_cloud (optional, block):
                            - alert_policy_checks (optional, block):
                                - alert_policies (required)
                                - id (required)
                                - labels (optional)
                    - postdeploy (optional, block):
                        - actions (optional)
                        - tasks (optional, block):
                            - container (optional, block):
                                - args (optional)
                                - command (optional)
                                - env (optional)
                                - image (required)
                    - predeploy (optional, block):
                        - actions (optional)
                        - tasks (optional, block):
                            - container (optional, block):
                                - args (optional)
                                - command (optional)
                                - env (optional)
                                - image (required)
                    - verify (optional)
                    - verify_config (optional, block):
                        - tasks (optional, block):
                            - container (optional, block):
                                - args (optional)
                                - command (optional)
                                - env (optional)
                                - image (required)
            - target_id (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    location        = string
    name            = string
    annotations     = optional(map(string))
    deletion_policy = optional(string)
    description     = optional(string)
    labels          = optional(map(string))
    project         = optional(string)
    suspended       = optional(bool)
    serial_pipeline = optional(object({
      stages = optional(list(object({
        deploy_parameters = optional(list(object({
          match_target_labels = optional(map(string))
          values              = map(string)
        })))
        profiles = optional(list(string))
        strategy = optional(object({
          canary = optional(object({
            canary_deployment = optional(object({
              analysis = optional(object({
                custom_checks = optional(list(object({
                  frequency = optional(string)
                  id        = string
                  task = optional(object({
                    container = optional(object({
                      args    = optional(list(string))
                      command = optional(list(string))
                      env     = optional(map(string))
                      image   = string
                    }))
                  }))
                })))
                duration = string
                google_cloud = optional(object({
                  alert_policy_checks = optional(list(object({
                    alert_policies = list(string)
                    id             = string
                    labels         = optional(map(string))
                  })))
                }))
              }))
              percentages = list(number)
              postdeploy = optional(object({
                actions = optional(list(string))
              }))
              predeploy = optional(object({
                actions = optional(list(string))
              }))
              verify = optional(bool)
              verify_config = optional(object({
                tasks = optional(list(object({
                  container = optional(object({
                    args    = optional(list(string))
                    command = optional(list(string))
                    env     = optional(map(string))
                    image   = string
                  }))
                })))
              }))
            }))
            custom_canary_deployment = optional(object({
              phase_configs = list(object({
                analysis = optional(object({
                  custom_checks = optional(list(object({
                    frequency = optional(string)
                    id        = string
                    task = optional(object({
                      container = optional(object({
                        args    = optional(list(string))
                        command = optional(list(string))
                        env     = optional(map(string))
                        image   = string
                      }))
                    }))
                  })))
                  duration = string
                  google_cloud = optional(object({
                    alert_policy_checks = optional(list(object({
                      alert_policies = list(string)
                      id             = string
                      labels         = optional(map(string))
                    })))
                  }))
                }))
                percentage = number
                phase_id   = string
                postdeploy = optional(object({
                  actions = optional(list(string))
                }))
                predeploy = optional(object({
                  actions = optional(list(string))
                }))
                profiles = optional(list(string))
                verify   = optional(bool)
                verify_config = optional(object({
                  tasks = optional(list(object({
                    container = optional(object({
                      args    = optional(list(string))
                      command = optional(list(string))
                      env     = optional(map(string))
                      image   = string
                    }))
                  })))
                }))
              }))
            }))
            runtime_config = optional(object({
              cloud_run = optional(object({
                automatic_traffic_control = optional(bool)
                canary_revision_tags      = optional(list(string))
                prior_revision_tags       = optional(list(string))
                stable_revision_tags      = optional(list(string))
              }))
              kubernetes = optional(object({
                gateway_service_mesh = optional(object({
                  deployment         = string
                  http_route         = string
                  pod_selector_label = optional(string)
                  route_destinations = optional(object({
                    destination_ids   = list(string)
                    propagate_service = optional(bool)
                  }))
                  route_update_wait_time  = optional(string)
                  service                 = string
                  stable_cutback_duration = optional(string)
                }))
                service_networking = optional(object({
                  deployment                   = string
                  disable_pod_overprovisioning = optional(bool)
                  pod_selector_label           = optional(string)
                  service                      = string
                }))
              }))
            }))
          }))
          standard = optional(object({
            analysis = optional(object({
              custom_checks = optional(list(object({
                frequency = optional(string)
                id        = string
                task = optional(object({
                  container = optional(object({
                    args    = optional(list(string))
                    command = optional(list(string))
                    env     = optional(map(string))
                    image   = string
                  }))
                }))
              })))
              duration = string
              google_cloud = optional(object({
                alert_policy_checks = optional(list(object({
                  alert_policies = list(string)
                  id             = string
                  labels         = optional(map(string))
                })))
              }))
            }))
            postdeploy = optional(object({
              actions = optional(list(string))
              tasks = optional(list(object({
                container = optional(object({
                  args    = optional(list(string))
                  command = optional(list(string))
                  env     = optional(map(string))
                  image   = string
                }))
              })))
            }))
            predeploy = optional(object({
              actions = optional(list(string))
              tasks = optional(list(object({
                container = optional(object({
                  args    = optional(list(string))
                  command = optional(list(string))
                  env     = optional(map(string))
                  image   = string
                }))
              })))
            }))
            verify = optional(bool)
            verify_config = optional(object({
              tasks = optional(list(object({
                container = optional(object({
                  args    = optional(list(string))
                  command = optional(list(string))
                  env     = optional(map(string))
                  image   = string
                }))
              })))
            }))
          }))
        }))
        target_id = optional(string)
      })))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.clouddeploy_delivery_pipelines : (
        v.serial_pipeline == null || (v.serial_pipeline.stages == null || alltrue([for item in v.serial_pipeline.stages : (item.strategy == null || (item.strategy.canary == null || (item.strategy.canary.custom_canary_deployment == null || (length(item.strategy.canary.custom_canary_deployment.phase_configs) >= 1))))]))
      )
    ])
    error_message = "Each phase_configs list must contain at least 1 items"
  }
}


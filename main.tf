resource "google_clouddeploy_delivery_pipeline" "clouddeploy_delivery_pipelines" {
  for_each = var.clouddeploy_delivery_pipelines

  location        = each.value.location
  name            = each.value.name
  annotations     = each.value.annotations
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  labels          = each.value.labels
  project         = each.value.project
  suspended       = each.value.suspended

  dynamic "serial_pipeline" {
    for_each = each.value.serial_pipeline != null ? [each.value.serial_pipeline] : []
    content {
      dynamic "stages" {
        for_each = serial_pipeline.value.stages != null ? serial_pipeline.value.stages : []
        content {
          dynamic "deploy_parameters" {
            for_each = stages.value.deploy_parameters != null ? stages.value.deploy_parameters : []
            content {
              match_target_labels = deploy_parameters.value.match_target_labels
              values              = deploy_parameters.value.values
            }
          }
          profiles = stages.value.profiles
          dynamic "strategy" {
            for_each = stages.value.strategy != null ? [stages.value.strategy] : []
            content {
              dynamic "canary" {
                for_each = strategy.value.canary != null ? [strategy.value.canary] : []
                content {
                  dynamic "canary_deployment" {
                    for_each = canary.value.canary_deployment != null ? [canary.value.canary_deployment] : []
                    content {
                      dynamic "analysis" {
                        for_each = canary_deployment.value.analysis != null ? [canary_deployment.value.analysis] : []
                        content {
                          dynamic "custom_checks" {
                            for_each = analysis.value.custom_checks != null ? analysis.value.custom_checks : []
                            content {
                              frequency = custom_checks.value.frequency
                              id        = custom_checks.value.id
                              dynamic "task" {
                                for_each = custom_checks.value.task != null ? [custom_checks.value.task] : []
                                content {
                                  dynamic "container" {
                                    for_each = task.value.container != null ? [task.value.container] : []
                                    content {
                                      args    = container.value.args
                                      command = container.value.command
                                      env     = container.value.env
                                      image   = container.value.image
                                    }
                                  }
                                }
                              }
                            }
                          }
                          duration = analysis.value.duration
                          dynamic "google_cloud" {
                            for_each = analysis.value.google_cloud != null ? [analysis.value.google_cloud] : []
                            content {
                              dynamic "alert_policy_checks" {
                                for_each = google_cloud.value.alert_policy_checks != null ? google_cloud.value.alert_policy_checks : []
                                content {
                                  alert_policies = alert_policy_checks.value.alert_policies
                                  id             = alert_policy_checks.value.id
                                  labels         = alert_policy_checks.value.labels
                                }
                              }
                            }
                          }
                        }
                      }
                      percentages = canary_deployment.value.percentages
                      dynamic "postdeploy" {
                        for_each = canary_deployment.value.postdeploy != null ? [canary_deployment.value.postdeploy] : []
                        content {
                          actions = postdeploy.value.actions
                        }
                      }
                      dynamic "predeploy" {
                        for_each = canary_deployment.value.predeploy != null ? [canary_deployment.value.predeploy] : []
                        content {
                          actions = predeploy.value.actions
                        }
                      }
                      verify = canary_deployment.value.verify
                      dynamic "verify_config" {
                        for_each = canary_deployment.value.verify_config != null ? [canary_deployment.value.verify_config] : []
                        content {
                          dynamic "tasks" {
                            for_each = verify_config.value.tasks != null ? verify_config.value.tasks : []
                            content {
                              dynamic "container" {
                                for_each = tasks.value.container != null ? [tasks.value.container] : []
                                content {
                                  args    = container.value.args
                                  command = container.value.command
                                  env     = container.value.env
                                  image   = container.value.image
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                  dynamic "custom_canary_deployment" {
                    for_each = canary.value.custom_canary_deployment != null ? [canary.value.custom_canary_deployment] : []
                    content {
                      dynamic "phase_configs" {
                        for_each = custom_canary_deployment.value.phase_configs
                        content {
                          dynamic "analysis" {
                            for_each = phase_configs.value.analysis != null ? [phase_configs.value.analysis] : []
                            content {
                              dynamic "custom_checks" {
                                for_each = analysis.value.custom_checks != null ? analysis.value.custom_checks : []
                                content {
                                  frequency = custom_checks.value.frequency
                                  id        = custom_checks.value.id
                                  dynamic "task" {
                                    for_each = custom_checks.value.task != null ? [custom_checks.value.task] : []
                                    content {
                                      dynamic "container" {
                                        for_each = task.value.container != null ? [task.value.container] : []
                                        content {
                                          args    = container.value.args
                                          command = container.value.command
                                          env     = container.value.env
                                          image   = container.value.image
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                              duration = analysis.value.duration
                              dynamic "google_cloud" {
                                for_each = analysis.value.google_cloud != null ? [analysis.value.google_cloud] : []
                                content {
                                  dynamic "alert_policy_checks" {
                                    for_each = google_cloud.value.alert_policy_checks != null ? google_cloud.value.alert_policy_checks : []
                                    content {
                                      alert_policies = alert_policy_checks.value.alert_policies
                                      id             = alert_policy_checks.value.id
                                      labels         = alert_policy_checks.value.labels
                                    }
                                  }
                                }
                              }
                            }
                          }
                          percentage = phase_configs.value.percentage
                          phase_id   = phase_configs.value.phase_id
                          dynamic "postdeploy" {
                            for_each = phase_configs.value.postdeploy != null ? [phase_configs.value.postdeploy] : []
                            content {
                              actions = postdeploy.value.actions
                            }
                          }
                          dynamic "predeploy" {
                            for_each = phase_configs.value.predeploy != null ? [phase_configs.value.predeploy] : []
                            content {
                              actions = predeploy.value.actions
                            }
                          }
                          profiles = phase_configs.value.profiles
                          verify   = phase_configs.value.verify
                          dynamic "verify_config" {
                            for_each = phase_configs.value.verify_config != null ? [phase_configs.value.verify_config] : []
                            content {
                              dynamic "tasks" {
                                for_each = verify_config.value.tasks != null ? verify_config.value.tasks : []
                                content {
                                  dynamic "container" {
                                    for_each = tasks.value.container != null ? [tasks.value.container] : []
                                    content {
                                      args    = container.value.args
                                      command = container.value.command
                                      env     = container.value.env
                                      image   = container.value.image
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                  dynamic "runtime_config" {
                    for_each = canary.value.runtime_config != null ? [canary.value.runtime_config] : []
                    content {
                      dynamic "cloud_run" {
                        for_each = runtime_config.value.cloud_run != null ? [runtime_config.value.cloud_run] : []
                        content {
                          automatic_traffic_control = cloud_run.value.automatic_traffic_control
                          canary_revision_tags      = cloud_run.value.canary_revision_tags
                          prior_revision_tags       = cloud_run.value.prior_revision_tags
                          stable_revision_tags      = cloud_run.value.stable_revision_tags
                        }
                      }
                      dynamic "kubernetes" {
                        for_each = runtime_config.value.kubernetes != null ? [runtime_config.value.kubernetes] : []
                        content {
                          dynamic "gateway_service_mesh" {
                            for_each = kubernetes.value.gateway_service_mesh != null ? [kubernetes.value.gateway_service_mesh] : []
                            content {
                              deployment         = gateway_service_mesh.value.deployment
                              http_route         = gateway_service_mesh.value.http_route
                              pod_selector_label = gateway_service_mesh.value.pod_selector_label
                              dynamic "route_destinations" {
                                for_each = gateway_service_mesh.value.route_destinations != null ? [gateway_service_mesh.value.route_destinations] : []
                                content {
                                  destination_ids   = route_destinations.value.destination_ids
                                  propagate_service = route_destinations.value.propagate_service
                                }
                              }
                              route_update_wait_time  = gateway_service_mesh.value.route_update_wait_time
                              service                 = gateway_service_mesh.value.service
                              stable_cutback_duration = gateway_service_mesh.value.stable_cutback_duration
                            }
                          }
                          dynamic "service_networking" {
                            for_each = kubernetes.value.service_networking != null ? [kubernetes.value.service_networking] : []
                            content {
                              deployment                   = service_networking.value.deployment
                              disable_pod_overprovisioning = service_networking.value.disable_pod_overprovisioning
                              pod_selector_label           = service_networking.value.pod_selector_label
                              service                      = service_networking.value.service
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              dynamic "standard" {
                for_each = strategy.value.standard != null ? [strategy.value.standard] : []
                content {
                  dynamic "analysis" {
                    for_each = standard.value.analysis != null ? [standard.value.analysis] : []
                    content {
                      dynamic "custom_checks" {
                        for_each = analysis.value.custom_checks != null ? analysis.value.custom_checks : []
                        content {
                          frequency = custom_checks.value.frequency
                          id        = custom_checks.value.id
                          dynamic "task" {
                            for_each = custom_checks.value.task != null ? [custom_checks.value.task] : []
                            content {
                              dynamic "container" {
                                for_each = task.value.container != null ? [task.value.container] : []
                                content {
                                  args    = container.value.args
                                  command = container.value.command
                                  env     = container.value.env
                                  image   = container.value.image
                                }
                              }
                            }
                          }
                        }
                      }
                      duration = analysis.value.duration
                      dynamic "google_cloud" {
                        for_each = analysis.value.google_cloud != null ? [analysis.value.google_cloud] : []
                        content {
                          dynamic "alert_policy_checks" {
                            for_each = google_cloud.value.alert_policy_checks != null ? google_cloud.value.alert_policy_checks : []
                            content {
                              alert_policies = alert_policy_checks.value.alert_policies
                              id             = alert_policy_checks.value.id
                              labels         = alert_policy_checks.value.labels
                            }
                          }
                        }
                      }
                    }
                  }
                  dynamic "postdeploy" {
                    for_each = standard.value.postdeploy != null ? [standard.value.postdeploy] : []
                    content {
                      actions = postdeploy.value.actions
                      dynamic "tasks" {
                        for_each = postdeploy.value.tasks != null ? postdeploy.value.tasks : []
                        content {
                          dynamic "container" {
                            for_each = tasks.value.container != null ? [tasks.value.container] : []
                            content {
                              args    = container.value.args
                              command = container.value.command
                              env     = container.value.env
                              image   = container.value.image
                            }
                          }
                        }
                      }
                    }
                  }
                  dynamic "predeploy" {
                    for_each = standard.value.predeploy != null ? [standard.value.predeploy] : []
                    content {
                      actions = predeploy.value.actions
                      dynamic "tasks" {
                        for_each = predeploy.value.tasks != null ? predeploy.value.tasks : []
                        content {
                          dynamic "container" {
                            for_each = tasks.value.container != null ? [tasks.value.container] : []
                            content {
                              args    = container.value.args
                              command = container.value.command
                              env     = container.value.env
                              image   = container.value.image
                            }
                          }
                        }
                      }
                    }
                  }
                  verify = standard.value.verify
                  dynamic "verify_config" {
                    for_each = standard.value.verify_config != null ? [standard.value.verify_config] : []
                    content {
                      dynamic "tasks" {
                        for_each = verify_config.value.tasks != null ? verify_config.value.tasks : []
                        content {
                          dynamic "container" {
                            for_each = tasks.value.container != null ? [tasks.value.container] : []
                            content {
                              args    = container.value.args
                              command = container.value.command
                              env     = container.value.env
                              image   = container.value.image
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          target_id = stages.value.target_id
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}


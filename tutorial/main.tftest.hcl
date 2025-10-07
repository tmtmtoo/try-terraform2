run "test_input_container_name" {
    command = plan
    variables {
      container_name = "FooBar"
    }

    assert {
      condition = docker_container.nginx.name == "FooBar"
      error_message = "fuck"
    }
}

run "test_default_container_name" {
  command = plan

  assert {
    condition = docker_container.nginx.name == "ExampleContainer"
    error_message = "fuck"
  }
}

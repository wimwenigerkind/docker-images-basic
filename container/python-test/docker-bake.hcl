variable "NAME" {
  default = "python-test"
}

variable "VERSION" {
  default = "1.0.0"
}

group "default" {
  targets = ["matrix"]
}

target "default" {
  platforms = []
}

target "matrix" {
  name       = "python${replace(item.python, ".", "")}-test"
  dockerfile = "Dockerfile"
  context    = "container/python-test"

  matrix = {
    item = [
      { python = "3.12" },
      { python = "3.13" }
    ]
  }

  args = {
    PYTHON_VERSION = item.python
  }

  tags = [
    "${REGISTRY}/${REGISTRY_USER}/${NAME}:py${replace(item.python, ".", "")}-${VERSION}",
    "${REGISTRY}/${REGISTRY_USER}/${NAME}:py${replace(item.python, ".", "")}-latest"
  ]
}
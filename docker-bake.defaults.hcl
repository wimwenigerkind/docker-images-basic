variable "REGISTRY" {
  validation {
    condition     = REGISTRY != ""
    error_message = "The variable 'REGISTRY' must not be empty"
  }
}

variable "REGISTRY_USER" {
  validation {
    condition     = REGISTRY_USER != ""
    error_message = "The variable 'REGISTRY_USER' must not be empty"
  }
}

variable "NAME" {
  validation {
    condition     = NAME != ""
    error_message = "The variable 'NAME' must not be empty"
  }
}

variable "VERSION" {
  default = "latest"
}

target "default" {
  dockerfile = "Dockerfile"
  context    = "container/${NAME}"
  tags = [
    "${REGISTRY}/${REGISTRY_USER}/${NAME}:${VERSION}",
    "${REGISTRY}/${REGISTRY_USER}/${NAME}:latest"
  ]
}

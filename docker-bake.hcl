group "default" {
  targets = ["apk", "rpm", "deb"]
}

variable "TAG" {default="" }

target "apk" {
  dockerfile = "Dockerfile.apk"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = [
    "ghcr.io/gh-org-template/kong-build-images:apk",
    notequal("",TAG) ? "ghcr.io/gh-org-template/kong-build-images:apk-${TAG}": ""
  ]
}

target "rpm" {
  dockerfile = "Dockerfile.rpm"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = [
    "ghcr.io/gh-org-template/kong-build-images:rpm",
    notequal("",TAG) ? "ghcr.io/gh-org-template/kong-build-images:rpm-${TAG}": ""
  ]
}

target "deb" {
  dockerfile = "Dockerfile.deb"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = [    "ghcr.io/gh-org-template/kong-build-images:deb",
    notequal("",TAG) ? "ghcr.io/gh-org-template/kong-build-images:deb-${TAG}": ""
  ]
}

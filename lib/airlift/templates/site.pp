import "manifests/*.pp"

node default {
  hiera_include("puppet_classes")
}

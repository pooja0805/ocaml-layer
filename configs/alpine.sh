#
# Configuration for creating a dockerfile, building the docker image, and
# for pushing it to a docker registry.
#

# Inherit common settings.
. ./common-config.sh

# The OS family. Determines which collection of install scripts to use.
# Currently, choices are 'alpine' or 'ubuntu'.
os="alpine"

# The argument of the FROM line in the dockerfile. This is the docker
# URL of the base image, optionally followed by more things.
# Only pin to minor version, not patch to ensure rebuilds pull in security fixes
from="alpine:3.18"

# This is the argument of 'docker pull', 'docker push', etc. for the image
# we are building.
docker_url="returntocorp/ocaml:alpine"
extra_docker_urls=("$docker_url-$date")

# User to create and use. If it already exists, we'll try to use it.
#
# We now use 'root' at r2c to avoid permission complications in GitHub
# Actions. This is a widespread practice for other languages (Rust, Go, ...)
user="root"

# Extra packages to be installed by the native package manager.
extra_packages="$extra_apk_packages"

# Opam switch to use. This determines the OCaml version and a set of
# configuration options.

opam_switch="4.14.0"

# The collection of opam packages we want to install. Go wild.
opam_packages="$opam_packages"

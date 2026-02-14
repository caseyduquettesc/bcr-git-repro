FROM --platform=linux/arm64 debian:bookworm AS root_img

RUN apt-get update --fix-missing
RUN apt-get upgrade -y

FROM root_img

# build-essential for C toolchain, curl+ca-certificates to fetch bazelisk
# Deliberately NO zlib1g-dev
RUN apt-get install -y build-essential curl ca-certificates python3

# Install bazelisk as "bzl"
RUN curl -fSL https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-arm64 \
    -o /usr/local/bin/bzl && chmod +x /usr/local/bin/bzl

WORKDIR /workspace
COPY .bazelversion MODULE.bazel BUILD.bazel ./

# Build git — expected to fail with missing zlib.h
CMD ["bzl", "build", "@git//:git", "--verbose_failures"]

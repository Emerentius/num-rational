#!/bin/bash

set -ex

echo Testing num-rational on rustc ${TRAVIS_RUST_VERSION}

# num-rational should build and test everywhere.
cargo build --verbose
cargo test --verbose

# It should build with minimal features too.
cargo build --no-default-features
cargo test --no-default-features

# Each isolated feature should also work everywhere.
for feature in bigint serde std; do
  cargo build --verbose --no-default-features --features="$feature"
  cargo test --verbose --no-default-features --features="$feature"
done

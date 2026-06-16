#!/bin/bash

build_generator() {
    docker build -f Dockerfile.generator -t generator .
}
run_generator() {
    docker run --rm -v $(pwd)/data:/data generator
}
create_local_data() {
    python generator/generate.py local_data/
}
build_reporter() {
    docker build -f Dockerfile.reporter -t reporter .
}
run_reporter() {
    docker run --rm -v $(pwd)/data:/data reporter
}
structure() {
    find . -type f -not -path "./.git/*" | head -20
}
clear_data() {
    rm -f data/*.csv data/*.html
}
inside_generator() {
    docker run --rm -v $(pwd)/data:/data generator ls -la /data
}
inside_reporter() {
    docker run --rm -v $(pwd)/data:/data reporter ls -la /data
}

$@
# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

# Copy the local package files to the container's workspace.
ADD . /knative-build

# Move into the directory with our code and build it
WORKDIR /knative-build
RUN go build 

# Run our application by default when the container starts.
ENTRYPOINT ./knative-build

# Document that the service listens on port 8080.
EXPOSE 8080
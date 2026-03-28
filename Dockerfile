FROM alpine:latest
RUN echo "Hello from Jenkins CI/CD Pipeline!" > /hello.txt
CMD ["cat", "/hello.txt"]

FROM alpine as builder
WORKDIR /app
COPY . .
RUN make

FROM alpine
COPY --from=builder /app/src/dnsproxy /usr/sbin/dnsproxy
CMD ["dnsproxy", "-f", "/etc/hosts"]

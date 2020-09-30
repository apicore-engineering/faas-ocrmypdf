FROM openfaas/classic-watchdog:0.18.8 as watchdog

FROM jbarlow83/ocrmypdf

COPY --from=watchdog /fwatchdog /usr/bin/fwatchdog
RUN chmod +x /usr/bin/fwatchdog

ENV fprocess "/usr/local/bin/ocrmypdf -l eng - -"
ENV combine_output false
ENV write_timeout 60
ENV read_timeout 60
ENV exec_timeout 60

EXPOSE 8080
ENTRYPOINT ["/usr/bin/fwatchdog"]

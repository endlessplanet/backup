FROM docker:17.09.0
COPY root /opt/docker/
RUN ["sh", "/opt/docker/scripts/run.sh"]
USER user
ENTRYPOINT ["sh", "/opt/scripts/docker/entrypoint.sh"]
CMD []
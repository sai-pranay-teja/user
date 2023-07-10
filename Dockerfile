FROM node
RUN mkdir /app
WORKDIR /app
COPY server.js .
COPY node_modules/ node_modules/
RUN           curl -s -L https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem -o /app/rds-combined-ca-bundle.pem
COPY docker/run.sh .
ENTRYPOINT [ "bash", "run.sh" ]
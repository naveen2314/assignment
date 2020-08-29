FROM python:3.8-alpine

WORKDIR /carta/devops
ENV PATH="/carta/devops:${PATH}"

COPY . .
RUN mv secret.txt /var/secret.txt
RUN pip install -r requirements.txt

EXPOSE 5000
CMD [ "carta-devops" , "serve"]
#ENTRYPOINT [ "carta-devops" , "serve" ]

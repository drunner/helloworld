# A simple hello world example!

FROM alpine
MAINTAINER j842

RUN apk --no-cache add bash

# add in the assets.
ADD ["./usrlocalbin","/usr/local/bin"]
RUN chmod a+rx -R /usr/local/bin

# A simple hello world example!

FROM drunner/baseimage-alpine
MAINTAINER j842

# add in the assets.
ADD ["./drunner","/drunner"]
ADD ["./usrlocalbin","/usr/local/bin"]
RUN chmod a+rx -R /usr/local/bin  &&  chmod a-w -R /drunner

# lock in druser.
USER druser

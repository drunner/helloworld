# A simple hello world example!

   # - debian
   #FROM debian
# - alpine
FROM alpine

MAINTAINER j842

# we use non-root user in the container for security.
# dr expects uid 22022 and gid 22022.
   # - debian
   #RUN groupadd -g 22022 drgroup
   #RUN adduser --disabled-password --gecos '' -u 22022 --gid 22022 druser
# - alpine
RUN apk add --update bash && rm -rf /var/cache/apk/*
RUN addgroup -S -g 22022 drgroup
RUN adduser -S -u 22022 -G drgroup -g '' druser

# create the key folders and allow druser access.
RUN mkdir /dr /config && chown druser:drgroup /dr /config

# add in the assets.
ADD ["./dr","/dr"]
ADD ["./usrlocalbin","/usr/local/bin"]
RUN chown -R druser:drgroup /dr /usr/local/bin && chmod a-w -R /dr

# lock in druser.
USER druser

# expose volume
VOLUME ["/config"]

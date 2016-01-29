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

# add in the assets.
ADD ["./dr","/dr"]
RUN chown -R druser:drgroup /dr

# lock in druser.
USER druser

# get bin files into path for easy acccess
echo "PATH=$PATH:/dr/bin" >> $HOME/.bash_profile

# expose volume
VOLUME ["/dr/config"]

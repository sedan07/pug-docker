FROM sedan07/pug-puppet-base

COPY launch.sh /usr/local/bin/launch.sh
RUN chmod +x /usr/local/bin/launch.sh

COPY csr_attributes.yaml /etc/puppet/csr_attributes.yaml

RUN mkdir /etc/facter/facts.d -p

EXPOSE :80

CMD ["/usr/local/bin/launch.sh"]

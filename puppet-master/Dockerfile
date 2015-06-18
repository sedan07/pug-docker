FROM sedan07/pug-puppet-base

RUN puppet module install Aethylred-puppet
RUN puppet module install puppetlabs-apache

COPY puppetmaster.pp /tmp/puppetmaster.pp
RUN puppet apply --modulepath /etc/puppet/modules/ /tmp/puppetmaster.pp

COPY launch.sh /usr/local/bin/launch.sh
RUN chmod +x /usr/local/bin/launch.sh

COPY puppet_autosign.rb /usr/local/bin/puppet_autosign.rb
RUN chmod +x /usr/local/bin/puppet_autosign.rb

RUN mkdir -p /etc/puppet/environments/production

# Adding this hack so we can have the Hiera data
# and puppet manifests in one repo to keep things simple
RUN sed -i 's/\/environments2/\/environments/' /etc/puppet/hiera.yaml

EXPOSE :8140

VOLUME /etc/puppet/environments

CMD ["/usr/local/bin/launch.sh"]

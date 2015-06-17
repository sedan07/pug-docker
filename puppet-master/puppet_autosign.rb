#!/usr/bin/ruby
 
require 'openssl'
require 'logger'
logger = Logger.new('/tmp/autosign.log')
 
def parse_extensions(extension_request)
  extension_request_hash = {}
  extension_request.each do |extension|
    extension_request_hash[extension.value[0].value] = extension.value[1].value
  end 
  return extension_request_hash
end

ARGV.shift
$csr = ARGF.read
$extensions_hash = {}
$password = ''
request = OpenSSL::X509::Request.new $csr

logger.info request.subject
request.attributes.each do |attribute|
  attr = OpenSSL::X509::Attribute.new attribute
  if attribute.oid == 'extReq'
    $extensions_hash = parse_extensions(attr.value.value.first.value)
  else
    $password = attribute.value.first.value
  end 
end

logger.info $extensions_hash
if $password == 'a_secret'
  logger.info "Approved"
  exit 0
end

logger.info "Denied"
exit 1

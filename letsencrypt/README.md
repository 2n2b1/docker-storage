# Let's Encrypt Certificate Manager

### About
The Let's Encrypt Certificate Manager obtains a free (SAN) SSL Certificate from the [Let's Encrypt CA](https://letsencrypt.org/) and adds it to the certificate store. Once the certificate is created it is scheduled for automatic renewal 20-days before expiration. 

#### HTTP

If you prefer not to use a DNS-based challenge or your provider is not supported, you can use the HTTP challenge.
Simply choose `HTTP` from the list of providers.
Then make sure that HTTP requests to `domain.com/.well-known/acme-challenge` are forwarded to port 80 of the `letsencrypt` service, e.g. by configuring a load balancer accordingly. Make sure the reverse proxy passes the original `host` header to the backend.

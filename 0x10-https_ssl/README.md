## HTTPS SSL

### Learning Outcomes
- What is HTTPS SSL 2 main roles
- What is the purpose encrypting traffic
- What SSL termination means

### Resources
* [What is HTTPS?](https://www.instantssl.com/http-vs-https)
* [What are the 2 main elements that SSL is providing](https://www.sslshopper.com/why-ssl-the-purpose-of-using-ssl-certificates.html)
* [HAProxy SSL termination on Ubuntu16.04](https://docs.ionos.com/cloud)
* [SSL termination](https://en.wikipedia.org/wiki/TLS_termination_proxy)
* [Bash function](https://tldp.org/LDP/abs/html/complexfunct.html)
* [How To Use Certbot Standalone Mode to Retrieve Let's Encrypt SSL Certificates on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-use-certbot-standalone-mode-to-retrieve-let-s-encrypt-ssl-certificates-on-ubuntu-20-04)

- `Simple hack: On the process of installing certbot, temporarily stop your_service(e.g haproxy) from listening to port 80`
- openssl dhparam -out /etc/haproxy/dhparam.pem 2048 - when configuring HAproxy
- Add settings: tune.ssl.default-dh-param 2048 to global section in haproxy configuration file

For additional Knowledge:
- [How To Secure Nginx with Let's Encrypt on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04)

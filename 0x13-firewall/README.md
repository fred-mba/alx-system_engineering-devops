## Firewall
### Resources

- [What is a firewall](https://en.wikipedia.org/wiki/Firewall_%28computing%29)
- Enabling port forwarding: `iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 8080 -j REDIRECT --to-port 80`
- Disabling port forwarding: `iptables -t nat -D PREROUTING 1`

FROM pihole/pihole:v5.6

COPY dnsmasq.d/ /etc/dnsmasq.d/

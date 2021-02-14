[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

> :warning: The setup is very very very experimental and not stable at all.

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <img src="https://pi-hole.net/wp-content/uploads/2018/12/pihole-text-logo-white.png.webp" alt="Logo" height="60">

  <h3 align="center">pi-hole</h3>

  <p align="center">
    Docker setup for pi-hole
    <br />
    <br />
    ·
    <a href="https://github.com/beuluis/pi-hole/issues">Report Bug</a>
    ·
    <a href="https://github.com/beuluis/pi-hole/issues">Request Feature</a>
  </p>
</p>

<!-- ABOUT THE PROJECT -->

## About The Project

Small docker setup for pi-hole.

<!-- GETTING STARTED -->

## Getting Started Develop

To get a local copy up and running follow these simple steps.

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Installation

1. Clone the repo

```sh
git clone https://github.com/beuluis/pi-hole.git
```

2. Start docker-compose

```sh
docker-compose up --build
```

3. Overwrite all variables marked under Customization as required

4. Change your DNS settings

### Customization

1. Create a `.env` file

```sh
touch .env
```

2. Overwrite variables as you like (format: `{variable name}={variable value}`)

| Variable               | Description                                                                                                                                                                                                                                                                                                                                                                                        | Default value                          | Required                 |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- | ------------------------ |
| `PH_TZ`                | Set an administrative contact address for the Block Page                                                                                                                                                                                                                                                                                                                                           | `Europe/Berlin`                        | false                    |
| `PH_ADMIN_EMAIL`       | Set your [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) to make sure logs rotate at local midnight instead of at UTC midnight.                                                                                                                                                                                                                                           | none                                   | true                     |
| `PH_DNS1`              | Primary upstream DNS provider, default is google DNS                                                                                                                                                                                                                                                                                                                                               | `8.8.8.8`                              | false                    |
| `PH_DNS2`              | Secondary upstream DNS provider, default is google DNS, no if only one DNS should used                                                                                                                                                                                                                                                                                                             | `8.8.4.4`                              | false                    |
| `PH_DNSSEC`            | Enable DNSSEC support                                                                                                                                                                                                                                                                                                                                                                              | `true`                                 | false                    |
| `PH_DNS_BOGUS_PRIV`    | Enable forwarding of reverse lookups for private ranges                                                                                                                                                                                                                                                                                                                                            | `true`                                 | false                    |
| `PH_DNS_FQDN_REQUIRED` | Never forward non-FQDNs                                                                                                                                                                                                                                                                                                                                                                            | `false`                                | false                    |
| `PH_REV_SERVER`        | Enable DNS conditional forwarding for device name resolution                                                                                                                                                                                                                                                                                                                                       | none                                   | false                    |
| `PH_REV_SERVER_DOMAIN` | If conditional forwarding is enabled, set the domain of the local network router                                                                                                                                                                                                                                                                                                                   | none                                   | false                    |
| `PH_REV_SERVER_TARGET` | If conditional forwarding is enabled, set the IP of the local network router                                                                                                                                                                                                                                                                                                                       | none                                   | false                    |
| `PH_REV_SERVER_CIDR`   | If conditional forwarding is enabled, set the reverse DNS zone (e.g. 192.168.0.0/24)                                                                                                                                                                                                                                                                                                               | none                                   | false                    |
| `PH_SERVER_IP`         | --net=host mode requires Set to your server's LAN IP, used by web block modes and lighttpd bind address                                                                                                                                                                                                                                                                                            | none                                   | true or PH_SERVER_IPV6   |
| `PH_SERVER_IPV6`       | If you have a v6 network set to your server's LAN IPv6 to block IPv6 ads fully                                                                                                                                                                                                                                                                                                                     | none                                   | true or PH_SERVER_IP     |
| `PH_VIRTUAL_HOST`      | What your web server 'virtual host' is, accessing admin through this Hostname/IP allows you to make changes to the whitelist / blacklists in addition to the default 'http://pi.hole/admin/' address                                                                                                                                                                                               | none                                   | false                    |
| `PH_IPV6`              | For unraid compatibility, strips out all the IPv6 configuration from DNS/Web services when false.                                                                                                                                                                                                                                                                                                  | `true`                                 | false                    |
| `PH_INTERFACE`         | The default works fine with our basic example docker run commands. If you're trying to use DHCP with --net host mode then you may have to customize this or DNSMASQ_LISTENING.                                                                                                                                                                                                                     | none                                   | false                    |
| `PH_DNSMASQ_LISTENING` | local listens on all local subnets, all permits listening on internet origin subnets in addition to local.                                                                                                                                                                                                                                                                                         | none                                   | false                    |
| `PH_WEB_PORT`          | This will break the 'webpage blocked' functionality of Pi-hole however it may help advanced setups like those running synology or --net=host docker argument. This guide explains how to restore webpage blocked functionality using a linux router DNAT rule: [Alternative Synology installation method] (https://discourse.pi-hole.net/t/alternative-synology-installation-method/5454?u=diginc) | none                                   | false                    |
| `PH_DNSMASQ_USER`      | Allows running FTLDNS as non-root.                                                                                                                                                                                                                                                                                                                                                                 | `root`                                 | false                    |
| `PH_TEMPERATUREUNIT`   | Set preferred temperature unit to c: Celsius, k: Kelvin, or f Fahrenheit units.                                                                                                                                                                                                                                                                                                                    | `c`                                    | false                    |
| `PH_WEBUIBOXEDLAYOUT`  | Use boxed layout (helpful when working on large screens)                                                                                                                                                                                                                                                                                                                                           | `boxed`                                | false                    |
| `PH_SKIPGRAVITYONBOOT` | Use this option to skip updating the Gravity Database when booting up the container. By default this environment variable is not set so the Gravity Database will be updated when the container starts up. Setting this environment variable to 1 (or anything) will cause the Gravity Database to not be updated when container starts up.                                                        | none                                   | false                    |
| `PH_WEBPASSWORD`       | http://pi.hole/admin password. Run `docker logs pihole | grep random` to find your random pass.                                                                                                                                                                                                                                                                                                    | `28TjoNC4N0pTbahcquS7TS`               | false                    |
[Additional documentation from pi-hole](https://hub.docker.com/r/pihole/pihole#note-on-capabilities)

## Getting Started Production

To get a copy up and running follow these simple steps.

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Installation

1. Clone the repo

```sh
git clone https://github.com/beuluis/pi-hole.git --branch master
```

2. Create a `.env.prod` file

```sh
touch .env.prod
```

3. Overwrite all variables marked under Customization as required
4. Start docker-compose

```sh
docker-compose --env-file ./.env.prod -f docker-compose.yml -f docker-compose.production.yml up -d
```

5. Change your DNS settings

### Customization

1. Create a `.env.prod` file

```sh
touch .env.prod
```

2. Overwrite variables as you like (format: `{variable name}={variable value}`)

| Variable               | Description                                                                                                                                                                                                                                                                                                                                                                                        | Default value                          | Required                 |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- | ------------------------ |
| `PH_TZ`                | Set an administrative contact address for the Block Page                                                                                                                                                                                                                                                                                                                                           | `Europe/Berlin`                        | false                    |
| `PH_ADMIN_EMAIL`       | Set your [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) to make sure logs rotate at local midnight instead of at UTC midnight.                                                                                                                                                                                                                                           | none                                   | true                     |
| `PH_DNS1`              | Primary upstream DNS provider, default is google DNS                                                                                                                                                                                                                                                                                                                                               | `8.8.8.8`                              | false                    |
| `PH_DNS2`              | Secondary upstream DNS provider, default is google DNS, no if only one DNS should used                                                                                                                                                                                                                                                                                                             | `8.8.4.4`                              | false                    |
| `PH_DNSSEC`            | Enable DNSSEC support                                                                                                                                                                                                                                                                                                                                                                              | `true`                                 | false                    |
| `PH_DNS_BOGUS_PRIV`    | Enable forwarding of reverse lookups for private ranges                                                                                                                                                                                                                                                                                                                                            | `true`                                 | false                    |
| `PH_DNS_FQDN_REQUIRED` | Never forward non-FQDNs                                                                                                                                                                                                                                                                                                                                                                            | `false`                                | false                    |
| `PH_REV_SERVER`        | Enable DNS conditional forwarding for device name resolution                                                                                                                                                                                                                                                                                                                                       | none                                   | false                    |
| `PH_REV_SERVER_DOMAIN` | If conditional forwarding is enabled, set the domain of the local network router                                                                                                                                                                                                                                                                                                                   | none                                   | false                    |
| `PH_REV_SERVER_TARGET` | If conditional forwarding is enabled, set the IP of the local network router                                                                                                                                                                                                                                                                                                                       | none                                   | false                    |
| `PH_REV_SERVER_CIDR`   | If conditional forwarding is enabled, set the reverse DNS zone (e.g. 192.168.0.0/24)                                                                                                                                                                                                                                                                                                               | none                                   | false                    |
| `PH_SERVER_IP`         | --net=host mode requires Set to your server's LAN IP, used by web block modes and lighttpd bind address                                                                                                                                                                                                                                                                                            | none                                   | true or PH_SERVER_IPV6   |
| `PH_SERVER_IPV6`       | If you have a v6 network set to your server's LAN IPv6 to block IPv6 ads fully                                                                                                                                                                                                                                                                                                                     | none                                   | true or PH_SERVER_IP     |
| `PH_VIRTUAL_HOST`      | What your web server 'virtual host' is, accessing admin through this Hostname/IP allows you to make changes to the whitelist / blacklists in addition to the default 'http://pi.hole/admin/' address                                                                                                                                                                                               | none                                   | false                    |
| `PH_IPV6`              | For unraid compatibility, strips out all the IPv6 configuration from DNS/Web services when false.                                                                                                                                                                                                                                                                                                  | `true`                                 | false                    |
| `PH_INTERFACE`         | The default works fine with our basic example docker run commands. If you're trying to use DHCP with --net host mode then you may have to customize this or DNSMASQ_LISTENING.                                                                                                                                                                                                                     | none                                   | false                    |
| `PH_DNSMASQ_LISTENING` | local listens on all local subnets, all permits listening on internet origin subnets in addition to local.                                                                                                                                                                                                                                                                                         | none                                   | false                    |
| `PH_WEB_PORT`          | This will break the 'webpage blocked' functionality of Pi-hole however it may help advanced setups like those running synology or --net=host docker argument. This guide explains how to restore webpage blocked functionality using a linux router DNAT rule: [Alternative Synology installation method] (https://discourse.pi-hole.net/t/alternative-synology-installation-method/5454?u=diginc) | none                                   | false                    |
| `PH_DNSMASQ_USER`      | Allows running FTLDNS as non-root.                                                                                                                                                                                                                                                                                                                                                                 | `root`                                 | false                    |
| `PH_TEMPERATUREUNIT`   | Set preferred temperature unit to c: Celsius, k: Kelvin, or f Fahrenheit units.                                                                                                                                                                                                                                                                                                                    | `c`                                    | false                    |
| `PH_WEBUIBOXEDLAYOUT`  | Use boxed layout (helpful when working on large screens)                                                                                                                                                                                                                                                                                                                                           | `boxed`                                | false                    |
| `PH_SKIPGRAVITYONBOOT` | Use this option to skip updating the Gravity Database when booting up the container. By default this environment variable is not set so the Gravity Database will be updated when the container starts up. Setting this environment variable to 1 (or anything) will cause the Gravity Database to not be updated when container starts up.                                                        | none                                   | false                    |
| `PH_WEBPASSWORD`       | http://pi.hole/admin password. Run `docker logs pihole | grep random` to find your random pass.                                                                                                                                                                                                                                                                                                    | none                                   | true                    |
[Additional documentation from pi-hole](https://hub.docker.com/r/pihole/pihole#note-on-capabilities)

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- CONTACT -->

## Contact

Luis Beu - me@luisbeu.de

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/beuluis/pi-hole.svg?style=flat-square
[contributors-url]: https://github.com/beuluis/pi-hole/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/beuluis/pi-hole.svg?style=flat-square
[forks-url]: https://github.com/beuluis/pi-hole/network/members
[stars-shield]: https://img.shields.io/github/stars/beuluis/pi-hole.svg?style=flat-square
[stars-url]: https://github.com/beuluis/pi-hole/stargazers
[issues-shield]: https://img.shields.io/github/issues/beuluis/pi-hole.svg?style=flat-square
[issues-url]: https://github.com/beuluis/pi-hole/issues
[license-shield]: https://img.shields.io/github/license/beuluis/pi-hole.svg?style=flat-square

# Hyperion

[![License Apache 2][badge-license]][LICENSE][]
![Version][badge-release]

## Description

[hyperion][] creates a Cloud environment :

- Applications managment is performed using [Rancher][] (UI available on *8080*)

## Rancher


## Local

Initialize environment:

    $ make machine

Install Rancher :

	$ make configure
	$ eval "$(docker-machine env hyperion-rancher)"
	$ make rancher

Check Docker containers :

	$ make info
	192.168.99.101
	CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                              NAMES
	12a0f66fb3f9        rancher/server      "/usr/bin/s6-svscan /"   3 minutes ago       Up 3 minutes        3306/tcp, 0.0.0.0:8080->8080/tcp   cocky_meninsky

	$ docker logs -f 12a0f66fb3f9

Then go to the Rancher UI on : `192.168.99.101:8080`


## Cloud

The Rancher UI is available on : `x.x.x.x:8080`

### Images

Read guides to creates the machine for a cloud provider :

* [Google cloud](https://github.com/portefaix/hyperion-rancher/blob/packer/google/README.md)
* [AWS](https://github.com/portefaix/hyperion-rancher/blob/packer/ec2/README.md)
* [Digitalocean](https://github.com/portefaix/hyperion-rancher/blob/packer/digitalocean/README.md)


### Infratructure

Read guides to creates the infrastructure :

* [Google cloud](https://github.com/portefaix/hyperion-rancher/blob/infra/google/README.md)
* [AWS](https://github.com/portefaix/hyperion-rancher/blob/infra/aws/README.md)
* [Digitalocean](https://github.com/portefaix/hyperion-rancher/blob/infra/digitalocean/README.md)
* [Openstack](https://github.com/portefaix/hyperion-rancher/blob/infra/openstack/README.md)


## Contributing

See [CONTRIBUTING](CONTRIBUTING.md).


## License

See [LICENSE][] for the complete license.


## Changelog

A [changelog](ChangeLog.md) is available


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>


[hyperion]: https://github.com/portefaix/hyperion-rancher
[LICENSE]: https://github.com/portefaix/hyperion-rancher/blob/master/LICENSE
[Issue tracker]: https://github.com/portefaix/hyperion-rancher/issues

[virtualbox]: https://www.virtualbox.org/

[badge-license]: https://img.shields.io/badge/license-Apache_2-green.svg
[badge-release]: https://img.shields.io/github/release/portefaix/hyperion-rancher.svg

[Rancher]: http://rancher.com/rancher/
[RancherOS]: http://rancher.com/rancher-os/

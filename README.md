[![Build Status](https://drone.io/github.com/benschw/consul-clb-go/status.png)](https://drone.io/github.com/benschw/consul-clb-go/latest)
[![GoDoc](http://godoc.org/github.com/benschw/consul-clb-go?status.png)](http://godoc.org/github.com/benschw/consul-clb-go)

# Consul Client Load Balancer for Go Demo

- download `demo` service here: https://github.com/benschw/consul-clb-go/releases/tag/v0.1.0
- blog post outlining the demo: http://txt.fliglio.com/2014/05/encapsulated-services-with-consul-and-confd/


Selects a `SRV` record answer according to specified load balancer algorithm, then resolves its `A` record to an ip, and returns an `Address` structure:

	type Address struct {
		Address string
		Port    uint16
	}

## Notes for Consul / Confd Cluster Demo

Version 0.1.0 contains the `demo` service used in my blog post outlining how to use Consul for service discovery and configuration management while using Confd and DNS to keep your applications decoupled from the specifics of Consul.

- download `demo` service here: https://github.com/benschw/consul-clb-go/releases/tag/v0.1.0
- blog post outlining the demo: http://txt.fliglio.com/2014/05/encapsulated-services-with-consul-and-confd/



## Example:
	

	srvName := "my-svc.service.consul"
	c := clb.NewClb("127.0.0.1", "8600", clb.RoundRobin)
	address, err := c.GetAddress(srvName)
	if err != nil {
		panic(err)
	}

	fmt.Printf("%s", address.String())
	// Output: 0.1.2.3:8001

## Development
tests are run against some fixture dns entries I set up on fliglio.com (`dig foo.service.fliglio.com SRV`).


- `make deps` install deps
- `make test` run all tests

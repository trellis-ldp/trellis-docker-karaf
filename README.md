# Trellis

Repository software that implements the [Fedora API](http://fedora.info/spec/).

## Goals

  * Horizontally scalable
  * Fast
  * Modular
  * Light-weight

## Implementation status

The code currently consists of the following elements:

### Core abstractions

  * [trellis-api](https://github.com/trellis-ldp/trellis-api): The core API abstractions
  * [trellis-spi](https://github.com/trellis-ldp/trellis-spi): The service abstractions
  * [trellis-vocabulary](https://github.com/trellis-ldp/trellis-vocabulary): The core RDF vocabularies in use
  * [trellis-ontology](https://github.com/trellis-ldp/trellis-ontology): The Trellis ontology definitions

### Service implementations

Each of these implements a different service in the `trellis-spi` module. These can be swapped out for different implementations as needed.

  * [trellis-agent](https://github.com/trellis-ldp/trellis-agent): A service for managing user roles
  * [trellis-amqp](https://github.com/trellis-ldp/trellis-amqp): An AMQP-based event publisher (e.g. for [RabbitMQ](https://www.rabbitmq.com) or [Qpid](https://qpid.apache.org))
  * [trellis-constraint-rules](https://github.com/trellis-ldp/trellis-constraint-rules): Rules defining the constraints on the RDF that can be accepted by the server
  * [trellis-datastream](https://github.com/trellis-ldp/trellis-datastream): A datastream storage and retrieval service
  * [trellis-id](https://github.com/trellis-ldp/trellis-id): An ID generation service
  * [trellis-io-jena](https://github.com/trellis-ldp/trellis-io-jena): A Jena-based I/O service
  * [trellis-jms](https://github.com/trellis-ldp/trellis-jms): A JMS-based event publisher (e.g. for [ActiveMQ](https://activemq.apache.org))
  * [trellis-namespaces](https://github.com/trellis-ldp/trellis-namespaces): A namespace service using JSON files for persistence
  * [trellis-webac](https://github.com/trellis-ldp/trellis-webac): An authorization layer

### In progress

 * Core (distributed) implementation -- for creating, deleting, updating and fetching resources, based on [RDF-Patch](https://afs.github.io/rdf-patch/) and an asynchronous Kafka event bus
 * Pluggable data storage layer, targeting [HBase](https://hbase.apache.org/) (for high performance, distributed scenarios) and a File-based structure (for simpler deployments).
 * LDP Paging support
 * HTTP layer -- this is slated to be implemented with [dropwizard.io](http://dropwizard.io)
 * Cloud-based datastream resolver based on [jclouds](https://jclouds.apache.org/)
 * HTML UI based on [LDPath Templates](http://marmotta.apache.org/ldpath/template.html)

## Main dependencies

  * [Commons-RDF](https://commons.apache.org/proper/commons-rdf/) -- for RDF abstractions
  * [Jena](https://jena.apache.org/) -- for RDF I/O processing
  * [Jackson](https://github.com/FasterXML/jackson) -- for JSON parsing
  * [Jersey](https://jersey.java.net/) -- for HTTP handling
  * [Zookeeper](https://zookeeper.apache.org/) -- for distributed coordination
  * [Kafka](https://kafka.apache.org/) -- for event handling and stream processing
  * [HDFS](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/HdfsUserGuide.html) (optional) -- for distributed data storage

## Deployment

 * The plan is to support container-less (e.g. Docker) and OSGi (e.g. Karaf) deployment options.

## Building

 * All projects are written in Java and/or Clojure and require at least Java 8. All projects can be built with Gradle.


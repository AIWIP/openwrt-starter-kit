
## Guiding Principles

- The software should be portable and concerns seperated so that a change of hardware or
  technology for the frontend won't effect the whole stack.

In order to help acheive these we divide each section of this module into 4 layers (HNCF) similar to MVC for application development. each piece of fuctionality is devided up into each layer and determines how we implement it.

### Hardware Layer

Anything tied to the hardware of the device is implemented in the hardware layer. This codebase primarily
focuses on the Native Layer upwards, so any tweaks required for a specific device (i.e exposing new interface / wifi card configuration) should be baked into the configuration of the OpenWRT firmware when it is built.

### Native Layer

Any native compiled code belongs in the Native Layer, software in this layer needs direct access to functionality
such as Sockets or are performance sensitive.

Building software for the Native Layer is made difficult by the fact OpenWRT provides it's own toolchain
for building native code (i.e C/C++), there are various system requirements and platform differences
which can cause a barrier for entry.

Ideally when using the Native Layer we will use pre-existing packages where possible (i.e OpenVPN),
not only will these provide greater support from OpenWRT but they exist on many other Linux Distro.

If any tweaks need to be made we favour forking and commiting back into these tools and as a last resport
building our own.

### Configuration Layer

Most of our code will live in this layer, the Configuration Layer consists of scripts used to setup and
configure the device.

Each script should try to do one thing and one thing well. In our module we use scripts as an easy way to interface with services on the device and setup things such as OpenVPN and Firewalls.

Since they are just scripts they are mostly portable, supported in almost every environment and have almost
no dependencies. By keeping all of our logic in scripts we can easily change the code, technology or hardware with
minimal re-compilation or dependencies.

### Frontend Layer

This is what our Users will see when navigating to your device in their browser. This layer
provides an easy to use UI which allows them to interact with the scripts in the Configuration Layer.

This layer should be as stateless as possible with all logic belonging to the Configuration Layer. This
simplifies development and removes any dependencies on the frontend technology for the logic.
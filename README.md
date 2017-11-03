# OpenWRT/LEDE Starter Kit

This Starter Kit is designed to help other companies build and configure their own distribution of OpenwWRT/LEDE for their own IOT device.

This project will create custom image to flash on your device as well as a custom
package containing your software for distribution.

## Customizing 

### Platforms

To begin building your own customizations, first ensure the platform you are
targeting exists in the `platforms` folder.

If it doesn't create a new `.mk` file with the name of that platform. The starter kit
already has an example for the x86 architecture.

Read this example to learn what options are avaliable.

### Global

Alot of the global settings such as version number, author and shared OpenWRT/LEDE 
congiurations are specified in the manifest file which is located in the `manifest.mk` file.

### Image

To customize your image place files you want to end up on the final device in the `images/src/` folder.

Any file in this location will be placed in the `/` location. We already have two
files in the starter kit to give you an idea of what you can include including an
example on how to customize the ssh banner.

### Package

To customize your image place files you want to end up in the final package in the `package/src/` folder.

You can customize various elements of the pakcage including how files should be 
installed onto the device via the `package/Makefile` file

## Building

Before you can start developing you will need to build an image for vagrant to run in a virtual machine.
To do this just run `./scripts/build platform/x86` to build the image followed by `./scripts/create-vm` to create start the virtual machine.

Running in a Virtual Machine should make it easier to iterate however we are unable to
accuratley simulate the printer or bluetooth so when developing those features,
it should still be done on the device.

When developing on the device, copy the `my-package-<version>.ipk` file to the device via `scp` and finally run `opkg install <path to ipk>` on the router to install the package.

When you are preparing for production simply run `./scripts/build platform/<name of platform>` and after a few hours you should have a image you can flash onto a router.

If you want to publish a new version of a package for Over The Air updates for existing
routers then simply run `./scripts/publish-feed`

## Guiding Principles

The software should be portable and concerns seperated so that a change of hardware or
technology for the frontend won't effect the whole stack.

In order to help this we divide each section of this module into 4 layers (HNCF) similar to MVC for application development. each piece of fuctionality is devided up into each layer and determines how we implement it.

We reccomened you take this apporach when building your IOT software

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

Each script should try to do one thing and one thing well. For example you can use scripts as an easy way to interface with services on the device and setup things such as OpenVPN and Firewalls.

Since they are just scripts they are mostly portabld and  supported in almost every environment. By keeping all of our logic in scripts we can easily change the code, technology or hardware with
minimal re-compilation or dependencies.

### Frontend Layer

This is what your Users will see when navigating to your device in their browser. This layer
provides an easy to use UI which allows them to interact with the scripts in the Configuration Layer.

This layer should be as stateless as possible with all logic belonging to the Configuration Layer. This
simplifies development and removes any dependencies on the frontend technology for the logic.

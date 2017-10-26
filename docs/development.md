# Development 

Before you can start developing you will need to build an image for vagrant to run in a virtual machine.
To do this just run `./scripts/build platform/x86` to build the image followed by `./scripts/create-vm` to create start the virtual machine.

Running in a Virtual Machine should make it easier to iterate however we are unable to
accuratley simulate the printer or bluetooth so when developing those features,
it should still be done on the device.

When developing on the device, copy the `my-package-<version>.ipk` file to the device via `scp` and finally run `opkg install <path to ipk>` on the router to install the package.

When you are preparing for production simply run `./scripts/build platform/<architecture of device>` and after a few hours you should have a image you can flash onto a router.

If you want to publish a new version of a package for Over The Air updates for existing
routers then simply run `./scripts/publish-feed`
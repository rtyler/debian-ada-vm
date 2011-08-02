# Debian Ada VM


### About

This is a little project to create a stable, distributable base virtual machine
that has a great Ada development environment bundled into it.


### Getting Started

We use [Vagrant](http://vagrantup.com) to develop and test these manifests and
as such there is a `Vagrantfile` already in the root directory. If you don't
already have Vagrant:

    % sudo gem install vagrant

Once you have vagrant you should be able to execute the following command to
bring up a virtual machine and provision it:

    % vagrant up

For development, you can just create your manifests and include them in
`manifests/vagrant.pp`, once you're ready to re-run the puppet manifests you
can run the following command (no need to rebuild the VM):

    % vagrant provision


### Getting Help

If you have any questions, stop by the `#ada` channel on the
[Freenode](http://freenode.net) network and ask
[rtyler](http://github.com/rtyler/).


#User Profile Module

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with User Profile](#setup)
    * [What User Profile affects](#what-[modulename]-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with User Profile](#beginning-with-User Profile)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)

##Overview
 
  This module is designed to work with parameters to let you manage a user profile in linux using Puppet 2.7.x. 

##Module Description

  This module is used to manage a user's linux profile. This will manage dependent configurations for other tools.
 
  We will be managing:
    VIM, BASH, GIT, AUTHORIZED KEYS

##Setup

###What User Profile affects

  * A list of files, packages, services, or operations that the module will alter, impact, or execute on the system it's installed on.
  * This is a great place to stick any warnings.
  * Can be in list or paragraph form. 

###Setup Requirements **OPTIONAL**

  If your module requires anything extra before setting up (pluginsync enabled, etc.), mention it here. 
    
###Beginning with User Profile  

  The very basic steps needed for a user to get the module up and running. 

  If your most recent release breaks compatibility or requires particular steps for upgrading, you may wish to include an additional section here: Upgrading (For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

##Usage

  Put the classes, types, and resources for customizing, configuring, and doing the fancy stuff with your module here. 

##Reference

  Here, list the classes, types, providers, facts, etc contained in your module. This section should include all of the under-the-hood workings of your module so people know what the module is touching on their system but don't need to mess with things. (We are working on automating this section!)

##Limitations

  This is where you list OS compatibility, version compatibility, etc.

##Development

  Since your module is awesome, other users will want to play with it. Let them know what the ground rules for contributing are.

##Release Notes/Contributors/Etc **Optional**

  If you aren't using changelog, put your release notes here (though you should consider using changelog). You may also add any additional sections you feel are necessary or important to include here. Please use the `## ` header. 

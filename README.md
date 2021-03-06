# xtoo-overlay
[![License](https://img.shields.io/badge/license-GPLv2-9977bb.svg?style=plastic)](https://github.com/Obsidian-StudiosInc/os-xtoo/blob/master/LICENSE)
[![Build Status](https://img.shields.io/travis/Obsidian-StudiosInc/os-xtoo/master.svg?colorA=9977bb&style=plastic)](https://travis-ci.org/Obsidian-StudiosInc/os-xtoo)
[![Build Status](https://img.shields.io/shippable/5840e5d8e2ab4d0f0058b4b7/master.svg?colorA=9977bb&style=plastic)](https://app.shippable.com/projects/5840e5d8e2ab4d0f0058b4b7/)

Obsidian-Studios, Inc. funtoo/gentoo overlay (a.k.a wltjr's overlay)
Making Gentoo Java Great Again!

Things that could and should be in Gentoo but are not.

Go GENTOO! :-1:

## About
This overlay mostly contains Java related ebuilds. Most of the 
ebuilds are not in tree, but some are corrections, newer versions 
and/or slot changes. Initial support for Java 9, JDK only at this time. 

Effort will be made to keep packages in this overlay up to date. All 
ebuilds in this overlay should be production quality and many are used 
in production, though some are not. Contributions are welcome!

## Arch
This repo is primarily amd64, no other archs are supported or tested, 
but can be added upon request.

## Credits and Copyright
Original ebuilds in this overlay are Copyright Obsidian-Studios, Inc. 
They can be used else where, but the copyright must be respected and 
preserved. It can be relocated, and/or credit mentioned to original 
source, such as

```shell
# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#
# Original work Copyright 2016 Obsidian-Studios, Inc.
# Ebuild written by "William L. Thomson Jr." <wlt@o-sinc.com>
# <link to ebuild in this repo>
```

## Process

Ebuilds in this overlay are a constant work in progress. They are added 
via the following process.

1. Ensure it builds and merges
  1. Ensure dependencies can build and merge against package
2. Ensure it runs and is usable, add missing files, set version, etc
3. Dial in package to meet upstream package

All ebuilds in this overlay meet at least step 1, and 1a. Step 2 is 
done when the package is used directly as a libary in a project and/or 
via an existing application that uses it directly. Step 3 is a 
finalization step.

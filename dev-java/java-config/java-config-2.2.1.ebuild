# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/java-config/java-config-2.2.0.ebuild,v 1.14 2015/05/04 07:00:08 ago Exp $

EAPI="5"

# jython depends on java-config, so don't add it or things will break
#PYTHON_COMPAT=( python{2_7,3_3,3_4} )

#inherit distutils-r1

DESCRIPTION="Java environment configuration query tool (meta package installs nothing)"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Java"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS=""
IUSE=""

# baselayout-java is added as a dep till it can be added to eclass.
#	>=dev-java/java-config-wrapper-0.15
#	sys-apps/baselayout-java
RDEPEND="sys-apps/portage"

#python_test() {
#	esetup.py test || die
#}

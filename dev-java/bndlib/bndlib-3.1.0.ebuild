# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A swiss army knife for OSGi"
HOMEPAGE="http://www.aqute.biz/Bnd/Bnd"
SRC_URI="https://github.com/bndtools/bnd/archive/${PV}.REL.tar.gz -> bnd-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64 ~x86"

OSGI_SLOT="5"

CDEPEND="dev-java/libg:3
	dev-java/osgi-annotation:0
	dev-java/osgi-compendium:${OSGI_SLOT}
	dev-java/osgi-core-api:${OSGI_SLOT}
	dev-java/osgi-ds:0
	dev-java/osgi-util:0"

DEPEND=">=virtual/jdk-1.8
	${CDEPEND}"

RDEPEND=">=virtual/jre-1.8
	${CDEPEND}"

S="${WORKDIR}/bnd-${PV}.REL/biz.aQute.${PN}"

# Do not change order, osgi-ds MUST come before others
JAVA_GENTOO_CLASSPATH="
	libg-${SLOT}
	osgi-annotation
	osgi-ds
	osgi-compendium-${OSGI_SLOT}
	osgi-core-api-${OSGI_SLOT}
	osgi-util
"
JAVA_SRC_DIR="src/"

java_prepare() {
	java-pkg_clean

#	if ! use test ; then
		rm -rf test* || die "Failed to remove tests."
#	fi
}


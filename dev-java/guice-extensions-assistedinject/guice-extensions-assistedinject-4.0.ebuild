# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

JAVA_PKG_IUSE="source"

inherit java-pkg-2 java-pkg-simple

MY_PN="guice"

DESCRIPTION="Guice extensions assisted inject"
HOMEPAGE="https://github.com/google/${MY_PN}/"
SRC_URI="https://github.com/google/${MY_PN}/archive/${PV}.zip -> ${MY_PN}-${PV}.zip"

LICENSE="Apache-2.0"
SLOT="4"
KEYWORDS="~amd64 ~x86"

IUSE=""

CDEPEND="dev-java/guava:18
	dev-java/guice:${SLOT}
	dev-java/javax-inject:0"

RDEPEND=">=virtual/jre-1.7
	${CDEPEND}"

DEPEND=">=virtual/jdk-1.7
	${CDEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}/extensions/assistedinject"

JAVA_SRC_DIR="src/"

JAVA_GENTOO_CLASSPATH="
	guava-18
	guice-${SLOT}
	javax-inject
"

java_prepare() {
	java-pkg_clean
}

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Service Platform Core API (Companion Code)"
HOMEPAGE="http://www.osgi.org/Specifications/HomePage"
# Broken URL :(
#SRC_URI="http://www.osgi.org/download/r$(get_major_version)/${PN/-/.}-${PV}.jar"
# Backup also :(
SRC_URI="http://central.maven.org/maven2/org/osgi/org.${PN/-/.}/${PV}/org.${PN/-/.}-${PV}.jar -> ${PN/-/.}-${PV}.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/jre-1.7"

DEPEND=">=virtual/jdk-1.7
	app-arch/unzip"

JAVA_SRC_DIR="OSGI-OPT/src"

java_prepare() {
	rm -r org || die
}

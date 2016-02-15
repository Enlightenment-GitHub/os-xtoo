# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Service Platform Enterprise API (Companion Code)"
HOMEPAGE="http://www.osgi.org/Specifications/HomePage"
SRC_URI="http://www.osgi.org/download/r$(get_major_version)/osgi.enterprise-${PV}.jar"

LICENSE="Apache-2.0"
SLOT="6"
KEYWORDS="~amd64 ~x86"
IUSE=""

CDEPEND="dev-java/glassfish-persistence:0
	dev-java/osgi-annotation:0
	dev-java/osgi-core-api:${SLOT}
	java-virtuals/servlet-api:4.0"

RDEPEND="${CDEPEND}
	>=virtual/jre-1.7"

DEPEND="${CDEPEND}
	>=virtual/jdk-1.7
	app-arch/unzip"

JAVA_GENTOO_CLASSPATH="
	glassfish-persistence
	osgi-annotation
	osgi-core-api-6
	servlet-api-4.0
"
JAVA_SRC_DIR="OSGI-OPT/src"

java_prepare() {
	rm -r org || die
}

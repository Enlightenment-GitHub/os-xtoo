# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Service Platform Compendium API (Companion Code)"
HOMEPAGE="https://www.osgi.org/developer/specifications/"
SRC_URI="https://osgi.org/download/r$(get_major_version)/osgi.cmpn-${PV}.jar"

LICENSE="Apache-2.0 OSGi-Specification-2.0"
SLOT="6"
KEYWORDS="~amd64 ~x86"

CP_DEPEND="dev-java/glassfish-persistence:0
	dev-java/osgi-annotation:0
	dev-java/osgi-core-api:${SLOT}
	dev-java/osgi-foundation:0
	java-virtuals/servlet-api:4.0"

DEPEND="app-arch/unzip:0
	${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

JAVA_SRC_DIR="OSGI-OPT/src"

java_prepare() {
	rm -r org || die
}

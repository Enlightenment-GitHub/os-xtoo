# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Core Annotation Code"
HOMEPAGE="https://www.osgi.org/Specifications/HomePage"
# Broken URL :(
#SRC_URI="https://www.osgi.org/download/r$(get_major_version)/${PN/-/.}-${PV}.jar"
# Backup also :(
SRC_URI="https://central.maven.org/maven2/org/osgi/org.${PN/-/.}/${PV}/org.${PN/-/.}-${PV}.jar -> ${PN/-/.}-${PV}.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-arch/unzip:0
	>=virtual/jdk-1.8"

RDEPEND=">=virtual/jre-1.8"

JAVA_SRC_DIR="OSGI-OPT/src"

java_prepare() {
	rm -r org || die
}

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Service Platform Core API (Companion Code)"
HOMEPAGE="http://www.osgi.org/Specifications/HomePage"
SRC_URI="https://www.osgi.org/download/r$(get_major_version)/osgi.core-${PV}.jar"

LICENSE="Apache-2.0"
SLOT="5"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/unzip:0
	>=virtual/jdk-1.8"

RDEPEND=">=virtual/jre-1.8"

JAVA_SRC_DIR="OSGI-OPT/src"

java_prepare() {
	rm -r org || die
}

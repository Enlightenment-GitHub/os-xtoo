# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="HTTP client that's efficient by default"
HOMEPAGE="http://square.github.io/okhttp/"
SRC_URI="https://github.com/square/${PN}/archive/parent-${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"

CP_DEPEND="
	dev-java/android-util:0
	dev-java/okio:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${P/${PN}/${PN}-parent}/${PN}"

JAVA_SRC_DIR="
	src/main/java
	src/main/java-templates
"

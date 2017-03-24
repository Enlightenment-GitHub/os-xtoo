# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"
JAVA_NO_COMMONS=1

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Flexible generator for barcodes written in Java"
HOMEPAGE="https://${PN}.sourceforge.net"
SRC_URI="https://repo1.maven.org/maven2/net/sf/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE="Apache-2.0"
KEYWORDS="~amd64"
SLOT="0"

CP_DEPEND="
	dev-java/ant-core:0
	dev-java/avalon-framework:4.2
	dev-java/commons-cli:1
	java-virtuals/servlet-api:4.0
"

DEPEND="app-arch/unzip
	${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

JAVA_ENCODING="ISO-8859-1"

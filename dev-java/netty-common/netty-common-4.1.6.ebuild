# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="netty"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Netty Common"
HOMEPAGE="http://${MY_PN}.io/"
SRC_URI="https://github.com/${MY_PN}/${MY_PN}/archive/${MY_P}.Final.tar.gz"
LICENSE="Apache-2.0"
KEYWORDS="~amd64"
SLOT="$(get_version_component_range 1-2)"

CP_DEPEND="
	dev-java/commons-logging:0
	dev-java/javassist:3
	dev-java/jctools-core:0
	dev-java/log4j:0
	dev-java/log4j-api:0
	dev-java/slf4j-api:0
"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8
"

S="${WORKDIR}/${MY_PN}-${MY_P}.Final/${PN/${MY_PN}-}"

JAVA_SRC_DIR="src/main/java"

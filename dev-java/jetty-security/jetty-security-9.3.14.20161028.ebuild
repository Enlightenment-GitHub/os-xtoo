# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jetty's security"

MY_PN="jetty"
MY_PV="${PV/2016/v2016}"
MY_P="${MY_PN}-${MY_PV}"

SLOT="$(get_version_component_range 1-2)"
SRC_URI="https://github.com/eclipse/${MY_PN}.project/archive/${MY_P}.tar.gz"
HOMEPAGE="https://eclipse.org/jetty/"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"

CP_DEPEND="~dev-java/jetty-http-${PV}:${SLOT}
	~dev-java/jetty-server-${PV}:${SLOT}
	~dev-java/jetty-util-${PV}:${SLOT}
	java-virtuals/servlet-api:4.0"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

S="${WORKDIR}/${MY_PN}.project-${MY_P}/${PN}/"

JAVA_SRC_DIR="src/main/java"

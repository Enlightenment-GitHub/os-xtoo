# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jetty's Webapp"

MY_PN="jetty"
MY_PV="${PV/2016/v2016}"
MY_P="${MY_PN}-${MY_PV}"

SLOT="$(get_version_component_range 1-2)"
SRC_URI="https://github.com/eclipse/${MY_PN}.project/archive/${MY_P}.zip"
HOMEPAGE="http://www.eclipse.org/${MY_PN}/"
KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"
IUSE=""

CP_DEPEND="dev-java/jetty-http:${SLOT}
	dev-java/jetty-security:${SLOT}
	dev-java/jetty-server:${SLOT}
	dev-java/jetty-servlet:${SLOT}
	dev-java/jetty-util:${SLOT}
	dev-java/jetty-xml:${SLOT}
	java-virtuals/servlet-api:4.0"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

S="${WORKDIR}/${MY_PN}.project-${MY_P}/${PN}/"

JAVA_SRC_DIR="src/main/java"

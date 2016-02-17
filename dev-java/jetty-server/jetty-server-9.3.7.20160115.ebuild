# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_USE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jetty's server API (not the server itself)"

MY_PN="jetty"
MY_PV="${PV/2016/v2016}"
MY_P="${MY_PN}-${MY_PV}"

SLOT="$(get_version_component_range 1-2)"
SRC_URI="https://github.com/eclipse/${MY_PN}.project/archive/${MY_P}.zip"
HOMEPAGE="http://www.eclipse.org/${MY_PN}/documentation/current/alpn-chapter.html"
KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"
IUSE=""

CDEPEND="dev-java/jetty-http:${SLOT}
	dev-java/jetty-io:${SLOT}
	dev-java/jetty-jmx:${SLOT}
	dev-java/jetty-util:${SLOT}
	java-virtuals/servlet-api:3.1"
# Fails to build with 4.0 :(

RDEPEND="${CDEPEND}
	>=virtual/jre-1.8"

DEPEND="${CDEPEND}
	>=virtual/jdk-1.8"

S="${WORKDIR}/${MY_PN}.project-${MY_P}/${PN}/"

JAVA_GENTOO_CLASSPATH="
	jetty-http-${SLOT}
	jetty-io-${SLOT}
	jetty-jmx-${SLOT}
	jetty-util-${SLOT}
	servlet-api-3.1
"
JAVA_SRC_DIR="src/main/java"

java_prepare() {
	java-pkg_clean
}

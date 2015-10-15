# Copyright 2015 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

JAVA_PKG_USE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jetty's ALPN implementation"

MY_PN="jetty"
MY_PV="${PV/2015/v2015}"
MY_P="${MY_PN}-${MY_PV}"

SLOT="$(get_version_component_range 1-2)"
SRC_URI="https://github.com/eclipse/${MY_PN}.project/archive/${MY_P}.zip"
HOMEPAGE="http://www.eclipse.org/${MY_PN}/documentation/current/alpn-chapter.html"
KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"
IUSE=""

CDEPEND="dev-java/jetty-alpn-api:0
	dev-java/jetty-io:${SLOT}
	dev-java/jetty-util:${SLOT}"
#	dev-java/jetty-server:${SLOT}

RDEPEND="${CDEPEND}
	>=virtual/jre-1.8"

DEPEND="${CDEPEND}
	>=virtual/jdk-1.8"

S="${WORKDIR}/${MY_PN}.project-${MY_P}/${PN/-client/}"

#JAVA_GENTOO_CLASSPATH="jetty-alpn-api,jetty-io-${SLOT},jetty-server-${SLOT},jetty-util-${SLOT}"
JAVA_GENTOO_CLASSPATH="jetty-alpn-api,jetty-io-${SLOT},jetty-util-${SLOT}"
JAVA_SRC_DIR="${PN}/src/main/java"

java_prepare() {
	java-pkg_clean
}

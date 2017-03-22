# Copyright 2016-2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="${PN//-/.}"
MY_PN="${MY_PN/n.a/n-a}"
MY_PV="${PV/_beta/-b0}"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="Java Transaction API"
HOMEPAGE="https://java.net/projects/jta-spec/"
SRC_URI="https://central.maven.org/maven2/${PN:0:5}/${PN:6:11}/${MY_PN}/${MY_PV}/${MY_P}-sources.jar"

LICENSE="CDDL GPL-2-with-classpath-exception"
KEYWORDS="~amd64"
SLOT="$(get_version_component_range 1-2)"

CP_DEPEND="
	dev-java/cdi-api:0
	dev-java/glassfish-interceptor-api:0
"

DEPEND="app-arch/unzip
	${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

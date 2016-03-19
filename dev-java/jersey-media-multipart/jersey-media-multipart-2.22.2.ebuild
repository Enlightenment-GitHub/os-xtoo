# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="${PN:0:6}"
#MY_P="${MY_PN}-${PV}"

DESCRIPTION="Jersey RESTful Web Services in Java Media Multipart"
HOMEPAGE="https://${MY_PN}.java.net/"
SRC_URI="http://central.maven.org/maven2/org/glassfish/${MY_PN}/${PN:7:5}/${PN}/${PV}/${P}-sources.jar"
# Missing org.glassfish.jersey.media.multipart.internal.LocalizationMessages
#SRC_URI="https://github.com/${MY_PN}/${MY_PN}/archive/2.22.2.zip -> ${MY_P}.zip"

LICENSE="CDDL GPL-2-with-linking-exception"
SLOT="2"
KEYWORDS="~amd64 ~x86"

CP_DEPEND="dev-java/glassfish-hk2-api:0
	dev-java/javax-inject:0
	dev-java/jax-rs:2
	~dev-java/jersey-core-common-${PV}:${SLOT}
	~dev-java/jersey-core-server-${PV}:${SLOT}
	~dev-java/jersey-guava-${PV}:${SLOT}
	dev-java/mimepull:0"

DEPEND="app-arch/unzip:0
	${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

# Used with sources from github
#S="${WORKDIR}/${MY_P}/media/multipart"

#JAVA_SRC_DIR="src/main/java"
#JAVA_ADDRES_DIRS="src/main/resources"

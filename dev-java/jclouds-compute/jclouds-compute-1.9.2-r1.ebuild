# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="${PN:0:7}"
MY_PV="${PV/_/-}"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="JClouds Compute"
SLOT="0"
SRC_URI="https://github.com/${MY_PN}/${MY_PN}/archive/rel/${MY_P}.tar.gz"
HOMEPAGE="https://jclouds.apache.org/"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"

GUICE_SLOT="4"

CP_DEPEND="
	dev-java/auto-service:0
	dev-java/guava:20
	dev-java/guice:${GUICE_SLOT}
	dev-java/guice-extensions-assistedinject:${GUICE_SLOT}
	~dev-java/jclouds-core-${PV}:${SLOT}
	~dev-java/jclouds-scriptbuilder-${PV}:${SLOT}
	dev-java/javax-inject:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_PN}-rel-${MY_P}/${PN:8}"

JAVA_SRC_DIR="src/main/java"

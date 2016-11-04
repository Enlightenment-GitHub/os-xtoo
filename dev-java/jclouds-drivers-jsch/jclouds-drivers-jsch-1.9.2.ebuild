# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="jclouds"
MY_PV="${PV/_/-}"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="JClouds Driver for sshj"
SLOT="0"
SRC_URI="https://github.com/${MY_PN}/${MY_PN}/archive/rel/${MY_P}.tar.gz"
HOMEPAGE="https://jclouds.apache.org/"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"

CP_DEPEND="
	dev-java/guava:20
	dev-java/guice:4
	dev-java/javax-inject:0
	~dev-java/jclouds-core-${PV}:${SLOT}
	~dev-java/jclouds-compute-${PV}:${SLOT}
	dev-java/jsch:0
	dev-java/jsch-agent-proxy-core:0
	dev-java/jsch-agent-proxy-connector-factory:0
	dev-java/jsch-agent-proxy-jsch:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_PN}-rel-${MY_P}/drivers/jsch"

JAVA_SRC_DIR="src/main/java"

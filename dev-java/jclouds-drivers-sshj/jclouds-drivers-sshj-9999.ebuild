# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="${PN:0:7}"
MY_PV="${PV/_/-}"
MY_P="${MY_PN}-${MY_PV}"

BASE_URI="https://github.com/${MY_PN}/${MY_PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
else
	SRC_URI="${BASE_URI}/archive/rel/${MY_P}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="JClouds Driver for sshj"
HOMEPAGE="https://jclouds.apache.org/"
LICENSE="Apache-2.0"
SLOT="0"

CP_DEPEND="
	dev-java/guava:20
	dev-java/guice:4
	dev-java/javax-inject:0
	~dev-java/jclouds-compute-${PV}:${SLOT}
	~dev-java/jclouds-core-${PV}:${SLOT}
	dev-java/jsch:0
	dev-java/jsch-agent-proxy-core:0
	dev-java/jsch-agent-proxy-connector-factory:0
	dev-java/jsch-agent-proxy-sshj:0
	dev-java/sshj:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

if [[ ${PV} == 9999 ]]; then
	S="${WORKDIR}/${P}/drivers/sshj"
else
	S="${WORKDIR}/${MY_PN}-rel-${MY_P}/drivers/sshj"
fi

JAVA_SRC_DIR="src/main/java"

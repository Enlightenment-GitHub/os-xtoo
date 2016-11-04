# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="${PN:0:16}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A proxy to ssh-agent and Pageant in Java"
HOMEPAGE="https://github.com/ymnk/${MY_PN}"
KEYWORDS="~amd64"
LICENSE="BSD-3-clause"
SLOT="0"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${MY_P}.tar.gz"

CP_DEPEND="
	dev-java/jna:4
	~dev-java/jsch-agent-proxy-core-${PV}:${SLOT}
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_P}/${PN}"

JAVA_SRC_DIR="src/main/java"

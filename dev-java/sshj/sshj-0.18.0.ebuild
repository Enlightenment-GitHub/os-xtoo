# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="SSHv2 library ssh, scp, and sftp for java"
SLOT="0"
HOMEPAGE="https://github.com/hierynomus/${PN}"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"

CP_DEPEND="
	dev-java/bcpkix:1.52
	dev-java/bcprov:1.54
	dev-java/ed25519-java:0
	dev-java/jzlib:1.1.3
	dev-java/slf4j-api:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${P}"

JAVA_SRC_DIR="src/main/java"

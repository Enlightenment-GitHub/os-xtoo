# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="aQute Repository"
HOMEPAGE="http://www.aqute.biz/Bnd/Bnd"
SRC_URI="https://github.com/bndtools/bnd/archive/${PV}.REL.tar.gz -> bnd-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64 ~x86"

JETTY_SLOT="9.3"

CP_DEPEND="dev-java/aqute-jpm-clnt:0
	dev-java/aqute-services-services:0
	dev-java/aqute-services-struct:0
	~dev-java/bndlib-${PV}:${SLOT}
	~dev-java/libg-${PV}:${SLOT}
	dev-java/osgi-compendium:5
	dev-java/osgi-core-api:5
	dev-java/osgi-impl-bundle-bindex:0
	dev-java/osgi-impl-bundle-repoindex-api:${SLOT}
	dev-java/osgi-impl-bundle-repoindex-lib:${SLOT}
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.7"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.7"

S="${WORKDIR}/bnd-${PV}.REL/biz.aQute.repository"

JAVA_SRC_DIR="src/"

java_prepare() {
	rm -rf src/test* || die "Failed to remove tests."
}

# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Bundle Repository Indexer lib"
HOMEPAGE="http://www.aqute.biz/Bnd/Bnd"
SRC_URI="https://github.com/bndtools/bnd/archive/${PV}.REL.tar.gz -> bnd-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64 ~x86"

CP_DEPEND="dev-java/osgi-compendium:4
	dev-java/osgi-core-api:4
	dev-java/osgi-impl-bundle-repoindex-api:${SLOT}"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/bnd-${PV}.REL/org.${PN//-/.}"

JAVA_SRC_DIR="src/"

java_prepare() {
	rm -rf test* || die "Failed to remove tests."
}

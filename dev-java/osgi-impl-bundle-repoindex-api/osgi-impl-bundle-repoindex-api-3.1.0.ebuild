# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Bundle Repository Indexer API"
HOMEPAGE="http://www.aqute.biz/Bnd/Bnd"
SRC_URI="https://github.com/bndtools/bnd/archive/${PV}.REL.tar.gz -> bnd-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64 ~x86"

CP_DEPEND="dev-java/bndlib:${SLOT}"

DEPEND=">=virtual/jdk-1.8
	${CP_DEPEND}"

RDEPEND=">=virtual/jre-1.8
	${CP_DEPEND}"

S="${WORKDIR}/bnd-${PV}.REL/org.${PN//-/.}"

JAVA_SRC_DIR="src/"

java_prepare() {
	java-pkg_clean
}


# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

BASE_URI="https://github.com/bndtools/bnd"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	MY_S="${P}"
else
	SRC_URI="${BASE_URI}/archive/${PV}.REL.tar.gz -> bnd-${PV}.tar.gz"
	KEYWORDS="~amd64"
	MY_S="bnd-${PV}.REL"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="OSGi Bundle Repository Indexer cli"
HOMEPAGE="https://www.aqute.biz/Bnd/Bnd"
LICENSE="Apache-2.0"
SLOT="3"

CP_DEPEND="
	dev-java/args4j:2
	dev-java/osgi-compendium:4
	dev-java/osgi-core-api:4
	~dev-java/osgi-impl-bundle-repoindex-api-${PV}:${SLOT}
	~dev-java/osgi-impl-bundle-repoindex-lib-${PV}:${SLOT}
	dev-java/pojosr-framework:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_S}/org.${PN//-/.}"

JAVA_SRC_DIR="src/"

java_prepare() {
	rm -rf test* || die "Failed to remove tests."
}

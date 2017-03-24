# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="source"

BASE_URI="https://github.com/bndtools/bnd"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
else
	SRC_URI="${BASE_URI}/archive/${PV}.REL.tar.gz -> bnd-${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="Lots of small utilities for bnd, a swiss army knife for OSGi"
HOMEPAGE="https://www.aqute.biz/Bnd/Bnd"
LICENSE="Apache-2.0"
SLOT="3"

CP_DEPEND="
	dev-java/osgi-util:0
	dev-java/slf4j-api:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.7"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.7"

if [[ ${PV} == 9999 ]]; then
	S="${WORKDIR}/${P}/aQute.${PN}"
else
	S="${WORKDIR}/bnd-${PV}.REL/aQute.${PN}"
fi

JAVA_SRC_DIR="src/"

# Remove method that conflicts with super correct fix?
PATCHES=(
	"${FILESDIR}/${PN}-${SLOT}-rm_remove.patch"
)

java_prepare() {
	rm -rf test* || die "Failed to remove tests."
}

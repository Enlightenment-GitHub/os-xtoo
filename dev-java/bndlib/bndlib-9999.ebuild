# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

BASE_URI="https://github.com/bndtools/bnd"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	MY_S="${P}/biz.aQute.${PN}"
else
	SRC_URI="${BASE_URI}/archive/${PV}.REL.tar.gz -> bnd-${PV}.tar.gz"
	KEYWORDS="~amd64"
	MY_S="bnd-${PV}.REL/biz.aQute.${PN}"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="A swiss army knife for OSGi"
HOMEPAGE="http://www.aqute.biz/Bnd/Bnd"
LICENSE="Apache-2.0"
SLOT="3"

OSGI_SLOT="6"

# Do not change order, osgi-ds MUST come before others
CP_DEPEND="
	~dev-java/bnd-annotation-${PV}:${SLOT}
	~dev-java/libg-${PV}:${SLOT}
	dev-java/osgi-annotation:0
	dev-java/osgi-ds:0
	dev-java/osgi-compendium:${OSGI_SLOT}
	dev-java/osgi-core-api:${OSGI_SLOT}
	dev-java/osgi-util:0
	dev-java/slf4j-api:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_S}"

JAVA_SRC_DIR="src/"

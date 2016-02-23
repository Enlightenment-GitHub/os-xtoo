# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="aQute Resolve"
HOMEPAGE="http://www.aqute.biz/Bnd/Bnd"
SRC_URI="https://github.com/bndtools/bnd/archive/${PV}.REL.tar.gz -> bnd-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64 ~x86"

OSGI_SLOT="5"

CP_DEPEND="dev-java/aqute-repository:${SLOT}
	dev-java/bndlib:${SLOT}
	dev-java/felix-resolver:0
	dev-java/libg:${SLOT}
	dev-java/osgi-compendium:${OSGI_SLOT}
	dev-java/osgi-core-api:${OSGI_SLOT}"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.7"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.7"

S="${WORKDIR}/bnd-${PV}.REL/biz.aQute.resolve"

JAVA_SRC_DIR="src/"

java_prepare() {
	java-pkg_clean

#	if ! use test ; then
		rm -rf test* || die "Failed to remove tests."
#	fi
}

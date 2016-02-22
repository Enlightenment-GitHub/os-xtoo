# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A swiss army knife for OSGi"
HOMEPAGE="http://www.aqute.biz/Bnd/Bnd"
SRC_URI="https://github.com/bndtools/bnd/archive/${PV}.REL.tar.gz -> bnd-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64 ~x86"

CP_DEPEND="dev-java/ant-core:0
	dev-java/aqute-remote:${SLOT}
	dev-java/aqute-repository:${SLOT}
	dev-java/aqute-resolve:${SLOT}
	dev-java/bndlib:${SLOT}
	dev-java/libg:${SLOT}
	dev-java/osgi-compendium:5
	dev-java/osgi-core-api:6
	dev-java/snakeyaml:0"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/bnd-${PV}.REL/biz.aQute.${PN}"

JAVA_SRC_DIR="src/"

java_prepare() {
	java-pkg_clean

#	if ! use test ; then
		rm -rf test* || die "Failed to remove tests."
#	fi
}

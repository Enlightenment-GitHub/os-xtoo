# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Lots of small utilities for bnd, a swiss army knife for OSGi"
HOMEPAGE="http://www.aqute.biz/Bnd/Bnd"
SRC_URI="https://github.com/bndtools/bnd/archive/${PV}.REL.tar.gz -> bnd-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jdk-1.7"
RDEPEND=">=virtual/jre-1.7"

S="${WORKDIR}/bnd-${PV}.REL/aQute.${PN}"

JAVA_SRC_DIR="src/"

java_prepare() {
	java-pkg_clean

#	if ! use test ; then
		rm -rf test* || die "Failed to remove tests."
#	fi
}

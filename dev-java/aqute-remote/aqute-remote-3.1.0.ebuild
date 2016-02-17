# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="aQute Remote provides remote debugging for bnd projects"
HOMEPAGE="http://www.aqute.biz/Bnd/Bnd"
SRC_URI="https://github.com/bndtools/bnd/archive/${PV}.REL.tar.gz -> bnd-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64 ~x86"

CDEPEND="dev-java/bndlib:${SLOT}
	dev-java/felix-framework:0
	dev-java/felix-gogo-runtime:0
	dev-java/libg:${SLOT}
	dev-java/osgi-core-api:6"

DEPEND=">=virtual/jdk-1.7
	${CDEPEND}"

RDEPEND=">=virtual/jre-1.7
	${CDEPEND}"

S="${WORKDIR}/bnd-${PV}.REL/biz.aQute.remote"

JAVA_GENTOO_CLASSPATH="
	bndlib-${SLOT}
	felix-framework
	felix-gogo-runtime
	libg-${SLOT}
	osgi-core-api-6
"
JAVA_SRC_DIR="src/"

java_prepare() {
	java-pkg_clean

#	if ! use test ; then
		rm -rf test* || die "Failed to remove tests."
#	fi
}

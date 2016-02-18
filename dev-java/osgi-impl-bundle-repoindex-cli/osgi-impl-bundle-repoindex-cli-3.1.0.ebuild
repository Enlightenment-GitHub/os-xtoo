# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Bundle Repository Indexer cli"
HOMEPAGE="http://www.aqute.biz/Bnd/Bnd"
SRC_URI="https://github.com/bndtools/bnd/archive/${PV}.REL.tar.gz -> bnd-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64 ~x86"

CDEPEND="dev-java/args4j:2
	dev-java/osgi-compendium:4
	dev-java/osgi-core-api:4
	dev-java/osgi-impl-bundle-repoindex-api:${SLOT}
	dev-java/osgi-impl-bundle-repoindex-lib:${SLOT}
	dev-java/pojosr-framework:0"

DEPEND=">=virtual/jdk-1.7
	${CDEPEND}"

RDEPEND=">=virtual/jre-1.7
	${CDEPEND}"

S="${WORKDIR}/bnd-${PV}.REL/org.${PN//-/.}"

JAVA_GENTOO_CLASSPATH="
	args4j-2
	osgi-compendium-4
	osgi-core-api-4
	osgi-impl-bundle-repoindex-api-${SLOT}
	osgi-impl-bundle-repoindex-lib-${SLOT}
	pojosr-framework
"
JAVA_SRC_DIR="src/"

java_prepare() {
	java-pkg_clean

#	if ! use test ; then
		rm -rf test* || die "Failed to remove tests."
#	fi
}


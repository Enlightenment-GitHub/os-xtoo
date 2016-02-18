# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit java-pkg-2 java-pkg-simple

MY_PN=${PN/aqute/aQute}
MY_PN=${MY_PN//-/.}

DESCRIPTION="aQute JPM Clnt"
HOMEPAGE="https://github.com/bndtools/bnd/tree/master/cnf/repo/${MY_PN}"
SRC_URI="${HOMEPAGE/tree/blob}/${MY_PN}-${PV}.jar?raw=true -> ${P}.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CDEPEND="dev-java/bndlib:3"

DEPEND="app-arch/unzip
	${CDEPEND}
	>=virtual/jdk-1.7"

RDEPEND="${CDEPEND}
	>=virtual/jre-1.7"

S="${WORKDIR}/"

JAVA_GENTOO_CLASSPATH="bndlib-3"

JAVA_SRC_DIR="OSGI-OPT/src"

# Makes imports specific vs .*
# Change MultiMap.remove(K key, V value) -> remove(Object key, Object value)
# Per http://stackoverflow.com/questions/23785807/
# Compiles with patch, rename may have effect on dependencies using MultiMap

PATCHES=(
	"${FILESDIR}"/${P}-fix-imports.patch
)

java_prepare() {
	java-pkg_clean

	epatch "${PATCHES[@]}"
}

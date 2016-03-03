# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN=${PN/aqute/aQute}
MY_PN=${MY_PN//-/.}

DESCRIPTION="aQute Services Struct"
HOMEPAGE="https://github.com/pkriens/aQute.repo/"
SRC_URI="https://github.com/pkriens/aQute.repo/blob/master/repo/${MY_PN}/${MY_PN}-${PV}.jar?raw=true -> ${P}.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/unzip:0
	>=virtual/jdk-1.7"

RDEPEND=">=virtual/jre-1.7"

S="${WORKDIR}/"

JAVA_SRC_DIR="OSGI-OPT/src/"

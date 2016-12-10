# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

BASE_URI="https://github.com/LMAX-Exchange/${PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
else
	SRC_URI="${BASE_URI}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

HOMEPAGE="http://lmax-exchange.github.io/${PN}/"
DESCRIPTION="High Performance Inter-Thread Messaging Library"
LICENSE="Apache-2.0"
SLOT="$(get_version_component_range 1-2)"

DEPEND=">=virtual/jdk-1.8"

RDEPEND=">=virtual/jre-1.8"

S="${WORKDIR}/${P}"

JAVA_SRC_DIR="src/main/java/"

# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java Persistence API $(get_version_component_range 1-2) JSR-338 Implementation by Eclipselink"

MY_PN="${PN:8}"
MY_PN="${MY_PN/-/.}"
MY_PV="${PV/2013/v2013}"
MY_P="${MY_PN}-${MY_PV}"

HOMEPAGE="https://github.com/eclipse/${MY_PN}"
SRC_URI="https://github.com/eclipse/${MY_PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
SLOT="$(get_major_version)"
KEYWORDS="~amd64"
LICENSE="EDL-1.0 EPL-1.0"

CP_DEPEND="dev-java/osgi-core-api:6"

DEPEND="app-arch/unzip
	${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_P}"

JAVA_SRC_DIR="src/"

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

OSGI_SLOT="5"

# Do not change order, osgi-ds MUST come before others
CP_DEPEND="~dev-java/libg-${PV}:3
	dev-java/osgi-annotation:0
	dev-java/osgi-ds:0
	dev-java/osgi-compendium:${OSGI_SLOT}
	dev-java/osgi-core-api:${OSGI_SLOT}
	dev-java/osgi-util:0"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/bnd-${PV}.REL/biz.aQute.${PN}"

JAVA_SRC_DIR="src/"

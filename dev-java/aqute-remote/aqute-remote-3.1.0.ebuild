# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="aQute Remote provides remote debugging for bnd projects"
HOMEPAGE="http://www.aqute.biz/Bnd/Bnd"
SRC_URI="https://github.com/bndtools/bnd/archive/${PV}.REL.tar.gz -> bnd-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64 ~x86"

CP_DEPEND="~dev-java/bndlib-${PV}:${SLOT}
	dev-java/felix-framework:0
	dev-java/felix-gogo-runtime:0
	~dev-java/libg-${PV}:${SLOT}
	dev-java/osgi-core-api:6"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.7"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.7"

S="${WORKDIR}/bnd-${PV}.REL/biz.aQute.remote"

JAVA_SRC_DIR="src/"

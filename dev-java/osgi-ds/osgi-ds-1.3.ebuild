# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Declarative Services API"
HOMEPAGE="https://www.osgi.org/developer/specifications/"
SRC_URI="https://osgi.org/download/r6/osgi.cmpn-6.0.0.jar"
# This package is found within sources for another see SRC_URI

LICENSE="Apache-2.0 OSGi-Specification-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CP_DEPEND="dev-java/osgi-annotation:0"

DEPEND="app-arch/unzip:0
	${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

JAVA_SRC_DIR="OSGI-OPT/src/"

java_prepare() {
	local p="${JAVA_SRC_DIR}org/osgi/"

	# Removing classes vs limiting sources, to get clean bundle/packageinfo
	rm -fR "${p}"{application,namespace,util} \
		"${p}"service/component/{runtime,*.java,packageinfo} \
		"${p}"service/metatype/*.java \
		|| die "Could not remove extra classes"
	find "${p}"service/*  ! -path "${p}/service" -a \
		! -path "*/service/component*" -a \
		! -path "*/service/metatype*" \
		-type d -maxdepth 1 -exec rm -vfR {} + \
		|| die "Could not remove extra classes"
}

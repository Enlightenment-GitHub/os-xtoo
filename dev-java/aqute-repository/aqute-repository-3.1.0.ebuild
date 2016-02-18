# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="aQute Repository"
HOMEPAGE="http://www.aqute.biz/Bnd/Bnd"
SRC_URI="https://github.com/bndtools/bnd/archive/${PV}.REL.tar.gz -> bnd-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="~amd64 ~x86"

JETTY_SLOT="9.3"

CDEPEND="dev-java/aqute-jpm-clnt:0
	dev-java/aqute-services-services:0
	dev-java/aqute-services-struct:0
	dev-java/bndlib:${SLOT}
	dev-java/jetty-continuation:${JETTY_SLOT}
	dev-java/jetty-http:${JETTY_SLOT}
	dev-java/jetty-io:${JETTY_SLOT}
	dev-java/jetty-security:${JETTY_SLOT}
	dev-java/jetty-server:${JETTY_SLOT}
	dev-java/jetty-util:${JETTY_SLOT}
	dev-java/libg:${SLOT}
	dev-java/osgi-compendium:5
	dev-java/osgi-core-api:5
	dev-java/osgi-impl-bundle-bindex:0
	dev-java/osgi-impl-bundle-repoindex-api:${SLOT}
	dev-java/osgi-impl-bundle-repoindex-lib:${SLOT}
	dev-java/xstream
	java-virtuals/servlet-api:4.0"

DEPEND=">=virtual/jdk-1.7
	${CDEPEND}"

RDEPEND=">=virtual/jre-1.7
	${CDEPEND}"

S="${WORKDIR}/bnd-${PV}.REL/biz.aQute.repository"

JAVA_GENTOO_CLASSPATH="
	aqute-jpm-clnt
	aqute-services-services
	aqute-services-struct
	bndlib-${SLOT}
	jetty-continuation-${JETTY_SLOT}
	jetty-http-${JETTY_SLOT}
	jetty-io-${JETTY_SLOT}
	jetty-security-${JETTY_SLOT}
	jetty-server-${JETTY_SLOT}
	jetty-util-${JETTY_SLOT}
	libg-${SLOT}
	osgi-compendium-5
	osgi-core-api-5
	osgi-impl-bundle-bindex
	osgi-impl-bundle-repoindex-api-${SLOT}
	osgi-impl-bundle-repoindex-lib-${SLOT}
	servlet-api-4.0
	xstream
"
JAVA_SRC_DIR="src/aQute"

java_prepare() {
	java-pkg_clean

#	if ! use test ; then
		rm -rf src/test* || die "Failed to remove tests."
#	fi
}

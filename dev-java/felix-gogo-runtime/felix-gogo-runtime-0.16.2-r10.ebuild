# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit java-pkg-2 java-ant-2 java-osgi

DESCRIPTION="Felix Gogo Runtime"
HOMEPAGE="https://felix.apache.org/documentation/subprojects/apache-felix-gogo.html"
LICENSE="Apache-2.0"

MY_PN="org.apache.felix.gogo.runtime"
MY_P="${MY_PN}-${PV}"
SRC_URI="mirror://apache/felix/${MY_P}-project.tar.gz"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/osgi-compendium:6
	dev-java/osgi-core-api:6
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8
"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_P}"

PATCHES=(
	"${FILESDIR}"/${PN}-event-properties-to-hashmap.patch
)

java_prepare() {

	cp "${FILESDIR}"/${PN}-build.xml build.xml || die

	# Set version in build.xml
	sed -i -e "s|runtime-GENTOO|runtime-${PV}|" build.xml || die
}

JAVA_ANT_REWRITE_CLASSPATH="true"

src_install() {
	java-osgi_newjar "${S}"/target/${MY_P}.jar ${MY_PN} ${MY_PN} "Export-Package: ${MY_PN}"
}

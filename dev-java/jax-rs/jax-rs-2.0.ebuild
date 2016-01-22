
EAPI=5
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

REV="A"

DESCRIPTION="Reference implementation of the Java API for RESTful Services"
HOMEPAGE="https://jax-rs-spec.java.net/"
DOWNLOAD_PAGE="http://download.oracle.com/otndocs/jcp/${PN/-/}-${PV/./_}_rev_${REV}-mrel-spec/index.html"
SRC_URI="javax.ws.rs-api-${PV}.rev.${REV}-sources.jar"
RESTRICT="fetch"
LICENSE="oracle-jsr339"
SLOT="2"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

COMMON_DEP=""

DEPEND=">=virtual/jdk-1.7
	app-arch/unzip
	${COMMON_DEP}"

RDEPEND=">=virtual/jre-1.7
	${COMMON_DEP}"

#S="${WORKDIR}"

pkg_nofetch() {

	einfo "Please go to"
	einfo " ${DOWNLOAD_PAGE}"
	einfo "and download file:"
	einfo "JSR-000339 ${PN^^} ${PV} rev ${REV} sources"
	einfo "Place the file ${SRC_URI} in:"
	einfo " ${DISTDIR}"

}

src_compile() {
	java-pkg-simple_src_compile
}

src_install() {
	java-pkg-simple_src_install
}

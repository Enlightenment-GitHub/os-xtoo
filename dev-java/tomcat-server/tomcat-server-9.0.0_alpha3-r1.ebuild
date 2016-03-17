# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

JAVA_PKG_IUSE="doc source test"

inherit eutils java-pkg-2 java-ant-2 prefix user

MY_PV="${PV/_alpha/.M}"
MY_P="apache-${PN/-server/}-${MY_PV}-src"

DESCRIPTION="Tomcat Servlet-4.0/JSP-2.3 Container"
HOMEPAGE="http://tomcat.apache.org/"
SRC_URI="mirror://apache/${PN}/tomcat-9/v${MY_PV}/src/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="9"
KEYWORDS="~amd64 ~x86"
IUSE="extra-webapps"

RESTRICT="test" # can we run them on a production system?

ECJ_SLOT="4.5"
SAPI_SLOT="4.0"

CP_DEPEND="dev-java/eclipse-ecj:${ECJ_SLOT}
	~dev-java/tomcat-servlet-api-${PV}:${SAPI_SLOT}"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8
	test? (
		>=dev-java/ant-junit-1.9:0
		dev-java/easymock:3.2
	)"

RDEPEND="${CP_DEPEND}
	!<dev-java/tomcat-native-1.1.24
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_P}"

java_prepare() {
	# Remove bundled servlet-api
	rm -rv java/javax/{el,servlet} || die

	epatch "${FILESDIR}/${P}-build.xml.patch"
}

JAVA_ANT_REWRITE_CLASSPATH="true"

EANT_BUILD_TARGET="deploy"
EANT_TEST_GENTOO_CLASSPATH="easymock-3.2"
EANT_GENTOO_CLASSPATH_EXTRA="${S}/output/classes"
EANT_NEEDS_TOOLS="true"
EANT_EXTRA_ARGS="-Dversion=${PV}-gentoo -Dversion.number=${PV} -Dcompile.debug=false"

# revisions of the scripts
IM_REV="-r2"
INIT_REV="-r1"

src_compile() {
	EANT_GENTOO_CLASSPATH_EXTRA+=":$(java-pkg_getjar --build-only ant-core ant.jar)"
	java-pkg-2_src_compile
}

src_test() {
	java-pkg-2_src_test
}

src_install() {
	java-pkg_dojar output/build/{bin,lib}/*.jar

	dodoc RELEASE-NOTES RUNNING.txt
	use doc && java-pkg_dojavadoc output/dist/webapps/docs/api
	use source && java-pkg_dosrc java/*
}

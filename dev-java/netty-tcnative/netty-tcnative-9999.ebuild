# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_P="${PN}-parent-${PV/33./33.Fork}"
BASE_URI="https://github.com/${PN}/"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	MY_S="${P}"
else
	SRC_URI="${BASE_URI}/archive/${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	MY_S="${PN}-${MY_P}"
fi

inherit autotools versionator java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="Fork of Tomcat Native that incorporates various patches"
HOMEPAGE="http://netty.io/wiki/forked-${PN}.html"
LICENSE="Apache-2.0"
SLOT="0"

CDEPEND="
	dev-libs/apr:1=
	dev-libs/openssl:0=
"

RDEPEND="${CDEPEND}
	>=virtual/jre-1.8"

DEPEND="${CDEPEND}
	>=virtual/jdk-1.8
	dev-java/maven-hawtjni-plugin:0"

S="${WORKDIR}/${MY_S}"
JAVA_SRC_DIR="${S}/openssl-dynamic/src/main/java"
NATIVE_DIR="${S}/openssl-dynamic/src/main/native-package"

java_prepare() {
	cd "${NATIVE_DIR}" || die
	ln -sn ../c src || die
	ln -sn . project-template || die

	# Provides missing m4 files and Makefile.am template.
	unzip -n $(java-pkg_getjars --build-only maven-hawtjni-plugin) project-template/\* || die

	sed -i \
		-e "s:@PROJECT_NAME@:${PN}:g" \
		-e "s:@PROJECT_NAME_UNDER_SCORE@:${PN//-/_}:g" \
		-e "s:@PROJECT_SOURCES@:$(echo src/*.c):g" \
		Makefile.am || die

	# Avoid dummy version and tedious symlink.
	sed -i "s/-release @VERSION@/-avoid-version/g" configure.ac || die

	eautoreconf
}

src_configure(){
	cd "${NATIVE_DIR}" || die
	econf --with-apr=/usr/bin/apr-1-config --with-ssl=/usr
}

src_compile() {
	java-pkg-simple_src_compile
	emake -C "${NATIVE_DIR}"
}

src_install() {
	java-pkg-simple_src_install
	java-pkg_doso "${NATIVE_DIR}"/.libs/lib${PN}.so
	dodoc README.md
}

# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/validation-api/validation-api-1.0.0.ebuild,v 1.3 2011/03/03 09:05:27 tomka Exp $

EAPI=4

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2

DESCRIPTION="reCAPTCHA Library for Java"
HOMEPAGE="http://code.google.com/p/recaptcha/"
SRC_URI="http://${PN/4j/}.googlecode.com/files/${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

RDEPEND=">=virtual/jre-1.5"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip"

EANT_BUILD_TARGET="jar"
EANT_DOC_TARGET="doc"

S="${WORKDIR}/${P}"

MY_T="${S}/target"

java_prepare() {
        einfo "Removing bundled jars and classes"
        find "${S}" '(' -name '*.class' -o -name '*.jar' ')' -delete
}

src_compile() {
	cd src/main/java
	mkdir "${MY_T}"
	ejavac net/tanesha/recaptcha/*.java \
		net/tanesha/recaptcha/http/*.java -d "${MY_T}"
	jar -cf "${S}/${PN}.jar" -C "${MY_T}" .

	if use doc; then
		mkdir "${MY_T}/html"
		javadoc net/tanesha/recaptcha/*.java \
			net/tanesha/recaptcha/http/*.java \
			-d "${MY_T}/html"
	fi
}

src_install() {
	java-pkg_dojar "${S}/${PN}.jar"
	use doc && java-pkg_dojavadoc "${MY_T}/html"
	use source && java-pkg_dosrc "${S}/src/main/java"
}

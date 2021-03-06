# Copyright 2016-2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="${PN/-core/}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Jersey RESTful Web Services in Java Core Common"
HOMEPAGE="https://${MY_PN}.java.net/"
SRC_URI="https://central.maven.org/maven2/org/glassfish/${PN:0:6}/core/${MY_PN}/${PV}/${MY_P}-sources.jar"
# Missing org.glassfish.jersey.internal.LocalizationMessages
#SRC_URI="https://github.com/${MY_PN}/${MY_PN}/archive/2.22.2.tar.gz -> ${MY_P}.tar.gz"

LICENSE="CDDL GPL-2-with-linking-exception"
SLOT="$(get_major_version)"
KEYWORDS="~amd64"

CP_DEPEND="dev-java/asm:4
	dev-java/glassfish-hk2-api:0
	dev-java/glassfish-hk2-locator:0
	dev-java/glassfish-hk2-utils:0
	dev-java/javax-inject:0
	dev-java/jax-rs:2
	~dev-java/jersey-core-client-${PV}:${SLOT}
	~dev-java/jersey-core-common-${PV}:${SLOT}
	dev-java/jersey-guava:${SLOT}
	dev-java/jsr250:0
	dev-java/osgi-core-api:6
	dev-java/validation-api:1.0"

DEPEND="
	${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

# Used with sources from github
#S="${WORKDIR}/${MY_P}/${PN/${MY_PN}-/}"

#JAVA_SRC_DIR="src/main/java"

java_prepare() {
	# Delete line 169, @override
	sed -i -e '169s/@Override//' \
		"${S}/org/glassfish/jersey/server/internal/inject/DelegatedInjectionValueFactoryProvider.java" \
		|| die "Could not remove overried"
}

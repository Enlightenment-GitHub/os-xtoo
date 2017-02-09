# Copyright 2016-2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="spring-framework"
MY_PV="${PV}.RELEASE"
MY_P="${MY_PN}-${MY_PV}"

BASE_URI="https://github.com/spring-projects/${MY_PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	MY_S="${P}"
else
	SRC_URI="${BASE_URI}/archive/v${PV}.RELEASE.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	MY_S="${MY_P}/${PN}"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="Spring Framework ${PN:7}"
HOMEPAGE="https://spring.io/"
LICENSE="Apache-2.0"
SLOT="$(get_version_component_range 1-2)"

CP_DEPEND="
	dev-java/asm:4
	dev-java/aspectj:0
	dev-java/bsh:0
	dev-java/bytelist:0
	dev-java/cglib:3
	dev-java/commons-logging:0
	dev-java/glassfish-interceptor-api:0
	dev-java/groovy:0
	dev-java/hibernate-validator-engine:4
	dev-java/javax-enterprise-concurrent-api:0
	dev-java/joda-time:0
	dev-java/jruby:0
	dev-java/jsr354-api:0
	dev-java/objenesis:2
	~dev-java/spring-aop-${PV}:${SLOT}
	~dev-java/spring-beans-${PV}:${SLOT}
	~dev-java/spring-beans-groovy-${PV}:${SLOT}
	~dev-java/spring-core-${PV}:${SLOT}
	~dev-java/spring-expression-${PV}:${SLOT}
	~dev-java/spring-instrument-${PV}:${SLOT}
	dev-java/beanvalidation-api:1.0
	java-virtuals/ejb-api:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_S}"

JAVA_SRC_DIR="src/main/java"

java_prepare() {
	local files
	files=(
		"org/springframework/scripting/support/ScriptFactoryPostProcessor.java"
		"org/springframework/context/annotation/ConfigurationClassEnhancer.java"
	)
	for file in "${files[@]}"; do
		# Replaced repackaged with standard
		sed -i -e "s|springframework.asm|objectweb.asm|g" \
			-e "s|org.springframework.cg|net.sf.cg|g" \
			"${S}/${JAVA_SRC_DIR}/${file}" \
			|| die "Could not sed asm/cglib"
	done
	# Reverse one import change, crude
	sed -i -e "s|net.sf.cglib.core.SpringNamingPolicy|org.springframework.cglib.core.SpringNamingPolicy|g" \
		"${S}/${JAVA_SRC_DIR}/${files[1]}" \
		|| die "Could not reverse sed cglib"

	# Replaced repackaged with standard
	sed -i -e "s|g.springframework.o|g.o|g" \
		"${S}/${JAVA_SRC_DIR}/${files[1]}" \
		|| die "Could not sed objenesis"

}

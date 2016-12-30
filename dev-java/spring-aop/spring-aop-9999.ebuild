# Copyright 2016 Obsidian-Studios, Inc.
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
	dev-java/aspectj:0
	dev-java/cglib:3
	dev-java/commons-logging:0
	dev-java/commons-pool:0
	dev-java/commons-pool:2
	dev-java/jamon:2
	dev-java/javax-inject:0
	dev-java/objenesis:2
	dev-java/snakeyaml:0
	~dev-java/spring-beans-${PV}:${SLOT}
	~dev-java/spring-core-${PV}:${SLOT}
	java-virtuals/servlet-api:4.0
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
		"org/springframework/aop/framework/ObjenesisCglibAopProxy.java"
		"org/springframework/aop/framework/CglibAopProxy.java"
	)
	for file in ${files[@]}; do
		# Replaced repackaged with standard
		sed -i -e "s|org.springframework.cg|net.sf.cg|g" \
			"${S}/${JAVA_SRC_DIR}/${file}" \
			|| die "Could not sed cglib"
	done
	# Reverse one import change, crude
	sed -i -e "s|net.sf.cglib.core.SpringNamingPolicy|org.springframework.cglib.core.SpringNamingPolicy|g" \
		"${S}/${JAVA_SRC_DIR}/org/springframework/aop/framework/CglibAopProxy.java" \
		|| die "Could not reverse sed cglib"
	# Replaced repackaged with standard
	sed -i -e "s|g.springframework.o|g.o|g" \
		"${S}/${JAVA_SRC_DIR}/org/springframework/aop/framework/ObjenesisCglibAopProxy.java" \
		|| die "Could not sed objenesis"
}

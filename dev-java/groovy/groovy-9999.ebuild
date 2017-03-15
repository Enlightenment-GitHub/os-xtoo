# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

# Original work Copyright 1999-2016 Gentoo Foundation

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="${PN^^}"
MY_PV="${PV//./_}"
MY_P="${MY_PN}_${MY_PV}"
BASE_URI="https://github.com/apache/${PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	MY_S="${P}"
else
	SRC_URI="${BASE_URI}/archive/${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	MY_S="${PN}-${MY_P}"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="A multi-faceted language for the Java platform"
HOMEPAGE="http://www.groovy-lang.org/"
LICENSE="Apache-2.0"
SLOT="0"

CP_DEPEND="
	>=dev-java/antlr-2.7.7-r7:0
	dev-java/asm:4
	dev-java/commons-cli:1
	dev-java/jansi:0
	dev-java/xstream:0
"

DEPEND="${CDEPEND}
	>=virtual/jdk-1.7"

RDEPEND="${CDEPEND}
	>=virtual/jre-1.7"

S="${WORKDIR}/${MY_S}"

JAVA_SRC_DIR="src/main"

# ExceptionUtil filename.
EU="ExceptionUtils.java"

ANTLR_GRAMMAR_FILES=(
	org/codehaus/groovy/antlr/groovy.g
	org/codehaus/groovy/antlr/java/java.g
)

# Patches utils.gradle. It basically rewrites ExceptionUtils.
PATCHES=(
	"${FILESDIR}/utils.gradle.patch"
)

# Add target/classes to the CP as we're generating an extra class there.
JAVA_GENTOO_CLASSPATH_EXTRA="target/classes"

# This function generates the ANTLR grammar files.
generate_antlr_grammar() {
	for grammar_file in "${@}"; do
		local my_grammar_file=$(basename ${grammar_file})

		einfo "Generating \"${my_grammar_file}\" grammar file"
		local my_grammar_dir=$(dirname ${grammar_file})

		cd "${S}/src/main/${my_grammar_dir}" || die
		antlr ${my_grammar_file} || die

		cd "${S}" || die
	done
}

# This function generates ExceptionUtils.class.
# ExceptionUtils is a helper class needed when compiling Groovy 2.x.
# Normally, this class is generated via a Gradle task at compile time. Since we
# don't use Gradle here.. we've translated it into a plain Java file and have
# it generate the same data.
generate_exceptionutils() {
	ebegin "Copying ${EU}"
	mv "gradle/utils.gradle" "${EU}" || die
	eend $?

	ejavac -classpath "$(java-pkg_getjar --build-only asm-4 asm.jar)" ${EU}

	ebegin "Running ${EU%.java}"
	$(java-config -J) -classpath "$(java-pkg_getjar --build-only asm-4 asm.jar):." ${EU%.java} || die
	eend $?
}

src_compile() {
	generate_antlr_grammar "${ANTLR_GRAMMAR_FILES[@]}"
	generate_exceptionutils
	java-pkg-simple_src_compile
}

src_install() {
	java-pkg_dolauncher "groovyc" --main org.codehaus.groovy.tools.FileSystemCompiler
	java-pkg_dolauncher "groovy" --main groovy.ui.GroovyMain
	java-pkg-simple_src_install
}

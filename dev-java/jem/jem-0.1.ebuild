
EAPI=5

inherit cmake-utils

MY_P="${P}-Source"

DESCRIPTION="A java environment manager"
HOMEPAGE="http://www.o-sinc.com/#!/software/${PN}"
SRC_URI="http://www.o-sinc.com/software/${PN}/${MY_P}.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug doc +java-config source test"

DEPEND="debug? ( dev-util/valgrind
		sys-libs/glibc[debug] )
	doc? ( app-doc/doxygen )"
RDEPEND=">=app-eselect/eselect-java-0.2.10
	java-config? ( <dev-java/java-config-2.2.1 )
	!java-config? (
		>=dev-java/java-config-2.2.1
	)"
S="${WORKDIR}/${MY_P}/"

src_configure() {
	local mytype="Release"
	use debug && mytype="Debug"
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${EROOT}"
		-DCMAKE_BUILD_TYPE=${mytype}
		$(cmake-utils_use_build doc DOC)
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install

	# not sure what is going on here
	fperms 755 /usr/bin/run-java-tool.bash

	dodir /etc/jem/{build,virtuals.d,vms.d}

	insinto /usr/share/eselect/modules/
	doins "${FILESDIR}"/java-vm.eselect

	# copy preference files from java-config-2 if exist if not use default
	local jc_files="build/compilers.conf build/jdk.conf virtuals"
	for file in ${jc_files}; do
		if [[ ! -f "${ED}"/etc/jem/${file/ls/ls.conf} ]] ; then
			if [[ -f "${EROOT}"/etc/java-config-2/${file} ]] ; then
				cp "${EROOT}"/etc/java-config-2/${file} \
					"${ED}"/etc/jem/${file/ls/ls.conf} || die
			else
				cp "${FILESDIR}"/${file/build\//} \
					"${ED}"/etc/jem/${file/ls/ls.conf} || die
			fi
		fi
	done

	# copy virtuals and vms
	local vv="virtuals vm"
	for v in ${vv}; do
		local jc_vfiles=$(ls "/usr/share/java-config-2/${v}/")
		for file in ${jc_vfiles}; do
			if [[ ! -f "${ED}"/etc/jem/${v/vm/vms}.d/${file} ]] ; then
				cp "${EROOT}"/usr/share/java-config-2/${v}/${file} \
					"${ED}"/etc/jem/${v/vm/vms}.d/${file} || die
			fi
		done
	done

	if ! use java-config ; then
		dosym /usr/bin/jem /usr/bin/java-config
		dosym /usr/bin/jem /usr/bin/java-config-2
	fi
	if use source ; then
		mkdir "${ED}"/usr/share/${PN}/sources || die
		cp -R "${S}"/{include,src} "${ED}"/usr/share/${PN}/sources \
		|| die
	fi
}

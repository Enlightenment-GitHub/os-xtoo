# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit eutils versionator autotools flag-o-matic

MAJOR="$(get_version_component_range 1-2 $PV)"
MY_PN="OdbcFb"
MY_P="${MY_PN}-Source-${PV}"
DESCRIPTION="ODBC driver for Firebird RDBMS"
HOMEPAGE="http://firebirdsql.org/index.php?op=files&id=odbc"
SRC_URI="mirror://sourceforge/project/firebird/firebird-ODBC-driver/2.0.1-Release/${MY_P}.tar.gz"
LICENSE="IDPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug doc hardened"
RDEPEND="dev-db/firebird
	 dev-db/unixODBC"
S="${WORKDIR}/${MY_P}"

src_unpack() {
	cp "${DISTDIR}/${A}" ${MY_P}.tar.tar
	unpack "./${MY_P}.tar.tar"
	mkdir ${MY_P}
	mv "${MY_P/.15/-15}.tar" "${S}"
	cd "${S}"
	unpack "./${MY_P/.15/-15}.tar"
}

src_prepare() {
	cd "${S}/Builds/Gcc.lin/"
	mv makefile.linux Makefile
	sed -i -e "s|#FIREBIRD=/usr/lib64/firebird|FIREBIRD=/usr|" \
		-e "s|-I/usr/include/odbc||" \
		-e 's|-I$(FBINCDIR)  $(INCLUDEDIR)|-I$(FBINCDIR)|' \
		-e 's|COMPFLAGS	= -g -w -D_REENTRANT -D_PTHREADS -DEXTERNAL -D$(ODBCMANAGER) $(INCLUDEDIR)|COMPFLAGS	= -w ${CXXFLAGS}|' \
		-e "s|COMPFLAGS	:= -fPIC -m64|COMPFLAGS	:= -fPIC|" \
		-e "s|LINKFLAGS	= -shared -m64|LINKFLAGS	= -shared|" \
		-e "s|COMPFLAGS	:= -m32||" \
		-e "s|LINKFLAGS	= -shared -m32|LINKFLAGS	= -shared|" \
		Makefile || die "Fixing Makefile via sed failed"

	# code needs to be fixed upstream, temp hack
	use hardened && sed -i -e "s|CXXFLAGS}|CXXFLAGS} -fpermissive|" \
			Makefile || die "Fixing Makefile via sed failed"
	append-flags -fPIC
}

src_compile() {
	cd "${S}/Builds/Gcc.lin/"
	emake -j1
}

src_install() {
	cd "${S}"
	dolib.so Builds/Gcc.lin/Release_${ARCH}/libOdbcFb.so

	local odbcinst="${ROOT}/etc/unixODBC/odbcinst.ini"

	insinto /etc/unixODBC/
	if [ -e "${odbcinst}"} ]; then
		if [ -n $(grep libOdbcFb.so "${odbcinst}") ]; then
			cp "${odbcinst}" ./
			cat ${FILESDIR}/${PN}.ini >> odbcinst.ini
			doins odbcinst.ini
		fi
	else
		newins ${FILESDIR}/${PN}.ini odbcinst.ini
	fi

	if use doc; then
		dodoc Install/Linux/*.ini
		dodoc Install/Linux/*.txt
	fi
}

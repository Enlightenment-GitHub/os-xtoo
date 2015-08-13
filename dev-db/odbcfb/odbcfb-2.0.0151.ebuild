# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit eutils versionator autotools

MAJOR="$(get_version_component_range 1-2 $PV)"
MY_PN="OdbcFb"
MY_P="${MY_PN}-Source-${PV}"
DESCRIPTION="ODBC driver for Firebird RDBMS"
HOMEPAGE="http://firebirdsql.org/index.php?op=files&id=odbc"
SRC_URI="mirror://sourceforge/firebird/files/firebird-ODBC-driver/2.0-Release/${MY_P}.tar.gz"
LICENSE="IDPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug doc"
RDEPEND="dev-db/firebird
	 dev-db/unixODBC"
S=${WORKDIR}/OdbcJdbc/Builds/Gcc.lin

src_prepare() {
	mv makefile.linux Makefile
	sed -i -e "s|#FIREBIRD=/usr/lib64/firebird|FIREBIRD=/usr|" \
		-e "s|-I/usr/include/odbc||" \
		-e 's|-I$(FBINCDIR)  $(INCLUDEDIR)|-I$(FBINCDIR)|' \
		-e 's|COMPFLAGS	= -g -w -D_REENTRANT -D_PTHREADS -DEXTERNAL -D$(ODBCMANAGER) $(INCLUDEDIR)|COMPFLAGS	= -w|' \
		-e "s|COMPFLAGS	:= -fPIC -m64|COMPFLAGS	:= -fPIC|" \
		-e "s|LINKFLAGS	= -shared -m64|LINKFLAGS	= -shared|" \
		-e "s|COMPFLAGS	:= -m32||" \
		-e "s|LINKFLAGS	= -shared -m32|LINKFLAGS	= -shared|" \
		Makefile || die "Fixing Makefile via sed failed"
}

#src_compile() {
#	emake -j1
#}

src_install() {
	die
}

# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="https://github.com/mariuz/${PN}.git"
	S="${WORKDIR}/${P}"
	WX_GTK_VER="3.0"
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="mirror://sourceforge/${PN}/${P}-src.tar.gz"
	S="${WORKDIR}/${P}-src"
	WX_GTK_VER="2.8"
fi

inherit eutils wxwidgets ${ECLASS}

DESCRIPTION="A database administration tool for Firebird DBMS"
HOMEPAGE="http://www.flamerobin.org/"

LICENSE="MIT IBPP-1.1 LGPL-2.1+"
SLOT="0"
IUSE="doc"

RDEPEND="x11-libs/wxGTK:${WX_GTK_VER}[X]
	 dev-db/firebird"

DEPEND="${RDEPEND}"

[[ ${PV} == 9999 ]] && DEPEND="app-arch/unzip ${DEPEND}"


PATCHES=(
	"${FILESDIR}/${P}-gcc46.patch"
)

src_prepare() {
	[[ ${PV} != 9999 ]] && epatch "${PATCHES[@]}"
}

src_configure() {
	# temp hack since configure is not executable
	chmod +x configure

	local myconf
	myconf="${myconf} \
		--disable-shared \
		--disable-debug \
		--with-wx=yes \
		--with-wx-config=${WX_CONFIG}"
	econf ${myconf}
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc devdocs/* docs/* docs-src/*
}

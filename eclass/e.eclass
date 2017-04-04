# Copyright 2017 Obisidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

# Tidbits from enlightenment.eclass
# Copyright 1999-2014 Gentoo Foundation

# @ECLASS: e.eclass
# @MAINTAINER: wlt@o-sinc.com
# @BLURB: Enlightenment package management common code

[[ -z ${_E_ECLASS} ]] && _E_ECLASS=1

inherit eutils libtool

# @ECLASS-VARIABLE: E_TYPE
# @DEFAULT_UNSET
# @DESCRIPTION:
# if defined, the type of package, apps, bindings, tools

# @ECLASS-VARIABLE: E_ECONF
# @DESCRIPTION:
# Array of flags to pass to econf (obsoletes MY_ECONF)
E_ECONF=()

if [[ ${PV} == 9999 ]]; then
	inherit autotools git-r3
	EGIT_REPO_URI="https://git.enlightenment.org/${E_TYPE}/${PN}.git"
	SLOT="${PV}"
else
        SRC_URI="http://download.enlightenment.org/rel/${E_TYPE}/${PN}/${P/_/-}.tar.gz"
	KEYWORDS="~amd64"
	SLOT="${PV%%.*}"
fi

S="${WORKDIR}/${P/_/-}"

E_EXPF="src_install"
case "${EAPI:-0}" in
2|3|4|5|6) E_EXPF+="src_prepare src_configure" ;;
*) ;;
esac

e_src_prepare() {
	default
	[[ ${PV} = 9999 ]] && eautoreconf
}

e_src_configure() {
	        has nls ${IUSE} && \
			E_ECONF+=( $(use_enable nls) )
	        has static-libs ${IUSE} && \
			E_ECONF+=( $(use_enable static-libs static) )

        econf ${MY_ECONF} "${E_ECONF[@]}"
}

e_src_install() {
	default
	prune_libtool_files
}

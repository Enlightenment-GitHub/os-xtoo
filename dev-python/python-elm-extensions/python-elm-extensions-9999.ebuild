# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

BASE_URI="https://github.com/JeffHoogland/${PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
else
	SRC_URI="${BASE_URI}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

PYTHON_COMPAT=( python{2_7,3_4,3_6} pypy2_0 )

inherit distutils-r1 ${ECLASS}

DESCRIPTION="Library with complex elementary objects for easy importing/usage"
HOMEPAGE="${BASE_URI}"
LICENSE="BSD-3-clause"
SLOT="0"

DEPEND="dev-python/python-efl"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}"

src_prepare() {
	default
	cd "${S}" || die

	echo "#!/usr/bin/env python

from distutils.core import setup

setup(name='${PN}',
	version='${PV}',
	description='${DESCRIPTION}',
	url='${HOMEPAGE}',
	packages=['elmextensions'],
	py_modules=['sortedlistother.sortedlist'],
	)" > setup.py || die "Failed to write setup.py"
}

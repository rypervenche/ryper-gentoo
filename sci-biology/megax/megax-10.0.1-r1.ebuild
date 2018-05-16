# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit rpm

MY_P="${PF/-r/-}"

DESCRIPTION="Molecular Evolutionary Genetics Analysis"
HOMEPAGE="https://www.megasoftware.net/"
SRC_URI="https://www.megasoftware.net/releases/${MY_P}.x86_64.rpm"
 
RESTRICT=strip
LICENSE="MEGA-CC-EULA"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
    x11-libs/cairo
    x11-libs/gdk-pixbuf
    x11-libs/libX11
    x11-libs/pango
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
    sed -i -r \
        -e 's/^(Version=)$/\11.0/' \
        -e 's/^(Categories=)Application;(.*)/\1Science;\2/' \
        -e 's/^(Icon=mega)\.png/\1/' usr/share/applications/megax.desktop || die
	cp -pRP "${S}/." "${D}/" || die "Install failed!"
}

TERMUX_PKG_HOMEPAGE=https://github.com/Dess-Services/dess-repo
TERMUX_PKG_DESCRIPTION="DESS Archive Protect (DAP) - A suite for data encryption and integrity metadata"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Dess-Services <dessservicesofc@gmail.com>"
TERMUX_PKG_VERSION=3.2
TERMUX_PKG_REVISION=0
TERMUX_PKG_DEPENDS="openssl"
TERMUX_PKG_SKIP_SRC_EXTRACT=true

termux_step_make_install() {
    # Criar diretório de binários
    mkdir -p $TERMUX_PREFIX/bin

    # Instalar o Core do DAP
    install -m 755 $TERMUX_PKG_BUILDER_DIR/dap $TERMUX_PREFIX/bin/dap

    # Instalar o Menu de Diagnóstico v1.1
    install -m 755 $TERMUX_PKG_BUILDER_DIR/dap-error-info $TERMUX_PREFIX/bin/dap-error-info

    # Instalar o DMETA (buscando da pasta correta)
    if [ -f "$TERMUX_PKG_BUILDER_DIR/../dmeta/dmeta" ]; then
        install -m 755 $TERMUX_PKG_BUILDER_DIR/../dmeta/dmeta $TERMUX_PREFIX/bin/dmeta
    fi
}

safejq () {
        jq -R -r "${1:-.} as \$line | try fromjson catch \$line"
}

sc_proj() {
        cargo new ex$1-492253-sanchez-torres-andres-alam --vcs none
}

activate() {
  source $1/.venv/bin/activate
}

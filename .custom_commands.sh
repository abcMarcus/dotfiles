#!/bin/bash

pdf_unlock () {
    if [ $# -ne 1 ]; then
        echo "Usage: pdf_unlock <pdf>"
        return
    fi
    name=$(basename "$1" ".pdf")
    read -p "Password: " -s PASSWORD
    echo

    qpdf --password="${PASSWORD}" --decrypt "${name}.pdf" "${name}_unlocked.pdf"
    unset PASSWORD
}

mc () {
  mkdir "$1" && cd "$1"
}


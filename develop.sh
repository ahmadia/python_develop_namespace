#!/usr/bin/env bash

(cd foo; pip install -e . --user --root=/)
(cd foo-bar; pip install -e . --user --root=/)

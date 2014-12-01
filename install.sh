#!/usr/bin/env bash

(cd foo; python setup.py install --user --root=/)
(cd foo-bar; python setup.py install --user --root=/)

#!/bin/bash
# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

if [[ $# -eq 0 ]]; then
  cd "$(dirname "$0")"/..
  set -- js/*.js
fi

eslint "$@"
# We allow ECMAScript 2017 (aka 8) due to use of async keywords.
exec closure-compiler \
  --checks-only \
  --jscomp_warning=lintChecks \
  --language_in=ECMASCRIPT8 \
  "$@"

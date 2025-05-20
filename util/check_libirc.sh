#!/usr/bin/env bash

ierror=0

searchfor="librc.so"

for file in `find ${SPACK_ENV} -type f -iname '*.so*'`; do
  # Return code from grep is 1 if not found, 0 if found
  ldd $file 2>&1 | grep "${searchfor}"
  if [[ $? -eq 0 ]]; then
    echo "Found ${searchfor} linked in ${file}"
    ierror=1
  fi
done

exit ${ierror}

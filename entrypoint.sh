#!/bin/bash

set -eo pipefail

if [ -z "$INPUT_SECRET_ID" ]; then
  echo '::error::secret_id required'
  exit 1
fi

if [ -z "$INPUT_SECRET_KEY" ]; then
  echo '::error::secret_key required'
  exit 1
fi

if [ -z "$INPUT_REGION" ]; then
  echo '::error::region required'
  exit 1
fi

if [ -z "$INPUT_COMMANDS" ]; then
  echo '::error::commands required'
  exit 1
fi

if [ -z "$INPUT_OUTPUT_FORMAT" ]; then
  echo 'output format: json'
fi

tccli configure set secretId $INPUT_SECRET_ID secretKey $INPUT_SECRET_KEY region $INPUT_REGION output $INPUT_OUTPUT_FORMAT

IFS="&&"
CMDS=($INPUT_COMMANDS)

count=0
for cmd in ${CMDS[@]}; do
  unset IFS
  cmd=$(echo ${cmd} | xargs)
  if [ -n "$cmd" ]; then
  echo ">> Start running: tccli ${cmd}"
  tccli $cmd
  echo "<< Finished running: tccli ${cmd}"
  echo
  let count+=1
  fi
done

echo "Finished running $count commands."

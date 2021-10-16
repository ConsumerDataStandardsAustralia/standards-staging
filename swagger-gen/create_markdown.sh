#!/usr/bin/env bash

echo "*** Generating Markdown ***"

echo "*** Generate cds_full.md"
{
  node ./widdershins-cdr/widdershins.js --environment ./widdershins-cdr/cdr_widdershins.json --search false --language_tabs 'http:HTTP' 'javascript:Javascript' --summary api/cds_full.json -o cds_full.md > create-markdown-log.txt
} >> create-markdown-log.txt 2>&1

diff -w cds_full.md ../slate/source/includes/cds_full.md > diff.txt

# Initialise the log file
echo "Staring create_mardown..." > create-markdown-log.txt

echo "*** Generate cds_admin.md"
{
  node ./widdershins-cdr/widdershins.js --environment ./widdershins-cdr/cdr_widdershins.json --search false --language_tabs 'http:HTTP' 'javascript:Javascript' --summary api/cds_admin.json -o cds_admin.md
} >> create-markdown-log.txt 2>&1

# TODO Fix by extending Widdershins to do this automagically
# Hack to clean up markdown for slate. Widdershins output does not support more than one swagger file markdown
echo "*** Removing redundant Admin header"
{
  sed -i '' -e '/consumer-data-standards-administration-end-points-admin/d' cds_admin.md
  sed -i '' -e '/consumer-data-standards-administration-end-points-admin-apis/d' cds_admin.md
  sed -i '' -e 's/# Schemas/## Schemas/g' cds_admin.md
  sed -i '' -e 's/This operation does not require authentication/This operation may only be called by the CDR Register/g' cds_admin.md
} >> create-markdown-log.txt 2>&1

diff -w cds_admin.md ../slate/source/includes/cds_admin.md > diff_admin.txt


echo "*** Generate cds_register.md"
{
  node ./widdershins-cdr/widdershins.js --environment ./widdershins-cdr/cdr_widdershins.json --search false --language_tabs 'http:HTTP' 'javascript:Javascript' --summary api/cds_register.json -o cds_register.md >> create-markdown-log.txt
} >> create-markdown-log.txt 2>&1

echo "*** Removing redundant Register header"
{
  #sed -i 'consumer-data-right-cdr-register-participant-discovery-apis-register' cds_register.md
  sed -i '' -e 's/# Schemas/## Schemas/g' cds_register.md
} >> create-markdown-log.txt 2>&1

diff -w cds_register.md ../slate/source/includes/cds_register.md > diff_register.txt


echo "*** Generate cds_dcr.md"
{
  node ./widdershins-cdr/widdershins.js --environment ./widdershins-cdr/cdr_widdershins.json --search false --language_tabs 'http:HTTP' 'javascript:Javascript' --summary api/cds_dcr.json -o cds_dcr.md >> create-markdown-log.txt
} >> create-markdown-log.txt 2>&1

echo "*** Removing redundant DCR header"
{
  sed -i '' -e '/cdr-dynamic-client-registration-api-client-registration/d' cds_dcr.md
  sed -i '' -e 's/# Schemas/## Schemas/g' cds_dcr.md
} >> create-markdown-log.txt 2>&1

diff -w cds_dcr.md ../slate/source/includes/cds_dcr.md > diff_dcr.txt

echo "*** Complete ***"

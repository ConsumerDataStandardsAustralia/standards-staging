#!/usr/bin/env bash

echo "*** Generating Markdown ***"

# Initialise the log file
echo "Starting create_markdown..." > create-markdown-log.txt


echo "*** Generate cds_banking.md"
{
  node ./widdershins-cdr/widdershins.js --environment ./widdershins-cdr/cdr_widdershins.json --search false --language_tabs 'http:HTTP' 'javascript--nodejs:Javascript' --summary api/cds_banking.json -o cds_banking.md >> create-markdown-log.txt
} >> create-markdown-log.txt 2>&1

if [ -f ../slate/source/includes/cds_banking.md ]; then
  diff -w cds_banking.md ../slate/source/includes/cds_banking.md > diff_banking.txt
else
  echo "Nothing to diff yet, file is empty: ../slate/source/includes/cds_banking.md"
fi


echo "*** Generate cds_energy.md"
{
  node ./widdershins-cdr/widdershins.js --environment ./widdershins-cdr/cdr_widdershins.json --search false --language_tabs 'http:HTTP' 'javascript--nodejs:Javascript' --summary api/cds_energy.json -o cds_energy.md >> create-markdown-log.txt
} >> create-markdown-log.txt 2>&1

if [ -f ../slate/source/includes/cds_energy.md ]; then
  diff -w cds_energy.md ../slate/source/includes/cds_energy.md > diff_energy.txt
else
  echo "Nothing to diff yet, file is empty: ../slate/source/includes/cds_energy.md"
fi


echo "*** Generate cds_energy_sdh.md"
{
  node ./widdershins-cdr/widdershins.js --environment ./widdershins-cdr/cdr_widdershins.json --search false --language_tabs 'http:HTTP' 'javascript--nodejs:Javascript' --summary api/cds_energy_sdh.json -o cds_energy_sdh.md >> create-markdown-log.txt
} >> create-markdown-log.txt 2>&1

if [ -f ../slate/source/includes/cds_energy_sdh.md ]; then
  diff -w cds_energy_sdh.md ../slate/source/includes/cds_energy_sdh.md > diff_energy_sdh.txt
else
  echo "Nothing to diff yet, file is empty: ../slate/source/includes/cds_energy_sdh.md"
fi


echo "*** Generate cds_telco.md"
{
  node ./widdershins-cdr/widdershins.js --environment ./widdershins-cdr/cdr_widdershins.json --search false --language_tabs 'http:HTTP' 'javascript--nodejs:Javascript' --summary api/cds_telco.json -o cds_telco.md >> create-markdown-log.txt
} >> create-markdown-log.txt 2>&1

if [ -f ../slate/source/includes/cds_telco.md ]; then
  diff -w cds_telco.md ../slate/source/includes/cds_telco.md > diff_telco.txt
else
  echo "Nothing to diff yet, file is empty: ../slate/source/includes/cds_telco.md"
fi


echo "*** Generate cds_common.md"
{
  node ./widdershins-cdr/widdershins.js --environment ./widdershins-cdr/cdr_widdershins.json --search false --language_tabs 'http:HTTP' 'javascript--nodejs:Javascript' --summary api/cds_common.json -o cds_common.md >> create-markdown-log.txt
} >> create-markdown-log.txt 2>&1

if [ -f ../slate/source/includes/cds_common.md ]; then
  diff -w cds_common.md ../slate/source/includes/cds_common.md > diff_common.txt
else
  echo "Nothing to diff yet, file is empty: ../slate/source/includes/cds_common.md"
fi


echo "*** Generate cds_admin.md"
{
  node ./widdershins-cdr/widdershins.js --environment ./widdershins-cdr/cdr_widdershins.json --search false --language_tabs 'http:HTTP' 'javascript--nodejs:Javascript' --summary api/cds_admin.json -o cds_admin.md
} >> create-markdown-log.txt 2>&1

echo "*** Removing redundant Admin header"
{
  sed -i '' -e 's/This operation does not require authentication/This operation may only be called by the CDR Register/g' cds_admin.md
} >> create-markdown-log.txt 2>&1

if [ -f ../slate/source/includes/cds_admin.md ]; then
  diff -w cds_admin.md ../slate/source/includes/cds_admin.md > diff_admin.txt
else
  echo "Nothing to diff yet, file is empty: ../slate/source/includes/cds_admin.md"
fi


echo "*** Generate cds_register.md"
{
  node ./widdershins-cdr/widdershins.js --environment ./widdershins-cdr/cdr_widdershins.json --search false --language_tabs 'http:HTTP' 'javascript--nodejs:Javascript' --summary api/cds_register.json -o cds_register.md >> create-markdown-log.txt
} >> create-markdown-log.txt 2>&1

if [ -f ../slate/source/includes/cds_register.md ]; then
  diff -w cds_register.md ../slate/source/includes/cds_register.md > diff_register.txt
else
  echo "Nothing to diff yet, file is empty: ../slate/source/includes/cds_register.md"
fi


echo "*** Generate cds_dcr.md"
{
  node ./widdershins-cdr/widdershins.js --environment ./widdershins-cdr/cdr_widdershins.json --search false --language_tabs 'http:HTTP' 'javascript--nodejs:Javascript' --summary api/cds_dcr.json -o cds_dcr.md >> create-markdown-log.txt
} >> create-markdown-log.txt 2>&1

if [ -f ../slate/source/includes/cds_dcr.md ]; then
  diff -w cds_dcr.md ../slate/source/includes/cds_dcr.md > diff_dcr.txt
else
  echo "Nothing to diff yet, file is empty: ../slate/source/includes/cds_dcr.md"
fi

echo "*** Complete ***"

#!/bin/bash


cd `dirname $0`

cd web_assembly
npm run asbuild

cd ..

cd frontend
npm run build

